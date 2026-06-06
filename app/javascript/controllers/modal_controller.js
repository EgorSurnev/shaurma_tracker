import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]
  
  open() {
    this.modalTarget.classList.remove("hidden")
    document.body.style.overflow = "hidden"
  }
  
  close() {
    this.modalTarget.classList.add("hidden")
    document.body.style.overflow = ""
    // Очищаем форму при закрытии
    const form = this.modalTarget.querySelector("form")
    if (form) form.reset()
  }
  
  backdropClick(event) {
    if (event.target === this.modalTarget) {
      this.close()
    }
  }
}