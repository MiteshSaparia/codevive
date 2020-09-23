global class AccountBatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id, Name, Industry FROM Account';                
        return Database.getQueryLocator(query);     
        //Write Query Here in This MEthod
    }
    global void execute(Database.BatchableContext BC, List<Account> accList){        
        for(Account acc : accList){          
            acc.Industry = 'Banking';    
        }
        update accList;  
        //Write Code Here 
    }
    global void finish(Database.BatchableContext BC) {  
        //
        To send confirmation emails or execute post-processing operations, use the finish method.
    }
}