import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// application.js
import { Turbo } from "@hotwired/turbo-rails"


const shareButton = document.getElementById('share-button');
const tripDetails = document.getElementById('trip-details').innerText;

shareButton.addEventListener('click', async () => {
    if (navigator.share) {
        try {
            await navigator.share({
                title: 'Detalhes da Viagem',
                text: tripDetails,
                url: window.location.href,
            });
            console.log('Compartilhado com sucesso!');
        } catch (error) {
            console.error('Erro ao compartilhar:', error);
        }
    } else {
        alert('Compartilhamento não suportado neste navegador.');
    }
});
