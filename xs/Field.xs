Field *
Keyword(CLASS, name, value)
const char* CLASS;
const char* name
const char* value
    CODE:
        RETVAL = Field::Keyword(name, value);
    OUTPUT:
        RETVAL

Field *
UnIndexed(CLASS, name, value)
const char* CLASS;
const char* name
const char* value
    CODE:
        RETVAL = Field::UnIndexed(name, value);
    OUTPUT:
        RETVAL

Field *
Text(CLASS, name, value)
const char* CLASS;
const char* name
const char* value
    CODE:
        RETVAL = Field::Text(name, value);
    OUTPUT:
        RETVAL

Field *
UnStored(CLASS, name, value)
const char* CLASS;
const char* name
const char* value
    CODE:
        RETVAL = Field::UnStored(name, value);
    OUTPUT:
        RETVAL

