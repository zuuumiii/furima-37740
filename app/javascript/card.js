const pay = () => {

  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();



    document.getElementById("card-number").removeAttribute("name");
    document.getElementById("card-cvc").removeAttribute("name");
    document.getElementById("card-exp-month").removeAttribute("name");
    document.getElementById("card-exp-year").removeAttribute("name");

    document.getElementById("charge-form").submit();

  });
};

window.addEventListener("load", pay);
