<cfscript>
    /* This page is called to generate the interior pages of the website. It reads in the template pages, appends the content
       from the json file, and exports the [pagename].html page back into the site directory.
     */

    // Get all the site information from the json file
    readList = deserializeJSON( fileRead(expandPath("./siteGen_interior_list.json"), "utf-8") );


    // Loop through the json file and generate a file name for each entry and content
    for(item in readList) {
        // writeDump(readList['#item#']['title']);
        // writeDump(readList['#item#']['banner_name']);
        // writeDump(readList['#item#']['content']);

        outputFilename = readList['#item#'];
        outputTitle = readList['#item#']['title'];
        outputBannerName = readList['#item#']['banner_name'];
        outputContent = readList['#item#']['content'];

        makeFilename = item;

        // The index file is a template file with markers that are replaced using the 
        // functions below.
        fileContent = fileRead(expandPath("./siteGenTemplate_interior.html"), "utf-8");

        fileContent = replace(fileContent, "[SITE_INT_TITLE]", outputTitle);
        fileContent = replace(fileContent, "[SITE_INT_BANNER_NAME]", outputBannerName);
        fileContent = replace(fileContent, "[[SITE_INT_CONTENT]", outputContent);



    // Read in the header template for replacing marker
    fileHeaderContent = fileRead(expandPath("./siteGenTemplate_header_all.html"), "utf-8");

    // The file content to write
    fileContent = replace(fileContent, "[[SITE_HEADER]]", fileHeaderContent);


    
    
    // Read in the footer template for replacing marker
    fileHeaderContent = fileRead(expandPath("./siteGenTemplate_footer_all.html"), "utf-8");

    // The file content to write
    fileContent = replace(fileContent, "[[SITE_FOOTER]]", fileHeaderContent);




    // Copy to backup before writing
    if( fileExists( expandPath("../#makeFilename#") ) ) {
        fileCopy( expandPath("../#makeFilename#"), expandPath("../backup_files/#makeFilename#") );
    }

        // Generate the file name
        fileWrite(expandPath("../#makeFilename#"), fileContent, "utf-8" );

        writeOutput("#makeFilename# is created.<br />")
    }

</cfscript>




<cfoutput >
    <p>The interior files have been created</p>
</cfoutput>