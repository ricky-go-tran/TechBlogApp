import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["source"]
    navigate() {

        window.location.href= this.pathTarget.dataset.content
    }
}
