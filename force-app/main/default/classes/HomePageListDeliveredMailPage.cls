public inherited sharing class HomePageListDeliveredMailPage {
    public Integer recordCount{get;set;}
    public static Integer pageSize = 6;


    public ApexPages.StandardSetController setCon{
        get {

            if(setCon==null){
                //User currentUser = [SELECT Id, ContactId FROM User WHERE Id=:UserInfo.getUserId()]; 
                //Above is final code; below is for testing purposes
                User currentUser = [SELECT Id, ContactId FROM User WHERE Id='0054x000004KA2MAAW'];
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id, Name, Delivery_Status__c, Height__c, Length__c, Thickness__c, Weight__c, Insurance__c, Insured_Value__c FROM Mail__c WHERE Inhabitant__r.Contact__c = :currentUser.ContactId AND Delivery_Status__c = 'Delivered' ORDER BY Name]));
                setCon.setPageSize(pageSize);
                recordCount = setCon.getResultSize();
            }
        return setCon;
        }
        set;

    }

    public List<Mail__c> getDeliveredMail(){
        List<Mail__c> mailList = new List<Mail__c>();
        List<Mail__c> records = setCon.getRecords();
        for(Mail__c mail : records){
                mailList.add(mail);
        }
        return mailList;
    }
    public Boolean hasNext{
        get{
            return setCon.getHasNext();
        }
        private set;
    }
    public Boolean hasPrevious{
        get{
            return setCon.getHasPrevious();
        }
        private set;
    }
    public Integer pageNumber {
        get{
            return setCon.getPageNumber();
        }
        private set;
    }
    public void first(){
        setCon.first();
    }
    public void last(){
        setCon.last();
    }
    public void previous(){
        setCon.previous();
    }
    public void next(){
        setCon.next();
    }

}