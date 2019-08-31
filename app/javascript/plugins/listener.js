const cible = document.querySelector('#icon-button-shopping-basket');
const button = document.querySelector('#button-validation-cart-item');

button.addEventListener('click', (e) => {
  e.target.classList.add('active');
  e.target.innerText = 'Votre commande en cours';
});

const basketWithCartItems = (cart) => {
  return cible.target.classList.add('active')
};




function activateCart(newColor) {
  var elem = document.getElementById('button-validation-cart-item');
  elem.style.color = newColor;
}
