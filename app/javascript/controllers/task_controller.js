import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs/modular/sortable.complete.esm"

// Connects to data-controller="sortable"
export default class extends Controller {

  static targets = [ "todo", "inprogress", "completed"]

  connect() {

    }

};
