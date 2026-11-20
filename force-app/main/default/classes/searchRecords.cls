public with sharing class searchRecords {
  public static void searchRecordsByName(String searchName) {
        List<List<SObject>> searchResults = [
            FIND :searchName IN ALL FIELDS
            RETURNING
            Consultant__c(Id, Name),
            Contact(Id, Name) with USER_MODE
        ];

        for (List<SObject> records : searchResults) {
            for (SObject record : records) {
                System.debug(record);
            }
        }
    }

    public static void searchRecordsByNameAndMaleGender(String SearchName, String Gender) {
        List<List<SObject>> searchResults = [
            FIND :SearchName 
            IN ALL FIELDS
            RETURNING Contact(Id, Name where GenderIdentity = :Gender),
            Consultant__c(Id,Name where Gender__c = :Gender) WITH USER_MODE
        ];

        for(List<SObject> records : searchResults) {
            for(Sobject record : records) {
                system.debug(record);
            }
        }
    }

    public static void searchRecordsByContainApex(String searchName) {
        List<list<SObject>> searchresults = [
            Find :searchName IN ALL FIELDS
            RETURNING Position__c(Id, Name)
        ];

        for(List<SObject> records : searchresults) {
            for(SObject record : records) {
                system.debug(record);
            }
        }
    }
}   