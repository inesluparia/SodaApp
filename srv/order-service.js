const cds = require('@sap/cds')
//import cds from '@sap/cds'

class OrderService extends cds.ApplicationService { init(){

  const { Inventory } = this.entities ('sodaApp')
  const { Orders } = this.entities ('sodaApp')

  // Reduce stock of ordered books if available stock suffices
  this.on ('placeOrder', async req => {
    let {item, quantity: order_quantity} = req.data
    
    //unnecessary when auth is implemented
    if (order_quantity < 1) return req.reject (400,`quantity has to be 1 or more`)
    
    let res = await SELECT `quantity` .from (Inventory) .where ({item: item}) 
    if (res.length === 0) return req.error (404,`${item} doesn't exist`)

    let [{quantity:stock_quantity}] = res
    if (order_quantity > stock_quantity) return req.reject (409,`${order_quantity} exceeds stock for item #${item}`)

    //TODO check error handeling here....
    //Update inventory
    let update_response = await UPDATE (Inventory) .where ({item: item}) .with ({ quantity: stock_quantity -= order_quantity })

    //Create order
    let create_response = await INSERT .into(Orders) .entries({item: item, quantity: order_quantity})
    //req.res(200)
    //await this.emit ('OrderedBook', { book, quantity, buyer:req.user.id })
    //return { stock }
  })
}}

module.exports = {OrderService}