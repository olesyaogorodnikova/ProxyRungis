const changeCartItemQuantity = () => {

  const decreaseButtons = document.querySelectorAll("#button-quantity-decrease");
  const increaseButtons = document.querySelectorAll("#button-quantity-increase");

  decreaseButtons.forEach((button) => {
    button.addEventListener("click", (event) => {
      const packageId = event.currentTarget.dataset.package;
      const form = document.querySelector(`form[data-package='${packageId}']`);
      const currentQuantityBox = form.querySelector("#current-quantity");
      const quantityInput = form.querySelector("#cart_item_quantity");

      const currentQuantity = parseInt(currentQuantityBox.innerText);
      if (currentQuantity - 1 > 0) {
        currentQuantityBox.innerText = `${currentQuantity - 1}`;
        quantityInput.value = (currentQuantity - 1);
      }
    });
  })

  increaseButtons.forEach((button) => {
    button.addEventListener("click", (event) => {
       const packageId = event.currentTarget.dataset.package;
       const form = document.querySelector(`form[data-package='${packageId}']`);
       const currentQuantityBox = form.querySelector("#current-quantity");
       const quantityInput = form.querySelector("#cart_item_quantity");

       const currentQuantity = parseInt(currentQuantityBox.innerText);
       currentQuantityBox.innerText = `${currentQuantity + 1}`;
       quantityInput.value = (currentQuantity + 1);

    });
  });
}


export { changeCartItemQuantity };









