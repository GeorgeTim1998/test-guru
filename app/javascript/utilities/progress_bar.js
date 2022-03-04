document.addEventListener("turbolinks:load", function() {
  const greenBar = document.getElementById('green-bar')

  if (greenBar) {
    greenBar.style.width = greenBar.dataset.percent + '%'
    greenBar.textContent = greenBar.dataset.percent + '%'
  }
})
