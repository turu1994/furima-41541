const price = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitField = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
    profitField.innerHTML = (inputValue - Math.floor(inputValue * 0.1)).toLocaleString();
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
