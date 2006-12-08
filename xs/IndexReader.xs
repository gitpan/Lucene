IndexReader *
open(CLASS, directory)
const char* CLASS
Directory* directory
    CODE:
        try {
          RETVAL = IndexReader::open(directory);
        } catch (CLuceneError& e) {
          die("[Lucene::Index::IndexReader->open()] %s\n", e.what());
        }

    OUTPUT:
        RETVAL
    CLEANUP:
        // Memorize Directory in returned blessed hash reference.
        // We don't want it to be destroyed by perl before the C++ object it
        // contains gets destroyed by C++. Otherwise this would cause a seg fault.
        hv_store((HV *) SvRV(ST(0)), "Directory", 9, newRV(SvRV(ST(1))), 1);

int
deleteDocuments(self, term)
IndexReader* self
Term* term
    CODE:
        RETVAL = self->deleteDocuments(term);
    OUTPUT:
        RETVAL

int
numDocs(self)
IndexReader* self
    CODE:
        RETVAL = self->numDocs();
    OUTPUT:
        RETVAL

void
close(self)
IndexReader* self
    CODE:
        self->close();
    OUTPUT:

void
unlock(CLASS, directory)
const char* CLASS
Directory* directory
    CODE:
        IndexReader::unlock(directory);

int
isLocked(CLASS, directory)
const char* CLASS
Directory* directory
    CODE:
        RETVAL = IndexReader::isLocked(directory);
    OUTPUT:
        RETVAL

int
indexExists(CLASS, directory)
const char* CLASS
Directory* directory
    CODE:
        RETVAL = IndexReader::indexExists(directory);
    OUTPUT:
        RETVAL

void
DESTROY(self)
IndexReader* self
    CODE:
        delete self;

