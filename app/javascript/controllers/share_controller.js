import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static targets = ["details"]
  connect() {
   
  }

  async show() {

      if (navigator.share) {
          try {
              await navigator.share({
                  title: 'Detalhes da Viagem',
                  text: this.detailsTarget.innerText,
                  url: window.location.href,
              });
              console.log('Compartilhado com sucesso!');
          } catch (error) {
              console.error('Erro ao compartilhar:', error);
          }
      } else {
          alert('Compartilhamento não suportado neste navegador.');
      }
  }


}
