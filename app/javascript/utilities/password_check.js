
document.addEventListener("input", function() {
  let forms = document.forms[0]
  
  if (forms.user_password_confirmation) { comparePasswordInputs(forms) }
})

function comparePasswordInputs(forms) {
  
  const value = forms.user_password.value
  const confirmation_value = forms.user_password_confirmation.value

  if (confirmation_value === '') {
    forms.querySelectorAll(".octicon-check-circle").forEach((octicon) => octicon.classList.add("hide"))
    forms.querySelectorAll(".octicon-circle-slash").forEach((octicon) => octicon.classList.add("hide"))
    console.log('Not yet')
  } else if (value === confirmation_value) {
    forms.querySelectorAll(".octicon-check-circle").forEach((octicon) => octicon.classList.remove("hide"))
    forms.querySelectorAll(".octicon-circle-slash").forEach((octicon) => octicon.classList.add("hide"))
    console.log('Bingo!')
  } else {
    forms.querySelectorAll(".octicon-circle-slash").forEach((octicon) => octicon.classList.remove("hide"))
    forms.querySelectorAll(".octicon-check-circle").forEach((octicon) => octicon.classList.add("hide"))
    console.log('Wrong!')
  }
}
