public with sharing class CommentCallouts {
    public class commentWrapper{
        public integer total ;
        public integer skip;
        public list<comment> comments;

    }
    public class comment{
        public integer id ;
        public string body;
        public integer postId;
        public userData user;
    }
    public class userData{
        public integer id ;
        public string username;
        public string fullName;
    
    }
    public static void getComments(){
        Http httpObject = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://dummyjson.com/comments');
        request.setMethod('GET');
        HttpResponse response = httpObject.send(request);
        if (response.getStatusCode() == 200) {
            commentWrapper result = (commentWrapper)JSON.deserialize(response.getBody(), commentWrapper.class);

            List<Comment__c> commentList = new List<Comment__c>();
            for (comment cm : result.comments) {
                Comment__c newCom = new Comment__c();

                newCom.Extenal_Id__c = String.valueOf(cm.id);
                newCom.Body__c = cm.body;
                newCom.Post_Id__c = String.valueOf(cm.postId);
                
                newCom.User_Name__c = cm.user.username;
                newCom.Full_Name__c = cm.user.fullName;
                commentList.add(newCom);
            }
            if (!commentList.isEmpty()) {
                insert commentList;
            }
        }
        
        
    }
}