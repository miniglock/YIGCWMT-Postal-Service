public with sharing class HomePageListController {

    public Mail__c getHello(){
        return new Mail__c();
    }


    public ApexPages.StandardSetController setCon{
        get {

            if(setCon==null){
                //User currentUser = [SELECT Id, ContactId FROM User WHERE Id=:UserInfo.getUserId()]; This is final code; below is for testing purposes
                User currentUser = [SELECT Id, ContactId FROM User WHERE Id='0054x000004KA2MAAW'];
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id, Name, Delivery_Status__c, Height__c, Length__c, Thickness__c, Weight__c, Insurance__c, Insured_Value__c FROM Mail__c WHERE Inhabitant__r.Contact__c = :currentUser.ContactId]));
            }
        return setCon;
        }
        set;

    }
    public List<Mail__c> getTransitMail(){
        List<Mail__c> mail1 = new List<Mail__c>();
        List<Mail__c> records = setCon.getRecords();
        for(Mail__c mail : records){
            if(mail.Delivery_Status__c!='Missing'){
                mail1.add(mail);
            }
        }
        return mail1;
    }
    public List<Mail__c> getMissingMail(){
        List<Mail__c> mail2 = new List<Mail__c>();
        List<Mail__c> records = setCon.getRecords();
        for(Mail__c mail : records){
            if(mail.Delivery_Status__c=='Missing'){
                mail2.add(mail);
            }
        }
        return mail2;
    }
    
    
}
