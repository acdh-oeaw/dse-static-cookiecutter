/*this cfg describes some of the features of the leaflet map and it't functions*/
/*its used to define how make_map_and_table.js build a tabulator table and a leaflet
map from data of an html table*/

/*this defines some features of the leaflet map
his simply is passed over to leaflet, consult docs
for more info */
const map_cfg = {
  div_id: "map",
  json_url: "",
  initial_zoom: "5",
  max_zoom: "15",
  min_zoom: "2",
  /* zoom level for a place on the map focused by clicking the corresponding row */
  on_row_click_zoom: 10,
  initial_coordinates: [47.0708, 15.4386],
  base_map_url:
    "https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png",
  /* some map providers need subdomains */
  subdomains: "abcd",
  attribution:
    '<a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors & <a href="https://carto.com/attributions">CARTO</a>',
  base_map_label: "Aktuelle Karte"
};

/*provide a list of your table columns and what tabulator should do with it
this simply is passed over to tabulator, consult docs for more info */
const columns = [
  /* the following field is necessary, 
    provide a string val in your html-table */
  {
    headerFilter: "input",
    title: "Ortsname",
    field: "Ortsname",
    formatter: linkToDetailView,
    resizable: true,
  },
  {
    headerFilter: "input",
    title: "Erwähnungen",
    field: "mentions",
    formatter: "plaintext",
    resizable: true,
  },
  /* the following fields are necessary, 
    provide a string val each in your html-table,
    (longitude and latitude)*/
  {
    title: "lat",
    field: "lat",
    formatter: "plaintext",
    resizable: false,
    visible: false,
  },
  {
    title: "lng",
    field: "lng",
    formatter: "plaintext",
    resizable: false,
    visible: false,
  },
  {
    title: "linkToEntity",
    field: "linkToEntity",
    formatter: "plaintext",
    resizable: false,
    visible: false,
  },
  /* for the following, provide a list of related Objects, 
  eg. documents referencing the place represented by the row.
  place a ul-item with one li-children for each entity in your html-table*/
  /*the following could contain a ul of links to external authority data*/
  /* {
     //headerFilter: "input",
     title: "authority",
     field: "authority",
     resizable: false,
     formatter: "html",
   },*/
];

/* using localization to change labels of tabulators pagination
    https://tabulator.info/docs/5.5/modules#module-localize */
const langs = {
  default: {
    pagination: {
      counter: {
        showing: "",
        of: "of",
        rows: "",
      },
    },
  },
};

/* this cfg describes some of the features of
    the tabulator table and it't functions 
    consult tabulator docs for more info*/
const tabulator_cfg = {
  maxHeight: "900px",
  layout: "fitColumns",
  width: "100%",
  headerFilterLiveFilterDelay: 600,
  responsiveLayout: "collapse",
  langs: langs,
  columns: columns,
  initialSort:[
    {column:"Ortsname", dir:"asc"},
  ]
};

/*this is just an extra capsule to pass cfg trough the functions*/
const table_cfg = {
  tabulator_cfg: tabulator_cfg,
  /* put the id of the div-element you want tabulator to be rendered in */
  table_div_html_id: "#placesTable",
};

/*optional you can define some wms config. If provided and passed to 
build_map_and_table a wms layer is added to your map,
including a layer controll;
if you don't need this, ignore it*/
let wms_cfg = {
  label: "Stadtplan 1858 (k.k. Ministerium des Inneren)",
  wms_url: "https://data.wien.gv.at/daten/wms?version=1.1.1",
  layerOptions: {
    service: "WMS",
    version: "1.1.1",
    request: "GetMap",
    contextualWMSLegend: "0",
    crs: L.CRS.EPSG4326,
    dpiMode: "7",
    featureCount: "10",
    format: "image/png",
    layers: "HISTWIENPL1858OGD",
    url: "https://data.wien.gv.at/daten/wms?version%3D1.1.1",
    opacity: 0.5,
  },
};

let tms_cfg = {
  label: "Europa um 1700",
  tms_url: "https://emt-project.github.io/mapserver/map_01/{z}/{x}/{y}.png",
  layerOptions: {tms: 1, opacity: 0.8, minZoom: 2, maxZoom: 12, attribution: "Austrian National Library (ÖNB)"},
}

//////////////////////////////////////////////////
/* some functions to influence the visualization*/
//////////////////////////////////////////////////

/*define the way you want to created an popup lable on the map
you have full acces to row data via row.getData() and can write html as in example below*/
function popupLabelCreator(row) {
  return `<a href="${row.linkToEntity}.html">${row.Ortsname}</a>`;
}

function tooltipLabelcreator(row) {
  return `${row.Ortsname}`;
}

const get_popup_label_string_html = popupLabelCreator
const get_tooltip_label = tooltipLabelcreator


/*some helpers*/

function linkToDetailView (cell) {
  var row = cell.getRow().getData()
  var cellData = cell.getData()
  var linkValue = row.linkToEntity
  var linkText = cellData.Ortsname
  var theLink = `<a href="${linkValue}.html">${linkText}</a>`
  return theLink
}
