import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const mapElement = document.getElementById('map');

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};


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

const addMarkerToMapOrderAddress = (map, markers) => {
  markers.forEach((marker) => {
  const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundColor = 'red';
  element.style.symbol = "rocket";
  element.style.width = '25px';
  element.style.height = '25px';
  element.style.borderRadius = "25px";
    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};


const initMapbox = () => {

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const center = mapElement.dataset.center;
    const map = buildMap(center);
    const markers = JSON.parse(mapElement.dataset.markers);
    const restaurants_markers = JSON.parse(mapElement.dataset.restaurants);
    addMarkerToMapOrderAddress(map, markers);
    addMarkersToMap(map, restaurants_markers);
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
    fitMapToMarkers(map, markers);


  }
};

function displayJourneyReshaped(map, coords) {

    var coordsString = coords.join(';');

    var typeRoute = 'driving';
    var directionsRequest = 'https://api.mapbox.com/matching/v5/mapbox/'+typeRoute+'/' + coordsString + '?geometries=geojson&access_token=' + accessToken;
    var xhr = new XMLHttpRequest();
    xhr.open('GET', directionsRequest);
    xhr.onload = function () {
        if (xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);

            var route = response.matchings[0].geometry;

            map.addLayer({
                id: 'journeyReshaped',
                type: 'line',
                source: {
                    type: 'geojson',
                    data: {
                        type: 'Feature',
                        geometry: route
                    }
                },
                paint: {
                    'line-color': "#3399ff",
                    'line-width': 4,
                    'line-opacity': 0.7
                }
            });
        } else {

            console.log('Request failed.  Returned status of ' + xhr.status);
        }
    };
    xhr.send();
}

export { initMapbox };
