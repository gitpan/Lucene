FSDirectory *
getDirectory(CLASS, path, create)
const char* CLASS;
const char* path
bool create
    CODE:
        RETVAL = FSDirectory::getDirectory(path, create);
    OUTPUT:
        RETVAL

void
DESTROY(self)
       FSDirectory * self
    CODE:
       delete self;

