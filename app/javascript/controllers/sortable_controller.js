import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs/modular/sortable.complete.esm"

// Connects to data-controller="sortable"
export default class extends Controller {

  static targets = [ "todiscuss", "unassigned" ,"todo", "inprogress", "completed", "task"]

  connect() {
    console.log(this.todoTarget)
    const csrfToken = document.querySelector("meta[name=csrf-token]").getAttribute("content")

    new Sortable(this.todiscussTarget, {
      group: 'shared', // set both lists to same group
      animation: 150,
      onAdd: function (event) {
        const url = event.item.children[0].id

        fetch(url, {
          method: "PATCH",
          credentials: "same-origin",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": csrfToken
          },
          body: JSON.stringify(
            { status: "To Discuss"
          })
        })

      }
    });

    new Sortable(this.unassignedTarget, {
      group: 'shared', // set both lists to same group
      animation: 150,
      onAdd: function (event) {
        const url = event.item.children[0].id
        fetch(url, {
          method: "PATCH",
          credentials: "same-origin",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": csrfToken
          },
          body: JSON.stringify(
            { status: "Unassigned"
          })
        })
      }
    });

    new Sortable(this.todoTarget, {
      group: 'shared', // set both lists to same group
      animation: 150,
      onAdd: function (event) {
        const url = event.item.children[0].id

        fetch(url, {
          method: "PATCH",
          credentials: "same-origin",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": csrfToken
          },
          body: JSON.stringify(
            { status: "To-Do"
          })
        })
      }
    });

    new Sortable(this.inprogressTarget, {
      group: 'shared',
      animation: 150,
      onAdd: function (event) {
        const url = event.item.children[0].id

        fetch(url, {
          method: "PATCH",
          credentials: "same-origin",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": csrfToken
          },
          body: JSON.stringify(
            { status: "In progress"
          })
        })
      }
    });

    new Sortable(this.completedTarget, {
      group: 'shared',
      animation: 150,
      onAdd: function (event) {
        const url = event.item.children[0].id

        fetch(url, {
          method: "PATCH",
          credentials: "same-origin",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": csrfToken
          },
          body: JSON.stringify(
            { status: "Completed"
          })
        })
      }
    });

  };
}
