import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');
// console.log(mapElement);

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  console.log(markers)
  markers.forEach((marker) => {
    console.log(marker.infoWindow)
   const popup_1 = new mapboxgl.Popup().setHTML(marker.infoWindow_1);
   const popup_2 = new mapboxgl.Popup().setHTML(marker.infoWindow_2);
   // if (markers.lng_ends) {
     const element = document.createElement('div');
     element.className = 'marker';
     element.style.backgroundColor = 'red';
     element.style.symbol = "rocket";
     element.style.width = '25px';
     element.style.height = '25px';
     element.style.borderRadius = "25px";
          new mapboxgl.Marker(element)
            .setLngLat([ marker.lng_starts, marker.lat_starts ])
            .setPopup(popup_1)
            .addTo(map);
          new mapboxgl.Marker()
          .setLngLat([ marker.lng_ends, marker.lat_ends ])
          .setPopup(popup_2)
          .addTo(map);

        // } else {
        //   new mapboxgl.Marker()
        //   .setLngLat([ markers.longitude, markers.latitude ])
        //   .setPopup(popup)
        //   .addTo(map);
        // }

  })
        // create iti
      const steps = Array.from(JSON.parse(mapElement.dataset.steps)).map(data => data.maneuver.location);
      setTimeout(() => {
        itineraire(map, steps)
      }, 1000)

};



const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  if (Array.isArray(markers)) {
    markers.forEach(marker => {
      bounds.extend([ marker.lng_starts, marker.lat_starts ]);
      bounds.extend([ marker.lng_ends, marker.lat_ends ]);
    });
    map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
  } else {
      bounds.extend([ markers.lng_starts, markers.lat_starts ]);
      bounds.extend([ markers.lng_ends, markers.lat_ends ]);
      map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
  }
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    // const user_markers = JSON.parse(mapElement.dataset.userMarkers);
    addMarkersToMap(map, markers);
    // addMarkersToMap(map, user_markers);
    fitMapToMarkers(map, markers);
    if (mapElement.dataset.markersActualPosition && mapElement.dataset.markersActualPosition !== "null") {
      const markersActualPosition =  JSON.parse(mapElement.dataset.markersActualPosition);
      new mapboxgl.Marker()
          .setLngLat([ markersActualPosition.lng, markersActualPosition.lat ])
          .addTo(map);
      // map.setZoom(14);
      // map.setCenter([ markersActualPosition.lng, markersActualPosition.lat ]);
    }
    // displayItinerary(map);
    map.addControl(new MapboxGeocoder({ accessToken: mapElement.dataset.mapboxApiKey }));
  }
};

// const displayItinerary = (map) => {
//   const cards = document.querySelectorAll(".card-trip");
//   cards.forEach((card) => {
//     card.addEventListener('mouseover', (e) => {
//       const id = e.currentTarget.dataset.id;
//       document.querySelector(`[data-marker-end-id='${id}']`).style.display = "block";
//       map.setPaintProperty("route" + id, 'line-opacity', 0.8);
//       const bounds = new mapboxgl.LngLatBounds();
//       bounds.extend(map.getLayer("route" + id).metadata.start_coordinates);
//       bounds.extend(map.getLayer("route" + id).metadata.end_coordinates);
//       map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
//     });
//     card.addEventListener('mouseout', (e) => {
//       const id = e.currentTarget.dataset.id;
//       document.querySelector(`[data-marker-end-id='${id}']`).style.display = "none";
//       map.setPaintProperty("route" + id, 'line-opacity', 0);
//     });
//   });
// };

const itineraire = (map, steps, id = 0) => {
  map.addLayer({
    "id": `route${id}`,
    "type": "line",
    "metadata": {
      "start_coordinates": steps[0],
      "end_coordinates": steps[steps.length - 1]
    },
    "source": {
      "type": "geojson",
      "data": {
        "type": "Feature",
        "geometry": {
          "type": "LineString",
          "coordinates": steps
        },
        "properties": {},
      }
    },
    "layout": {
      "line-join": "round",
      "line-cap": "round"
    },
    "paint": {
      // pour changer la couleur de la route
      "line-color": "#009661",
      "line-width": 8,
      "line-opacity": (id === 0) ? 0.8 : 0
    }
  });
};

export { initMapbox };
