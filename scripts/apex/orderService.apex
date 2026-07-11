List<Order__c> orders = [SELECT Id FROM Order__c WHERE Status__c = 'Draft'];
Set<Id> orderIds = new Set<Id>();
for (Order__c ord : orders) {
    orderIds.add(ord.Id);
}

OrderService os = new OrderService(50);
os.processOrders(orderIds);