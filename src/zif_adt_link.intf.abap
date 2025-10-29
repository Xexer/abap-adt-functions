INTERFACE zif_adt_link
  PUBLIC.

  TYPES system_id TYPE c LENGTH 8.

  CONSTANTS:
    BEGIN OF supported_objects,
      " ABAP Cloud Objects
      class                       TYPE string VALUE `CLAS`,
      interface                   TYPE string VALUE `INTF`,
      service_binding             TYPE string VALUE `SRVB`,
      service_definition          TYPE string VALUE `SRVD`,
      metadata                    TYPE string VALUE `DDLX`,
      behavior                    TYPE string VALUE `BEHV`,
      database_table              TYPE string VALUE `TABL`,
      data_definition             TYPE string VALUE `DDLS`,
      domain                      TYPE string VALUE `DOMA`,
      package                     TYPE string VALUE `DEVC`,
      data_element                TYPE string VALUE `DTEL`,
      function_group              TYPE string VALUE `FUGR`,
      function_module             TYPE string VALUE `FUNC`,
      message_class               TYPE string VALUE `MSAG`,
      lock_object                 TYPE string VALUE `ENQU`,
      entity                      TYPE string VALUE `STOB`,
      behavior_definition         TYPE string VALUE `BDEF`,
      auth_default_value          TYPE string VALUE `SUSH`,
      iam_app                     TYPE string VALUE `SIA6`,
      inbound_service             TYPE string VALUE `SCO2`,
      sicf_service                TYPE string VALUE `SICF`,
      business_catalog_assignment TYPE string VALUE `SIA7`,
      access_control              TYPE string VALUE `DCLS`,
      table_type                  TYPE string VALUE `TTYP`,
      appl_job_template           TYPE string VALUE `SAJT`,
      auth_field                  TYPE string VALUE `AUTH`,
      " Classic ABAP
      transaction                 TYPE string VALUE `TRAN`,
      program                     TYPE string VALUE `PROG`,
    END OF supported_objects.

  "! Create simple ADT Link for Object
  "! @parameter object_type        | Type of the object
  "! @parameter object             | Name of the object
  "! @parameter result             | ADT Link
  "! @raising   zcx_adt_link_error | Error creating the link
  METHODS get_link
    IMPORTING object_type   TYPE string
              !object       TYPE csequence
    RETURNING VALUE(result) TYPE string
    RAISING   zcx_adt_link_error.

  "! Create HTML Link with object as link
  "! @parameter object_type        | Type of the object
  "! @parameter object             | Name of the object
  "! @parameter result             | HTML Link
  "! @raising   zcx_adt_link_error | Error creating the link
  METHODS get_html_link
    IMPORTING object_type   TYPE string
              !object       TYPE csequence
    RETURNING VALUE(result) TYPE string
    RAISING   zcx_adt_link_error.

  "! Create HTML Link with custom text
  "! @parameter object_type        | Type of the object
  "! @parameter object             | Name of the object
  "! @parameter link_text          | Text of the link
  "! @parameter result             | HTML Link with custom text
  "! @raising   zcx_adt_link_error | Error creating the link
  METHODS get_html_link_with_text
    IMPORTING object_type   TYPE string
              !object       TYPE csequence
              link_text     TYPE string
    RETURNING VALUE(result) TYPE string
    RAISING   zcx_adt_link_error.
ENDINTERFACE.
