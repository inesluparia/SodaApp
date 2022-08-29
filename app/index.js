document.getElementById("coffee").addEventListener("click", fetchInventory);

let order = { item: "Coke", quantaty: 2}

let inventory = [];

async function fetchInventory() {
    const res = await fetch("http://localhost:4004/inv/Inventory")
    const data = await res.json();
    
    Object.assign(inventory, data.data);
    console.log(inventory)
    
    //const itemsArray = await res.json();
    //console.log(itemsArray);
}


/*onMount(async () => {
    const res = await fetch(synthURL);
    const { data: productArray } = await res.json();
    products = productArray;
});*/

/*async function login(){
    const res = await fetch(loginURL, {
      headers: {
        "content-type": "application/json"
      },
      method: "POST",
      body: JSON.stringify({email, password})
    });*/