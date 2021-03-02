public inherited sharing class CaseFormExtension {
    public Case myCase {get;set;}
    ApexPages.StandardController sController;
    
    public CaseFormExtension(ApexPages.StandardController stdController) { 
        sController = stdcontroller;
    }
    

    public Pagereference save(){
        sController.save();
        //insert myCase;
        PageReference pref = new PageReference('/apex/CaseThankYouPage');
        pref.setRedirect(true);

        return pref;
    }
    
}