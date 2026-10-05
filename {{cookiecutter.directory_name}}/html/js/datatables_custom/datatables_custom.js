const columns = [];

document.querySelectorAll('#myTable thead th').forEach((th) => {
    const label = th.textContent.trim();

    columns.push({
        data: th.textContent.trim().toLowerCase(),
        visible: th.dataset.dtVisible !== 'false',
        columnControl: [
            {
                target: 0,
                content: ['orderStatus']
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
        setTimeout(labelSearchLogicSelects, 0);
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