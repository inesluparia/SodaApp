const cds = require('@sap/cds')
//import cds from '@sap/cds'

class OrderService extends cds.ApplicationService { init(){

  const { Inventory } = this.entities ('sodaApp')

  // Reduce stock of ordered books if available stock suffices
  this.on ('placeOrder', async req => {
    const {item, quantity} = req.data
    //if (quantity < 1) return req.reject (400,`quantity has to be 1 or more`)
    let stock = await SELECT `quantity` .from (Inventory,item)
    if (!stock) return req.error (404,`Book #${book} doesn't exist`)
    let {s} = stock
    if (quantity > s) return req.reject (409,`${quantity} exceeds stock for item #${item}`)
    await UPDATE (Inventory,item) .with ({ quantity: quantity -= s })
    //await this.emit ('OrderedBook', { book, quantity, buyer:req.user.id })
    //return { stock }
  })
}}
