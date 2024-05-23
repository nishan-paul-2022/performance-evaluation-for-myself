const information = {
	event: {
		2003: '',
		2004: 'class-1',
		2005: 'class-2',
		2006: 'class-3',
		2007: 'class-4',
		2008: 'class-5 / psc',
		2009: 'class-6',
		2010: 'class-7',
		2011: 'class-8 / jsc',
		2012: 'class-9',
		2013: 'class-10 / ssc',
		2014: 'clg-ad / clg-1st',
		2015: 'clg-2nd / clg-3rd',
		2016: 'hsc / uni-ad',
		2017: 'bsc-1st / bsc-2nd',
		2018: 'bsc-3rd / bsc-4th',
		2019: 'bsc-5th / bsc-6th',
		2020: 'lockdown',
		2021: 'bsc-7th-a / bsc-8th-a',
		2022: 'bsc-7th-b / bsc-8th-b'
	},

	statStart: '2004',
	statLast: '2022',
	statCurrent: '2022',

	undergraduateOptions: [
		'undergraduate',
		'all',
		'result',
		'exam',
		'short',
		'l1t1',
		'l1t2',
		'l2t1',
		'l2t2',
		'l3t1',
		'l3t2',
		'l4t1',
		'l4t2',
		'department',
		'not_department',
		'theory',
		'lab',
		'theory_department',
		'lab_department',
		'theory_not_department',
		'lab_not_department',
		'lab_only'
	]
};

let chart = '';

function createOptionsA() {
	const xhr = new XMLHttpRequest();
	xhr.open('get', 'main', true);
	xhr.onreadystatechange = function () {
		if (xhr.readyState === 4 && xhr.status === 200) {
			const element = document.getElementById('main-container');
			element.innerHTML = xhr.responseText;
		}
	};
	xhr.send();
}

function createOptionsB() {
	const xhr = new XMLHttpRequest();
	xhr.open('get', 'main', true);
	xhr.onreadystatechange = function () {
		if (xhr.readyState === 4 && xhr.status === 200) {
			const element = document.getElementById('undergraduate-options');
			const container = document.createDocumentFragment();

			for (const options of information['undergraduateOptions']) {
				const node = document.createElement('option');
				const nodeChild = document.createTextNode(options);
				node.value = options;
				node.appendChild(nodeChild);
				container.appendChild(node);
			}

			element.appendChild(container);
		}
	};
	xhr.send();
}

function createOptionsC() {
	const xhr = new XMLHttpRequest();
	xhr.open('get', 'main', true);
	xhr.onreadystatechange = function () {
		if (xhr.readyState === 4 && xhr.status === 200) {
			const element = document.getElementById('js-year-details');
			const container = document.createDocumentFragment();
			const temp1 = parseInt(information['statStart']);
			const temp2 = parseInt(information['statCurrent']);

			for (let year = temp1; year <= temp2; year++) {
				const node = document.createElement('option');
				node.value = String(year);
				node.appendChild(document.createTextNode(node.value));
				container.appendChild(node);
			}

			element.appendChild(container);
		}
	};
	xhr.send();
}

function createModal() {
	const modal = document.getElementById('modal-schedule');
	const closeButton = document.querySelector('.modal__close-button');
	const keyCodes = {
		KeyN: false,
		KeyP: false
	};

	function openModal() {
		modal.style.display = 'block';
	}

	function closeModal() {
		modal.style.display = 'none';
	}

	function checkKeys() {
		const allKeysPressed = Object.values(keyCodes).every((value) => {
			return value;
		});
		if (allKeysPressed) {
			openModal();
			Object.keys(keyCodes).forEach((key) => {
				keyCodes[key] = false;
			});
		}
	}

	function handleKeyDown(event) {
		if (event.code in keyCodes) {
			keyCodes[event.code] = true;
			checkKeys();
		}
	}

	function handleKeyUp(event) {
		if (event.code in keyCodes) {
			keyCodes[event.code] = false;
		}
	}

	document.addEventListener('keydown', handleKeyDown);
	document.addEventListener('keyup', handleKeyUp);

	closeButton.addEventListener('click', closeModal);

	window.addEventListener('click', (event) => {
		if (event.target === modal) {
			closeModal();
		}
	});
}

function getDesiredTemplate(value) {
	const fileName =
		value === 'undergraduate'
			? 'main_undergraduate_summary'
			: 'main_undergraduate_details?options=' + value;

	const xhr = new XMLHttpRequest();
	xhr.open('get', fileName, true);
	xhr.onreadystatechange = function () {
		if (xhr.readyState === 4 && xhr.status === 200) {
			const element = document.getElementById('canvas-chart');
			element.innerHTML = xhr.responseText;
		}
	};
	xhr.send();
}

function imonlyhumanEvaluate() {
	const xhr = new XMLHttpRequest();
	xhr.open('get', 'main_imonlyhuman', true);
	xhr.onreadystatechange = function () {
		if (xhr.readyState === 4 && xhr.status === 200) {
			const element = document.getElementById('canvas-chart');
			element.innerHTML = xhr.responseText;
		}
	};
	xhr.send();
}

function legendEvaluate() {
	const xhr = new XMLHttpRequest();
	xhr.open('get', 'main_legend', true);
	xhr.onreadystatechange = function () {
		if (xhr.readyState === 4 && xhr.status === 200) {
			const element = document.getElementById('canvas-chart');
			element.innerHTML = xhr.responseText;
		}
	};
	xhr.send();
}

function toggleDataSeries(e) {
	e.dataSeries.visible = !(
		typeof e.dataSeries.visible === 'undefined' || e.dataSeries.visible
	);
	chart.render();
}

function dataLabeling(key, value, indexLabel) {
	const data = {};

	data.label = key;
	data.y = parseInt(value);
	data.indexLabel = indexLabel;
	data.indexLabelPlacement = 'outside';
	data.indexLabelOrientation = 'vertical';
	data.indexLabelFontSize = 18;

	return data;
}

function graphRenderingA(text, title, data) {
	chart = new CanvasJS.Chart('canvas-chart', {
		animationEnabled: true,
		exportEnabled: true,
		title: { text: text },
		axisX: { title: title },
		axisY: { title: 'grade' },
		toolTip: { shared: true },
		legend: { cursor: 'pointer', itemclick: toggleDataSeries },
		data: data
	});
	chart.render();
}

function graphRenderingB(text, dataPoints) {
	chart = new CanvasJS.Chart('canvas-chart', {
		theme: 'dark2',
		animationEnabled: true,
		exportEnabled: true,
		title: { text: text },
		axisX: { interval: 1 },
		axisY2: {
			interval: 5,
			suffix: '%'
		},
		data: [
			{
				type: 'bar',
				yValueFormatString: '[ # ]',
				indexLabel: '{y}',
				axisYType: 'secondary',
				dataPoints: dataPoints
			}
		]
	});
	chart.render();
}

function graphRenderingDays(statisticsDays) {
	const text = 'from 2021' + ' - ' + information['statCurrent'];
	const title = 'day';
	const type = 'splineArea';
	const dataPointSet = {};

	for (const year in statisticsDays) {
		const dateList = statisticsDays[year];
		dataPointSet[year] = [];

		for (const date in dateList) {
			const value = dateList[date];
			const node = dataLabeling(date, value[0], value[1]);
			dataPointSet[year].push(node);
		}
	}

	const data = [];
	for (const year in dataPointSet) {
		const node = {
			type: type,
			name: year,
			visible: true,
			showInLegend: true,
			dataPoints: dataPointSet[year]
		};
		data.push(node);
	}

	graphRenderingA(text, title, data);
}

function graphRenderingYears(statisticsYears) {
	const text =
		'from ' + information['statStart'] + ' - ' + information['statCurrent'];
	const title = 'year';
	const type = 'column';
	const name = 'psych eval';
	const dataPoints = [];
	const event = information['event'];

	for (const year in statisticsYears) {
		const node = dataLabeling(year, statisticsYears[year], event[year]);
		dataPoints.push(node);
	}

	const data = [
		{ type: type, name: name, showInLegend: true, dataPoints: dataPoints }
	];

	graphRenderingA(text, title, data);
}

function graphRenderingYearsDetails(statisticsYearsDetails, year) {
	const text = 'Year ' + String(year);
	const eventList = statisticsYearsDetails[year];
	const dataPoints = [];

	for (const event in eventList) {
		const value = eventList[event][1];
		const y = parseInt(value);
		const node = { label: event, y: y };
		dataPoints.push(node);
	}

	graphRenderingB(text, dataPoints);
}

createOptionsA();
createOptionsB();
createOptionsC();
createModal();
