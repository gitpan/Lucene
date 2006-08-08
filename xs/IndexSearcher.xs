IndexSearcher *
new(CLASS, directory)
const char* CLASS;
Directory* directory
    CODE:
        RETVAL = new IndexSearcher(directory);
//        printf("created indexsearcher\n");
    OUTPUT:
        RETVAL
    CLEANUP:
        // Memorize Directory in returned blessed hash reference.
        // We don't want it to be destroyed by perl before the C++ object it
        // contains gets destroyed by C++. Otherwise this would cause a seg fault.
        hv_store((HV *) SvRV(ST(0)), "Directory", 9, newRV(SvRV(ST(1))), 1);


Hits * 
search(self, query)
IndexSearcher* self
Query* query
    PREINIT:
        const char* CLASS = "Lucene::Search::Hits";
    CODE:
        RETVAL = self->search(query);
    OUTPUT:
        RETVAL


void
close(self)
IndexSearcher* self
    CODE:
        self->close();
    OUTPUT:


void
DESTROY(self)
        IndexSearcher * self
    CODE:
        delete self;
//        printf("deleted indexsearcher\n");

