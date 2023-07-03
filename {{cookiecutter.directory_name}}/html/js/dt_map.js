$("#map").css("height", "500px");
var table = $('#myTable').DataTable({
    "language": {
        "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/German.json"
    },
    dom: "'<'row'<'col-sm-4'f><'col-sm-4'i><'col-sm-4 exportbuttons'Br>>'" +
        "'<'row'<'col-sm-12't>>'" +
        "'<'row'<'col-sm-6 offset-sm-6'p>>'"
    ,
    buttons: [
        {
            extend: 'colvis',
            className: 'btn-outline-green',
            init: function (api, node, config) {
                $(node).removeClass('btn-secondary')
            }
        },
        {
            extend: 'copyHtml5',
            text: '<i class="far fa-copy"/>',
            titleAttr: 'Copy',
            className: 'btn-link',
            init: function (api, node, config) {
                $(node).removeClass('btn-secondary')
            }
        },
        {
            extend: 'excelHtml5',
            text: '<i class="far fa-file-excel"/>',
            titleAttr: 'Excel',
            className: 'btn-link',
            init: function (api, node, config) {
                $(node).removeClass('btn-secondary')
            }
        },
        {
            extend: 'pdfHtml5',
            text: '<i class="far fa-file-pdf"/>',
            titleAttr: 'PDF',
            className: 'btn-link',
            init: function (api, node, config) {
                $(node).removeClass('btn-secondary')
            }
        }
    ],
    responsive: true,
    orderCellsTop: true,
    "pageLength": 50,
    keepConditions: true,
});
var tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
});
var map = L.map('map').addLayer(tiles);
var markers = L.markerClusterGroup();
var currentTableData = getTableData(table);
var currentGeoJson = createGeoJson(currentTableData);
var startLayer = L.geoJson(currentGeoJson, {
    onEachFeature: function (feature, layer) {
        layer.bindPopup(feature.properties.name);
    }
});
markers.addLayer(startLayer);
map.addLayer(markers);
try {
    map.fitBounds(markers.getBounds());
} catch (err) {
    console.log(err);
}

$(document).ready(function () {
    $("#loader").hide();
    $("#myTable").show();
    $('#myTable thead #filterrow th').each(function (colIndex) {
        var title = $(this).text();
        $(this).html('<input type="text"/>');
        $('input', this).on('keyup change', function () {
            if (table.column(colIndex).search() !== this.value) {
                table
                    .column(colIndex)
                    .search(this.value)
                    .draw();
            }
        });
    });

    table.responsive.recalc();
});

table.on('search.dt', function () {
    //markers.removeLayer(startLayer);
    markers.clearLayers();
    var currentTableData = getTableData(table);
    var currentGeoJson = createGeoJson(currentTableData);
    var geoJsonLayer = L.geoJson(currentGeoJson, {
        onEachFeature: function (feature, layer) {
            layer.bindPopup(feature.properties.name);
        }
    });
    markers.addLayer(geoJsonLayer);
    map.addLayer(markers);
    try {
        map.fitBounds(markers.getBounds());
    }
    catch (err) {
        console.log(err);
    }
});

function getTableData(table) {
    const dataArray = [],
        placesArray = [];
    // loop table rows
    table.rows({ search: "applied" }).every(function () {
        const data = this.data();
        if (data[1]) {
            placesArray.push(data);
        }
    });
    // store all data in dataArray
    dataArray.push(placesArray);
    return dataArray;
};

function createGeoJson(data) {
    var geojsonArray = [];
    data[0].forEach(function (element, i) {
        var geojson = new Object();
        geojson.id = i;
        geojson.type = "Feature";
        geojson.geometry = {
            "type": "Point",
            "coordinates": [
                element[2],
                element[1]
            ]
        };
        geojson.properties = {
            "name": element[0]
        };
        geojsonArray.push(geojson);
    });
    return geojsonArray;
};
function onEachFeature(feature, layer) {
    layer.bindPopup(feature.properties.name);
};