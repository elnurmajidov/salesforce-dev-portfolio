trigger BookingTrigger on Booking__c (after insert) {
    if (Trigger.isAfter && Trigger.isInsert) {

        for (Booking__c eachBooking : trigger.new) {
            if (eachBooking.Booking_ID__c == null) {
                BookingRestCallouts.postBooking(eachBooking.Id);
            }
            
        }
    }
}