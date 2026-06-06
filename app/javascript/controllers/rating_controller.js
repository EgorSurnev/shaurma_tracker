import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]
  
  set(event) {
    const value = parseInt(event.currentTarget.dataset.value)
    this.inputTarget.value = value
    
    // Обновляем визуал звезд
    const stars = this.element.querySelectorAll("button")
    stars.forEach((star, index) => {
      if (index < value) {
        star.classList.add("text-yellow-400")
        star.classList.remove("text-gray-300")
      } else {
        star.classList.add("text-gray-300")
        star.classList.remove("text-yellow-400")
      }
    })
  }
}