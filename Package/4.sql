/*
    @author  kenneth.cruz@unah.hn
    @version 0.1.0
    @date    11/7/2021  
*/


-- Definición del paquete 
CREATE OR REPLACE PACKAGE PK_DIET
IS 
    FUNCTION FN_GET_COUNT_DIETS RETURN NUMBER;
    FUNCTION FN_GET_DESCRIPTION_DIET(DIET_ID NUMBER) RETURN VARCHAR2;
END
;


-- Estructura y funcinoalidad
CREATE OR REPLACE PACKAGE BODY PK_DIET
IS 
    -- Obtener el número de dietas
    FUNCTION FN_GET_COUNT_DIETS RETURN NUMBER
        IS 
            COUNT_DIETS NUMBER;
        BEGIN 
            SELECT 
                COUNT(*) 
                INTO COUNT_DIETS 
            FROM 
                DIETA
                ;
            
            RETURN COUNT_DIETS;
        END
        ;

    -- Funcion que retorna la descripcion de una dieta
    FUNCTION FN_GET_DESCRIPTION_DIET(DIET_ID NUMBER) RETURN VARCHAR2
        IS 
            DESCRIPTION DIETA.DESCRIPCION%TYPE;
        BEGIN 
            SELECT 
                DESCRIPCION 
                INTO DESCRIPTION
            FROM 
                DIETA
            WHERE 
                DIETAID = DIET_ID
                ;
            
            RETURN DESCRIPTION;
        END
        ;
END
;


-- 
-- Prueba del paquete
-- 

DECLARE
    COUNT_DIETS NUMBER;
    DESCRIPTION DIETA.DESCRIPCION%TYPE;
BEGIN 

    COUNT_DIETS := PK_DIET.FN_GET_COUNT_DIETS;
    DESCRIPTION := PK_DIET.FN_GET_DESCRIPTION_DIET(423872);

    DBMS_OUTPUT.PUT_LINE('Número total de dietas: ' || COUNT_DIETS);
    DBMS_OUTPUT.PUT_LINE('Descripción de la dieta con ID 1: ' || DESCRIPTION);
END
;