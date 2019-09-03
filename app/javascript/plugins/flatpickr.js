import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import "flatpickr/dist/themes/airbnb.css" // Note this is important!

flatpickr(".datepicker", {
    altInput: true
  })

flatpickr(".timepicker", {
    time_24hr: true,
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i"
})
