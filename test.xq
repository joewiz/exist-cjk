xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";

let $q := '"吃人"'
let $hits := doc('/db/apps/exist-cjk/data/test.xml')//tei:p[ft:query(., $q)]
return
    <hits count="{count($hits)}" xmlns:exist="http://exist.sourceforge.net/NS/exist">{
        for $hit in $hits
        let $score := ft:score($hit)
        let $expanded := util:expand($hit)
        let $matches := $expanded//exist:match
        order by $score descending
        return
            <hit length="{string-length($hit)}" matches="{count($matches)}" exist:score="{$score}">{$expanded/node()}</hit>
    }</hits>
