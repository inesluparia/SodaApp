using { Currency, managed, sap, cuid } from '@sap/cds/common';
namespace sodaApp;

entity Inventory : managed {
    // item : Association to Items;
    item : Beverages;
    quantity : Integer;
    location : String(2);
}

// entity Items {
//     key ID : Integer;
//     name   : String(111);
//     price : Decimal;
// }

entity Orders : managed, cuid {
    Items : Composition of many OrderItems on Items.parent = $self;    
}

entity OrderItems {
    key ID : UUID;
    parent : Association to Orders;
    item : Beverages;
    // item : Association to Items;
    quantity : Integer;
}

type Beverages : String enum {
    Coke ; Fanta ; Coffee 
}

