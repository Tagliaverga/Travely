import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="contractor"
export default class extends Controller {
  static targets = ["type"]
  connect() {
  }

  show(event) {
    console.log("Chegueiiiii");
      }
  }
