public with sharing class OWASPTop10_1_InjectionController {
	public List<Case> cases {get; set;}
	public String contactNumber = '';

	public OWASPTop10_1_InjectionController() {
		// Get Parameter from URL
		contactNumber = ApexPages.currentPage().getParameters().get('cn');

		// Query for cases that match
		String queryName = '%' + contactNumber + '%';
		cases = [SELECT Id FROM Case WHERE 
           	(IsDeleted = false and CaseNumber = :queryName)];
		
	}
}
