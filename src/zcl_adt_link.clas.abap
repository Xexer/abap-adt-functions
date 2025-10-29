CLASS zcl_adt_link DEFINITION
  PUBLIC FINAL
  CREATE PRIVATE
  GLOBAL FRIENDS zcl_adt_link_factory.

  PUBLIC SECTION.
    INTERFACES zif_adt_link.

    METHODS constructor
      IMPORTING system_id TYPE zif_adt_link=>system_id DEFAULT sy-sysid.

  PRIVATE SECTION.
    DATA system_id TYPE zif_adt_link=>system_id.
    DATA base_path TYPE string.
ENDCLASS.


CLASS zcl_adt_link IMPLEMENTATION.
  METHOD constructor.
    me->system_id = system_id.
    base_path = `/sap/bc/adt/`.
  ENDMETHOD.


  METHOD zif_adt_link~get_html_link.
    RETURN zif_adt_link~get_html_link_with_text( object_type = object_type
                                                 object      = object
                                                 link_text   = to_upper( object ) ).
  ENDMETHOD.


  METHOD zif_adt_link~get_html_link_with_text.
    DATA(link) = zif_adt_link~get_link( object_type = object_type
                                        object      = object ).
    RETURN |<a href="{ link }">{ link_text }</a>|.
  ENDMETHOD.


  METHOD zif_adt_link~get_link.
    IF object IS INITIAL.
      RAISE EXCEPTION NEW zcx_adt_link_error( ).
    ENDIF.

    DATA(link) = ``.
    CASE object_type.
      WHEN zif_adt_link=>supported_objects-class.
        link = |oo/classes/[[OBJECT]]/source/main|.
      WHEN zif_adt_link=>supported_objects-interface.
        link = |oo/interfaces/[[OBJECT]]/source/main|.
      WHEN zif_adt_link=>supported_objects-service_binding.
        link = |businessservices/bindings/[[OBJECT]]|.
      WHEN zif_adt_link=>supported_objects-service_definition.
        link = |ddic/srvd/sources/[[OBJECT]]/source/main|.
      WHEN zif_adt_link=>supported_objects-behavior.
        link = |bo/behaviordefinitions/[[OBJECT]]/source/main|.
      WHEN zif_adt_link=>supported_objects-core_data_service.
        link = |ddic/ddl/sources/[[OBJECT]]/source/main|.
      WHEN zif_adt_link=>supported_objects-database_table.
        link = |ddic/tables/[[OBJECT]]/source/main|.
      WHEN zif_adt_link=>supported_objects-metadata.
        link = |ddic/ddlx/sources/[[OBJECT]]/source/main|.
      WHEN zif_adt_link=>supported_objects-domain.
        link = |ddic/domains/[[OBJECT]]|.
      WHEN zif_adt_link=>supported_objects-package.
        link = |packages/[[OBJECT]]|.
      WHEN OTHERS.
        RAISE EXCEPTION NEW zcx_adt_link_error( ).
    ENDCASE.

    link = replace( val  = link
                    sub  = `[[OBJECT]]`
                    with = to_lower( object ) ).

    RETURN |adt://{ system_id }{ base_path }{ link }|.
  ENDMETHOD.
ENDCLASS.
