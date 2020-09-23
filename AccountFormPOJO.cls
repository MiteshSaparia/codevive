public class AccountFormPOJO {
    public String accountId {get;set;} 
    public AccountFormPOJO(JSONParser parser) {
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
      if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
        String text = parser.getText();
        if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
          if (text == 'accountId') {
            accountId = parser.getText();
          } else {
            System.debug(LoggingLevel.WARN, 'AccountFormPOJO'+text);
            consumeObject(parser);
          }
        } 
      }
    }
  }
  
  
  public static List<AccountFormPOJO> parse(String json) {
    System.JSONParser parser = System.JSON.createParser(json);
    return arrayOfAccountFormPOJO(parser);
  }
  
  public static void consumeObject(System.JSONParser parser) {
    Integer depth = 0;
    do {
      System.JSONToken curr = parser.getCurrentToken();
      if (curr == System.JSONToken.START_OBJECT || 
        curr == System.JSONToken.START_ARRAY) {
        depth++;
      } else if (curr == System.JSONToken.END_OBJECT ||
        curr == System.JSONToken.END_ARRAY) {
        depth--;
      }
    } while (depth > 0 && parser.nextToken() != null);
  }
  


    private static List<AccountFormPOJO> arrayOfAccountFormPOJO(System.JSONParser p) {
        List<AccountFormPOJO> res = new List<AccountFormPOJO>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new AccountFormPOJO(p));
        }
        return res;
    }
}