/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-30-2026
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/


@RestResource(urlMapping='/ContactManager/*')
global class ContactManager{
    @HttpGet
    global static Contact getContactDetails(){
        RestRequest request = RestContext.request;
        String contactId = request.requestURI.substring(request.requestURI.lastIndexOf('/') +1);

            Contact result = [SELECT Firstname, LastName, Title,Email,Department
                                                FROM Contact WHERE Id = :contactId];

            return result;

    }

    @HttpPost
    global static ID createContact(String firstName, String lastName, String Title, String Email, String Department){
        Contact thisContact = new Contact();

            thisContact.FirstName = firstName;
            thisContact.LastName = lastName;
            thisContact.Title = title;
            thisContact.Email = email;
            thisContact.Department = department;
    

        insert thisContact;
        return thisContact.Id;
    }

    @HttpDelete
    global static string deleteContact() {
    RestRequest request = RestContext.request;
        String contactId = request.requestURI.substring(request.requestURI.lastIndexOf('/') +1);
        Contact this1Contact = [SELECT Id FROM Contact WHERE Id = :contactId];
        delete this1Contact;
        return 'Contact Delete';
}

    @HttpPut
    global static ID upsertContact(String firstName, String lastName, String title, String Email, String Department, String Id){
        Contact this2Contact = new Contact(
        Id = id,
        FirstName = firstName ,
        LastName = lastName,
        Title = title,
        Email = email,
        Department = department
        );

        upsert this2Contact;
        return this2Contact.Id;
    }

    @HttpPatch
    global static Contact updateContactFileds(){
        RestRequest request = RestContext.request;
       // String contactId = request.requestURI.substring(request.requestURI.lastIndexOf('/') +1);

       // Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestBody.toString());
       // Contact this3Contact = new Contact(Id = contactId);

        String jsBody = request.requestBody.toString();
        Contact this3Contact = (Contact)JSON.deserialize(jsBody,Contact.class);

      //  for(String fieldName : params.keySet()){
        //    this3Contact.put(fieldName, params.get(fieldName));

      //  }

        update this3Contact;
        return this3Contact;
    }
    


}