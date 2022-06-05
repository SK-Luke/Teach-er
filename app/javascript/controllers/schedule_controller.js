import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["startTimes", "endTimes"]

  connect() {
    console.log("hello from schedule_controller!")
  }

  modalAppear(event) {
    console.log(event)
    event.preventDefault()
    console.log(event)
    const modal = document.getElementById("editSchedModal");
    modal.style.display = "block";

    console.log("updateInput")

    const startTimes = this.startTimesTargets
    const endTimes = this.endTimesTargets
    startTimes.forEach((item, index) => {
      console.log(`${index}: ${item}`)
    })
  }

  modalClose(event) {
    event.preventDefault();
    const modal = document.getElementById("editSchedModal");
    modal.style.display = "none";
  }

  updateInputs(event) {
    event.preventDefault();
    console.log("updateInput")
    console.log(this.startTimeTargets)
    console.log(this.endTimeTargets)
  }
}
