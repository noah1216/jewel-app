function post (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const Tax = 0.1;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor( `${inputValue}` * Tax );

    const salesCommission = inputValue * Tax;
    const salesPrice = document.getElementById("profit");
    salesPrice.innerHTML = Math.floor( `${inputValue}` - salesCommission );
  });
}

window.addEventListener('load', post);