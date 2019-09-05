
const cardPackages = document.querySelectorAll('#card-product-parent');
console.log(cardPackages);

const changeCartItemQuantity = () => {

  const buttonDecrease = document.getElementById("button-quantity-decrease");
  const buttonIncrease = document.getElementById("button-quantity-increase");
  const currentQuantityBox = document.getElementById("current-quantity");
  const quantityInput = document.getElementById("cart_item_quantity");

  // console.log(cardPackage);


      if (quantityInput) {
        buttonDecrease.addEventListener("click", (event) => {
           const currentQuantity = parseInt(currentQuantityBox.innerText);
           if (currentQuantity - 1 > 0) {
            currentQuantityBox.innerText = `${currentQuantity - 1}`;
            quantityInput.value = (currentQuantity - 1);
           }
        });

        // console.log(quantityInput);
        buttonIncrease.addEventListener("click", (event) => {
          const currentQuantity = parseInt(currentQuantityBox.innerText);
          currentQuantityBox.innerText = `${currentQuantity + 1}`;
          quantityInput.value = (currentQuantity + 1);
          // console.log(quantityInput);
        });
      }
}

// cardPackage.forEach((card) => {
//   console.log(card)
//   card.addEventListener('click', () => {
//       changeCartItemQuantity(card);
//     });
//   });


// for (var i = 0; i < cardPackages.length; ++i) {
//  var item = cardPackages[i]
// }


cardPackages.forEach((card) => {
  // let index = 0
  console.log(card);
  changeCartItemQuantity(card);
  // let index = index + card.item(index);
  });

export { changeCartItemQuantity };









