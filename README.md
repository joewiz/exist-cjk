## Full text search of CJK text with eXist-db

This application package aims to demonstrate how to configure [eXist](https://exist-db.org) to perform full text queries on CJK text with eXist.

The default eXist installation does not ship with CJK analyzers for Lucene. Installing this package saves you the trouble of downloading the right version of [Lucene](http://archive.apache.org/dist/lucene/java/) for your version of eXist, extracting jars from the `analysis` folder, and placing them into `EXIST_HOME/extensions/indexes/lucene/lib`.

This package assumes you are running eXist v3.5.0+. 

### Set up

1. Build the package via `ant`
2. Install the package via the eXist Dashboard Package Manager
3. Go to http://localhost:8080/exist/apps/exist-cjk to view this README.md
4. Go to http://localhost:8080/exist/apps/exist-cjk/test.xq to run a sample query for `"吃人"` in Lu Xun's

### Planned improvements

- Explain considerations for searching traditional vs. simplified Chinese and limitations of the SmartCN analyzer.
- Add Japanese & Korean.

