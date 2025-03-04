// app/javascript/controllers/restaurant_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["imagePreview", "imageInput"]

  connect() {
    console.log("Restaurant controller connected")
  }

  previewImage() {
    if (!this.hasImagePreviewTarget || !this.hasImageInputTarget) return

    const input = this.imageInputTarget

    if (input.files && input.files[0]) {
      const reader = new FileReader()

      reader.onload = (e) => {
        this.imagePreviewTarget.innerHTML = `
          <div class="relative">
            <img src="${e.target.result}" class="h-24 w-24 object-cover rounded">
            <div class="absolute inset-0 bg-gray-900 bg-opacity-75 flex items-center justify-center opacity-0 hover:opacity-100 transition-opacity rounded">
              <span class="text-white text-xs">Change</span>
            </div>
          </div>
        `
      }

      reader.readAsDataURL(input.files[0])
    }
  }
}
