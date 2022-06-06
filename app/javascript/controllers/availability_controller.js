import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["addbtn", "slot", "delBtn", "cfmBtn", "cfmBtnTwo","weekCal"]

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
    const delBtn = this.delBtnTarget
    const cfmBtn = this.cfmBtnTarget;
    const cfmBtnTwo = this.cfmBtnTwoTarget;
    if (delBtn.innerText === "-") {
      cfmBtn.style.display = "block";
      cfmBtnTwo.style.display = "block";
      delBtn.innerText = "Delete Mode"
    } else {
      delBtn.innerText = "-"
      cfmBtn.style.display = "none";
      cfmBtnTwo.style.display = "none";
      this.slotTargets.forEach(slot => {
        if (slot.className === "selected") {
          slot.className = "available"
        } else if (slot.className === "month_selected") {
          slot.className = "month_available"
        }
      })
    }
  }

  selectAvails(event) {
    const delBtn = this.delBtnTarget
    if (delBtn.innerText === "Delete Mode") {
      //console.log(event.path[1])
      //console.log(event.path[1].id)
      const id = event.path[1].id
      const element = document.getElementById(`${id}`)
      console.log(event.path[1])
      //console.log(element.className)
      if (element.className === "available") {
        element.className = "selected"
      } else if (element.className === "selected") {
        element.className = "available"
      }
    }
  }

  selectAvailsMonth(event) {
    const delBtn = this.delBtnTarget
    if (delBtn.innerText === "Delete Mode") {
      console.log(event.path[1])
      const element = event.path[1]
      if (element.className === "month_available") {
        element.className = "month_selected"
      } else if (element.className === "month_selected") {
        element.className = "month_available"
      }
    }
  }

  // deleteModeold(event) {
  //   event.preventDefault();
  //   const delBtn = this.delBtnTarget
  //   const cfmBtn = this.cfmBtnTarget;
  //   const cfmBtnTwo = this.cfmBtnTwoTarget;
  //   if (delBtn.innerText === "-") {
  //     cfmBtn.style.display = "block";
  //     cfmBtnTwo.style.display = "block";
  //     delBtn.innerText = "Delete Mode"
  //     this.slotTargets.forEach(slot => {
  //       slot.addEventListener("click", function(){
  //         if (slot.className === "available") {
  //           slot.className = "selected"
  //         } else if (slot.className === "month_available") {
  //           slot.className = "month_selected"
  //         } else if (slot.className === "selected") {
  //           slot.className = "available"
  //         } else if (slot.className === "month_selected") {
  //           slot.className = "month_available"
  //         }
  //       });
  //     })
  //   } else {
  //     delBtn.innerText = "-"
  //     cfmBtn.style.display = "none";
  //     cfmBtnTwo.style.display = "none";
  //   }
  // }

  deleteSelected(event) {
    event.preventDefault;
    let selected = []
    this.slotTargets.forEach(slot => {
      console.log(slot.className)
      if (slot.className === "selected" || slot.className === "month_selected") {
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
      .then((data) => {

        //event.target.parentElement.remove()
        console.log(data)
        this.weekCalTarget.outerHTML = data.week_calendar
        })
      })
    const cfmBtn = this.cfmBtnTarget;
    cfmBtn.style.display = "none";
    const cfmBtnTwo = this.cfmBtnTwoTarget;
    cfmBtnTwo.style.display = "none";
    const delBtn = this.delBtnTarget
    delBtn.innerText = "-"
  }

}
