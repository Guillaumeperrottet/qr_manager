// app/javascript/application.js

// Import dependencies
import { Application } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

// Configure Stimulus
window.Stimulus = Application.start()

// Configure Turbo
Turbo.session.drive = true

// Import controllers
import QrCodeController from "./controllers/qr_code_controller"
import RestaurantController from "./controllers/restaurant_controller"
import MobileMenuController from "./controllers/mobile_menu_controller"

// Register controllers
Stimulus.register("qr-code", QrCodeController)
Stimulus.register("restaurant", RestaurantController)
Stimulus.register("mobile-menu", MobileMenuController)

// Mobile menu toggle
document.addEventListener('DOMContentLoaded', function() {
  const mobileMenuButton = document.getElementById('mobile-menu-button');
  const mobileMenu = document.getElementById('mobile-menu');

  if (mobileMenuButton && mobileMenu) {
    mobileMenuButton.addEventListener('click', function() {
      mobileMenu.classList.toggle('hidden');
    });
  }
});
