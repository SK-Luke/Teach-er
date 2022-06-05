import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["startTimes", "endTimes", "scheduleRef"]

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
    let refs = []
    let inputStartTime = [];
    let inputEndTime = [];
    const regex = /(\w+): (\d{2})(\d{2}) - (\d{2})(\d{2})/g
    console.log(document.querySelectorAll('[id=schedule]'))
    document.querySelectorAll('[id=schedule]').forEach((reference)=> {
      refs.push(reference.innerText)
      // console.log(reference.innerText === null)
      // console.log(reference)
      // console.log(regex.exec(reference.innerText))
      // const startHour = regex.exec(reference.innerText)[2]
      // console.log(startHour)
      // const startMin = regex.exec(reference.innerText)[3]
      // const endHour = regex.exec(reference.innerText)[4]
      // const endMin = regex.exec(reference.innerText)[5]
      // inputStartTime.push(startHour);
      // inputStartTime.push(startMin);
      // inputEndTime.push(endHour);
      // inputEndTime.push(endMin);
    });
    console.log(refs)

    refs.map(element => {
      const startHour = element.match(/\d{4}/)[0].substr(0,2)
      const startMin = element.match(/\d{4}/)[0].substr(2)
      inputStartTime.push(startHour);
      inputStartTime.push(startMin);
      console.log(element.match(/\d{4}$/)[0])
      const endHour = element.match(/\d{4}$/)[0].substr(0,2)
      const endMin = element.match(/\d{4}$/)[0].substr(2)
      inputEndTime.push(endHour);
      inputEndTime.push(endMin);
    })

    console.log(inputStartTime)
    console.log(inputEndTime)

    const startTimes = this.startTimesTargets
    console.log(startTimes)
    const endTimes = this.endTimesTargets
    console.log(endTimes)
    startTimes.forEach((item, index) => {
      //console.log(`${index}: ${item.value}`)
      item.setAttribute("value",inputStartTime[index])
    })
    endTimes.forEach((item, index) => {
      //console.log(`${index}: ${item.value}`)
      item.setAttribute("value",inputEndTime[index])
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
