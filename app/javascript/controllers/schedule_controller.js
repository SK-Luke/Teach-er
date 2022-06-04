import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  //static targets = ["addbtn"]

  connect() {
    console.log("hello from schedule_controller!")
  }

  modalAppear(event) {
    console.log(event)
    event.preventDefault()
    console.log(event)
    const modal = document.getElementById("editSchedModal");
    modal.style.display = "block";
  }

  modalClose(event) {
    event.preventDefault();
    var modal = document.getElementById("editSchedModal");
    modal.style.display = "none";
  }
}
