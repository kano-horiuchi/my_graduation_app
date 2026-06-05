import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "main" ]

  connect() {
    console.log("Gallery controller connected!")
  }

  changeImage(event) {
    const newSrc = event.currentTarget.src
    this.mainTarget.src = newSrc
  }
}