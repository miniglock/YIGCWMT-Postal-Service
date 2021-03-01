public without sharing class Zod {
    public static void tester(){
        List<String> ipHold = new List<String>();
        for(Integer i=1;i<255;i++){
            Integer j =i+1;
            String ip='<ipRanges><end>'+i+'.255.255.255</end><start>'+i+'.255.255.255</start></ipRanges>';
            ipHold.add(ip);
        }
        System.debug(ipHold);

    }
    public static void football(){
        Route__c holding = [SELECT Id, Name, IPHOLDING__c FROM Route__c WHERE Name = 'R-00011' LIMIT 1];
        List<String> ipHold = new List<String>();
        for(Integer i=1;i<255;i++){
            Integer j =i+1;
            String ip='<ipRanges><end>'+j+'.255.255.255</end><start>'+i+'.255.255.255</start></ipRanges>';
            ipHold.add(ip);
        }
        holding.IPHOLDING__c = string.join(ipHold, ',');
        System.debug(holding);
    }
}