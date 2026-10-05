// Relies on the global DataTable instance `table` from datatables_custom.js
const mapEl = document.getElementById('map');
mapEl.style.height = '500px';
mapEl.classList.add('mb-4');

const map = L.map('map');
L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

const clusterGroup = L.markerClusterGroup();
map.addLayer(clusterGroup);
map.setView([48.2, 14.3], 5);

function parseCoord(value, limit) {
    const text = String(value ?? '').trim().replace(',', '.');

    if (text === '') {
        return null;
    }

    const num = Number(text);

    return Number.isFinite(num) && Math.abs(num) <= limit ? num : null;
}

function updateMap() {
    clusterGroup.clearLayers();
    const markers = [];

    // Column keys are the lowercased header labels (see datatables_custom.js)
    table.rows({ search: 'applied' }).data().each((row) => {
        const lat = parseCoord(row.lat, 90);
        const lng = parseCoord(row.lng, 180);

        if (lat === null || lng === null) {
            return;
        }

        // Popup DOM is built lazily on click
        markers.push(L.marker([lat, lng]).bindPopup(() => {
            const tmp = document.createElement('div');
            tmp.innerHTML = row.ortsname ?? '';
            const link = tmp.querySelector('a');
            const popup = document.createElement('a');
            popup.href = link ? link.getAttribute('href') : '#';
            popup.textContent = tmp.textContent.trim();
            return popup;
        }));
    });

    clusterGroup.addLayers(markers);

    if (markers.length) {
        map.fitBounds(clusterGroup.getBounds(), { padding: [30, 30], maxZoom: 13 });
    }
}

let updateTimer;
table.on('search.dt', () => {
    clearTimeout(updateTimer);
    updateTimer = setTimeout(updateMap, 150);
});
updateMap();