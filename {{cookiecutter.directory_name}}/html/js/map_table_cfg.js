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
    formatter: "plaintext",
    resizable: false,
  },
  {
    headerFilter: "input",
    title: "Erwähnungen",
    field: "mentions",
    formatter: "plaintext",
    resizable: true,
  },
  {
    headerFilter: "input",
    title: "ID",
    field: "ID",
    formatter: "html",
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

function draw_cirlce_from_rowdata(latLng, row) {
  /*provides a circular icon to be drawn on the map, radius is dermined by the amount
    of child elements in the related_objects column first ul child*/
  let row_data = Number(row.getData().mentions);
  if (row_data > 100) {
    row_data = 100 + row_data / 100
  }
  let radius_factor = row_data;
  let radius = radius_factor * 0.2;
  let border_width = 4;
  let options = {
    radius: radius,
    weight: border_width,
    fillOpacity: "0.5",
    color: "#702963",
    fillColor: "#702963",
  }
  let marker = L.circleMarker(latLng, options);
  return marker;
}

/*define the way you wish to draw icons on the map in the make_map_and_table.js; 
per default the function takes the coordinates as [lat, lng]
from row.getData() and the row object as in the above example 
(draw_cirlce_from_rowdata)*/
const draw_icon = draw_cirlce_from_rowdata;


/*define the way you want to created an popup lable on the map
you have full acces to row data via row.getData() and can write html as in example below*/
function get_bold_name(row) {
  let label_string = `<b>${row.Ortsname}</b><br/>`;
  return label_string;
}

const get_popup_label_string_html = get_bold_name


/*some helpers*/

/*helper for scrollable cell, use in custom formatter in $columns*/
function make_cell_scrollable(table, cell, cell_html_string_in) {
  var cell_html_element = cell.getElement();
  cell_html_element.style.whiteSpace = "pre-wrap";
  cell_html_element.style.overflow = "auto";
  cell_html_element.style.maxHeight = "100px";
  if (cell_html_string_in !== undefined) {
    return table.emptyToSpace(cell_html_string_in);
  } else {
    return table.emptyToSpace(cell.getValue());
  }
}

/* YOU DONT NEED THIS IF YOUR LIST-DATA STEMS FROM HTML, simply provide a html-list in the cell.
this is a helper to provide you with a scrollable table cell, containing an html list;
use in custom formatter in $columns;*/
function build_linklist_cell(table, cell) {
  let values = cell.getValue();
  let i = 0;
  let links = [];
  while (i < values.length) {
    let pair = values[i];
    links.push(get_html_link(pair[0], pair[1]));
    i++;
  }
  let basic_html = get_html_list(links);
  return make_cell_scrollable(table, cell, basic_html);
}