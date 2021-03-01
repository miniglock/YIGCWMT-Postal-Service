public with sharing class HomePageController {


    public HomePageController(ApexPages.StandardController stdController) {}

    public List<Mail__c> AllUserMail{
        /*User hold1 = [SELECT Id, Alias FROM User WHERE Username='externaluser1614450360435@company.com'];
        User hold = [SELECT Id, Name, ContactId FROM User WHERE Id = :UserInfo.getUserId()];
        */
        get {
            if(AllUserMail==null){
                AllUserMail = new List<Mail__c>();
        
                User currentUser = [SELECT Id, ContactId FROM User WHERE Id=:UserInfo.getUserId()];

                for(Mail__c mail : [SELECT Id, Name, Delivery_Status__c, Height__c, Length__c, Thickness__c, Weight__c, Insurance__c, Insured_Value__c FROM Mail__c WHERE Inhabitant__r.Contact__c = :currentUser.ContactId]){
                AllUserMail.add(mail);
                }
            }
        return AllUserMail;
        }
        set;
    }
    
    
}