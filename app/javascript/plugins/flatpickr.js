import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import "flatpickr/dist/themes/airbnb.css" // Note this is important!

flatpickr(".datepicker", {
    altInput: true,
    enableTime: true,
    minTime: "16:00",
    maxTime: "22:00"
  })
