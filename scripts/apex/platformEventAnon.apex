Order_Event__e event1 = new Order_Event__e ();
event1.Has_ShiHas_Shippedpped__c = true;
event1.Order_Event__c = '1945';
EventBus.publish(event1);