Partie Fonctions:

Partie procédures : 

1. 

CREATE OR REPLACE PROCEDURE SEED_DATA_WORKERS (NB_WORKERS NUMBER, FACTORY_ID NUMBER) 
IS
  V_FIRST_NAME VARCHAR2(100);
  V_LAST_NAME VARCHAR2(100);
  V_START_DATE DATE;
BEGIN
  FOR I IN 1..NB_WORKERS LOOP
    -- Générer le nom du travailleur
    V_FIRST_NAME := 'worker_f_' || TO_CHAR(I);
    V_LAST_NAME := 'worker_l_' || TO_CHAR(I);

    -- Générer une date de démarrage aléatoire
    SELECT TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2065-01-01','J'), TO_CHAR(DATE '2070-01-01','J'))), 'J')
    INTO V_START_DATE
    FROM DUAL;

    -- Insérer le travailleur dans la table appropriée en fonction de l'usine
    IF FACTORY_ID = 1 THEN
      INSERT INTO WORKERS_FACTORY_1 (first_name, last_name, age, first_day, last_day)
      VALUES (V_FIRST_NAME, V_LAST_NAME, TRUNC(DBMS_RANDOM.VALUE(18, 65)), V_START_DATE, NULL);
    ELSIF FACTORY_ID = 2 THEN
      INSERT INTO WORKERS_FACTORY_2 (first_name, last_name, start_date, end_date)
      VALUES (V_FIRST_NAME, V_LAST_NAME, V_START_DATE, NULL);
    ELSE
      RAISE_APPLICATION_ERROR(-20001, 'FACTORY_ID doit être 1 ou 2');
    END IF;
  END LOOP;
END;
/

2.

CREATE OR REPLACE PROCEDURE ADD_NEW_ROBOT(MODEL_NAME VARCHAR2) 
IS
BEGIN
  -- Insérer un nouveau robot dans la table ROBOTS
  INSERT INTO ROBOTS (model)
  VALUES (MODEL_NAME);

  -- Vous pouvez ajouter des instructions supplémentaires ici pour manipuler d'autres tables si nécessaire

  -- Confirmer l'insertion
  COMMIT;
END;

3.

CREATE OR REPLACE PROCEDURE SEED_DATA_SPARE_PARTS(NB_SPARE_PARTS NUMBER) 
IS
  V_COLOR VARCHAR2(10);
  V_NAME VARCHAR2(100);
  V_COLORS CONSTANT SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('red', 'gray', 'black', 'blue', 'silver');
BEGIN
  FOR I IN 1..NB_SPARE_PARTS LOOP
    -- Générer une couleur aléatoire
    V_COLOR := V_COLORS(TRUNC(DBMS_RANDOM.VALUE(1, 6)));
    
    -- Générer un nom de pièce de rechange
    V_NAME := 'spare_part_' || TO_CHAR(I);
    
    -- Insérer la pièce de rechange dans la table SPARE_PARTS
    INSERT INTO SPARE_PARTS (color, name)
    VALUES (V_COLOR, V_NAME);
  END LOOP;
  
  -- Confirmer les insertions
  COMMIT;
END;


---------------------------------------------------------------------------------------------------------------------------------

Partie procédures : 

1. 

CREATE OR REPLACE PROCEDURE SEED_DATA_WORKERS (NB_WORKERS NUMBER, FACTORY_ID NUMBER) 
IS
  V_FIRST_NAME VARCHAR2(100);
  V_LAST_NAME VARCHAR2(100);
  V_START_DATE DATE;
BEGIN
  FOR I IN 1..NB_WORKERS LOOP
    -- Générer le nom du travailleur
    V_FIRST_NAME := 'worker_f_' || TO_CHAR(I);
    V_LAST_NAME := 'worker_l_' || TO_CHAR(I);

    -- Générer une date de démarrage aléatoire
    SELECT TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2065-01-01','J'), TO_CHAR(DATE '2070-01-01','J'))), 'J')
    INTO V_START_DATE
    FROM DUAL;

    -- Insérer le travailleur dans la table appropriée en fonction de l'usine
    IF FACTORY_ID = 1 THEN
      INSERT INTO WORKERS_FACTORY_1 (first_name, last_name, age, first_day, last_day)
      VALUES (V_FIRST_NAME, V_LAST_NAME, TRUNC(DBMS_RANDOM.VALUE(18, 65)), V_START_DATE, NULL);
    ELSIF FACTORY_ID = 2 THEN
      INSERT INTO WORKERS_FACTORY_2 (first_name, last_name, start_date, end_date)
      VALUES (V_FIRST_NAME, V_LAST_NAME, V_START_DATE, NULL);
    ELSE
      RAISE_APPLICATION_ERROR(-20001, 'FACTORY_ID doit être 1 ou 2');
    END IF;
  END LOOP;
END;
/

2.

CREATE OR REPLACE PROCEDURE ADD_NEW_ROBOT(MODEL_NAME VARCHAR2) 
IS
BEGIN
  -- Insérer un nouveau robot dans la table ROBOTS
  INSERT INTO ROBOTS (model)
  VALUES (MODEL_NAME);

  -- Vous pouvez ajouter des instructions supplémentaires ici pour manipuler d'autres tables si nécessaire

  -- Confirmer l'insertion
  COMMIT;
END;

3.

CREATE OR REPLACE PROCEDURE SEED_DATA_SPARE_PARTS(NB_SPARE_PARTS NUMBER) 
IS
  V_COLOR VARCHAR2(10);
  V_NAME VARCHAR2(100);
  V_COLORS CONSTANT SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('red', 'gray', 'black', 'blue', 'silver');
BEGIN
  FOR I IN 1..NB_SPARE_PARTS LOOP
    -- Générer une couleur aléatoire
    V_COLOR := V_COLORS(TRUNC(DBMS_RANDOM.VALUE(1, 6)));
    
    -- Générer un nom de pièce de rechange
    V_NAME := 'spare_part_' || TO_CHAR(I);
    
    -- Insérer la pièce de rechange dans la table SPARE_PARTS
    INSERT INTO SPARE_PARTS (color, name)
    VALUES (V_COLOR, V_NAME);
  END LOOP;
  
  -- Confirmer les insertions
  COMMIT;
END;


