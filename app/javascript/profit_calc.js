window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput != null) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxPrice = document.getElementById("add-tax-price");
      addTaxPrice.innerHTML = Math.floor(inputValue * 0.1);
      const profit = document.getElementById("profit");
      profit.innerHTML = Math.floor(inputValue * 0.9);
    })
  }
})
