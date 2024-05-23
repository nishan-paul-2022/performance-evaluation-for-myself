from django.shortcuts import render
from collections import defaultdict
from main import models
import math
import json

stat_start = '2004'
stat_last = '2021'
stat_current = '2022'

weight_year_a = ['book', 'routine_2am_7am', 'writing', 'study_time', 'response_teacher', 'response_friend']
weight_year_b = ['pro_contest', 'pro_solving', 'soft_developing', 'research', 'algorithm', 'software', 'online_course']
weight_year_c = ['academic']
node_undergraduate = ['l1t1', 'l1t2', 'l2t1', 'l2t2', 'l3t1', 'l3t2', 'l4t1', 'l4t2']
failed = ['F', '+', '-']

gpa_system = {
    4.00: [80, 'A+'],
    3.75: [75, 'A'],
    3.50: [70, 'A-'],
    3.25: [65, 'B+'],
    3.00: [60, 'B'],
    2.75: [55, 'B-'],
    2.50: [50, 'C+'],
    2.25: [45, 'C'],
    2.00: [40, 'D']
}

mission = 10000
target_hours_daily = 14
week = 7
statistics_years_details = dict()

undergraduate_filtered_by_level = lambda row, odd, option: row.level == option and row.grade not in failed

undergraduate_options = {
    'all': lambda row, odd, option: row.grade not in failed,
    'result': lambda row, odd, option: row.grade == '-',
    'exam': lambda row, odd, option: row.grade == '+',
    'short': lambda row, odd, option: row.grade == 'F',
    'l1t1': undergraduate_filtered_by_level,
    'l1t2': undergraduate_filtered_by_level,
    'l2t1': undergraduate_filtered_by_level,
    'l2t2': undergraduate_filtered_by_level,
    'l3t1': undergraduate_filtered_by_level,
    'l3t2': undergraduate_filtered_by_level,
    'l4t1': undergraduate_filtered_by_level,
    'l4t2': undergraduate_filtered_by_level,
    'department': lambda row, odd, option: 'CSE' in row.code and row.grade not in failed,
    'not_department': lambda row, odd, option: 'CSE' not in row.code and row.grade not in failed,
    'theory': lambda row, odd, option: odd and row.grade not in failed,
    'lab': lambda row, odd, option: not odd and row.grade not in failed,
    'theory_department': lambda row, odd, option: odd and 'CSE' in row.code and row.grade not in failed,
    'lab_department': lambda row, odd, option: not odd and 'CSE' in row.code and row.grade not in failed,
    'theory_not_department': lambda row, odd, option: odd and 'CSE' not in row.code and row.grade not in failed,
    'lab_not_department': lambda row, odd, option: not odd and 'CSE' not in row.code and row.grade not in failed,
    'lab_only': lambda row, odd, option: 'ONLY' in row.name and row.grade not in failed
}

legend_background_color = {
    'DEVOTION': '#90D26D',
    'BREAKING': '#59B4C3',
    'YOGA': '#C3ACD0',
    'FUELING': '#DAC0A3',
    'HEALING': '#BFCFE7'
}


def get_details_from_cgpa(value):
    global gpa_system
    for i in gpa_system:
        if value >= i:
            return gpa_system[i][0], gpa_system[i][1]
    return 0, 'X'


def show_undergraduate_details():
    global undergraduate_options

    undergraduate_options_items = undergraduate_options.items()
    data_undergraduate = models.Undergraduate.objects.all()
    data_undergraduate = sorted(data_undergraduate, key=lambda i: i.id)

    undergraduate_details = defaultdict(lambda: list())

    for row in data_undergraduate:
        odd = 'SESSIONAL' not in row.name
        for option_name, function_name in undergraduate_options_items:
            if function_name(row, odd, option_name):
                undergraduate_details[option_name].append(row)

    return undergraduate_details


def show_undergraduate_summary():
    global node_undergraduate
    undergraduate_summary = list()
    node_credit, node_value = defaultdict(lambda: 0.0), defaultdict(lambda: 0.0)
    data_undergraduate = models.Undergraduate.objects.all()

    for row in data_undergraduate:
        if row.grade not in failed:
            credit = float(row.credit)
            gpa = float(row.gpa)
            node_credit[row.level] += credit
            node_value[row.level] += (credit * gpa)
            node_credit['final'] += credit
            node_value['final'] += (credit * gpa)

    node_undergraduate.append('final')

    for level in node_undergraduate:
        cgpa = (node_value[level] / node_credit[level]) if node_credit[level] else 0
        percentage, grade = get_details_from_cgpa(cgpa)
        node = {
            'level': level,
            'cgpa': f'{cgpa:.2f}',
            'percentage': percentage,
            'grade': grade,
            'credit': f'{node_credit[level]:.2f}'
        }
        undergraduate_summary.append(node)

    return undergraduate_summary


def imonlyhuman_evaluate():
    summary = list()
    average = 0
    data_imonlyhuman = models.Imonlyhuman.objects.all()
    data_imonlyhuman = sorted(data_imonlyhuman, key=lambda i: i.id)

    for row in data_imonlyhuman:
        key = f'{row.classname} / {row.time} / {row.name} : {row.value}'
        item = {'key': key, 'value': row.value}
        summary.append(item)
        average += int(row.value)

    number_rows = models.Imonlyhuman.objects.count()
    average = int(average / number_rows)
    key = f'imonlyhuman : {average}'
    item = {'key': key, 'value': average}
    summary.append(item)

    return summary


def legend_summary_initiate():
    summary = list()
    container = list()
    marks = {'DEVOTION': 70, 'BREAKING': 10, 'YOGA': 10, 'FUELING': 5, 'HEALING': 5}
    
    for key, score in marks.items():
        item = {'day': 'DATE', 'score': score, 'background_color': legend_background_color[key]}
        container.append(item)
    
    summary.append(container)
    
    return summary


def legend_evaluate():
    summary = legend_summary_initiate()
    data_legend = models.Legend.objects.all()
    data_legend = sorted(data_legend, key=lambda i: i.id)
    keys = legend_background_color.keys()

    for row in data_legend:
        container = list()

        for key in keys:
            score = getattr(row, key.lower())
            if score != '':
                background_color = legend_background_color[key]
                item = {'day': row.day, 'score': score, 'background_color': background_color}
                container.append(item)

        summary.append(container)

    return summary


def graph_rendering_days_data(year):
    data_daily = models.Daily.objects.all()
    collection = dict()
    container = dict()

    for row in data_daily:
        container[row.id] = [row.day, getattr(row, year)]

    number_rows = models.Daily.objects.count()

    for i in range(1, number_rows+1):
        collection[container[i][0]] = [container[i][1], '']

    return collection


def graph_rendering_years_data(data_x_year, data_field_x, dont_x, check='weight'):
    global statistics_years_details

    for row in data_x_year:
        for field in data_field_x:
            if field.name in dont_x:
                continue

            year = field.name[1:] if check == 'weight' else row.year
            parameter = row.parameter if check == 'weight' else field.name
            value = getattr(row, field.name)

            if year not in statistics_years_details:
                statistics_years_details[year] = dict()

            if parameter not in statistics_years_details[year]:
                statistics_years_details[year][parameter] = list()

            statistics_years_details[year][parameter].append(int(value))


def graph_rendering_days():
    statistics_days = dict()

    for field in models.Daily._meta.fields:
        name = field.name
        if name == 'id' or name == 'day':
            continue
        name = name[1: len(name)]
        statistics_days[name] = graph_rendering_days_data(field.name)

    statistics_days_serialized = json.dumps(statistics_days)
    return statistics_days_serialized


def graph_rendering_years():
    global statistics_years_details
    
    data_academic = models.Academic.objects.all()

    for row in data_academic:
        if row.year not in statistics_years_details:
            statistics_years_details[row.year] = dict()

        if row.event not in statistics_years_details[row.year]:
            statistics_years_details[row.year][row.event] = list()

        statistics_years_details[row.year][row.event] = [int(row.weight), int(row.value)]

    dont_weight = ['id', 'parameter']

    data_weight_year_a = models.WeightYearA.objects.all()
    data_field_weight_a = models.WeightYearA._meta.fields
    graph_rendering_years_data(data_weight_year_a, data_field_weight_a, dont_weight)

    data_weight_year_b = models.WeightYearB.objects.all()
    data_field_weight_b = models.WeightYearB._meta.fields
    graph_rendering_years_data(data_weight_year_b, data_field_weight_b, dont_weight)

    dont_value = ['id', 'year', 'event']

    data_value_year_a = models.ValueYearA.objects.all()
    data_field_value_a = models.ValueYearA._meta.fields
    graph_rendering_years_data(data_value_year_a, data_field_value_a, dont_value, 'value')

    data_value_year_b = models.ValueYearB.objects.all()
    data_field_value_b = models.ValueYearB._meta.fields
    graph_rendering_years_data(data_value_year_b, data_field_value_b, dont_value, 'value')

    statistics_years = dict()

    for year in statistics_years_details:
        x, y = 0, 0
        parameter_list = statistics_years_details[year]

        for parameter in parameter_list:
            weight = int(parameter_list[parameter][0])
            value = int(parameter_list[parameter][1])
            x += (weight * value)
            y += weight

        statistics_years[year] = math.ceil(x / y)

    return statistics_years


undergraduate_details = show_undergraduate_details()
undergraduate_summary = show_undergraduate_summary()
imonlyhuman_summary = imonlyhuman_evaluate()
legend_summary = legend_evaluate()
statistics_days = graph_rendering_days()
statistics_years = graph_rendering_years()

context = {
    'stat_start': stat_start,
    'stat_last': stat_last,
    'stat_current': stat_current,
    'undergraduate_details': undergraduate_details,
    'undergraduate_summary': undergraduate_summary,
    'imonlyhuman_summary': imonlyhuman_summary,
    'legend_summary': legend_summary,
    'statistics_days': statistics_days,
    'statistics_years': statistics_years,
    'statistics_years_details': statistics_years_details
}


def views_index(request):
    global context
    return render(request, 'index.html', context)


def views_main(request):
    global context
    return render(request, 'main.html', context)


def views_main_imonlyhuman(request):
    global context
    return render(request, 'main_imonlyhuman.html', context)


def views_main_undergraduate_details(request):
    global context
    undergraduate_details_specified = undergraduate_details[request.GET.get('options')]
    context['undergraduate_details_specified'] = undergraduate_details_specified
    return render(request, 'main_undergraduate_details.html', context)


def views_main_undergraduate_summary(request):
    global context
    return render(request, 'main_undergraduate_summary.html', context)


def views_main_legend(request):
    global context
    return render(request, 'main_legend.html', context)
