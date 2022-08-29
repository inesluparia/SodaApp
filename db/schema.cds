using { managed, sap, cuid } from '@sap/cds/common';
namespace sodaApp;

type Items : String enum {
  Coke; Light_Coke; Tuborg; Tuborg_Nul; Fanta; Danskvand; Sprite; Expresso; Ristretto; Lungo
}

type Location : String enum {
    Coffee; Fridge1; Fridge2
}

entity Inventory : cuid {
    item: Items;
    quantity: Integer;
    location: Location;
}

entity Orders : managed, cuid {
    item : Items;
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
//     key ID: Integer;
//     name: String(30);
//     price: Decimal;
//     image: String(111);
// }


// entity Inventory {
//     key ID : UUID;
//     item_ID: Association to one Items;
//     quantity: Integer;
//     location: Location;
// }

// entity Orders : managed, cuid {
//     item : Association to one Items;
//     quantity : Integer;
// } 