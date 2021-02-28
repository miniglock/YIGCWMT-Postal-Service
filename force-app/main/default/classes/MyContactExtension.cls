public class MyContactExtension {
    public Contact myContact {get;set;}

    public myContactExtension(ApexPages.StandardController stdController) { 
        //Finds the Current User
        User[] users = [SELECT ContactId FROM User WHERE Id = :UserInfo.getUserId()];
        User usr = users[0];

        //Loads the contact related to the user
        Contact[] contacts = [SELECT Name, Firstname, Lastname, Email, Phone, MobilePhone, OtherPhone
                              FROM Contact WHERE Id = :usr.ContactId];
            if (contacts.isEmpty()) {
                Contact testContact = new Contact(FirstName = 'Ricky', LastName ='Bobby', Email='RacecarBackwards@gmail.com');
                this.myContact = testContact;
            // handle when contacts is empty
            } else {
                this.myContact = contacts[0];     
        }
    }

    //updates contact and rerenders the page
    public Pagereference save(){
        update myContact;
        return null;
    }
}