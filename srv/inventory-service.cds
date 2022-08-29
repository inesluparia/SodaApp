using { sodaApp as schema } from '../db/schema';

service InventoryService @(path:'/api'){

  @readonly entity All_Inventory as projection on schema.Inventory;
  @readonly entity Coffee_Inventory as select from schema.Inventory { * } where location='Coffee';
  @readonly entity Fridge_1_Inventory as select from schema.Inventory { * } where location='Fridge1';

  //for testing purposes
  entity All_Orders as projection on schema.Orders;
}



// service CatalogService @(path:'/browse') {

//   /** For displaying lists of Books */
//   @readonly entity ListOfBooks as projection on Books
//   excluding { descr };

//   /** For display in details pages */
//   @readonly entity Books as projection on my.Books { *,
//     author.name as author
//   } excluding { createdBy, modifiedBy };

//   @requires: 'authenticated-user'
//   action submitOrder ( book: Books:ID, quantity: Integer ) returns { stock: Integer };
//   event OrderedBook : { book: Books:ID; quantity: Integer; buyer: String };
// }