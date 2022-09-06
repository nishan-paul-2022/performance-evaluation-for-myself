# Generated by Django 3.2.6 on 2022-01-28 17:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Undergraduate',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.TextField()),
                ('name', models.TextField()),
                ('credit', models.TextField()),
                ('grade', models.TextField()),
                ('gpa', models.TextField()),
                ('level', models.TextField()),
            ],
            options={
                'db_table': 'main_undergraduate',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ValueYearA',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('year', models.TextField()),
                ('event', models.TextField()),
                ('book', models.TextField()),
                ('routine_2am_7am', models.TextField()),
                ('writing', models.TextField()),
                ('study_time', models.TextField()),
                ('response_teacher', models.TextField()),
                ('response_friend', models.TextField()),
            ],
            options={
                'db_table': 'main_value_year_a',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ValueYearB',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('year', models.TextField()),
                ('event', models.TextField()),
                ('pro_contest', models.TextField()),
                ('pro_solving', models.TextField()),
                ('soft_developing', models.TextField()),
                ('research', models.TextField()),
                ('algorithm', models.TextField()),
                ('software', models.TextField()),
                ('online_course', models.TextField()),
            ],
            options={
                'db_table': 'main_value_year_b',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='WeightYearA',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('parameter', models.TextField()),
                ('n2004', models.TextField()),
                ('n2005', models.TextField()),
                ('n2006', models.TextField()),
                ('n2007', models.TextField()),
                ('n2008', models.TextField()),
                ('n2009', models.TextField()),
                ('n2010', models.TextField()),
                ('n2011', models.TextField()),
                ('n2012', models.TextField()),
                ('n2013', models.TextField()),
                ('n2014', models.TextField()),
                ('n2015', models.TextField()),
                ('n2016', models.TextField()),
                ('n2017', models.TextField()),
                ('n2018', models.TextField()),
                ('n2019', models.TextField()),
                ('n2020', models.TextField()),
                ('n2021', models.TextField()),
                ('n2022', models.TextField()),
            ],
            options={
                'db_table': 'main_weight_year_a',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='WeightYearB',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('parameter', models.TextField()),
                ('n2017', models.TextField()),
                ('n2018', models.TextField()),
                ('n2019', models.TextField()),
                ('n2020', models.TextField()),
                ('n2021', models.TextField()),
                ('n2022', models.TextField()),
            ],
            options={
                'db_table': 'main_weight_year_b',
                'managed': False,
            },
        ),
        migrations.DeleteModel(
            name='L1T1',
        ),
        migrations.DeleteModel(
            name='L1T2',
        ),
        migrations.DeleteModel(
            name='L2T1',
        ),
        migrations.DeleteModel(
            name='L2T2',
        ),
        migrations.DeleteModel(
            name='L3T1',
        ),
        migrations.DeleteModel(
            name='L3T2',
        ),
        migrations.DeleteModel(
            name='L4T1',
        ),
        migrations.DeleteModel(
            name='L4T2',
        ),
        migrations.DeleteModel(
            name='ValueYear1',
        ),
        migrations.DeleteModel(
            name='ValueYear2',
        ),
        migrations.DeleteModel(
            name='WeightYear1',
        ),
        migrations.DeleteModel(
            name='WeightYear2',
        ),
        migrations.AlterModelTable(
            name='daily',
            table='main_daily',
        ),
    ]
