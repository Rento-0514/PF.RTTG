import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["input", "list"]

  connect() {
    // コントローラーが接続されたときの処理
  }

    
    updateList(data) {
        this.listTarget.innerHTML = data.map(customer => {
          return `<li data-action="click->autocomplete#selectItem">${customer.name}</li>`;
        }).join("");
      }
      
      // イベント処理部分
      selectItem(event) {
        const name = event.target.textContent;
        this.inputTarget.value = name;
        this.listTarget.innerHTML = '';
      }
    

  search() {
    const query = encodeURIComponent(this.inputTarget.value);
    const url = `/customers/search?q=${query}`;
  
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        } else {
          throw new Error('Network response was not ok.');
        }
      })
      .then(data => {
        this.updateList(data); // ここを変更して、既にあるメソッドを再利用する
      })
      .catch(error => {
        console.error('Error:', error);
      });
  }
}