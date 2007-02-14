
#ifdef CLUCENE_0_9_17

MultiFieldQueryParser *
new(CLASS, fields, analyzer)
const char* CLASS;
wchar_t** fields
Analyzer* analyzer
    CODE:
        RETVAL = new MultiFieldQueryParser((const wchar_t**) fields, analyzer);
    OUTPUT:
        RETVAL
    CLEANUP:
        // Memorize Analyzer in returned blessed hash reference.
        // We don't want it to be destroyed by perl before the C++ object it
        // contains gets destroyed by C++. Otherwise this would cause a seg fault.
        hv_store((HV *) SvRV(ST(0)), "Analyzer", 8, newRV(SvRV(ST(2))), 1);

#else

MultiFieldQueryParser *
new(CLASS, field, analyzer)
const char* CLASS;
wchar_t* field
Analyzer* analyzer
    CODE:
        RETVAL = new MultiFieldQueryParser(field, analyzer);
    OUTPUT:
        RETVAL
    CLEANUP:
        // Memorize Analyzer in returned blessed hash reference.
        // We don't want it to be destroyed by perl before the C++ object it
        // contains gets destroyed by C++. Otherwise this would cause a seg fault.
        hv_store((HV *) SvRV(ST(0)), "Analyzer", 8, newRV(SvRV(ST(2))), 1);

#endif

Query*
parse(self, query_string, wfields, analyzer)
MultiFieldQueryParser* self
wchar_t* query_string
wchar_t** wfields
Analyzer* analyzer
    PREINIT:
        const char* CLASS = "Lucene::Search::Query";
    CODE:
        try {
          RETVAL = self->parse(query_string, (const wchar_t**) wfields, analyzer);
        } catch (CLuceneError& e) {
          die("[Lucene::MultiFieldQueryParser->parse()] %s\n", e.what());
        }
    OUTPUT:
        RETVAL
    CLEANUP:
        // Allocated in typemap
        int i = 0;
        while (wfields[i]) {
          free(wfields[i]);
          i++;
        } 

void
DESTROY(self)
        MultiFieldQueryParser * self
    CODE:
        delete self;

