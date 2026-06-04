import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "input", "results" ]

  search() {
    const query = this.inputTarget.value;

    if (query.length === 0) {
      this.clearResults();
      return;
    }

    fetch(`/boards/autocomplete?term=${encodeURIComponent(query)}`)
      .then(response => response.json())
      .then(data => {
        this.renderResults(data);
      });
  }

  renderResults(data) {
    this.clearResults();

    if (data.length === 0) return;

    const ul = document.createElement("ul");
    ul.className = "list-group position-absolute w-100 shadow-sm";
    ul.style.zIndex = "1000";

    data.forEach(title => {
      const li = document.createElement("li");
      li.className = "list-group-item list-group-item-action cursor-pointer";
      li.textContent = title;
      
      li.addEventListener("click", () => {
        this.inputTarget.value = title;
        this.clearResults();
        this.element.requestSubmit();
      }); // 💡 【ここを修正！】消えていた閉じカッコを追加しました！

      ul.appendChild(li);
    });

    this.resultsTarget.appendChild(ul);
  }

  clearResults() {
    this.resultsTarget.innerHTML = "";
  }
}