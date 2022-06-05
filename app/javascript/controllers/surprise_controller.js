import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["avatar", "question", "answer", "body"]

  connect() {
    console.log("Surprise surprise!")
    const clickme = this.clickmeTarget;
    const avatar = this.avatarTarget;
    console.log(clickme)
    console.log(avatar)
  }

  // hide(event) {
  //   event.preventDefault();
  //   console.log(event)
  //   const clickme = this.clickmeTarget;
  //   console.log(clickme)
  //   clickme.style.display = "block"
  //   const avatar = this.avatarTarget;
  //   avatar.style.display = "none"  //"block";

  // }

  displayQuestion(event) {
    event.preventDefault();
    const avatar = this.avatarTarget;
    avatar.style.display = "none";
    const question = this.questionTarget;
    question.style.display = "block"

    const joke_list = [
      ["Did you hear about the over-educated circle?", "It has 360°"],
      ["Why doesnt anybody talk to circles?","Because there is no point."],
      ["Why was the obtuse triangle always upset?","Because its never right."],
      ["Why was math class so long?","The teacher kept going off on a tangent."],
      ["Why can you never trust an atom?","They make up literally everything."],
      ["A neutron walks into a bar and asks the bartender how much a drink costs.", "“For you, no charge.”"],
      ["Why is it best to teach physics on the edge of a cliff?","Because thats where students have the most potential."],
      ["Einstein developed a theory about space.","And it was about time too."],
      ["Why Can't You Trust Atoms?","They make up everything"],
      ["Have You Heard About the Sick Chemist?","If you can't helium, and you can't curium, you'll probably have to barium."],
      ["Where Does Bad Light End Up?","In prism."],
      ["Why Did the Programmer Use the Entire Bottle of Shampoo During One Shower?","Because the bottle said 'Lather, Rinse, Repeat'"],
      ["Which is smarter, Longitude or latitude?","Longitude, because it has 360 degrees!"],
      ["Mountains aren't just funny...","They're hill-areas!"],
      ["Why were the early days of history called The Dark Ages?","Because there were so many knights."],
      ["How was the Roman Empire Cut in Half?","With a pair of Caesars"],
      ["How did the Vikings send secret messages?","By Norse code!"],
      ["Why did George Washington have trouble sleeping?","Because he could not lie."],
      ["Why do chemists like nitrates so much?","They're cheaper than day rates!"],
      ["Why did the girl wear glasses during math class?","It improved di-vision."]
    ]
    const randomQuestion = joke_list[Math.floor(Math.random() * joke_list.length)][0];
    question.innerText = randomQuestion
  }

  displayAnswer(event) {
    event.preventDefault();

    const joke_list = [
      ["Did you hear about the over-educated circle?", "It has 360°"],
      ["Why doesnt anybody talk to circles?","Because there is no point."],
      ["Why was the obtuse triangle always upset?","Because its never right."],
      ["Why was math class so long?","The teacher kept going off on a tangent."],
      ["Why can you never trust an atom?","They make up literally everything."],
      ["A neutron walks into a bar and asks the bartender how much a drink costs.", "“For you, no charge.”"],
      ["Why is it best to teach physics on the edge of a cliff?","Because that’s where students have the most potential."],
      ["Einstein developed a theory about space.","And it was about time too."],
      ["Why Can't You Trust Atoms?","They make up everything"],
      ["Have You Heard About the Sick Chemist?","If you can't helium, and you can't curium, you'll probably have to barium."],
      ["Where Does Bad Light End Up?","In prism."],
      ["Why Did the Programmer Use the Entire Bottle of Shampoo During One Shower?","Because the bottle said 'Lather, Rinse, Repeat'"],
      ["Which is smarter, Longitude or latitude?","Longitude, because it has 360 degrees!"],
      ["Mountains arent just funny...","Theyre hill-areas!"],
      ["Why were the early days of history called The Dark Ages?","Because there were so many knights."],
      ["How was the Roman Empire Cut in Half?","With a pair of Caesars"],
      ["How did the Vikings send secret messages?","By Norse code!"],
      ["Why did George Washington have trouble sleeping?","Because he could not lie."],
      ["Why do chemists like nitrates so much?","They're cheaper than day rates!"],
      ["Why did the girl wear glasses during math class?","It improved di-vision."]
    ]
    const question = this.questionTarget;
    console.log(question.innerText)
    console.log(joke_list.find(element => element[0] === question.innerText))
    const answerText = joke_list.find(element => element[0] === question.innerText)[1]
    console.log(answerText)
    question.style.display = "none";

    const answer = this.answerTarget;
    answer.style.display = "block";

    answer.innerText = answerText
  }

  backToAvatar(event) {
    event.preventDefault;
    const answer = this.answerTarget;
    answer.style.display = "none";
    const avatar = this.avatarTarget;
    avatar.style.display = "block"
  }
}
