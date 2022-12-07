// Entry point for the build script in your package.json
//= require bootstrap-toggle
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

// Complete SortableJS (with all plugins)
import Sortable from 'sortablejs/modular/sortable.complete.esm.js';
import "trix"
import "@rails/actiontext"


import "trix"
import "@rails/actiontext"
import "chartkick/chart.js"

const toogleButton = document.getElementById("toggle-btn");
const prevSlideButton = document.getElementById("prevSlide");
const nextSlideButton = document.getElementById("nextSlide");

function nextSlide (event) {
  const slider = event.target.parentNode.children[1]
  slider.append(slider.children[0])
}


function prevSlide (event) {
  const slider = event.target.parentNode.children[1]
  slider.prepend(slider.children[slider.children.length - 1])
}

function colapse(event) {
  document.getElementById("toggle-example").classList.toggle("collapse")
}


toogleButton.addEventListener("click", colapse)

prevSlideButton.addEventListener("click", prevSlide);

nextSlideButton.addEventListener("click", nextSlide);
