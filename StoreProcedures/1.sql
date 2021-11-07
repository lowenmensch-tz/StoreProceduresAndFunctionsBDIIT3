/*
    @author  kenneth.cruz@unah.hn
    @version 0.1.0
    @date    11/7/2021  
*/


-- ---------------------------------------------
--   --- Insertar datos de una nueva Toma ---
-- ---------------------------------------------


--
-- Secuencia para generar el id de la toma
--

CREATE SEQUENCE SQ_TOMA
    START WITH 14
    INCREMENT BY 1
;

CREATE OR REPLACE TRIGGER TG_SQ_TOMA
    BEFORE INSERT ON TOMAS 
    FOR EACH ROW
    DECLARE
    BEGIN
        :new.TOMAID := SQ_TOMA.NEXTVAL;
    END
;


--
-- Procedimiento para insertar la data de una nueva toma
-- 


CREATE OR REPLACE PROCEDURE SP_INSERT_DATA_TOMAS(
    ANIMALID VARCHAR2,
    DIETAID VARCHAR2,
    MESSAGE OUT NUMBER, 
    MESSAGE_ERR OUT VARCHAR2
)
    IS 
        HOUR TIMESTAMP(6) := SYSTIMESTAMP;
        CURRENT_DATE DATE := SYSDATE;
    BEGIN    
        INSERT INTO TOMAS(HORA, FECHA, ANIMALID, DIETAID) VALUES
        (
            HOUR,
            CURRENT_DATE,
            ANIMALID,
            DIETAID
        );
        MESSAGE:=1;

        -- Algo ocurrió
        EXCEPTION
            WHEN OTHERS THEN
                MESSAGE:=0;
                MESSAGE_ERR:=SQLERRM;
                
    END
;


--
-- Procedimiento que indica éxito o error generado al haber insertado una nueva TOMA
--

CREATE OR REPLACE PROCEDURE SP_PROCESS_DATA_TOMAS(
    ANIMALID VARCHAR2,
    DIETAID VARCHAR2
)
    IS 
        MESSAGE NUMBER;
        MESSAGE_ERR VARCHAR2(255);
    BEGIN
        SP_INSERT_DATA_TOMAS(ANIMALID, DIETAID, MESSAGE, MESSAGE_ERR);

        -- Análisis de la ejecución del procedimiento
        IF (MESSAGE=0) THEN
            DBMS_OUTPUT.PUT_LINE('No se pudo insertar el registro: ' || MESSAGE_ERR);
            ROLLBACK;
            
        ELSE
            DBMS_OUTPUT.PUT_LINE('Registro insertado exitosamente');
            COMMIT;
        END IF;

    END
;


--
-- Datos de prueba
--

-- Datos erroneos
EXECUTE SP_PROCESS_DATA_TOMAS('ASSAASDSA', '134134');
EXECUTE SP_PROCESS_DATA_TOMAS('VVVDDDDD', '134134');
EXECUTE SP_PROCESS_DATA_TOMAS('L-03-D8', '521413');

-- Datos correctos
EXECUTE SP_PROCESS_DATA_TOMAS('L-03-D8', '342567');