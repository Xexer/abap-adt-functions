INTERFACE zif_adt_link
  PUBLIC.

  TYPES system_id TYPE c LENGTH 8.

  CONSTANTS:
    BEGIN OF supported_objects,
      class              TYPE string VALUE `CLAS`,
      interface          TYPE string VALUE `INTF`,
      service_binding    TYPE string VALUE `SRVB`,
      service_definition TYPE string VALUE `SRVD`,
      metadata           TYPE string VALUE `DDLX`,
      behavior           TYPE string VALUE `BEHV`,
      database_table     TYPE string VALUE `TABL`,
      core_data_service  TYPE string VALUE `DDLS`,
      domain             TYPE string VALUE `DOMA`,
      package            TYPE string VALUE `DEVC`,
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
