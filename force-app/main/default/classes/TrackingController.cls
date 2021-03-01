public with sharing class TrackingController {
     public Mail__c mailne {get; set;}
     public Integer tra {get; set;}
     public Boolean isvis{get; set;}
     public Boolean shoerror{get; set;} 
   //  public String recep{get; set;}

    public TrackingController() {
        isvis=false;
        shoerror=false;
        mailne =new Mail__c();
    
    
    }
    public Pagereference search(){
        String converttra=String.valueOf(tra);
        List<Mail__c>  tempmail=[SELECT Delivery_Status__c,Recipient__C,Name FROM Mail__c ];
       for(Mail__c c:tempmail){
         Integer n =Integer.valueOf(c.name);
           if(n==tra){
            isvis=true;
            mailne=c;
          //  recep=mailne.Recipient__C.replaceAll('<br>', ', ');
            shoerror=false;
           break;
        }else {
            isvis=false;
            shoerror=true;
        }
    }
        return null;
    }
}