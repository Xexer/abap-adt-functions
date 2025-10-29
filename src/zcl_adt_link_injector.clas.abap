CLASS zcl_adt_link_injector DEFINITION
  PUBLIC ABSTRACT FINAL
  CREATE PUBLIC
  FOR TESTING.

  PUBLIC SECTION.
    CLASS-METHODS inject_generator
      IMPORTING double TYPE REF TO zif_adt_link.
ENDCLASS.


CLASS zcl_adt_link_injector IMPLEMENTATION.
  METHOD inject_generator.
    zcl_adt_link_factory=>double_generator = double.
  ENDMETHOD.
ENDCLASS.
