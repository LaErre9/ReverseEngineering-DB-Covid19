--UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO II
--FACOLTA' DI INGEGNERIA INFORMATICA
--ANNO ACCADEMICO 2019/20
--AUTORI: RICCIO GIUSEPPE N46004297
	  ROMANO ANTONIO  N46004321
--DESCRIZIONE: GUIDA ALLA LETTURA DEI DATI CON PL/SQL

--1-Quante persone sono state colpite dal COVID19 il giorno 25 marzo in italia?
create or replace procedure diff_tot_att_pos IS
--definisco che il cursore che conterrà i casi totali nella data X
cursor totpos is
    SELECT DATA, sum(TOTALE_CASI) AS Totale_Casi
    FROM REGIONI_COVID19
    GROUP BY DATA
    HAVING DATA <= '2020-03-25T17:00:00' AND DATA >= '2020-03-24T17:00:00' ;

--definisco tutte le variabili che serviranno per i calcoli
rec_casi totpos%ROWTYPE; --questa variabile è dello stesso tipo del cursore
giorno1 number;
giorno2 number;
diff number;

BEGIN
    OPEN totpos; --apro il cursore
    FETCH totpos into rec_casi; --inserisco la tupla seguente nella variabile che poi userò per i calcoli dopo
    giorno1 := rec_casi.Totale_Casi;
    FETCH totpos into rec_casi;
    giorno2 := rec_casi.Totale_Casi;
    diff := giorno1 - giorno2;
    DBMS_OUTPUT.PUT_LINE('Numero di persone colpite dal COVID_19 = ' || diff);
    CLOSE totpos; --chiudo il cursore
end;

call diff_tot_att_pos(); --chiamo la procedura che mi darà i risultati in output

--2-Quante persone sono entrate in terapia intensiva il giorno 25 marzo in italia?
create or replace procedure diff_tot_ter_intensiva IS
--definisco il cursore che conterrà il numero dei ricoveri in terapia intensiva nella data X
cursor totint is
    SELECT DATA, sum(TERAPIA_INTENSIVA) AS Totale_intensiva
    FROM REGIONI_COVID19
    GROUP BY DATA
    HAVING DATA <= '2020-03-25T17:00:00' AND DATA >= '2020-03-24T17:00:00' ;

--dichiaro le variabili che mi serviranno per i calcoli
rec_casi totint%ROWTYPE; --questa variabile è dello stesso tipo del cursore
giorno1 number;
giorno2 number;
diff number;

BEGIN
    OPEN totint; --apro il cursore
    FETCH totint into rec_casi; --inserisco la tupla seguente nella variabile che poi userò per i calcoli dopo
    giorno1 := rec_casi.Totale_intensiva;
    FETCH totint into rec_casi;
    giorno2 := rec_casi.Totale_intensiva;
    diff := giorno1 - giorno2;
    DBMS_OUTPUT.PUT_LINE('Variazione di persone che sono entrate in terapia intensiva a causa del COVID_19 = ' || diff);
    CLOSE totint; --chiudo il cursore
end;

call diff_tot_ter_intensiva(); --chiamo la procedura che mi darà i risultati in output

--3-Quante persone sono guarite dal COVID19 il giorno 25 marzo in italia?----
create or replace procedure diff_tot_guariti IS
--definisco il cursore che conterrà i guariti nella data X
cursor totgua is
    SELECT DATA, sum(DIMESSI_GUARITI) AS Totale_dimessi
    FROM REGIONI_COVID19
    GROUP BY DATA
    HAVING DATA <= '2020-03-25T17:00:00' AND DATA >= '2020-03-24T17:00:00' ;

--dichiaro le variabili che mi serviranno per i calcoli
rec_casi totgua%ROWTYPE; --questa variabile è dello stesso tipo del cursore
giorno1 number;
giorno2 number;
diff number;

BEGIN
    OPEN totgua; --apro il cursore
    FETCH totgua into rec_casi; --inserisco la tupla seguente nella variabile che poi userò per i calcoli dopo
    giorno1 := rec_casi.Totale_dimessi;
    FETCH totgua into rec_casi;
    giorno2 := rec_casi.Totale_dimessi;
    diff := giorno1 - giorno2;
    DBMS_OUTPUT.PUT_LINE('Numero di persone GUARITE dal COVID_19 = ' || diff);
    CLOSE totgua; --chiudo il cursore
end;

call diff_tot_guariti(); --chiamo la procedura che mi darà i risultati in output

--6.2.1-Calcolo percentuale positivi/tamponi in Italia
create or replace procedure diff_tasso_pos_tam IS
--definisco il cursore che conterrà tutti i positivi e tutti i tamponi effettuati alla data X 
cursor totpostam is
    SELECT DATA, sum(TOTALE_POSITIVI) AS TOTALE_POSITIVI_ITA, sum(TAMPONI) AS TOTALE_TAMPONI
    FROM REGIONI_COVID19
    GROUP BY DATA
    HAVING DATA <= '2020-03-25T17:00:00' AND DATA >= '2020-03-12T17:00:00'
    ORDER BY DATA DESC;

--dichiaro le variabili che mi serviranno per i calcoli
rec_casi totpostam%ROWTYPE; --questa variabile è dello stesso tipo del cursore
tot_pos number;
tot_tamp number;
diff number;

BEGIN
    OPEN totpostam; --apro il cursore
    DBMS_OUTPUT.PUT_LINE('Data : '|| '              | Tasso positivi/popolazione in ITALIA : ');
    LOOP
        FETCH totpostam into rec_casi;   --inserisco la tupla seguente nella variabile che userò per i calcoli dopo
        EXIT when totpostam%NOTFOUND;    --se non trova una tupla non stampa nulla ed esce dal ciclo
        tot_pos := rec_casi.TOTALE_POSITIVI_ITA;
        tot_tamp := rec_casi.TOTALE_TAMPONI;
        diff := (tot_pos / tot_tamp) * 100;
        DBMS_OUTPUT.PUT_LINE(rec_casi.DATA || '  |  ' || diff || '%');
    END LOOP;
    CLOSE totpostam; --chiudo il cursore

end;

call diff_tasso_pos_tam(); --chiamo la procedura che mi darà i risultati in output

--6.2.2-Calcolo percentuale positivi/popolazione in Italia
create or replace procedure diff_tasso_pos_pop IS
--definisco il cursore che conterrà la popolazione italiana e tutti i casi di COVID alla data X
cursor totpospop is
    SELECT DATA, SUM(NUM_RESIDENTI) AS POPOLOITA, SUM(TOTALE_CASI) AS TOT_POS
    FROM REGIONI_COVID19 R JOIN REGIONI R2 on R.DENOMINAZIONE_REGIONE = R2.DENOMINAZIONE_REGIONE
    GROUP BY DATA
    HAVING DATA <='2020-03-25T17:00:00' AND DATA >= '2020-02-25T18:00:00'
    ORDER BY DATA DESC ;

--dichiaro le variabili che mi serviranno per i calcoli
rec_casi totpospop%ROWTYPE; --questa variabile è dello stesso tipo del cursore
tot_pos number;
pop_ita number;
diff number;

BEGIN
    OPEN totpospop; --apro il cursore
    DBMS_OUTPUT.PUT_LINE('Data : '|| '              | Tasso positivi/popolazione in ITALIA : ');
    LOOP
        FETCH totpospop into rec_casi;   --Inserisco la tupla seguente nella variabile che userò per i calcoli dopo
        EXIT when totpospop%NOTFOUND;    --se non trova una tupla non stampa nulla ed esce dal ciclo
        tot_pos := rec_casi.TOT_POS;
        pop_ita := rec_casi.POPOLOITA;
        diff := (tot_pos / pop_ita) * 100;
        DBMS_OUTPUT.PUT_LINE(rec_casi.DATA || '  |  ' || diff || '%');
    END LOOP;
    CLOSE totpospop; --chiudo il cursore

end;

call diff_tasso_pos_pop(); --chiamo la procedura che mi darà i risultati in output

--6.2.3-Calcolo percentuale positivi/popolazione nel Mondo
create or replace procedure diff_tasso_pos_pop_mondo IS
--definisco il cursore che conterrà la popolazione degli stati con più positivi
cursor totpospop_m is
    SELECT * FROM ( SELECT DENOMINAZIONI_STATO, sum(CASI) AS TOTALE_CASI, POPOLAZIONE
    		    FROM STATI_COVID19 JOIN STATI S on STATI_COVID19.STATO = S.STATO
  		    GROUP BY DENOMINAZIONI_STATO, POPOLAZIONE
    		    ORDER BY TOTALE_CASI desc )
    WHERE ROWNUM <= 10;

-dichiaro le variabili che mi serviranno per i calcoli
rec_casi totpospop_m%ROWTYPE; --questa variabile è dello stesso tipo del cursore
tot_pos number;
pop_mon number;
diff number;

BEGIN
    OPEN totpospop_m; --apro il cursore
    DBMS_OUTPUT.PUT_LINE(RPAD('Stato : ',13)|| '              | Tasso positivi/popolazione nel MONDO : ');
    LOOP
        FETCH totpospop_m into rec_casi;   --inserisco la tupla seguente nella variabile che userò per i calcoli dopo
        EXIT when totpospop_m%NOTFOUND;    --se non trova una tupla non stampa nulla ed esce dal ciclo
        tot_pos := rec_casi.TOTALE_CASI;
        pop_mon := rec_casi.POPOLAZIONE;
        diff := (tot_pos / pop_mon) * 100;
        DBMS_OUTPUT.PUT_LINE(RPAD(rec_casi.DENOMINAZIONI_STATO,25) || '  |  ' || diff || '%');
    END LOOP;
    CLOSE totpospop_m; --chiudo il cursore

end;

call diff_tasso_pos_pop_mondo(); --chiamo la procedura che mi darà i risultati in output

--6.3-Calcolo R0 dell'epidemia
create or replace procedure calcoloR0 IS
--definisco il cursore che conterrà tutti i positivi alla data X
cursor totcont is
    SELECT DATA, sum(TOTALE_POSITIVI) AS TOTALE_POSITIVI_ITA
    FROM REGIONI_COVID19
    GROUP BY DATA
    HAVING DATA <= '2020-05-03T17:00:00' AND DATA >= '2020-02-25T17:00:00'
    ORDER BY DATA DESC ;

--dichiaro le variabili che mi serviranno per i calcoli
rec_casi totcont%ROWTYPE; -- questa variabile è dello stesso tipo del cursore
data_inizio varchar2(19);
data_fine varchar2(19);
totpos number;
totpos2 number;
R0 number;
x number;
n number;

BEGIN
    OPEN totcont; --apro il cursore
    n := 1;
    SELECT count(*) into x FROM USER_TABLES WHERE table_name = 'R0_COVID19';
    if (x = 0) then
	--creo una tabella dove inserirò i risulati del calcolo dell'R0
        execute immediate  ' CREATE TABLE R0_COVID19 (
                            DATA_INIZIO VARCHAR2(19),
                            DATA_FINE   VARCHAR2(19),
                            R0          NUMBER,
                            PRIMARY KEY (DATA_INIZIO,DATA_FINE))';
        commit;
    end if;
    FETCH totcont into rec_casi; --inserisco la tupla seguente nella variabile che userò per i calcoli dopo
    totpos := rec_casi.TOTALE_POSITIVI_ITA;
    data_fine := rec_casi.DATA;
        LOOP
        FETCH totcont into rec_casi; --inserisco la tupla seguente nella variabile che userò per i calcoli dopo
        EXIT WHEN totcont%NOTFOUND; --se non trova una tupla non stampa nulla ed esce dal ciclo
        totpos2 := rec_casi.TOTALE_POSITIVI_ITA;
        if(totcont%ROWCOUNT = 5*n) then
            data_inizio := rec_casi.DATA;
            R0 := totpos/totpos2;
            DBMS_OUTPUT.PUT_LINE('Calcolo R0 = ' || R0 );
            execute immediate 'INSERT INTO R0_COVID19 VALUES (:val1,:val2,:val3)' using data_inizio,data_fine,R0; --inserisco i valori del calcolo nella tabella prima creata
            commit;
            n := n+1;
            totpos := rec_casi.TOTALE_POSITIVI_ITA;
            data_fine := rec_casi.DATA;
        END if ;
        END LOOP;
    CLOSE totcont; --chiudo il cursore
end;

call calcoloR0(); --chiamo la procedura che mi darà i risultati in output

--6.4-Calcolo del tasso di letalità dell'epidemia
create or replace procedure calcololetalita IS
--definisco il cursore che conterrà il totale dei deceduti, dei giorni e dei casi alla data X
cursor totcont is
    SELECT DATA, count(DATA) AS SOMMA_GIORNI, SUM(DECEDUTI) AS DECED, SUM(TOTALE_CASI) AS TOTCAS
    FROM REGIONI_COVID19 R JOIN REGIONI R2 on R.CODICE_REGIONE = R2.CODICE_REGIONE and R.DENOMINAZIONE_REGIONE = R2.DENOMINAZIONE_REGIONE
    GROUP BY DATA
    HAVING DATA <='2020-05-03T17:00:00' AND DATA >= '2020-02-25T18:00:00'
    ORDER BY DATA DESC ;

--dichiaro le variabili che mi serviranno per i calcoli
rec_casi totcont%ROWTYPE; --questa variabile è dello stesso tipo del cursore
data_inizio varchar2(19);
data_fine varchar2(19);
L number;
x number;
n number;
num number;
den number;

BEGIN
    OPEN totcont; --apro il cursore
    n := 1;
    SELECT count(*) into x FROM USER_TABLES WHERE table_name = 'LETALITA_COVID19';
    if (x = 0) then
	--creo una tabella dove inserirò i risulati del calcolo del tasso di letalità
        execute immediate  ' CREATE TABLE LETALITA_COVID19 (
                            DATA_INIZIO VARCHAR2(19),
                            DATA_FINE   VARCHAR2(19),
                            L         NUMBER,
                            PRIMARY KEY (DATA_INIZIO,DATA_FINE))';
        commit;
    end if;
    FETCH totcont into rec_casi; --inserisco la tupla seguente nella variabile che userò per i calcoli dopo
    num := rec_casi.DECED / 7;
    data_fine := rec_casi.DATA;
        LOOP
        FETCH totcont into rec_casi; --inserisco la tupla seguente nella variabile che userò per i calcoli dopo
        EXIT WHEN totcont%NOTFOUND; --se non trova una tupla non stampa nulla ed esce dal ciclo
        den := rec_casi.TOTCAS / 7;
        if(totcont%ROWCOUNT = 7*n) then
            data_inizio := rec_casi.DATA;
            L := (num/den) * 100;
            DBMS_OUTPUT.PUT_LINE('Calcolo LETALITA = ' || L ||'%' );
            execute immediate 'INSERT INTO LETALITA_COVID19 VALUES (:val1,:val2,:val3)' using data_inizio,data_fine,L; --inserisco i valori del calcolo nella tabella prima creata
            commit;
            n := n+1;
            num := rec_casi.DECED / 7;
            data_fine := rec_casi.DATA;
        END if ;
        END LOOP;
    CLOSE totcont; --chiudo il cursore
end;

call calcololetalita(); --chiamo la procedura che mi darà i risultati in output

--6.5-Automatizzazione calcolo delle variazioni percentuali rispetto al giorno precedente
create or replace trigger var_perc_giornaliere
    before insert on REGIONI_COVID19
    for each row

declare
    regcovid            REGIONI_COVID19%ROWTYPE; --questa variabile ha gli stessi campi della tabella REGIONI_COVID19
    var_perc_casi       NUMBER;
    var_perc_terinten   NUMBER;
    var_perc_positivi   NUMBER;
    var_perc_deceduti   NUMBER;
    var_perc_tamponi    NUMBER;

begin
    --prendo i valori registrati nella Regione il giorno precedente
    SELECT * into regcovid FROM ( SELECT *
                                    FROM REGIONI_COVID19
                                    WHERE DENOMINAZIONE_REGIONE = :NEW.DENOMINAZIONE_REGIONE
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

--6.6-trigger per la sicurezza dei dati
--Impedisce che venga modificata la tabella REGIONI_COVID19
create or replace trigger GEST_MODIFICA_REGIONI
    before update
    on REGIONI_COVID19
    for each row
begin
    raise_application_error(-20450,' Non si possono modificare i dati sulle rilevazioni');
end;

----Impedisce che venga modificata la tabella STATI_COVID19----------
create or replace trigger GEST_MODIFICA_STATI
    before update
    on STATI_COVID19
    for each row
begin
    raise_application_error(-20451,' Non si possono modificare i dati sulle rilevazioni');
end;

----Impedisce che venga modificata la tabella PROVINCE_COVID19----------
create or replace trigger GEST_MODIFICA_PROVINCE
    before update
    on PROVINCE_COVID19
    for each row
begin
    raise_application_error(-20452,' Non si possono modificare i dati sulle rilevazioni');
end;