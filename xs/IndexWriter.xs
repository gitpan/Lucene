IndexWriter *
new(CLASS, directory, analyzer, create)
const char* CLASS;
Directory* directory
Analyzer* analyzer
bool create
    CODE:
        RETVAL = new IndexWriter(directory, analyzer, create);
    OUTPUT:
        RETVAL
    CLEANUP:
        // Memorize Directory and Analyzer in returned blessed hash reference.
        // We don't want them to be destroyed by perl before the C++ object they
        // contain gets destroyed by C++. Otherwise this would cause a seg fault.
        hv_store((HV *) SvRV(ST(0)), "Directory", 9, newRV(SvRV(ST(1))), 1);
        hv_store((HV *) SvRV(ST(0)), "Analyzer", 8, newRV(SvRV(ST(2))), 1);

void
addDocument(self, document)
IndexWriter* self
Document* document
    CODE:
        self->addDocument(document);
    OUTPUT:

void
addIndexes(self, directory)
IndexWriter* self
Directory* directory
    CODE:
        Directory* directories[1];
        directories[0] = directory;
        directories[1] = NULL;
        self->addIndexes(directories);


void setMaxFieldLength(self, max_tokens)
IndexWriter* self
int max_tokens
    CODE:
       self->setMaxFieldLength(max_tokens);


int getMaxFieldLength(self)
IndexWriter* self
    CODE:
        RETVAL = self->getMaxFieldLength();
    OUTPUT:
        RETVAL


void setMergeFactor(self, factor)
IndexWriter* self
int factor
    CODE:
       self->setMergeFactor(factor);


int getMergeFactor(self)
IndexWriter* self
    CODE:
        RETVAL = self->getMergeFactor();
    OUTPUT:
        RETVAL


void setMinMergeDocs(self, factor)
IndexWriter* self
int factor
    CODE:
       self->setMinMergeDocs(factor);


int getMinMergeDocs(self)
IndexWriter* self
    CODE:
        RETVAL = self->getMinMergeDocs();
    OUTPUT:
        RETVAL


void setMaxMergeDocs(self, factor)
IndexWriter* self
int factor
    CODE:
       self->setMaxMergeDocs(factor);


int getMaxMergeDocs(self)
IndexWriter* self
    CODE:
        RETVAL = self->getMaxMergeDocs();
    OUTPUT:
        RETVAL


void
setUseCompoundFile(self, value)
IndexWriter* self
bool value
    CODE:
        self->setUseCompoundFile(value);

void
optimize(self)
IndexWriter* self
    CODE:
        self->optimize();
    OUTPUT:

int
docCount(self)
IndexWriter* self
    CODE:
       RETVAL = self->docCount();
    OUTPUT:
       RETVAL

void
close(self)
IndexWriter* self
    CODE:
        self->close();
    OUTPUT:

void
DESTROY(self)
        IndexWriter * self
    CODE:
        delete self;

