StopAnalyzer *
new(CLASS)
const char* CLASS;
    CODE:
        RETVAL = new StopAnalyzer();
    OUTPUT:
        RETVAL

void
DESTROY(self)
        StopAnalyzer * self
    CODE:
        delete self;
