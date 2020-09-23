public class AccountTriggerHandler {
    public static void createContact(List<Account> accounts) {
        List<Contact> contact = new List<Contact>();
        List<Opportunity> opportunity = new List<Opportunity>();
        for(Account acc : accounts){
            
            Contact con = new Contact();
            con.LastName = acc.name;
            con.AccountId = acc.id;
            con.MailingStreet = acc.BillingStreet;
            con.MailingCity = acc.BillingCity;
            con.MailingState = acc.BillingState;
            con.MailingPostalCode = acc.BillingPostalCode;
            con.MailingCountry = acc.BillingCountry;
            con.MobilePhone = acc.Phone;
            con.Email = acc.Email__c;
            con.Fax = acc.Fax;
            con.Level__c = 'Primary';
            
            contact.add(con);
            
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.id;
            opp.Name = acc.name;
            opp.Contact__c = con.Id;
            opp.StageName = 'Prospecting';
            opp.CloseDate = date.today().addDays(25);
            opp.Type = 'New Customer';
            opp.LeadSource = 'Web';
            opp.DeliveryInstallationStatus__c = 'In progress';
            opportunity.add(opp);
        }
        insert contact; 
        System.debug('contact:'+contact);
        insert opportunity;
        System.debug('opportunity:'+opportunity);
    }    
}