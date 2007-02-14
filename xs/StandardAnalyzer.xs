StandardAnalyzer *
new(CLASS)
const char* CLASS;
    CODE:
        RETVAL = new StandardAnalyzer();
    OUTPUT:
        RETVAL

void
DESTROY(self)
        StandardAnalyzer * self
    CODE:
        if (!IsObjCppOwned(ST(0)))
            delete self;
