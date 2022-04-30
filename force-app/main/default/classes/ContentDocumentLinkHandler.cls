/*
 *  @author:    @reality_jung
 *  @created:   April 2022
 *  @desc:      The view access to a ContentDocumentVersion linked to an object inherited 
 *              through their access to a record. This is handled automatically by enabling
 *              "Enable the preference Set file access to Set by Record for files attached to records". 
 *              In order to provide file access to Community users, ContentDocumentLinkHandler will invoked from 
 *              ContentDocumentLink trigger class. The process will grant view access to files that are linked to objects
 *              defined in a Custom Metadata Type named, FileExternalObjectAccess__mdt.
 *  @test       ContentDocumentLinkHandler_Test
 */
public without sharing class ContentDocumentLinkHandler {
    
    List<ContentDocumentLink> newCdl = new List<ContentDocumentLink>();
    // contructor instantiate with Trigger.new
    public ContentDocumentLinkHandler(List<ContentDocumentLink> newCdl) {
        this.newCdl = newCdl;
    }
    /*
     *  @method  SetAllUsers()
     *  @desc    A public method that will invoke from ContentDocumentLink trigger
     */
    public void SetAllUsers() {
        Set<Id> cdids = new Set<id>();
        List<String> idPrefixes = new List<String>();
        for (ContentDocumentLink l :newCdl) {
            cdids.add(l.ContentDocumentId);
        }

        // Get CMT that stores a list of objects that will need community access to files that are linked to them
        List<FileCustomerAccessObject__mdt> accessObjs = FileCustomerAccessObject__mdt.getAll().values();
        //system.debug(accessObjs);
        for (FileCustomerAccessObject__mdt file : accessObjs) {
            if(file.prefix__c != null){
                idPrefixes.add(file.prefix__c);
            }
        }
        // Querying ContentDocumentLink after a file is uploaded. 
        // We will create a new ContentDocumentLink that linked to an account and assign Community Acces to that version
        List<ContentDocumentLink> cdllist = [ SELECT Id, LinkedEntityId FROM ContentDocumentLink WHERE ContentDocumentId IN :cdids];
        
        String objIdPrefix;

        List<ContentDocumentLink> cdlToUpdate = new List<ContentDocumentLink>();
        for (ContentDocumentLink l :cdllist) {
            objIdPrefix = String.valueOf(l.LinkedEntityId).substring(0,3);
            if(idPrefixes.contains(objIdPrefix)) {
                l.Visibility = 'AllUsers';
                l.ShareType = 'I';
            }
            cdlToUpdate.add(l);
        }
        if (!cdlToUpdate.isEmpty()){
            try{
                Update cdlToUpdate;
            } catch (DmlException e){
                System.debug(e);
                // errors can log into a custom object as a record
            }
        }
    }
}
