--Type Creation--
CREATE OR REPLACE TYPE address_type AS OBJECT(
    address_name            VARCHAR2(100),
    address_first_line      VARCHAR2(100),
    address_second_line     VARCHAR2(100),
    address_postcode        VARCHAR2(12),
    address_county          VARCHAR2(100),
    address_country         VARCHAR2(100) 
);
/

CREATE TABLE addresses OF address_type;

CREATE OR REPLACE TYPE review_type AS OBJECT(
    review_rating           NUMBER(1),
    review_author           VARCHAR2(100),
    review_date             DATE,
    review_description      VARCHAR2(2000),
    review_source           VARCHAR2(100)
);
/

CREATE TYPE review_table_type AS TABLE OF review_type;
/

CREATE OR REPLACE TYPE practice_type AS OBJECT(
    practice_name           VARCHAR2(100),
    practice_category       VARCHAR2(100),
    practice_level          NUMBER(2)

);
/

CREATE TYPE practice_varray_type AS VARRAY(20) OF practice_type;
/

--Relational Table Creation--
CREATE TABLE accommodations(
    accommodation_id NUMBER(12),
    accommodation_name VARCHAR(100)         NOT NULL,
    accommodation_number_of_rooms NUMBER(3),
    accommodation_price NUMBER(10, 2),
    accommodation_currency CHAR(3),
    accommodation_address address_type,
    accommodation_last_cleaned DATE,
    accommodation_last_maintenance DATE
);

CREATE TABLE retreat_accommodations(
    retreat_id NUMBER(12),
    accommodation_id NUMBER(12),
    building_manager VARCHAR2(255)
);

CREATE TABLE retreats(
    retreat_id NUMBER(12),
    retreat_reviews review_table_type,
    retreat_average_rating NUMBER(2,1),
    retreat_name VARCHAR2(100)
)
NESTED TABLE retreat_reviews STORE AS nested_review_table_type;

CREATE TABLE programmes(
    programme_id NUMBER(12),
    programme_name VARCHAR2(100),
    programme_start_time DATE,
    programme_duration NUMBER(6),
    guide_id NUMBER(12),
    retreat_id NUMBER(12),
    accommodation_id NUMBER(12),
);

CREATE TABLE guides(
    guide_id NUMBER(12),
    guide_title VARCHAR2(10),
    guide_firstname VARCHAR2(100),
    guide_lastname VARCHAR2(100),
    guide_salary NUMBER(10, 2),
    guide_address REF address_type SCOPE IS addresses
);

