--***-query totale for big data analysis
select DATA, sum(TOTALE_OSPEDALIZZATI) AS TOT_OSP, sum(TOTALE_POSITIVI) AS Tot_pos, sum(TOTALE_CASI) AS Tot_cas, sum(DECEDUTI) AS Tot_deceduti, sum(DIMESSI_GUARITI) AS Tot_dim
from REGIONI_COVID19
group by DATA
ORDER BY DATA ASC ;

---***---Contagi per Provincia in un determinato arco temporale----
select DENOMINAZIONE_PROVINCIA, SUM (TOTALE_CASI) AS Totale_Casi
FROM PROVINCE_COVID19 P JOIN PROVINCE P2 ON P.CODICE_PROVINCIA = P2.CODICE_PROVINCIA
WHERE DATA_REG <= '2020-03-25T17:00:00' AND DATA_REG >= '2020-03-19T17:00:00' AND DENOMINAZIONE_PROVINCIA <> 'In fase di definizione/aggiornamento'
GROUP BY DENOMINAZIONE_PROVINCIA
ORDER BY TOTALE_CASI DESC ;

------Regione con il maggior numero di casi per densità abitativa----
select * from ( select R.DENOMINAZIONE_REGIONE, SUM(R.TOTALE_CASI) AS TOTALE_CASI, R2.DENSITÀ_SUP AS DENSITÀ_ABITATIVA_IN_KM2
                FROM REGIONI_COVID19 R JOIN REGIONI R2 ON R.CODICE_REGIONE = R2.CODICE_REGIONE and R.DENOMINAZIONE_REGIONE = R2.DENOMINAZIONE_REGIONE
                GROUP BY R.DENOMINAZIONE_REGIONE, R2.DENSITÀ_SUP
                ORDER BY R2.DENSITÀ_SUP,TOTALE_CASI DESC )
WHERE ROWNUM = 1;

------Tamponi giornalieri e contagiati-------------
select DENOMINAZIONE_REGIONE, TAMPONI, TOTALE_POSITIVI
FROM REGIONI_COVID19
WHERE  DATA ='2020-05-03T17:00:00' ORDER BY TOTALE_POSITIVI DESC;

------Classifiche---------------------------------
------Le 5 Regioni con più decessi al 3 Maggio----
select * from ( select DENOMINAZIONE_REGIONE, DECEDUTI
                FROM REGIONI_COVID19
                WHERE  DATA ='2020-05-03T17:00:00' ORDER BY DECEDUTI DESC )
WHERE ROWNUM <= 5;

------Le 5 Regioni con meno decessi al 3 Maggio---
select * from ( select DENOMINAZIONE_REGIONE, DECEDUTI
                FROM REGIONI_COVID19
                WHERE  DATA ='2020-05-03T17:00:00' ORDER BY DECEDUTI ASC )
WHERE ROWNUM <= 5;

------Le 10 Province con più casi al 3 Maggio------
select * from ( select DENOMINAZIONE_PROVINCIA, R.DENOMINAZIONE_REGIONE, TOTALE_CASI
                FROM (PROVINCE_COVID19 P JOIN PROVINCE P2 ON P.CODICE_PROVINCIA = P2.CODICE_PROVINCIA)  JOIN REGIONI R ON P2.CODICE_REGIONE = R.CODICE_REGIONE
                WHERE DATA_REG ='2020-05-03T17:00:00' ORDER BY TOTALE_CASI DESC )
WHERE ROWNUM <= 10;

------Le 10 Province con meno casi al 3 Maggio-----
select * from ( select DENOMINAZIONE_PROVINCIA, R.DENOMINAZIONE_REGIONE, TOTALE_CASI
                FROM (PROVINCE_COVID19 P JOIN PROVINCE P2 ON P.CODICE_PROVINCIA = P2.CODICE_PROVINCIA)  JOIN REGIONI R ON P2.CODICE_REGIONE = R.CODICE_REGIONE
                WHERE DATA_REG ='2020-05-03T17:00:00' AND DENOMINAZIONE_PROVINCIA <> 'In fase di definizione/aggiornamento'
                ORDER BY TOTALE_CASI ASC )
WHERE ROWNUM <= 10;

------Terapia intensiva e ricoverati con sintomi---
select DENOMINAZIONE_REGIONE, TERAPIA_INTENSIVA, RICOVERATI_CON_SINTOMI
FROM REGIONI_COVID19
WHERE DATA ='2020-05-03T17:00:00'
ORDER BY TERAPIA_INTENSIVA DESC;

--solution https://oracleitalia.wordpress.com/tag/rownum/

--------------GUIDA ALLA LETTURA DEI DATI-------------
----1 QUERY dopo ...Compilato su base regionale...----
select *
FROM REGIONI_COVID19
WHERE DATA ='2020-03-25T17:00:00'
ORDER BY DENOMINAZIONE_REGIONE ASC;


----Deceduti nella giornata del 25 Marzo--------------
select SUM(DECEDUTI) AS TOTALE_DECEDUTI
FROM REGIONI_COVID19
WHERE DATA ='2020-03-25T17:00:00'
ORDER BY DENOMINAZIONE_REGIONE ASC;

----Totale positivi alla giornata del 25 Marzo--------
select SUM(TOTALE_POSITIVI) AS TOTALE_ATTUALMENTE_POSITIVI
FROM REGIONI_COVID19
WHERE DATA ='2020-03-25T17:00:00'
ORDER BY DENOMINAZIONE_REGIONE ASC;

--1--Quante persone sono state colpite il giorno 25 marzo in italia?----
create or replace procedure diff_tot_att_pos IS
cursor totpos is
    select DATA, Sum(TOTALE_CASI) AS Totale_Casi
    FROM REGIONI_COVID19
    GROUP BY DATA
    HAVING DATA <= '2020-03-25T17:00:00' AND DATA >= '2020-03-24T17:00:00';

rec_casi totpos%ROWTYPE;
giorno1 number;
giorno2 number;
diff number;

BEGIN
    OPEN totpos;
    FETCH totpos into rec_casi;
    giorno1 := rec_casi.Totale_Casi;
    FETCH totpos into rec_casi;
    giorno2 := rec_casi.Totale_Casi;
    diff := giorno1 - giorno2;
    DBMS_OUTPUT.PUT_LINE('Numero di persone colpite dal COVID_19 = ' || diff);
    CLOSE totpos;
end;
call diff_tot_att_pos();

--3--Quante persone sono guarite il giorno 25 marzo in italia?----
create or replace procedure diff_tot_guariti IS
cursor totgua is
    select DATA, Sum(DIMESSI_GUARITI) AS Totale_dimessi
    FROM REGIONI_COVID19
    GROUP BY DATA
    HAVING DATA <= '2020-03-25T17:00:00' AND DATA >= '2020-03-24T17:00:00';

rec_casi totgua%ROWTYPE;
giorno1 number;
giorno2 number;
diff number;

BEGIN
    OPEN totgua;
    FETCH totgua into rec_casi;
    giorno1 := rec_casi.Totale_dimessi;
    FETCH totgua into rec_casi;
    giorno2 := rec_casi.Totale_dimessi;
    diff := giorno1 - giorno2;
    DBMS_OUTPUT.PUT_LINE('Numero di persone GUARITE dal COVID_19 = ' || diff);
    CLOSE totgua;
end;
call diff_tot_guariti();

--2--Quante persone sono entrate in terapia intensiva il giorno 25 marzo in italia?----
create or replace procedure diff_tot_ter_intensiva IS
cursor totint is
    select DATA, Sum(TERAPIA_INTENSIVA) AS Totale_intensiva
    FROM REGIONI_COVID19
    GROUP BY DATA
    HAVING DATA <= '2020-03-25T17:00:00' AND DATA >= '2020-03-24T17:00:00';

rec_casi totint%ROWTYPE;
giorno1 number;
giorno2 number;
diff number;

BEGIN
    OPEN totint;
    FETCH totint into rec_casi;
    giorno1 := rec_casi.Totale_intensiva;
    FETCH totint into rec_casi;
    giorno2 := rec_casi.Totale_intensiva;
    diff := giorno1 - giorno2;
    DBMS_OUTPUT.PUT_LINE('Variazione di persone che sono entrate in terapia intensiva a causa del COVID_19 = ' || diff);
    CLOSE totint;
end;
call diff_tot_ter_intensiva();

----FINE GUIDA--------------
------------------------------------------------------------------------------------------------------------------------

----Prova calcolo R0----VA BENE PERO' ZERO EFFICIENZA----
create or replace procedure calcoloR0 IS
cursor totcont is
    select DATA, sum(TOTALE_POSITIVI) AS TOTALE_POSITIVI_ITA
    FROM REGIONI_COVID19
    GROUP BY DATA
    HAVING DATA <= '2020-05-03T17:00:00' AND DATA >= '2020-02-25T17:00:00'
    ORDER BY DATA DESC ;

rec_casi totcont%ROWTYPE;
data_inizio varchar2(19);
data_fine varchar2(19);
totpos number;
totpos2 number;
R0 number;
x number;
n number;

BEGIN
    OPEN totcont;
    n := 1;
    select count(*) into x from USER_TABLES where table_name = 'R0_COVID19';
    if (x = 0) then
        execute immediate  ' CREATE TABLE R0_COVID19 (
                            DATA_INIZIO VARCHAR2(19),
                            DATA_FINE   VARCHAR2(19),
                            R0          NUMBER,
                            PRIMARY KEY (DATA_INIZIO,DATA_FINE))';
        commit;
    end if;
    FETCH totcont into rec_casi;
    totpos := rec_casi.TOTALE_POSITIVI_ITA;
    data_fine := rec_casi.DATA;
        LOOP
        FETCH totcont into rec_casi;
        EXIT WHEN totcont%NOTFOUND;
        totpos2 := rec_casi.TOTALE_POSITIVI_ITA;
        if(totcont%ROWCOUNT = 5*n) then
            data_inizio := rec_casi.DATA;
            R0 := totpos/totpos2;
            DBMS_OUTPUT.PUT_LINE('Calcolo R0 = ' || R0 );
            execute immediate 'INSERT INTO R0_COVID19 VALUES (:val1,:val2,:val3)' using data_inizio,data_fine,R0;
            commit;
            n := n+1;
            totpos := rec_casi.TOTALE_POSITIVI_ITA;
            data_fine := rec_casi.DATA;
        END if ;
        END LOOP;
    CLOSE totcont;
end;
call calcoloR0();

------------------------------------------------------------------------------------------------------------------------
----Calcolo letalità---FORSE VA BENE----------------------------
create or replace procedure calcololet IS
cursor totcont is
    select DATA, count(DATA) AS SOMMA_GIORNI, SUM(DECEDUTI) AS DECED, SUM(TOTALE_CASI) AS TOTCAS
    FROM REGIONI_COVID19 R JOIN REGIONI R2 on R.CODICE_REGIONE = R2.CODICE_REGIONE and R.DENOMINAZIONE_REGIONE = R2.DENOMINAZIONE_REGIONE
    GROUP BY DATA
    HAVING DATA <='2020-03-25T17:00:00' AND DATA >= '2020-02-25T18:00:00'
    ORDER BY DATA DESC ;

rec_casi totcont%ROWTYPE;
l integer;
num number;
den number;

BEGIN
    OPEN totcont;
    FETCH totcont into rec_casi;
    ---calcolo l---
    num := rec_casi.DECED / rec_casi.SOMMA_GIORNI;
    --ho cambiato den, invece di nuovi positivi ho messo totcasi ha piu senso
    den := rec_casi.TOTCAS / rec_casi.SOMMA_GIORNI;
    l := (num / den) * 100;
    DBMS_OUTPUT.PUT_LINE('Calcolo tasso di letalità = ' || l || '%');
    CLOSE totcont;
end;
call calcololet();

----Ad ogni nuovo inserimento da le variazioni percentuali rispetto al giorno precedente-----
CREATE OR REPLACE TRIGGER var_perc_giornaliere
    before insert on REGIONI_COVID19
    for each row
declare
    regcovid            REGIONI_COVID19%ROWTYPE;
    var_perc_casi       NUMBER;
    var_perc_terinten   NUMBER;
    var_perc_positivi   NUMBER;
    var_perc_deceduti   NUMBER;
    var_perc_tamponi    NUMBER;
begin
    select * into regcovid from ( select *
                                    from REGIONI_COVID19
                                    where DENOMINAZIONE_REGIONE = :NEW.DENOMINAZIONE_REGIONE
                                    ORDER BY DATA desc)
    WHERE ROWNUM = 1;

    var_perc_casi := (:NEW.TOTALE_CASI - regcovid.TOTALE_CASI)/100;
    var_perc_terinten := (:NEW.TERAPIA_INTENSIVA - regcovid.TERAPIA_INTENSIVA)/100;
    var_perc_positivi := (:NEW.VARIAZIONE_TOTALE_POSITIVI)/100;
    var_perc_deceduti := (:NEW.DECEDUTI - regcovid.DECEDUTI)/100;
    var_perc_tamponi := (:NEW.TAMPONI - regcovid.TAMPONI)/100;
    DBMS_OUTPUT.PUT_LINE('In ' || :NEW.DENOMINAZIONE_REGIONE);
    DBMS_OUTPUT.PUT_LINE('La variazione percentuale dei casi rispetto ad ieri e'' stata del: ' || var_perc_casi || '%');
    DBMS_OUTPUT.PUT_LINE('La variazione percentuale dei ricoveri in terapia intensiva rispetto ad ieri e'' stata del: ' || var_perc_terinten || '%');
    DBMS_OUTPUT.PUT_LINE('La variazione percentuale dei positivi rispetto ad ieri e'' stata del: ' || var_perc_positivi || '%');
    DBMS_OUTPUT.PUT_LINE('La variazione percentuale dei deceduti rispetto ad ieri e'' stata del: ' || var_perc_deceduti || '%');
    DBMS_OUTPUT.PUT_LINE('La variazione percentuale dei tamponi effettuati rispetto ad ieri e'' stata del: ' || var_perc_tamponi || '%');
end;

----Impedisce che venga modificata la data di una rilevazione giornaliera in REGIONI_COVID19----------
create or replace trigger GEST_MODIFICA_REGIONI
    before update
    on REGIONI_COVID19
    for each row
begin
    raise_application_error(-20450,' Non si possono modificare i dati sulle rilevazioni');
end;

----Impedisce che venga modificata la data di una rilevazione giornaliera in STATI_COVID19----------
create or replace trigger GEST_MODIFICA_STATI
    before update
    on STATI_COVID19
    for each row
begin
    raise_application_error(-20451,' Non si possono modificare i dati sulle rilevazioni');
end;

----Impedisce che venga modificata la data di una rilevazione giornaliera in PROVINCE_COVID19----------
create or replace trigger GEST_MODIFICA_PROVINCE
    before update
    on PROVINCE_COVID19
    for each row
begin
    raise_application_error(-20452,' Non si possono modificare i dati sulle rilevazioni');
end;

------------------------------------------------------------------------------------------------------------------------
----CREATE VIEW-------CASI NELL'ARCO DI UNA SETTIMANA NELLE REGIONI------
CREATE VIEW info_settimana_REGIONI AS
select *
FROM REGIONI_COVID19
WHERE DATA >='2020-03-25T17:00:00' AND DATA <='2020-03-31T17:00:00'
ORDER BY DENOMINAZIONE_REGIONE ASC;

----CREATE VIEW-------CASI NELL'ARCO DI UNA SETTIMANA NELLE PROVINCE------
CREATE VIEW info_settimana_PROVINCE AS
select DATA_REG,DENOMINAZIONE_PROVINCIA,TOTALE_CASI
FROM PROVINCE_COVID19 P JOIN PROVINCE P2 on P.CODICE_PROVINCIA = P2.CODICE_PROVINCIA
WHERE DATA_REG >='2020-03-25T17:00:00' AND DATA_REG <='2020-03-31T17:00:00'
ORDER BY DENOMINAZIONE_PROVINCIA ASC;

----CREATE VIEW-------CASI NELL'ARCO DI UNA SETTIMANA NEGLI STATI------
CREATE VIEW info_settimana_STATI AS
select *
FROM STATI_COVID19
WHERE DATA_STATO >='25/03/2020' AND DATA_STATO <='31/03/2020'
ORDER BY DENOMINAZIONI_STATO ASC;

---prova creazione index
CREATE INDEX idx_info_sett_REGIONI
ON REGIONI (DENOMINAZIONE_REGIONE);

CREATE INDEX idx_info_sett_PROVINCE
ON PROVINCE (DENOMINAZIONE_PROVINCIA);

CREATE INDEX idx_info_sett_STATI
ON STATI (DESCRIZIONE);

-------------------------------------
----------------------------------------------------------------------
----calcolo positivi/tamponi in italia DA FARE----
create or replace procedure diff_tasso_pos_tam IS
cursor totpostam is
    select DATA, sum(TOTALE_POSITIVI) AS TOTALE_POSITIVI_ITA, sum(TAMPONI) AS TOTALE_TAMPONI
    FROM REGIONI_COVID19
    GROUP BY DATA
    having data <= '2020-03-25T17:00:00' AND DATA >= '2020-03-12T17:00:00'
    ORDER BY DATA DESC;

rec_casi totpostam%ROWTYPE;
tot_pos number;
tot_tamp number;
diff number;

BEGIN
    OPEN totpostam;
    DBMS_OUTPUT.PUT_LINE('Data : '|| '              | Tasso positivi/popolazione in ITALIA : ');
    LOOP
        FETCH totpostam into rec_casi;   --Operazione di fetch
        EXIT when totpostam%NOTFOUND;    --Se non trova una tupla non stampa nulla
        tot_pos := rec_casi.TOTALE_POSITIVI_ITA;
        tot_tamp := rec_casi.TOTALE_TAMPONI;
        diff := (tot_pos / tot_tamp) * 100;
        DBMS_OUTPUT.PUT_LINE(rec_casi.DATA || '  |  ' || diff || '%');
    END LOOP;
    CLOSE totpostam;

end;
call diff_tasso_pos_tam();

----------------------------------------------------------------------
---calcolo positivi/popolazione in italia DA FARE---
create or replace procedure diff_tasso_pos_pop IS
cursor totpospop is
    select DATA, SUM(NUM_RESIDENTI) AS POPOLOITA, SUM(TOTALE_CASI) AS TOT_POS
    FROM REGIONI_COVID19 R JOIN REGIONI R2 on R.DENOMINAZIONE_REGIONE = R2.DENOMINAZIONE_REGIONE
    GROUP BY DATA
    HAVING DATA <='2020-03-25T17:00:00' AND DATA >= '2020-02-25T18:00:00'
    ORDER BY DATA DESC ;

rec_casi totpospop%ROWTYPE;
tot_pos number;
pop_ita number;
diff number;

BEGIN
    OPEN totpospop;
    DBMS_OUTPUT.PUT_LINE('Data : '|| '              | Tasso positivi/popolazione in ITALIA : ');
    LOOP
        FETCH totpospop into rec_casi;   --Operazione di fetch
        EXIT when totpospop%NOTFOUND;    --Se non trova una tupla non stampa nulla
        tot_pos := rec_casi.TOT_POS;
        pop_ita := rec_casi.POPOLOITA;
        diff := (tot_pos / pop_ita) * 100;
        DBMS_OUTPUT.PUT_LINE(rec_casi.DATA || '  |  ' || diff || '%');
    END LOOP;
    CLOSE totpospop;

end;
call diff_tasso_pos_pop();

------------query for world------------------
---contagi nel mondo dal 1 gennaio al 3 maggio---
select DENOMINAZIONI_STATO, sum(CASI) AS TOTALE_CASI
FROM STATI_COVID19
group by DENOMINAZIONI_STATO
order by TOTALE_CASI desc;

---contagi nei continenti dal 1 gennaio al 3 maggio---
select CONTINENTE, sum(CASI) AS TOTALE_CASI
FROM STATI_COVID19
group by CONTINENTE
order by TOTALE_CASI desc;

--classifica dei top 10 stati----
select * from (
select DENOMINAZIONI_STATO, sum(CASI) AS TOTALE_CASI
FROM STATI_COVID19
group by DENOMINAZIONI_STATO
order by TOTALE_CASI desc )
WHERE ROWNUM <= 10;

--classifica dei top continenti----
select CONTINENTE, sum(CASI) AS TOTALE_CASI
FROM STATI_COVID19
group by CONTINENTE
order by TOTALE_CASI desc;

------------------------------------------------
-------------------calcolo positivi/popolazione mondiale---------
create or replace procedure diff_tasso_pos_pop_mondo IS
cursor totpospop_m is
    select * from (
    select DENOMINAZIONI_STATO, sum(CASI) AS TOTALE_CASI, POPOLAZIONE
    FROM STATI_COVID19 JOIN STATI S on STATI_COVID19.STATO = S.STATO
    group by DENOMINAZIONI_STATO, POPOLAZIONE
    order by TOTALE_CASI desc)
    WHERE ROWNUM <= 10;

rec_casi totpospop_m%ROWTYPE;
tot_pos number;
pop_mon number;
diff number;

BEGIN
    OPEN totpospop_m;
    DBMS_OUTPUT.PUT_LINE('Data : '|| '              | Tasso positivi/popolazione nel MONDO : ');
    LOOP
        FETCH totpospop_m into rec_casi;   --Operazione di fetch
        EXIT when totpospop_m%NOTFOUND;    --Se non trova una tupla non stampa nulla
        tot_pos := rec_casi.TOTALE_CASI;
        pop_mon := rec_casi.POPOLAZIONE;
        diff := (tot_pos / pop_mon) * 100;
        DBMS_OUTPUT.PUT_LINE(rec_casi.DENOMINAZIONI_STATO || '  |  ' || diff || '%');
    END LOOP;
    CLOSE totpospop_m;

end;
call diff_tasso_pos_pop_mondo();

----letalità-----------
----Prova calcolo R0----VA BENE PERO' ZERO EFFICIENZA----
create or replace procedure calcololetalita IS
cursor totcont is
    select DATA, count(DATA) AS SOMMA_GIORNI, SUM(DECEDUTI) AS DECED, SUM(TOTALE_CASI) AS TOTCAS
    FROM REGIONI_COVID19 R JOIN REGIONI R2 on R.CODICE_REGIONE = R2.CODICE_REGIONE and R.DENOMINAZIONE_REGIONE = R2.DENOMINAZIONE_REGIONE
    GROUP BY DATA
    HAVING DATA <='2020-05-03T17:00:00' AND DATA >= '2020-02-25T18:00:00'
    ORDER BY DATA DESC ;

rec_casi totcont%ROWTYPE;
data_inizio varchar2(19);
data_fine varchar2(19);
L number;
x number;
n number;
num number;
den number;

BEGIN
    OPEN totcont;
    n := 1;
    select count(*) into x from USER_TABLES where table_name = 'LETALITA_COVID19';
    if (x = 0) then
        execute immediate  ' CREATE TABLE LETALITA_COVID19 (
                            DATA_INIZIO VARCHAR2(19),
                            DATA_FINE   VARCHAR2(19),
                            L         NUMBER,
                            PRIMARY KEY (DATA_INIZIO,DATA_FINE))';
        commit;
    end if;
    FETCH totcont into rec_casi;
    num := rec_casi.DECED / 7;
    data_fine := rec_casi.DATA;
        LOOP
        FETCH totcont into rec_casi;
        EXIT WHEN totcont%NOTFOUND;
        den := rec_casi.TOTCAS / 7;
        if(totcont%ROWCOUNT = 7*n) then
            data_inizio := rec_casi.DATA;
            L := (num/den) * 100;
            DBMS_OUTPUT.PUT_LINE('Calcolo LETALITA = ' || L ||'%' );
            execute immediate 'INSERT INTO LETALITA_COVID19 VALUES (:val1,:val2,:val3)' using data_inizio,data_fine,L;
            commit;
            n := n+1;
            num := rec_casi.DECED / 7;
            data_fine := rec_casi.DATA;
        END if ;
        END LOOP;
    CLOSE totcont;
end;
call calcololetalita();

----big grafico per nazioni----
select DATA_STATO, DENOMINAZIONI_STATO,  sum(CASI) AS TOTALE_CASI
FROM STATI_COVID19
group by DENOMINAZIONI_STATO, DATA_STATO
order by DENOMINAZIONI_STATO asc ;