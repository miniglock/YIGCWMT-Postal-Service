public class Tobedeleted {
    
    public static void tbd(){
        User currentUser=[SELECT Id, Alias, ContactId FROM User WHERE Name='John Severo'];
        List<Mail__c> mails = new List<Mail__c>();
        for(Mail__c mail : [SELECT Id, Name FROM Mail__c WHERE Inhabitant__r.Contact__c = :currentUser.ContactId]){
            mails.add(mail);
        }
        
        System.debug(currentUser);
    }

}