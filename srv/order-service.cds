using { sodaApp as schema } from '../db/schema';

service OrderService @(path:'/orders'){
    action placeOrder ( item: String, quantity: Integer)
}