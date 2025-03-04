// app/javascript/controllers/mobile_menu_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "button"]

  connect() {
    console.log("Mobile menu controller connected")
  }

  toggle() {
    if (!this.hasMenuTarget) return

    this.menuTarget.classList.toggle('hidden')

    if (this.hasButtonTarget) {
      const isOpen = !this.menuTarget.classList.contains('hidden')

      if (isOpen) {
        this.buttonTarget.innerHTML = '<i class="fas fa-times text-xl"></i>'
      } else {
        this.buttonTarget.innerHTML = '<i class="fas fa-bars text-xl"></i>'
      }
    }
  }
}
