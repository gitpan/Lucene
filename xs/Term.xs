Term *
new(CLASS, field, text)
const char* CLASS;
char* field;
char* text;
    CODE:
        RETVAL = new Term(field, text);
//        printf("created term\n");
    OUTPUT:
        RETVAL

void
DESTROY(self)
        Term * self
    CODE:
        delete self;
//        printf("deleted term\n");

