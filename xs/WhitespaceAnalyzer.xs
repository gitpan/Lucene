WhitespaceAnalyzer *
new(CLASS)
const char* CLASS;
    CODE:
        RETVAL = new WhitespaceAnalyzer();
    OUTPUT:
        RETVAL

void
DESTROY(self)
        WhitespaceAnalyzer * self
    CODE:
        delete self;
