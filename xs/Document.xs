Document *
new(CLASS)
const char* CLASS;
    CODE:
        RETVAL = new Document();
    OUTPUT:
        RETVAL

void
add(self, field)
       Document* self
       Field* field
    CODE:
       self->add(*field);

const wchar_t*
get(self, field)
       Document* self
       wchar_t* field
    CODE:
       RETVAL = self->get(field);
    OUTPUT:
       RETVAL

void
DESTROY(self)
       Document* self
    CODE:
       SV ** sv = hv_fetch((HV *) SvRV(ST(0)), "Hits", 4, 0);
       if (!sv) {
//         printf("deleted document\n");
         delete self;
       }

