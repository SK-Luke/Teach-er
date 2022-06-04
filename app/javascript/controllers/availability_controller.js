import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["addbtn"]

  connect() {
    console.log("hello from availability_controller!")
  }

  modalAppear(event) {
    event.preventDefault()
    console.log(event)
    const modal = document.getElementById("addAvailModal");
    modal.style.display = "block";
  }

  modalClose(event) {
    event.preventDefault();
    var modal = document.getElementById("addAvailModal");
    modal.style.display = "none";
  }
}
