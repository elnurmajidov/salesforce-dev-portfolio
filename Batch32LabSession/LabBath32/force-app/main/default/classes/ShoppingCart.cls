public class ShoppingCart {

    // Data members
    private String name;
    private Map<String, Decimal> shopItems;

    // We can access only discount variable outside of class
    public static Decimal discount;

    // (Hint) totals - next methodlerde işe yarasın diye
    private Decimal totalBeforeDiscount = 0;
    private Decimal discountAmount = 0;
    private Decimal totalAfterDiscount = 0;

    // --------------- Constructors ---------------

    // new ShoppingCart();  -> set name as blank
    public ShoppingCart() {
        this.name = '';
        this.shopItems = new Map<String, Decimal>();
        greetUser();
    }

    // new ShoppingCart('John'); -> set name as passed in parameter
    public ShoppingCart(String name) {
        this.name = (name == null) ? '' : name;
        this.shopItems = new Map<String, Decimal>();
        greetUser();
    }

    private void greetUser() {
        System.debug('Hello ' + this.name + ', we are glad you are here, what would you like to shop today?');
    }

    // --------------- Getter / Setter for Name ---------------

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = (name == null) ? '' : name;
    }

    // --------------- Methods required ---------------

    // addItem(string itemName) -> price 0.0
    public void addItem(String itemName) {
        if (String.isBlank(itemName)) return;
        this.shopItems.put(itemName, 0.0);
    }

    // addItems(string itemName, decimal price)
    public void addItems(String itemName, Decimal price) {
        if (String.isBlank(itemName)) return;
        if (price == null) price = 0.0;
        this.shopItems.put(itemName, price);
    }

    // addItems(map<string, decimal> itemsPrice)
    public void addItems(Map<String, Decimal> itemsPrice) {
        if (itemsPrice == null || itemsPrice.isEmpty()) return;
        this.shopItems.putAll(itemsPrice);
    }

    // removeItem(string itemName)
    public String removeItem(String itemName) {
        if (this.shopItems.containsKey(itemName)) {
            this.shopItems.remove(itemName);
            return '\'' + itemName + '\' removed successfully';
        }
        return 'no such item is added in cart, how can I remove it buddy?';
    }

    // getShopItems()
    public Map<String, Decimal> getShopItems() {
        return this.shopItems;
    }

    // getTotalAmount()
    // - total > 300 => discount uygula (discount static variable)
    // - return: pay ediləcək final amount (discount sonrası)
    public Decimal getTotalAmount() {
        Decimal sumTotal = 0;

        for (String isoCode : this.shopItems.keySet()) {   // hocanın keySet iteration metodu
            Decimal price = this.shopItems.get(isoCode);
            if (price == null) price = 0;
            sumTotal += price;
        }

        this.totalBeforeDiscount = sumTotal;

        if (sumTotal > 300 && ShoppingCart.discount != null && ShoppingCart.discount > 0) {
            this.discountAmount = (sumTotal * ShoppingCart.discount);
            this.totalAfterDiscount = sumTotal - this.discountAmount;
        } else {
            this.discountAmount = 0;
            this.totalAfterDiscount = sumTotal;
        }

        return this.totalAfterDiscount;
    }

    // printSummary()
    public void printSummary() {
        Integer itemCount = this.shopItems.size();

        System.debug('You have added ' + itemCount + ' items in your cart. Each items and its prices are below');

        // item lines
        for (String itemName : this.shopItems.keySet()) {
            Decimal price = this.shopItems.get(itemName);
            if (price == null) price = 0;
            System.debug('Item name \'' + itemName + '\', its price is ' + fmt(price));
        }

        // totals
        Decimal finalPay = getTotalAmount(); // totals compute eder

        System.debug('Total value of your cart is ' + fmt(this.totalBeforeDiscount));

        if (this.totalBeforeDiscount >= 300 && this.discountAmount > 0) {
            System.debug('Final price to pay is ' + fmt(finalPay));
            System.debug('Congratulations, You JUST saved ' + fmt(this.discountAmount) + '.');
        } else {
            Decimal remaining = 300 - this.totalBeforeDiscount;
            if (remaining > 0) {
                System.debug('Add items worth ' + fmt(remaining) + ' to get bind blowing discount');
            }
        }
    }

    // clearCart()
    public void clearCart() {
        this.shopItems.clear();
    }

    // helper formatter: 2 decimal
    private static String fmt(Decimal d) {
        if (d == null) d = 0;
        return String.valueOf(d.setScale(2));
    }
}