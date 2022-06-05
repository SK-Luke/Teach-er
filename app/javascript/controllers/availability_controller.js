import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["addbtn", "slot", "delBtn", "cfmBtn"]

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
    const modal = document.getElementById("addAvailModal");
    modal.style.display = "none";
  }

  deleteMode(event) {
    event.preventDefault();
    const cfmBtn = this.cfmBtnTarget;
    cfmBtn.style.display = "block";
    const delBtn = this.delBtnTarget
    delBtn.innerText = "Delete Mode"
    this.slotTargets.forEach(slot => {
      slot.addEventListener("click", function(){
        if (slot.className === "available") {
          // if (slot.style.color === "white") {
          //   console.log(slot)
          //   slot.style.color = "#53b480";
          // } else {
          //   console.log(slot)
          //   slot.style.color = "white"
          // }
          slot.className = "selected"
        } else {
          slot.className = "available"
        }
       });
    })
  }

  deleteSelected(event) {
    event.preventDefault;
    let selected = []
    this.slotTargets.forEach(slot => {
      console.log(slot.className)
      if (slot.className === "selected") {
        console.log(slot)
        selected.push(slot)
      }
    })

    console.log(selected)

    selected.forEach(sel => {
      console.log(sel.id)
      fetch(`/availabilities/${sel.id}`, {
        method: "DELETE",
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'X-CSRF-Token': csrfToken()
        }
      })
      .then(event.target.parentElement.remove())
      })
    const cfmBtn = this.cfmBtnTarget;
    cfmBtn.style.display = "none";
    const delBtn = this.delBtnTarget
    delBtn.innerText = "-"
  }
}
