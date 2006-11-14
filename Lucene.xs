#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "Av_CharPtrPtr.h"  /* XS_*_charPtrPtr() */
#ifdef __cplusplus
}
#endif


#include "CLucene.h"
#include "CLucene/queryParser/MultiFieldQueryParser.h"
#include <locale.h>

typedef lucene::analysis::Analyzer Analyzer;
typedef lucene::analysis::SimpleAnalyzer SimpleAnalyzer;
typedef lucene::analysis::StopAnalyzer StopAnalyzer;
typedef lucene::analysis::WhitespaceAnalyzer WhitespaceAnalyzer;
typedef lucene::analysis::standard::StandardAnalyzer StandardAnalyzer;
typedef lucene::document::Document Document;
typedef lucene::document::Field Field;
typedef lucene::index::IndexWriter IndexWriter;
typedef lucene::index::IndexReader IndexReader;
typedef lucene::index::Term Term;
typedef lucene::search::IndexSearcher IndexSearcher;
typedef lucene::search::Hits Hits;
typedef lucene::search::Sort Sort;
typedef lucene::search::SortField SortField;
typedef lucene::search::Query Query;
typedef lucene::search::TermQuery TermQuery;
typedef lucene::search::FuzzyQuery FuzzyQuery;
typedef lucene::search::Similarity Similarity;
typedef lucene::queryParser::QueryParser QueryParser;
typedef lucene::queryParser::MultiFieldQueryParser MultiFieldQueryParser;
typedef lucene::store::Directory Directory;
typedef lucene::store::FSDirectory FSDirectory;
typedef lucene::store::RAMDirectory RAMDirectory;

MODULE = Lucene        PACKAGE = Lucene::Analysis::SimpleAnalyzer
INCLUDE: xs/SimpleAnalyzer.xs

MODULE = Lucene        PACKAGE = Lucene::Analysis::StopAnalyzer
INCLUDE: xs/StopAnalyzer.xs

MODULE = Lucene        PACKAGE = Lucene::Analysis::WhitespaceAnalyzer
INCLUDE: xs/WhitespaceAnalyzer.xs

MODULE = Lucene        PACKAGE = Lucene::Analysis::Standard::StandardAnalyzer
INCLUDE: xs/StandardAnalyzer.xs

MODULE = Lucene        PACKAGE = Lucene::Document
INCLUDE: xs/Document.xs

MODULE = Lucene        PACKAGE = Lucene::Document::Field
INCLUDE: xs/Field.xs

MODULE = Lucene        PACKAGE = Lucene::Index::IndexWriter
INCLUDE: xs/IndexWriter.xs

MODULE = Lucene        PACKAGE = Lucene::Index::IndexReader
INCLUDE: xs/IndexReader.xs

MODULE = Lucene        PACKAGE = Lucene::Index::Term
INCLUDE: xs/Term.xs

MODULE = Lucene        PACKAGE = Lucene::Search::IndexSearcher
INCLUDE: xs/IndexSearcher.xs

MODULE = Lucene        PACKAGE = Lucene::Search::Hits
INCLUDE: xs/Hits.xs

MODULE = Lucene        PACKAGE = Lucene::Search::Sort
INCLUDE: xs/Sort.xs

MODULE = Lucene        PACKAGE = Lucene::Search::SortField
INCLUDE: xs/SortField.xs

MODULE = Lucene        PACKAGE = Lucene::Search::Query
INCLUDE: xs/Query.xs

MODULE = Lucene        PACKAGE = Lucene::Search::TermQuery
INCLUDE: xs/TermQuery.xs

MODULE = Lucene        PACKAGE = Lucene::Search::FuzzyQuery
INCLUDE: xs/FuzzyQuery.xs

MODULE = Lucene        PACKAGE = Lucene::QueryParser
INCLUDE: xs/QueryParser.xs

MODULE = Lucene        PACKAGE = Lucene::MultiFieldQueryParser
INCLUDE: xs/MultiFieldQueryParser.xs

MODULE = Lucene        PACKAGE = Lucene::Store::FSDirectory
INCLUDE: xs/FSDirectory.xs

MODULE = Lucene        PACKAGE = Lucene::Store::RAMDirectory
INCLUDE: xs/RAMDirectory.xs
