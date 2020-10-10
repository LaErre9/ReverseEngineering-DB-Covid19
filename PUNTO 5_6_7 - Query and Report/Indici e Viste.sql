--UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO II
--FACOLTA' DI INGEGNERIA INFORMATICA
--ANNO ACCADEMICO 2019/20
--AUTORI: RICCIO GIUSEPPE N46004297
	  ROMANO ANTONIO  N46004321
--DESCRIZIONE: VISTE ED INDICI UTILI ALL'ANALISI DEI DATI PRESENTI NEL DATABASE

--CREATE VIEW
--Casi nell'arco di una settimana nelle Regioni
CREATE VIEW info_settimana_REGIONI AS
SELECT *
FROM REGIONI_COVID19
WHERE DATA >='2020-03-25T17:00:00' AND DATA <='2020-03-31T17:00:00'
ORDER BY DENOMINAZIONE_REGIONE ASC;

--Casi nell'arco di una settimana nelle Province
CREATE VIEW info_settimana_PROVINCE AS
SELECT DATA_REG,DENOMINAZIONE_PROVINCIA,TOTALE_CASI
FROM PROVINCE_COVID19 P JOIN PROVINCE P2 on P.CODICE_PROVINCIA = P2.CODICE_PROVINCIA
WHERE DATA_REG >='2020-03-25T17:00:00' AND DATA_REG <='2020-03-31T17:00:00'
ORDER BY DENOMINAZIONE_PROVINCIA ASC;

--Casi nell'arco di una settimana negli stati
CREATE VIEW info_settimana_STATI AS
SELECT DATA_STATO,DENOMINAZIONI_STATO,CASI,DECEDUTI
FROM STATI_COVID19
WHERE DATA_STATO like '%03_2020' and DATA_STATO >='25/03/2020'
ORDER BY DENOMINAZIONI_STATO ASC;

--CREATE INDEX
--Indice sulla denominazione della Regione
CREATE INDEX idx_info_sett_REGIONI
ON REGIONI (DENOMINAZIONE_REGIONE);

--Indice sulla denominazione della Provincia
CREATE INDEX idx_info_sett_PROVINCE
ON PROVINCE (DENOMINAZIONE_PROVINCIA);

--Indice sulla descrizione dello stato
CREATE INDEX idx_info_sett_STATI
ON STATI (DESCRIZIONE);

--Procedura che estrae dalla vista INFO_SETTIMANA_PROVINCE le informazioni relative alla provincia desiderata
create or replace procedure info_province is
--definisco il cursore che conterrà le informazioni settimanali relative alla provincia che viene fornita in input
cursor info_covid_cursor (provincia in INFO_SETTIMANA_PROVINCE.DENOMINAZIONE_PROVINCIA%TYPE)
    is SELECT *
    FROM INFO_SETTIMANA_PROVINCE
    WHERE DENOMINAZIONE_PROVINCIA= provincia
    ORDER BY DATA_REG ASC;

--dichiaro la variabile che mi servirà per fornire l'output
info_covid info_covid_cursor%ROWTYPE; --questa variabile è dello stesso tipo del cursore

begin
    open info_covid_cursor('Napoli'); --apro il cursore e fornisco la provincia di cui voglio le informazioni
    fetch info_covid_cursor into info_covid; --inserisco la tupla seguente nella variabile
    DBMS_OUTPUT.PUT_LINE('Ecco le informazioni relative alla provincia di ' || info_covid.DENOMINAZIONE_PROVINCIA || ' nella settimana tra il 25 ed il 31 Marzo');
    DBMS_OUTPUT.PUT_LINE('Data                | Totale casi ');
    loop
        exit when info_covid_cursor%notfound; --se non trova una tupla non stampa nulla ed esce dal ciclo
        DBMS_OUTPUT.PUT_LINE(RPAD(info_covid.DATA_REG,22) || info_covid.TOTALE_CASI);
        fetch info_covid_cursor into info_covid; --inserisco la tupla seguente nella variabile
    end loop;
    close info_covid_cursor; --chiudo il cursore
end;

call info_province(); --chiamo la procedura che mi darà le info in output

--Procedura che estrae dalla vista INFO_SETTIMANA_REGIONI le informazioni relative alla regione desiderata
create or replace procedure info_regioni is
--definisco il cursore che conterrà le informazioni settimanali relative alla regione che viene fornita in input
cursor info_covid_cursor (regione in INFO_SETTIMANA_REGIONI.DENOMINAZIONE_REGIONE%TYPE)
    is SELECT *
    FROM INFO_SETTIMANA_REGIONI
    WHERE DENOMINAZIONE_REGIONE= regione
    ORDER BY DATA ASC;

--dichiaro la variabile che mi servirà per fornire l'output
info_covid info_covid_cursor%ROWTYPE; --questa variabile è dello stesso tipo del cursore

begin
    open info_covid_cursor('Liguria'); --apro il cursore e fornisco la regione di cui voglio le informazioni
    fetch info_covid_cursor into info_covid; --inserisco la tupla seguente nella variabile
    DBMS_OUTPUT.PUT_LINE('Ecco le informazioni relative alla regione ' || info_covid.DENOMINAZIONE_REGIONE || ' nella settimana tra il 25 ed il 31 Marzo');
    DBMS_OUTPUT.PUT_LINE('Data                | Deceduti | Totale casi | Terapia intensiva ' ||
                         '| Dimessi guariti | Nuovi positivi | Tamponi');
    loop
        exit when info_covid_cursor%notfound; --se non trova una tupla non stampa nulla ed esce dal ciclo
        DBMS_OUTPUT.PUT_LINE(RPAD(info_covid.DATA,22) || RPAD(info_covid.DECEDUTI,11) ||
                             RPAD(info_covid.TOTALE_CASI,14) || RPAD(info_covid.TERAPIA_INTENSIVA,20) ||
                             RPAD(info_covid.DIMESSI_GUARITI,18) || RPAD(info_covid.NUOVI_POSITIVI,17) ||
                             info_covid.TAMPONI);
        fetch info_covid_cursor into info_covid; --inserisco la tupla seguente nella variabile
    end loop;
    close info_covid_cursor; --chiudo il cursore
end;

call info_regioni(); --chiamo la procedura che mi darà le info in output

--Procedura che estrae dalla vista INFO_SETTIMANA_STATI le informazioni relative allo stato desiderato
create or replace procedure info_stati is
--definisco il cursore che conterrà le informazioni settimanali relative allo stato che viene fornito in input
cursor info_covid_cursor (stato in INFO_SETTIMANA_STATI.DENOMINAZIONI_STATO%TYPE)
    is SELECT *
    FROM INFO_SETTIMANA_STATI
    WHERE DENOMINAZIONI_STATO= stato;

--dichiaro la variabile che mi servirà per fornire l'output
info_covid info_covid_cursor%ROWTYPE; --questa variabile è dello stesso tipo del cursore

begin
    open info_covid_cursor('Germany'); --apro il cursore e fornisco lo stato di cui voglio le informazioni
    fetch info_covid_cursor into info_covid; --inserisco la tupla seguente nella variabile
    DBMS_OUTPUT.PUT_LINE('Ecco le informazioni relative allo stato ' || info_covid.DENOMINAZIONI_STATO);
    DBMS_OUTPUT.PUT_LINE('Data       | Totale casi | Deceduti');
    loop
        exit when info_covid_cursor%notfound; --se non trova una tupla non stampa nulla ed esce dal ciclo
        DBMS_OUTPUT.PUT_LINE(RPAD(info_covid.DATA_STATO,13) || RPAD(info_covid.CASI,14) || info_covid.DECEDUTI);
        fetch info_covid_cursor into info_covid; --inserisco la tupla seguente nella variabile
    end loop;
    close info_covid_cursor; --chiudo il cursore
end;

call info_stati(); --chiamo la procedura che mi darà le info in output