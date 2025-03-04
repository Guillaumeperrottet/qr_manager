// app/javascript/controllers/qr_code_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["url", "preview", "form"]

  connect() {
    console.log("QR Code controller connected")

    // Initial preview if URL is already present
    if (this.hasUrlTarget && this.urlTarget.value.trim() !== "") {
      this.updatePreview()
    }
  }

  updatePreview() {
    if (!this.hasUrlTarget || !this.hasPreviewTarget) return

    const url = this.urlTarget.value.trim()

    if (url === "") {
      this.previewTarget.innerHTML = `
        <div class="w-48 h-48 flex items-center justify-center text-gray-400">
          <p class="text-center">Enter a URL to<br>preview QR code</p>
        </div>
      `
      return
    }

    // In a real application, you would make an AJAX request to the server
    // to generate a QR code preview. For this prototype, we'll simulate loading.
    this.previewTarget.innerHTML = `
      <div class="w-48 h-48 flex items-center justify-center bg-gray-100">
        <p class="text-center">Preview loading...</p>
      </div>
    `

    // Simulate a server request delay
    setTimeout(() => {
      this.previewTarget.innerHTML = `
        <div class="w-48 h-48 flex items-center justify-center bg-white">
          <img src="data:image/svg+xml;charset=UTF-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20baseProfile%3D%22full%22%20width%3D%22200%22%20height%3D%22200%22%3E%3Crect%20width%3D%22200%22%20height%3D%22200%22%20fill%3D%22white%22%2F%3E%3Crect%20x%3D%2250%22%20y%3D%2250%22%20width%3D%22100%22%20height%3D%22100%22%20fill%3D%22black%22%2F%3E%3Crect%20x%3D%2270%22%20y%3D%2270%22%20width%3D%2260%22%20height%3D%2260%22%20fill%3D%22white%22%2F%3E%3Crect%20x%3D%2290%22%20y%3D%2290%22%20width%3D%2220%22%20height%3D%2220%22%20fill%3D%22black%22%2F%3E%3C%2Fsvg%3E" alt="QR Code Preview" class="w-full h-full">
        </div>
      `
    }, 500)
  }

  download(event) {
    event.preventDefault()
    // In a real application, you would download the actual QR code
    alert("QR code download functionality would be implemented here.")
  }

  validateForm(event) {
    if (!this.hasUrlTarget || !this.hasFormTarget) return

    const url = this.urlTarget.value.trim()

    if (url === "") {
      event.preventDefault()
      alert("Please enter a valid URL for your QR code.")
    }
  }
}
