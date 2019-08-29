import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = (center) => {
  const long = parseFloat(center.split('[')[1].split(']')[0].split(', ')[0]);
  const lati = parseFloat(center.split('[')[1].split(']')[0].split(', ')[1]);
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    center: [long, lati],
    zoom: 15
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
  const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    const center = mapElement.dataset.center;
    const map = buildMap(center);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    //fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
