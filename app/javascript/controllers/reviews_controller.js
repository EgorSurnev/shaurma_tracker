import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  reset() {
    this.element.reset()
    // Сбросить звезды
    const ratingInput = this.element.querySelector('input[name="review[rating]"]')
    if (ratingInput) ratingInput.value = ""
    
    const stars = this.element.querySelectorAll('[data-controller="rating"] button')
    stars.forEach(star => {
      star.classList.add("text-gray-300")
      star.classList.remove("text-yellow-400")
    })
  }
}