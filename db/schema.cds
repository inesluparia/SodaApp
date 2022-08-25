using { Currency, managed, sap, cuid } from '@sap/cds/common';
namespace sodaApp;

entity Inventory {
    // item : Association to Items;
    key item : Beverages;
    quantity : Integer;
    location : Location;
}

type Beverages : String enum {
    Coke ; Fanta ; Expresso; Ristretto; Tuborg; Tuborg_light;
}

type Location : String enum {
    Coffee; Fridge1; Fridge2
}

entity Orders : managed, cuid {
    item : Beverages;
    quantity : Integer;
} 

//////////To have multiple items in the order
// entity Orders : managed, cuid {
//     Items : Composition of many OrderItems on Items.parent = $self;    
// }

// entity OrderItems {
//     key ID : UUID;
//     parent : Association to Orders;
//     item : Beverages;
//     // item : Association to Items;
//     quantity : Integer;
// }


// entity Items {
//     key ID : Integer;
//     name   : String(111);
//     price : Decimal;
// }