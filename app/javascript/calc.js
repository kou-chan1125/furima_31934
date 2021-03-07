function calc (){
  const itemPrice  = document.getElementById("item-price");


  itemPrice.addEventListener("input", ()=> {
    const itemPriceVal = itemPrice.value
    const Tax = 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    const Profit = document.getElementById("profit");
    const addTaxVal = itemPriceVal * Tax;
    const profitVal = itemPriceVal - addTaxVal;

    addTaxPrice.innerHTML = `${addTaxVal}`;
    Profit.innerHTML = `${profitVal}`;


  })


}
window.addEventListener("load",calc);
