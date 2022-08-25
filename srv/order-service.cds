using { sodaApp as schema } from '../db/schema';

service OrderService @(path:'/orders'){
    entity Order as projection on schema.Orders;
    //action placeOrder ( item: String, quantity: Integer)
}