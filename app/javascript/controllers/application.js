import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// application.js
import { Turbo } from "@hotwired/turbo-rails"

document.addEventListener("turbolinks:load", function() {
  const serviceSelect = document.getElementById('service-select');
  const userSelect = document.getElementById('user-select');

  if (serviceSelect) {
    serviceSelect.addEventListener('change', function() {
      const serviceId = serviceSelect.value;

      // Make an AJAX request to fetch users based on the selected service
      fetch(`/experiences/new?service_id=${serviceId}`, {
        headers: {
          'X-Requested-With': 'XMLHttpRequest'
        }
      })
      .then(response => response.json())
      .then(data => {
        // Clear existing options
        userSelect.innerHTML = '';

        // Add the prompt option
        const promptOption = document.createElement('option');
        promptOption.value = '';
        promptOption.textContent = 'Select a user';
        userSelect.appendChild(promptOption);

        // Populate with new options
        data.users.forEach(user => {
          const option = document.createElement('option');
          option.value = user.id.where;
          option.textContent = user.full_name;
          userSelect.appendChild(option);
        });
      });
    });
  }
});
