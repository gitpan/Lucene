StandardAnalyzer *
new(CLASS)
const char* CLASS;
    CODE:
        setlocale(LC_ALL, "fr_FR.iso88591"); 
        RETVAL = new StandardAnalyzer();
    OUTPUT:
        RETVAL

void
DESTROY(self)
        StandardAnalyzer * self
    CODE:
        delete self;
