/*
    @author  kenneth.cruz@unah.hn
    @version 0.1.0
    @date    11/7/2021  
*/


--
-- Función que retorna los datos de todos los animales de la base de datos
--


CREATE OR REPLACE FUNCTION FN_GET_ALL_ANIMALS
RETURN SYS_REFCURSOR
    IS
        CURSOR_ANIMAL SYS_REFCURSOR;
    BEGIN
        OPEN CURSOR_ANIMAL FOR
            SELECT * FROM ANIMALES;
        RETURN CURSOR_ANIMAL;
    END
;


--
-- Visualizar los datos de los animales
--

DECLARE
    DATA SYS_REFCURSOR;
    MAPPING_ANIMALS ANIMALES%ROWTYPE;
BEGIN
    DATA := FN_GET_ALL_ANIMALS;
    LOOP
        FETCH DATA INTO MAPPING_ANIMALS;
        EXIT WHEN DATA%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
        DBMS_OUTPUT.PUT_LINE('ID: ' || MAPPING_ANIMALS.ANIMALID);
        DBMS_OUTPUT.PUT_LINE('Especie: ' || MAPPING_ANIMALS.ESPECIE);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || MAPPING_ANIMALS.NOMBRE);
        DBMS_OUTPUT.PUT_LINE('Peso: ' || MAPPING_ANIMALS.PESO);
        DBMS_OUTPUT.PUT_LINE('Fecha de nacimiento: ' || MAPPING_ANIMALS.FECHANACIMIENTO);
        DBMS_OUTPUT.PUT_LINE('Lugar código: ' || MAPPING_ANIMALS.LUGARCODIGO);
        DBMS_OUTPUT.PUT_LINE(CHR(13));
        DBMS_OUTPUT.PUT_LINE(CHR(13));
    END LOOP;
END
;