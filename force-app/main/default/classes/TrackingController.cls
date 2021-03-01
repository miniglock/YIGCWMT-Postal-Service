public with sharing class TrackingController {
     public Mail__c mailne {get; set;}
     public Integer tra {get; set;}
     public Boolean isvis{get; set;}
     public Boolean shoerror{get; set;} 
     public Boolean inshow{get; set;}
     public Boolean payout{get; set;}
   //  public String recep{get; set;}

    public TrackingController() {
        isvis=false;
        payout=false;
        inshow=false;
        shoerror=false;
        mailne =new Mail__c();
    
    
    }
    public Pagereference search(){
        String converttra=String.valueOf(tra);
        List<Mail__c>  tempmail=[SELECT Delivery_Status__c,Recipient__C,Name,Insurance__C,Insured_Value__c,Submit_For_Insurance__c,Approval_Status__c FROM Mail__c ];
       for(Mail__c c:tempmail){
         Integer n =Integer.valueOf(c.name);
           if(n==tra){
            isvis=true;
            mailne=c;
          //  recep=mailne.Recipient__C.replaceAll('<br>', ', ');
            shoerror=false;
            if(c.Insurance__c==true){
                inshow=true;
                if(c.Submit_For_Insurance__c==true){
                    payout=true;
                }
            }
           break;
        }else {
            isvis=false;
            isvis=false;
            shoerror=true;
            payout=false;
        }
    }
        return null;
    }
}