CLASS zcl_adt_link_factory DEFINITION
  PUBLIC ABSTRACT FINAL
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_adt_link_injector.

  PUBLIC SECTION.
    CLASS-METHODS create_generator
      IMPORTING system_id     TYPE zif_adt_link=>system_id DEFAULT sy-sysid
      RETURNING VALUE(result) TYPE REF TO zif_adt_link.

  PRIVATE SECTION.
    CLASS-DATA double_generator TYPE REF TO zif_adt_link.
ENDCLASS.


CLASS zcl_adt_link_factory IMPLEMENTATION.
  METHOD create_generator.
    IF double_generator IS BOUND.
      RETURN double_generator.
    ELSE.
      RETURN NEW zcl_adt_link( system_id ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
