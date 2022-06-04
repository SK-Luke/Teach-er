import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "time", "grade", "subject", "subjects"]

  connect() {
    console.log("hello from calendar_controller!")
  }

  select_time_slot(event) {
    event.preventDefault()
    const modal = document.getElementById("myModal");
    modal.style.display = "block";

    console.log(event.target.innerText.split(/\r?\n/));
    // This is an array of the date [y, m, d]
    const date = event.target.innerText.split(/\r?\n/)[3].split('-')
    console.log(date)

    const time_range = event.target.innerText.split(/\r?\n/)[1]
    // This is an array of the time with AM/PM [HH, MM, AM/PM]
    let time = time_range.match(/\d{2}:\d{2} [AP]M/)[0].split(/[^A-Za-z0-9]/);
    console.log(time)
    if (time[2] == "PM") {
      time[0] = String(parseInt(time[0]) + 12)
    }
    console.log(time)

    let date_input = document.getElementById("booking_start_time");

    //console.log(String(Date(parseInt(date[0]), parseInt(date[1]), parseInt(date[2]), parseInt(time[0]), parseInt(time[1]),0)))
    const selected_datetime = `${date[0]}-${date[1]}-${date[2]} ${time[0]}:${time[1]}:00`
    console.log(selected_datetime)
    date_input.value = `${date[0]}-${date[1]}-${date[2]} ${time[0]}:${time[1]}:00`
  }

  close_modal(event) {
    event.preventDefault();
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
  }

  update_grade_input(event) {
    event.preventDefault()
    const selected_subject = event.currentTarget.selectedOptions[0].innerText
    // console.log(selected_subject)
    // console.log(this.subjectsTargets)
    // console.log(document.querySelectorAll("#subject_title")[0].innerText)
    // console.log(document.querySelectorAll("#subject_grades")[0].innerText)

    const subject_titles = []
    const subject_grades = []
    document.querySelectorAll("#subject_title").forEach(title => subject_titles.push(title.innerText));
    document.querySelectorAll("#subject_grades").forEach(grades => subject_grades.push(grades.innerText));

    const index = subject_titles.indexOf(selected_subject)
    const selected_subj_grades = subject_grades[index]
    const grade_options = selected_subj_grades.replace('Grades:','').replaceAll(/\s/g,'').split('|')
    const gradeTarget = this.gradeTarget
    gradeTarget.innerHTML = '';

    const option1 = document.createElement('option')
    option1.innerHTML = '<option value="" label=" "></option>'
    gradeTarget.appendChild(option1)

    grade_options.forEach((element) => {
      const new_option = document.createElement('option')
      new_option.innerHTML = `<option value="${element}">${element}</option>`
      gradeTarget.appendChild(new_option)
    })
    console.log(gradeTarget)
  }
}
