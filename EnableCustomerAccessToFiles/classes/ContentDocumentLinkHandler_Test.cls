@isTest
private class ContentDocumentLinkHandler_Test {
    /*
    *   @desc   a test method for SetAllUsers() method in ContentDocumentLinkHandler. 
    *           It creates a ContenVersion from a base64 string and then creates a new ContentDocumentVersion and links to a record
    *   @result The success scenario expect the newly inserted file to a record has View permission
    *           enabled for Community Users. 
    */
    @isTest
    static void CDLH_SetAllUsersTest(){
        String fileBase64 = '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AAAAAACQAAAAAQAAAJAAAAABAAOShgAHAAAAEgAAAISgAgAEAAAAAQAAABmgAwAEAAAAAQAAABkAAAAAQVNDSUkAAABTY3JlZW5zaG90u8DdygAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAtdpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDYuMC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOnRpZmY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vdGlmZi8xLjAvIj4KICAgICAgICAgPGV4aWY6UGl4ZWxYRGltZW5zaW9uPjg1MjwvZXhpZjpQaXhlbFhEaW1lbnNpb24+CiAgICAgICAgIDxleGlmOlVzZXJDb21tZW50PlNjcmVlbnNob3Q8L2V4aWY6VXNlckNvbW1lbnQ+CiAgICAgICAgIDxleGlmOlBpeGVsWURpbWVuc2lvbj4xOTQ8L2V4aWY6UGl4ZWxZRGltZW5zaW9uPgogICAgICAgICA8dGlmZjpSZXNvbHV0aW9uVW5pdD4yPC90aWZmOlJlc29sdXRpb25Vbml0PgogICAgICAgICA8dGlmZjpZUmVzb2x1dGlvbj4xNDQ8L3RpZmY6WVJlc29sdXRpb24+CiAgICAgICAgIDx0aWZmOlhSZXNvbHV0aW9uPjE0NDwvdGlmZjpYUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6T3JpZW50YXRpb24+MTwvdGlmZjpPcmllbnRhdGlvbj4KICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CiAgIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+CrGV8aMAAABzSURBVEgNY/wPBAxYwPeffxiiq9agyIgJcTMI8HGgiBHDYSFGEUzNq3dfGUCYVMBEqgZy1JPkExYWJgYWZtLdRZIlcT4GDD62aiR7hnRnkWwFA8OoJSQF2mhwjQYXSSFAkuLR1DUaXCSFAEmKR1PX4AsuABlyEDC+mcHXAAAAAElFTkSuQmCC';

        Account a = new Account (Name = 'Test Account');
        Insert a;
        Test.startTest();
        ContentVersion cv  = createContentVersion(fileBase64, 'test');
        ContentDocumentLink cdl = createContentLink(cv.Id, a.Id);
        Test.stopTest();

        List<ContentDocumentLink> cdllist = [ SELECT Id, LinkedEntityId, Visibility FROM ContentDocumentLink WHERE Id = :cdl.Id];

        System.debug(cdllist);
        System.debug(cdllist[0].Visibility == 'AllUsers');

    }
    /*
    *   @method createContentVersion()
    *   @desc   Creates a content version from a given file's base64 and a filename
    *   @param  {String} based64 - a string base64 value of a file
    *   @param  {String} filename - A filename given to the base64
    *   @return {ContentVersion} - returns a newly created CentenVersion, if it is succeeded, or returns null if an error occurs
    */
    private static ContentVersion createContentVersion(String base64, String filename) {
        ContentVersion cv = new ContentVersion();
        cv.VersionData = EncodingUtil.base64Decode(base64);
        cv.Title = filename;
        cv.PathOnClient = filename;
        try {
            insert cv;
            return cv;
        } catch(DMLException e) {
            System.debug(e);
            return null;
        }
    }
   /*
   *    @method createContentLink() [private]
   *    @desc Creates a content link for a given ContentVersion and a record 
   *    @param {String} contentVersionId - Id of the ContentVersion of the file
   *    @param {String} recordId - a record Id that the ContenVersion get related to
   *    @return {ContentDocumentLink} - returns the newly created ContentDocumentLinkis, if it is succeeded, or returns null if an error occurs
   */
    private static ContentDocumentLink createContentLink(String contentVersionId, String recordId) {
        if (contentVersionId == null || recordId == null) { 
            return null; 
        }
        ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.ContentDocumentId = [ SELECT ContentDocumentId 
                                    FROM ContentVersion 
                                    WHERE Id =: contentVersionId
                                ][0].ContentDocumentId;
        cdl.LinkedEntityId = recordId;
        cdl.ShareType = 'I'; // Inferred 
        try {
            insert cdl;
            return cdl;
        } catch(DMLException e) {
            System.debug(e);
            return null;
        }
    }
    
}
