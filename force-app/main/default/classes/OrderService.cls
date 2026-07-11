public class OrderService {

    private Decimal shippingFee = 0;

    public OrderService(Decimal shippingFee) {
        if(shippingFee != null){
            this.shippingFee = shippingFee;
        }else{
            this.shippingFee = 0 ;
        }
    }

    public Decimal getShippingfee(){
        return this.shippingFee;
    }

    public void setShippingFee(Decimal shippingFee){
        if(shippingFee != null){
            this.shippingFee = shippingFee;
        }else{
            this.shippingFee = 0 ;
        }
    }

    public void processOrders(Set<Id> ordersId){
        List<Order__c> orders = [SELECT Id, Order_Quantity__c, Product__r.Price__c, Product__r.Stock_Quantity__c FROM Order__c WHERE Id IN:ordersId AND Status__c = 'Draft'];

        if(orders.isEmpty()) return;

        Set<Id> productIds = new Set<Id>();
        for(Order__c ord : orders){
            productIds.add(ord.Product__c);
        }

        /*
        Map<Id,Product__c> productMap = new Map<Id,Product__c> ();
        List<Product__c> products = [SELECT Id,Price__c,Stock_Quantity__c FROM Product__c WHERE Id IN : productIds];
        for(Product__c prod : products){
            productMap.put(prod.Id,prod);
        }
        */

        Map<Id,Product__c> productMap = new Map<Id,Product__c>([SELECT Id,Price__c,Stock_Quantity__c FROM Product__c WHERE Id IN : productIds ]);

        for(Order__c ord : orders){
            Product__c prod = productMap.get(ord.Product__c);

            if(prod != null && prod.Stock_Quantity__c >= ord.Order_Quantity__c){
                ord.Total_Price__c = (ord.Order_Quantity__c * prod.Price__c) + this.shippingFee;
                ord.Status__c = 'Processing';


                prod.Stock_Quantity__c -= ord.Order_Quantity__c;
            }else if(prod != null && prod.Stock_Quantity__c < ord.Order_Quantity__c){
                ord.Status__c = 'Out Of Stock';
            }
        }

        update orders;

        update productMap.values();
    }
}