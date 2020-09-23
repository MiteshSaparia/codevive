public with sharing class AccountRest {
    public list<account> acc{get{
    	HttpRequest req = new HttpRequest();
        req.setEndpoint('https://'+URL.getSalesforceBaseUrl().getHost()+'/services/data/v39.0/query/?q=SELECT+Id,Name,AccountNumber,Type+FROM+Account+limit+10');
        req.setMethod('GET');
        
        //Get SessionId
        string autho = 'Bearer '+userInfo.getSessionId();
        req.setHeader('Authorization', autho);
        
        //Get Response
        Http http = new Http();
        HTTPresponse res= http.send(req);
        string response = res.getBody();
        
        //Deserialize obtained json response
        string str = '['+ response.substring(response.indexOf('records":[')+10,response.indexof(']}')) +']';
        acc = (list<Account>)JSON.deserialize(str,list<Account>.class);
        
        return acc;    
    }set;}
    
}