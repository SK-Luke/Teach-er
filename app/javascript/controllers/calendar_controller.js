import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "time"]

  connect() {
    console.log("hello from calendar_controller!")
  }

  select_time_slot(event) {
    event.preventDefault()
    console.log(event.target.innerText.split(/\r?\n/));
    const date = event.target.innerText.split(/\r?\n/)[3]
    const time_range = event.target.innerText.split(/\r?\n/)[1]
    const time = time_range.match(/\d{2}:\d{2}/)[0];
    const selected_datetime = `${date} ${time}`
    console.log(`${date} ${time}`)
    //console.log(this.inputTarget);
    //console.log(this.timeTarget);
    //var date = document.getElementById("time");
    //console.log(date.innerText);
    var date_input = document.getElementById("booking_start_time");
    //console.log(date_input);
    // console.log(date_input.value);
    date_input.value = selected_datetime
  }
}
