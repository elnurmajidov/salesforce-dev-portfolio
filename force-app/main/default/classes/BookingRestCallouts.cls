public with sharing class BookingRestCallouts {
    
    @future(callout=true)
    public static void postBooking(Id bookingId) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://restful-booker.herokuapp.com/booking');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Accept', 'application/json');
        Booking__c booking = [SELECT Id, First_Name__c, Last_Name__c, Total_Price__c, Deposit_Paid__c, Check_Out_Date__c, Check_In_Date__c, Additional_Needs__c FROM Booking__c WHERE Id = :bookingId LIMIT 1];
        BookingRequestWrapper book = new BookingRequestWrapper();
        book.firstname = booking.First_Name__c;
        book.lastname = booking.Last_Name__c;
        book.depositpaid = booking.Deposit_Paid__c;
        book.totalprice = Integer.valueOf(booking.Total_Price__c);
        book.additionalneeds = booking.Additional_Needs__c;
        BookingD bookd = new BookingD();
        bookd.checkin = String.valueOf(booking.Check_In_Date__c);
        bookd.checkout = String.valueOf(booking.Check_Out_Date__c);
        book.bookingdates = bookd;
        String data = JSON.serialize(book);
        request.setBody(data);

        Http httpReq = new Http();
        HttpResponse response = httpReq.send(request);
            if (response.getStatusCode() == 200 || response.getStatusCode() == 201) {
            System.debug('Process successful');
            String jsbody = response.getBody();
            
            BookingResponseWrapper responseObj = (BookingResponseWrapper) JSON.deserialize(jsbody, BookingResponseWrapper.class);
            
            if (responseObj != null && responseObj.bookingid != null) {
                booking.Booking_ID__c = responseObj.bookingid;
                update booking;
                System.debug('Booking güncellendi. Yeni Booking ID: ' + booking.Booking_ID__c);
            }
        } else {
            System.debug('Callout failed. Status: ' + response.getStatus() + ', Body: ' + response.getBody());
        }
    }


    public class BookingRequestWrapper {
        public String firstname;
        public String lastname;
        public Integer totalprice;
        public Boolean depositpaid;
        public BookingD bookingdates;
        public String additionalneeds;
    }
    
    public class BookingD {
        public String checkin;
        public String checkout;
    }

    public class BookingResponseWrapper {
        public Integer bookingid;
        public Booking booking;
    }
    
    public class Booking {
        public String firstname;
        public String lastname;
        public Integer totalprice;
        public Boolean depositpaid;
        public BookingD bookingdates;
        public String additionalneeds;
    }
}