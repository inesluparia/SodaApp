using { sodaApp as schema } from '../db/schema';

@(path:'/orders')
service OrderService {
    action placeOrder ( item: String, quantity: Integer)
}