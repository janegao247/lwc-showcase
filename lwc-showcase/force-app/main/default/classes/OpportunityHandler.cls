public with sharing class OpportunityHandler extends TriggerHandler{
    public OpportunityHandler() {
    }
  
    @TestVisible
    protected override void beforeUpdate(
      List<SObject> newRecords,
      Map<Id, SObject> newMap,
      List<SObject> oldRecords,
      Map<Id, SObject> oldMap
    ) {
        this.setCloseDateWhenClosedWon(newRecords, oldRecords);
    }
  
    private void setCloseDateWhenClosedWon(
      List<SObject> newRecords,
      List<SObject> oldRecords
    ) {
      for (Opportunity currentOpportunity : (List<Opportunity>)newRecords) {
        Opportunity oldOpportunity = (Opportunity) ListUtils.firstOrDefault(
          oldRecords,
          Opportunity.Id,
          currentOpportunity.Id
        );
        if (
          currentOpportunity.StageName == OpportunityStages.CLOSED_WON 
        ) {
          currentOpportunity.CloseDate = Date.today();
        }
      }
    }
  
    public static OpportunityHandler build() {
      return new OpportunityHandler();
    }
}
