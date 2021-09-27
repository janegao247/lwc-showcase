trigger OpportunityTrigger on Opportunity (before update) {
    OpportunityHandler.build().run();
}