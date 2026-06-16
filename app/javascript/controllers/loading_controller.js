import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    static targets = [ "message" ]
    show(e){
        this.messageTarget.classList.remove("d-none");
        e.currentTarget.style.pointerEvents = "none";
    }
}