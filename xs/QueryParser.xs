QueryParser *
new(CLASS, field, analyzer)
    const char* CLASS;
    wchar_t* field
    Analyzer* analyzer
    CODE:
        RETVAL = new QueryParser(field, analyzer);
    OUTPUT:
        RETVAL
    CLEANUP:
        // Memorize Analyzer in returned blessed hash reference.
        // We don't want it to be destroyed by perl before the C++ object it
        // contains gets destroyed by C++. Otherwise this would cause a seg fault.
        hv_store((HV *) SvRV(ST(0)), "Analyzer", 8, newRV(SvRV(ST(2))), 1);

Query*
parse(self, query_string)
QueryParser* self
wchar_t* query_string
    PREINIT:
        const char* CLASS = "Lucene::Search::Query";
    CODE:
        try {
          RETVAL = self->parse(query_string);
        } catch (CLuceneError& e) {
          die("[Lucene::QueryParser->parse()] %s\n", e.what());
        }
    OUTPUT:
        RETVAL

void
setLowercaseWildcardTerms(self, flag)
QueryParser * self
bool flag
    ALIAS:
        setLowercaseWildcardTerms = 1
        setLowercaseExpandedTerms = 2
    CODE:
#ifdef CLUCENE_0_9_17
        self->setLowercaseExpandedTerms(flag);
#else 
        self->setLowercaseWildcardTerms(flag);
#endif

void
DESTROY(self)
        QueryParser * self
    CODE:
        delete self;

