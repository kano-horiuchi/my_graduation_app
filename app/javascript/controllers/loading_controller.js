import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    static targets = [ "message" ]
    show(e){
        console.log("ボタンがクリックされました！");
        this.messageTarget.classList.remove("d-none")
        e.currentTarget.disabled = true
    }
}