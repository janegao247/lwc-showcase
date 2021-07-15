@RestResource(urlMapping = '/StentImport/*')
global class REST_Lead {
@HttpPatch
    global static void updateLead(){
        // Initializing the request parameter with the incoming request
        RestRequest leadRequest = RestContext.request;
        // Getting the request URI
        String leadRequestURI = leadRequest.requestURI;
        // Getting the contact id from the request URI
        String lkId = leadRequestURI.substring(leadRequestURI.lastIndexOf('/') + 1);
        

        try{
        Lead l = [SELECT Id,Company,Email,LinkedInId__c from Lead WHERE LinkedInId__c=:lkId ];            
        String requestBody = leadRequest.requestBody.toString();
		// Deserializing the JSON response body and assigning it to the instance of Contact object
		Map<String, Object> o = (Map<String, Object>) JSON.deserializeUntyped(requestBody);
		String parsed=(String)o.get('Company');
        l.Company=parsed;
        update l;

        }
        catch(Exception e){
            RestContext.response.responseBody = Blob.valueOf('Error: ' + e.getMessage());
        }
    } 
    @HttpGet
    global static List<Lead> getLeads(){
        
        List<Lead> ls = [SELECT Id, Email , Company, LinkedInId__c FROM Lead];
		return ls;
    } 
}