/**
 *  @author: Jung Mun
 *  @created: April 2022
 *  @description:   The view access to a ContentDocumentVersion linked to an object inherited 
 *                  through their access to a record. This is handled automatically by enabling
 *                  "Enable the preference Set file access to Set by Record for files attached to records". 
 *                  In order to provide file access to Community users, ContentDocumentLink trigger class 
 *                  will invoke "ContentDocumentLinkHandler" that will provide access to files that are linked to objects
 *                  defined in a Custom Metadata Type named, FileExternalObjectAccess__mdt.
 *  @test   ContentDocumentLinkHandler_Test
 * 
 */
trigger ContentDocumentLinkTrigger on ContentDocumentLink (after insert) {

    ContentDocumentLinkHandler cdlh = new ContentDocumentLinkHandler(Trigger.new);

    if(Trigger.isInsert && Trigger.isAfter) {
        cdlh.SetAllUsers();
    }
}