function calcPrice (){
  const priceElem = document.getElementById("item-price")
  priceElem.addEventListener("keyup", () => {
    const price = priceElem.value
    const tax = Math.floor(price * 0.1)
    const profit = price - tax

    const taxElem = document.getElementById("add-tax-price")
    const profitElem = document.getElementById("profit")

    taxElem.innerHTML = tax
    profitElem.innerHTML = profit
  })
};

window.addEventListener('load', calcPrice);
