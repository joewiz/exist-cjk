xquery version "3.1";

import module namespace markdown="http://exist-db.org/xquery/markdown";

declare namespace output="http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace pkg="http://expath.org/ns/pkg";
declare namespace repo="http://exist-db.org/xquery/repo";

declare option output:method "html5";
declare option output:media-type "text/html";

declare function local:wrap-html($title as xs:string?, $body as element()*) {
    <html>
        <head>
            <title>{$title}</title>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>

            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>

            <!-- Optional theme -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/>

            <!-- Latest compiled and minified JavaScript -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"/>
        </head>
        <body>
            <div class="container">
                <h1>{$title}</h1>
                {$body}
            </div>
        </body>
    </html>
};

let $title := doc("expath-pkg.xml")/pkg:package/pkg:title/string()
let $readme :=
    util:binary-doc("/db/apps/" || doc("repo.xml")/repo:meta/repo:target || "/README.md")
    => util:binary-to-string()
    => markdown:parse()
return
    local:wrap-html($title, $readme/*)
