// Example 1
ShoppingCart.discount = 0.05;

// create with blank constructor
ShoppingCart cart1 = new ShoppingCart();
cart1.setName('Donald Duck');

// add item with price 0
cart1.addItem('chips');

// add items one by one with price
cart1.addItems('cookies', 9.99);
cart1.addItems('pancake', 10.20);

// add multiple items at once
Map<String, Decimal> moreItems = new Map<String, Decimal>{
    'ketchup' => 5.55,
    'tea'     => 6.00
};
cart1.addItems(moreItems);

// print items map
System.debug(cart1.getShopItems());

// total
System.debug('Total value of cart is ' + cart1.getTotalAmount());

// summary
cart1.printSummary();

// clear
cart1.clearCart();
System.debug(cart1.getShopItems());


// Example 2
ShoppingCart cart2 = new ShoppingCart('Uncle Scrooge');

cart2.addItems('towel', 49.99);
cart2.addItems('Suit', 250.00);
cart2.addItems('watch', 199.00);

cart2.printSummary();

// now change discount
ShoppingCart.discount = 0.10;
cart2.printSummary();