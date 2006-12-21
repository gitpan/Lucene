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

Query*
parse(self, query_string, fields, analyzer)
MultiFieldQueryParser* self
wchar_t* query_string
char** fields
Analyzer* analyzer
    PREINIT:
        const char* CLASS = "Lucene::Search::Query";
    CODE:
        wchar_t* wfields[100];
        int i = 0;
        while (fields[i]) {
          wfields[i] = STRDUP_AtoW(fields[i]);
          i++;
          if (i >= 100) { 
            break;
          }
        }
        wfields[i] = NULL;
        try {
          RETVAL = self->parse(query_string, (const wchar_t**) wfields, analyzer);
        } catch (CLuceneError& e) {
          die("[Lucene::MultiFieldQueryParser->parse()] %s\n", e.what());
        }
        i = 0;
        while (wfields[i]) {
          free (wfields[i]);
          i++;
        } 
    OUTPUT:
        RETVAL

void
DESTROY(self)
        MultiFieldQueryParser * self
    CODE:
        delete self;

