const columns = [];

// Unique cell values of a column with their row counts, as searchList options
function countOptions(index) {
    const counts = new Map();

    document.querySelectorAll(`#myTable tbody tr td:nth-child(${index + 1})`).forEach((td) => {
        const value = td.textContent.trim();

        if (value) {
            counts.set(value, (counts.get(value) || 0) + 1);
        }
    });

    return [...counts]
        .sort(([a, countA], [b, countB]) => countB - countA || a.localeCompare(b, 'de'))
        .map(([value, count]) => ({ label: `${value} (${count})`, value }));
}

document.querySelectorAll('#myTable thead th').forEach((th, index) => {
    const label = th.textContent.trim();

    const sortContent = ['orderStatus'];

    if (th.dataset.dtSearchlist === 'true') {
        sortContent.push({
            extend: 'dropdown',
            icon: 'search',
            iconActive: 'searchActive',
            className: 'searchlist',
            text: `Werte auswählen: ${label}`,
            content: [{ extend: 'searchList', options: countOptions(index) }]
        });
    }

    columns.push({
        data: th.textContent.trim().toLowerCase(),
        visible: th.dataset.dtVisible !== 'false',
        columnControl: [
            {
                target: 0,
                content: sortContent
            },
            {
                target: 1,
                content: [
                    {
                        extend: 'search',
                        placeholder: label
                    }
                ]
            }
        ]
    });
});

const table = new DataTable('#myTable', {
    columnDefs: [
		{
			targets: 0,
			className: 'noVis'
		}
	],
    layout: {
        topStart: {
            buttons: [{
					extend: 'colvis',
					columns: ':not(.noVis)',
				}]
        },
        topEnd: {
            buttons: [
                {
                    extend: 'collection',
                    text: 'Export',
                    buttons: ['copy', 'csv', 'print']
                }
            ]
        },
        bottomStart: 'pageLength',
        bottomEnd: 'paging'
    },
    language: {
        url: 'js/datatables_custom/de-DE.json',
    },
    initComplete: function () {
        updateInfo(this.api());
        // ColumnControl builds its search-row DOM asynchronously after initComplete fires
        setTimeout(() => {
            labelSearchLogicSelects();
            addSearchListTooltips();
        }, 0);
    },

    columns: columns,

    ordering: {
        indicators: false
    }
});

table.on('draw', function () {
    updateInfo(table);
});

table.on('click', 'tbody tr', function (event) {
    if (event.target.closest('a')) {
        return;
    }

    const link = this.querySelector('a');

    if (link) {
        link.click();
    }
});

function updateInfo(table) {
    const info = table.page.info();

    document.querySelector('#custom-info-box').textContent =
        `${info.recordsDisplay} von ${info.recordsTotal} Einträgen`;
}

// ColumnControl has no tooltip option for buttons
function addSearchListTooltips() {
    document.querySelectorAll('#myTable thead .dtcc-button_searchlist').forEach((button) => {
        button.title = 'Liste aller Werte öffnen und nach Werten filtern';
    });
}

// ColumnControl renders the search-logic <select> without an accessible name
function labelSearchLogicSelects() {
    document.querySelectorAll('#myTable thead th').forEach((th, index) => {
        const label = th.querySelector('.dt-column-title').textContent.trim();
        const select = document.querySelectorAll('#myTable thead span.dtcc select.form-select')[index];

        if (label && select) {
            select.setAttribute('aria-label', `Suchmodus für ${label}`);
        }
    });
}