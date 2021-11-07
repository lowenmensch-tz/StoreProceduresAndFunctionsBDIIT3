/*
    @author  kenneth.cruz@unah.hn
    @version 0.1.0
    @date    11/7/2021  
*/

--
-- Procedimiento almacenado que llama a la función FN_GET_ALL_ANIMALS
--

CREATE OR REPLACE PROCEDURE SP_CALL_GET_ALL_ANIMALS
IS 

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


-- Ejecutar Procedimiento almacenado

EXECUTE SP_CALL_GET_ALL_ANIMALS;