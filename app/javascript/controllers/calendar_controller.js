import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "time","subjectSelection"]

  connect() {
    console.log("hello from calendar_controller!")
  }

  select_time_slot(event) {
    event.preventDefault()
    console.log(event.target.innerText.split(/\r?\n/));
    const date = event.target.innerText.split(/\r?\n/)[3].split('-')
    console.log(date)
    const time_range = event.target.innerText.split(/\r?\n/)[1]
    const time = time_range.match(/\d{2}:\d{2}/)[0].split(':');
    console.log(time)
    const selected_datetime = `${date} ${time}`

    var date_input = document.getElementById("booking_start_time");
    console.log(String(Date(parseInt(date[0]), parseInt(date[1]), parseInt(date[2]), parseInt(time[0]), parseInt(date[1]), parseInt(date[2]))))
    date_input.value = String(Date(parseInt(date[0]), parseInt(date[1]), parseInt(date[2]), parseInt(time[0]), parseInt(date[1]), parseInt(date[2])))
  }

  update_grade_input(event) {
    event.preventDefault()
    console.log(event)
    console.log(this.subjectSelectionTarget)
    var subject = document.getElementById("booking_subject");
    console.log(subject)
    var grade_input = document.getElementById("booking_grade");
    console.log(grade_input)
  }
}
