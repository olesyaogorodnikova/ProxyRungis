import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import "../plugins/flatpickr";
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import AOS from 'aos';

import { initAutocomplete } from '../plugins/init_autocomplete';
import { changeCartItemQuantity } from '../components/cart_item';

initMapbox();
initAutocomplete();
AOS.init();
changeCartItemQuantity();
