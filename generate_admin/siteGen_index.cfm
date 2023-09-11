<cfscript>
    /* This page is called to generate the homepage of the website. It reads in the template page, processes the text if needed
       and exports the index.html page back into the site directory.
     */

    makeFilename = "index.html";
    
    // The primary html file here is a basic HTML file. It is necessary.
    fileContent = fileRead(expandPath("./siteGenTemplate_index.html"), "utf-8");



    // Read in the header template for replacing marker
    fileHeaderContent = fileRead(expandPath("./siteGenTemplate_header_all.html"), "utf-8");

    // The file content to write
    fileContent = replace(fileContent, "[[SITE_HEADER]]", fileHeaderContent);

    
    
    // Read in the footer template for replacing marker
    fileHeaderContent = fileRead(expandPath("./siteGenTemplate_footer_all.html"), "utf-8");

    // The file content to write
    fileContent = replace(fileContent, "[[SITE_FOOTER]]", fileHeaderContent);




    // Copy to backup before writing
    if( not directoryExists( expandPath("../backup_files") ) ) {
        cfdirectory ( action="create" ,directory="#expandPath("../backup_files")#"  )
    }
    fileCopy(expandPath("../#makeFilename#"), expandPath("../backup_files/#makeFilename#"));

    fileWrite(expandPath("../#makeFilename#"), fileContent, "utf-8" );

</cfscript>



<cfoutput >
    The file <b>#makeFilename#</b> is created
</cfoutput>