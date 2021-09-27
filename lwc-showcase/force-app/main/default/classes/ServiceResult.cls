public with sharing class ServiceResult {
    public Set<SObject> ToDelete { get; set; }
    public Set<SObject> ToUpdate { get; set; }
    public Set<SObject> ToCreate { get; set; }
  
    public ServiceResult() {
      this.ToDelete = new Set<SObject>();
      this.ToUpdate = new Set<SObject>();
      this.ToCreate = new Set<SObject>();
    }
}
