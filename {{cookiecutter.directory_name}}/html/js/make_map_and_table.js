function resizeIconsOnZoom(map, existing_markers_by_coordinates) {
  let first_marker = Object.values(existing_markers_by_coordinates)[0]
  if (!first_marker.getRadius) {
    console.warn("Can't resize selected marker. Use L.circleMarker to use this function.")
    return null;
  };
  let previousZoom;
  map.on("zoomstart", function () {
    previousZoom = map.getZoom();
  });
  map.on("zoomend", function () {
    let zoomRatio = map.getZoom() / previousZoom;
    Object.entries(existing_markers_by_coordinates).forEach(
      ([coordinate_key, marker]) => {
        // Adjust the circle radius based on the zoom ratio
        let currentSize = marker.getRadius();
        marker.setRadius(currentSize * zoomRatio);
      }
    );
  });
}

function fetch_tabulatordata_and_build_table(
  map_cfg,
  map,
  table_cfg,
  marker_layer
) {
  console.log("loading table");
  if (map_cfg.json_url.length !== 0) {
    fetch(map_cfg.json_url)
      .then(function (response) {
        // json string
        return response.json();
      })
      .then(function (tabulator_data) {
        // the table will draw all markers on to the empty map
        table_cfg.tabulator_cfg.data = tabulator_data;
        let table = build_map_table(table_cfg);
        populateMapFromTable(
          table,
          map,
          map_cfg.on_row_click_zoom,
          marker_layer,
          map_cfg.initial_coordinates,
          map_cfg.initial_zoom
        );
      })
      .catch(function (err) {
        console.log(err);
      });
  } else {
    let table = build_map_table(table_cfg);
    populateMapFromTable(
      table,
      map,
      map_cfg.on_row_click_zoom,
      marker_layer,
      map_cfg.initial_coordinates,
      map_cfg.initial_zoom
    );
  }
}

function zoom_to_point_from_row_data(
  row_data,
  map,
  zoom,
  existing_markers_by_coordinates
) {
  let coordinate_key = get_coordinate_key_from_row_data(row_data);
  let marker = existing_markers_by_coordinates[coordinate_key];
  marker.openPopup();
  map.setView([row_data.lat, row_data.lng], zoom);
}

function get_coordinate_key_from_row_data(row_data) {
  return row_data.lat + row_data.lng;
}

function init_map_from_rows(rows, marker_layer) {
  console.log("populating map with icons");
  let existing_icons_by_coordinates = {};
  rows.forEach((row) => {
    let row_data = row.getData();
    let coordinate_key = get_coordinate_key_from_row_data(row_data);
    let new_icon = draw_icon([row_data.lat, row_data.lng], row);
    existing_icons_by_coordinates[coordinate_key] = new_icon;
    new_icon.bindPopup(get_popup_label_string_html(row_data));
    new_icon.addTo(marker_layer);
  });
  return existing_icons_by_coordinates;
}

function toggle_marker_visibility(marker) {
  let element = marker.getElement();
  if (element.style.display === "inline") {
    element.style.display = "none";
  } else if (element.style.display === "none") {
    element.style.display = "inline";
  } else {
    // after pageload there is no value direct value there
    // its still table-cell cause css
    element.style.display = "none";
  }
}

function populateMapFromTable(
  table,
  map,
  on_row_click_zoom,
  marker_layer,
  initial_coordinates,
  initial_zoom
) {
  table.on("tableBuilt", function () {
    console.log("built table");
    let all_rows = this.getRows();
    var existing_markers_by_coordinates = init_map_from_rows(
      all_rows,
      marker_layer
    );
    // every marker is displayed …
    var keys_of_displayed_markers = Object.keys(
      existing_markers_by_coordinates
    );
    table.on("dataFiltered", function (filters, rows) {
      if (rows.length < 4 && rows.length > 0) {
        let row_data = rows[0].getData();
        zoom_to_point_from_row_data(
          row_data,
          map,
          on_row_click_zoom,
          existing_markers_by_coordinates
        );
      } else {
        map.setView(initial_coordinates, initial_zoom);
      }
      let keys_of_markers_to_be_displayed = [];
      rows.forEach((row) => {
        let row_data = row.getData();
        let coordinate_key = get_coordinate_key_from_row_data(row_data);
        keys_of_markers_to_be_displayed.push(coordinate_key);
      });
      // hide & display filtered markers
      Object.entries(existing_markers_by_coordinates).forEach(
        ([coordinate_key, marker]) => {
          if (keys_of_markers_to_be_displayed.includes(coordinate_key)) {
            // this marker should be displayed
            if (!keys_of_displayed_markers.includes(coordinate_key)) {
              // it is not beeing displayed
              // display it
              // marker_layer.addLayer(marker);
              toggle_marker_visibility(marker);
              keys_of_displayed_markers.push(coordinate_key);
            }
          } else {
            // this marker should be hidden
            if (keys_of_displayed_markers.includes(coordinate_key)) {
              // it is not hidden
              // hide it
              // marker_layer.removeLayer(marker);
              let index_of_key =
                keys_of_displayed_markers.indexOf(coordinate_key);
              keys_of_displayed_markers.splice(index_of_key, 1);
              toggle_marker_visibility(marker);
            }
          }
        }
      );
    });
    //eventlistener for click on row
    table.on("rowClick", function (event, row) {
      let row_data = row.getData();
      zoom_to_point_from_row_data(
        row_data,
        map,
        on_row_click_zoom,
        existing_markers_by_coordinates
      );
    });
    // enable resizing for icons on map
    resizeIconsOnZoom(map, existing_markers_by_coordinates);
  });
}

function build_map_table(table_cfg) {
  let table = new Tabulator(
    table_cfg.table_div_html_id,
    table_cfg.tabulator_cfg
  );
  console.log("made table");
  return table;
}

/////////////////////
// building the map//
/////////////////////
function build_map_and_table(map_cfg, table_cfg, wms_cfg = null, tms_cfg = null) {
  console.log("loading map");
  let map = L.map(map_cfg.div_id).setView(
    map_cfg.initial_coordinates,
    map_cfg.initial_zoom
  );
  let tile_layer = L.tileLayer(map_cfg.base_map_url, {
    maxZoom: map_cfg.max_zoom,
    minZoom: map_cfg.min_zoom,
    attribution: map_cfg.attribution,
  });
  let marker_layer = L.layerGroup();
  let overlay_control = {};
  overlay_control[map_cfg.base_map_label] = tile_layer

  // handle the layers
  // order of adding matters!
  tile_layer.addTo(map);
  // if wms_cfg is provided wms map layer gets added
  if (wms_cfg !== null) {
    // this is for the page gui / switch for toggling overlays
    let wms_layer = L.tileLayer.wms(wms_cfg.wms_url, wms_cfg.layerOptions);
    wms_layer.addTo(map);
    overlay_control[wms_cfg.label] = wms_layer;
  }

  // if tms_cfg is provided tms map layer gets added
  if (tms_cfg !== null) {
    // this is for the page gui / switch for toggling overlays
    let tms_layer = L.tileLayer('https://emt-project.github.io/mapserver/map_01/{z}/{x}/{y}.png', tms_cfg.layerOptions);
    tms_layer.addTo(map);
    overlay_control[tms_cfg.label] = tms_layer;
  }
  // this has to happen here, in case historical map gets added
  L.control.layers(null, overlay_control).addTo(map);
  marker_layer.addTo(map);

  fetch_tabulatordata_and_build_table(map_cfg, map, table_cfg, marker_layer);
}