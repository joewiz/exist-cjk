## Full text search of CJK text with eXist-db

This application package aims to demonstrate how to configure [eXist-db](https://exist-db.org)
to perform full text queries on CJK text with eXist.

The default eXist-db installation does not ship with CJK analyzers for Lucene.
Installing this package saves you the trouble of downloading the right version of [Lucene](http://archive.apache.org/dist/lucene/java/)
for your version of eXist, extracting jars from the `analysis` folder, and placing them into `EXIST_HOME/extensions/indexes/lucene/lib`.

This package assumes you are running eXist-db v3.5.0+.

### Set up

1.  Build the package via `ant`
2.  Install the package via the eXist Dashboard Package Manager
3.  Go to [http://localhost:8080/exist/apps/exist-cjk](http://localhost:8080/exist/apps/exist-cjk) to view this README.md
4.  Go to [http://localhost:8080/exist/apps/exist-cjk/test.xq](http://localhost:8080/exist/apps/exist-cjk/test.xq) to run a sample query for `"吃人"` in 《狂人日記》*A Madman's Diary* by 鲁迅 Lu Xun.

## Introduction

This section addresses developers who are unfamiliar with Chinese as a written language. Before we introduce different options for eXist-db to indexing Chinese documents, it is important that developers familiarise themselves with the basic concepts that pertain to East Asian writing systems, and which have no equivalent when processing alphabetic documents. These articles should get you started:
*   [Efficient Chinese Search with Elasticsearch](https://www.sitepoint.com/efficient-chinese-search-elasticsearch/)
*   [Why Chinese Is So Damn Hard](http://pinyin.info/readings/texts/moser.html)

### Know your sources

Now that you understand the basic difference between different character variants, such as  ``@xml:lang="zh-Hant"`` and ``@xml:lang="zh-Hans"`` you can determine which character set is most appropriate to the documents that you want to query. Generally speaking, contemporary documents from the PRC are in simplified character, and benefit from extensive dictionaries that contain longer N-grams, such as 中华人民共和国 = The Peoples Republic of China. But even PRC documents from before the 1960's might be normalised to the simplified writing system, or not. In short the origin of the documents are not a reliable guide to the characters used. To provide accurate search results, you need to consult the providers of the resources to inquire about the contents of the source, and their editorial practices.

### eXist-db's indexing options
Once you determined the language variant eXist-db supports three basic option for indexing your documents:
*   Lucene CJK analyzer
*   The N-gram index
*   (ICU collation indexes)


### Planned improvements

*   Explain considerations for searching traditional vs. simplified Chinese and limitations of the SmartCN analyzer.
*   show how ICU, N-gram, and Lucene(a,b,c) address different scenarios
*   (add CJK analysers of Stanford NLP-app?)
*   Translate this document into Chinese?
*   Add Japanese & Korean.
