SortField *
new(CLASS, fieldname, reverse = 0)
  CASE: items == 2
    const char* CLASS;
    char* fieldname
    CODE:
        RETVAL = new SortField(fieldname);
    OUTPUT:
        RETVAL
  CASE: items == 3
    const char* CLASS;
    char* fieldname
    int reverse
    CODE:
        RETVAL = new SortField(fieldname, SortField::INT, reverse);
    OUTPUT:
        RETVAL


SortField *
FIELD_SCORE(CLASS)
const char* CLASS;
  CODE:
       RETVAL = new SortField (NULL, SortField::DOCSCORE, false);
  OUTPUT:
       RETVAL

SortField *
FIELD_DOC(CLASS)
const char* CLASS;
  CODE:
       RETVAL = new SortField (NULL, SortField::DOC, false);
  OUTPUT:
       RETVAL
