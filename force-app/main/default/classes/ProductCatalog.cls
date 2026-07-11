public with sharing class ProductCatalog {

    private static Map<String,Decimal> products = new Map<String,Decimal>{'Laptop' => 3000, 'Monitor' => 2000, 'Smartphone' => 2000, 'Mouse' => 300};

    // Bir map içerisinde bulunan ürün ve fiyat ikililerinin herbirini debug edelim
   public static void displayProducts(){
        // Map<String,Decimal> products = new Map<String,Decimal>();
        // products.put('Laptop',3000);
        // products.put('Monitor',2000);
        // products.put('Smartphone',2000);
        // products.put('Mouse',300);

        for(String product : products.keySet()){
            // System.debug(product);
            Decimal price = products.get(product);
            System.debug('Product name ===> ' + product + ' ,Product price ===> $' + price );
            // System.debug('Product name ===> ' + product + ' ,Product price ===> $' + products.get(product) );
        }
   }

    //    Paramaetrede ürünün adı verilen ve fiyatını return eden bir method yazalım.
    public static String getProductPrice(String productName){
        // Map<String,Decimal> products = new Map<String,Decimal>{'Laptop' => 3000, 'Monitor' => 2000, 'Smartphone' => 2000, 'Mouse' => 300};

        String result ;
        if(products.containsKey(productName)){
            Decimal price = products.get(productName);
            result = productName + ' price is $' + price;
        }else{
            result = productName + ' is not exist!';
        }
        return result;
    }



    //    Paramaetrede ürünün adı verilen ve fiyatını return eden bir method yazalım.
    public static String getProductPrice2(String productName){
        // Map<String,Decimal> products = new Map<String,Decimal>{'Laptop' => 3000, 'Monitor' => 2000, 'Smartphone' => 2000, 'Mouse' => 300};

        if(products.containsKey(productName)){
            Decimal price = products.get(productName);
           return productName + ' price is $' + price;
        }
        return productName + ' is not exist!';
    }

}