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

      WHEN zif_adt_link=>supported_objects-data_definition OR zif_adt_link=>supported_objects-entity.
        link = |ddic/ddl/sources/[[OBJECT]]/source/main|.

      WHEN zif_adt_link=>supported_objects-database_table.
        link = |ddic/tables/[[OBJECT]]/source/main|.

      WHEN zif_adt_link=>supported_objects-metadata.
        link = |ddic/ddlx/sources/[[OBJECT]]/source/main|.

      WHEN zif_adt_link=>supported_objects-domain.
        link = |ddic/domains/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-package.
        link = |packages/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-data_element.
        link = |ddic/dataelements/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-function_group.
        link = |functions/groups/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-function_module.
        link = |functions/fmodules/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-message_class.
        link = |messageclass/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-transaction.
        link = |vit/wb/object_type/trant/object_name/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-program.
        link = |programs/programs/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-lock_object.
        link = |ddic/lockobjects/sources/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-behavior_definition.
        link = |bo/behaviordefinitions/[[OBJECT]]/source/main|.

      WHEN zif_adt_link=>supported_objects-auth_default_value.
        link = |aps/iam/sush/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-iam_app.
        link = |aps/cloud/iam/sia6/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-inbound_service.
        link = |aps/cloud/com/sco2/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-sicf_service.
        link = |vit/wb/object_type/sicftyp/object_name/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-business_catalog_assignment.
        link = |aps/cloud/iam/sia7/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-access_control.
        link = |acm/dcl/sources/[[OBJECT]]/source/main|.

      WHEN zif_adt_link=>supported_objects-table_type.
        link = |ddic/tabletypes/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-appl_job_template.
        link = |applicationjob/templates/[[OBJECT]]|.

      WHEN zif_adt_link=>supported_objects-auth_field.
        link = |aps/iam/auth/[[OBJECT]]|.

      WHEN OTHERS.
        RAISE EXCEPTION NEW zcx_adt_link_error( ).
    ENDCASE.

    link = replace( val  = link
                    sub  = `[[OBJECT]]`
                    with = to_lower( object ) ).

    RETURN |adt://{ system_id }{ base_path }{ link }|.
  ENDMETHOD.
ENDCLASS.
