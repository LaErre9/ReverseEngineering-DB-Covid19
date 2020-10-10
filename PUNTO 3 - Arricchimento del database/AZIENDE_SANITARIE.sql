CREATE TABLE AZIENDE_SANITARIE
(
    CODICE_AZIENDA        NUMBER       not null,
    DENOMINAZIONE_AZIENDA VARCHAR2(40) not null
        primary key,
    INDIRIZZO             VARCHAR2(39) not null,
    SIGLA_PROVINCIA       VARCHAR2(2)  not null,
    TELEFONO              VARCHAR2(12),
    FAX                   VARCHAR2(12),
    EMAIL                 VARCHAR2(43),
    SITO_WEB              VARCHAR2(27),
    PARTITA_IVA           NUMBER,
    CODICE_PROVINCIA      NUMBER
        constraint AZIENDE_SANITARIE_PROVINCE_FK
            references PROVINCE
);

INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (203, 'TO3', 'VIA MARTIRI XXX APRILE 30', 'TO', '1140171', '114017277', 'aslto3@cert.aslto3.piemonte.it', 'www.aslto3.piemonte.it', 2704350012, 1);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (321, 'ATS DELLA CITTA'' METROPOLITANA DI MILANO', 'CORSO ITALIA 19', 'MI', '02 85782001', '02 85782009', 'direzionegenerale@ats-milano.it', 'www.asl.milano.it', 9320520969, 15);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (509, 'AZIENDA ULSS N. 9 SCALIGERA', 'VIA VALVERDE 42', 'VR', '045 8075510', '045 8075609', 'direzione.generale@aulss9.veneto.it', 'www.aulss9.veneto.it', 2573090236, 23);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (205, 'AS FRIULI OCCIDENTALE', 'VIA DELLA VECCHIA CERAMICA 1', 'PN', '0434 369111', '0434 523011', 'dg@aas5.sanita.fvg.it', 'www.ass6.sanita.fvg.it', 1772890933, 93);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (201, 'AZIENDA USL TOSCANA CENTRO', 'PIAZZA SANTA MARIA NUOVA 1', 'FI', '556939222', '556939223', 'direttore.generale@uslcentro.toscana.it', 'www.uslcentro.toscana.it', 6593810481, 48);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (111, 'LATINA', 'V.le PIERLUIGI NERVI Torre 2G snc', 'LT', '0773 6553901', '7736553919', 'direzionegenerale@ausl.latina.it', 'www.asl.latina.it', 1684950593, 59);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (202, 'A.S.P. CROTONE', 'VIA CORIGLIANO 1', 'KR', '962924111', '962924141', 'dirgen@asl5.it', 'www.asl5.crotone.it', 1997410798, 101);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (205, 'A.S.P. REGGIO CALABRIA', 'VIA SANT''ANNA II TRONCO 18/P', 'RC', '96522931', '965347202', 'dirgen@asl11.it', null, 1367600804, 80);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (206, 'ASP PALERMO', 'VIA G. CUSMANO 24', 'PA', '091 6661111', '091 6661111', 'sil@asl6.it', 'www.asl6.it', 5841760829, 82);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (207, 'ASP RAGUSA', 'P.ZZA IGEA 1', 'RG', '932600111', '932600111', 'sil@asl7.it', 'www.asl7.it', 1426410880, 88);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (204, 'TO4', 'Via Po 11', 'TO', '119176666', '119176322', 'direzione.generale@asl7.to.it', 'www.asl.ivrea.to.it', 9736160012, 1);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (101, 'AZIENDA U.S.L. VALLE D''AOSTA', 'VIA GUIDO REY 1', 'AO', '0165 5431', '0165 544587', 'protocollo@pec.ausl.vda.it', 'www.ausl.vda.it', 177330073, 7);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (323, 'ATS DELLA MONTAGNA', 'VIA N. SAURO 38', 'SO', '0342 555722', '0342 210976', 'direzione.generale@ats-montagna.it', 'www.ats-montagna.it', 988200143, 14);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (101, 'TRENTO', 'VIA DE GASPERI 79', 'TN', '0461 364158', '0461 364160', 'dirgen@apss.tn.it', 'www.apss.tn.it', 1429410226, 22);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (103, 'GENOVESE', 'VIA BERTANI 4', 'GE', '1084911', '108497625', 'direzione.generale@asl3.liguria.it', 'www.asl3.liguria.it', 3399650104, 10);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (104, 'CHIAVARESE', 'VIA G.B.GHIO 9', 'GE', '185329111', '185304795', 'asl4@asl4.liguria.it', 'www.asl4.liguria.it', 1038700991, 10);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (104, 'AZIENDA USL MODENA', 'VIA S.GIOVANNI DEL CANTONE 23', 'MO', '059 435111', '059 435604', 'urpmodena@ausl.mo.it', 'www.ausl.mo.it', 2241850367, 36);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (106, 'AZIENDA USL IMOLA', 'VIALE  AMENDOLA 2', 'BO', '0542 604011', '0542 604013', 'ausl@ausl.imola.bo.it', 'www.ausl.imola.bo.it', 705271203, 37);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (109, 'AZIENDA USL FERRARA', 'VIA A.CASSOLI 30', 'FE', '0532 235111', '0532 235602', 'urpferrara@ausl.fe.it', 'www.ausl.fe.it', 1295960387, 38);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (202, 'AUSL UMBRIA N. 2', 'VIALE BRAMANTE  37', 'TR', '0744 204320', '0744 303639', 'aslumbria2@postacert.umbria.it', 'www.aslumbria2.it', 1499590550, 55);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (205, 'ROMA 5', 'VIA TIBURTINA 22/A', 'RM', '0774 3164069', '0774 331809', 'direzionegenerale@aslromag.it', 'www.aslromag.it', 4733471009, 58);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (205, 'A.S.L. NAPOLI 2 NORD', 'VIA CORRADO ALVARO 8', 'NA', '081 8552111', '081 5249308', 'direzionestrategica@aslnapoli2nord.it', 'www.aslnapoli2nord.it', 6321661214, 63);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (204, 'A.S.P. VIBO VALENTIA', 'VIA DANTE ALIGHIERI 1', 'VV', '9639621', '963591021', 'dirgen@asl8.it', 'www.asl8vv.it', 1997680796, 102);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (204, 'ASP ENNA', 'VIALE DIAZ 23', 'EN', '93545111', '93545111', 'sil@asl4.it', 'www.asl4.it', 1151150867, 86);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (205, 'ASP MESSINA', 'VIA DEL VESPRO  289', 'ME', '090 6991', '090 6991', 'sil@asl5.it', 'www.asl5.it', 3051870834, 83);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (209, 'ASP DI TRAPANI', 'VIA MAZZINI 1', 'TP', '923805111', '923805111', 'office@astrapani.it', 'www.asltrapani.it', 2363280815, 81);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (201, 'AZIENDA PER LA TUTELA DELLA SALUTE', 'VIA MONTE GRAPPA 82', 'SS', '792061907', '792061907', 'protocollo.generale@pec.atssardegna.it', 'www.atssardegna.it', 935650903, 90);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (322, 'ATS DELL''INSUBRIA', 'VIA O. ROSSI 9', 'VA', '0332 277451', '0332 277448', 'direzionegenerale@ats-insubria.it', 'www.asl.como.it', 3510140126, 12);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (326, 'ATS DI BRESCIA', 'Viale Duca degli Abruzzi 15', 'BS', '030 3838251', '030 3838339', 'direzionegenerale@ats-brescia.it', 'www.ats-brescia.it', 3775430980, 17);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (505, 'AZIENDA ULSS N. 5 POLESANA', 'V.LE TRE MARTIRI 89', 'RO', '0425 393646', '0425 394618', 'direzione.generale@aulss5.veneto.it', 'www.aulss5.veneto.it', 1013470297, 29);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (206, 'ASU FRIULI CENTRALE', 'VIA POZZUOLO 330', 'UD', '0432 806000', '0432 806005', 'dg@asufc.sanita.fvg.it', 'www.asufc.sanita.fvg.it', 2985660303, 30);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (102, 'AZIENDA USL PARMA', 'STRADA DEL QUARTIERE 2/A', 'PR', '0521 393111', '0521 282393', 'filodiretto@ausl.pr.it', 'www.ausl.pr.it', 1874230343, 34);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (105, 'AZIENDA USL BOLOGNA', 'VIA CASTIGLIONE 29', 'BO', '051 622 5111', '051 658 4936', 'relazioni.cittadino@ausl.bo.it', 'www.ausl.bologna.it', 2406911202, 37);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (114, 'AZIENDA USL DELLA ROMAGNA', 'VIA DE GASPERI 8', 'RA', '0544 285111', '0544 285111', 'ausl110ra.uffprotocollo@pec.ausl.ra.it', 'www.auslromagna.it', 2483810392, 39);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (201, 'AUSL UMBRIA N. 1', 'VIA G. GUERRA  21/17', 'PG', '075 5412003', '075 5412004', 'aslumbria1@postacert.umbria.it', 'www.aslumbria1.it', 3301860544, 54);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (201, 'ASUR', 'Via G. Oberdan 2', 'AN', '071 2911501', '071 2911500', 'protocollo@asur.marche.it', 'www.asur.marche.it', 2175860424, 42);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (201, 'ASREM', 'VIA PETRELLA 1', 'CB', '8744091', '874412190', null, 'www.asrem.org', null, 70);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (202, 'A.S.L. BENEVENTO', 'VIA ODERISIO 1', 'BN', '0824 308111', '0824 51107', 'bruno.destefano@aslbenevento1.it', 'www.aslbenevento1.it', 1009680628, 62);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (204, 'A.S.L. NAPOLI 1 CENTRO', 'Via Comunale del Principe 13/a', 'NA', '081 2541111', '081 2544798', 'aslnapoli1centro@pec.aslna1centro.it', 'www.aslna1.napoli.it', 6328131211, 63);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (106, 'ASL BR', 'Via Napoli 8', 'BR', '83120561', '83120561', 'protocollo.asl.brindisi@pec.rupar.puglia.it', null, 1647800745, 74);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (113, 'ASL BT', 'Via Fornaci 201', 'BT', '0883-299111', '883299461', null, 'www.auslbatuno.it', 6391740724, 110);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (207, 'BI', 'VIA DEI PONDERANESI 2', 'BI', '1535031', '015 3503545', 'ufficio.protocollo@cert.aslbi.piemonte.it', 'www2.aslbi.piemonte.it', 1810260024, 96);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (208, 'NO', 'VIA DEI MILLE 2', 'NO', '0321 374111', '0321 374519', 'protocollogenerale@pec.asl.novara.it', 'www.asl13.novara.it', 1522670031, 3);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (301, 'ASL CITTA'' DI TORINO', 'VIA SAN SECONDO  29', 'TO', '115.661.566', '115.661.566', 'protocollo@pec.aslcittaditorino.it', 'www.aslcittaditorino.it', 11632570013, 1);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (501, 'AZIENDA ULSS N. 1 DOLOMITI', 'VIA FELTRE 57', 'BL', '0437 216710', '0437 27717', 'direzione.generale@aulss1.veneto.it', 'www.aulss1.veneto.it', 300650256, 25);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (503, 'AZIENDA ULSS N. 3 SERENISSIMA', 'VIA DON FEDERICO TOSATTO 147', 'VE', '041 2608948', '041 2608945', 'direzione.generale@aulss3.veneto.it', 'www.aulss3.veneto.it', 2798850273, 27);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (105, 'SPEZZINO', 'VIA XXIV MAGGIO 139', 'SP', '1875331', '187534745', 'direttore.generale@asl5.liguria.it', 'www.asl5.liguria.it', 962520110, 11);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (103, 'AZIENDA USL REGGIO EMILIA', 'VIA AMENDOLA 2', 'RE', '0522 335111', '0522 335205', 'info.saub@ausl.re.it', 'www.ausl.re.it', 1598570354, 35);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (110, 'RIETI', 'VIALE  MATTEUCCI 9', 'RI', '0746 278685', '0746 278799', 'g.bellini@asl.rieti.it', 'www.asl.ri.it', 821180577, 57);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (204, 'ROMA 4', 'VIA DELLE TERME DI TRAIANO 39/a', 'RM', '0766 591610', '0766 21110', 'direzione.generale@aslrmf.it', 'www.aslrmf.it', 4743741003, 58);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (201, 'AVEZZANO-SULMONA-L''AQUILA', 'L''AQUILA  VIA G. BELLISARI SNC -', 'AQ', '8.623.681', null, 'direzione.generale@asl-laquila.it', 'www.aslaq.it', 1792410662, 66);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (207, 'A.S.L. SALERNO', 'VIA NIZZA 146', 'SA', '089 693647', '089 251629', 'direzionegenerale@aslsalerno2.it', 'www.aslsalerno.it', 4701800650, 65);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (202, 'AZIENDA SANITARIA LOCALE DI MATERA  ASM', 'VIA MONTESCAGLIOSO 20', 'MT', '0835/253652', '0835/253506', 'asl4.urp@rete.basilicata.it', 'www.aslmt4.it', 1178540777, 77);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (203, 'ASP CATANIA', 'VIA S. MARIA LA GRANDE 5', 'CT', '095 254111', '095 254111', 'sil@asl3.it', 'www.asp3.it', 4721260877, 87);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (205, 'TO5', 'VIA SAN DOMENICO 21', 'TO', '011 94291', '011 94293268', 'protocollo@cert.aslto5.piemonte.it', 'www.asl8.piemonte.it', 6827170017, 1);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (213, 'AL', 'VIA VENEZIA 6', 'AL', '142434111', '142434361', 'direzione@aslal.it', 'www.aslal.it', 2190140067, 6);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (102, 'SAVONESE', 'VIA MANZONI 14', 'SV', '1984041', '198405524', 'dg.segr@asl2.liguria.it', 'www.asl2.liguria.it', 1062990096, 9);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (101, 'AZIENDA USL PIACENZA', 'VIA ANTONIO ANGUISSOLA 15', 'PC', '0523 301111', '0523 302391', 'urp.pc@ausl.pc.it', 'www.ausl.pc.it', 91002500337, 33);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (201, 'ROMA 1', 'BORGO SANTO SPIRITO 3', 'RM', '668.352.461', '668352442', 'dir.gen@asl-rme.it', 'www.asl-rme.it', null, 58);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (116, 'ASL LE', 'VIA MIGLIETTA 5', 'LE', '832215111', '832215648', null, null, null, 75);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (202, 'ASP CALTANISSETTA', 'VIA CUSMANO 10', 'CL', '934559111', '934559111', 'sil@asl2.it', 'www.aspcl.it', 1825570854, 85);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (208, 'ASP SIRACUSA', 'C.SO GELONE 17', 'SR', '931724111', '931724111', 'sil@asl8.it', 'www.asp8.it', 1661590891, 89);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (211, 'CN2', 'VIA VIDA 10', 'CN', '0173 316111', '0173 316480', 'aslcn2@legalmail.it', 'www.asl18.it', 2419170044, 4);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (201, 'AZIENDA SANITARIA DELLA P.A. DI BOLZANO', 'VIA CASSA DI RISPARMIO 4', 'BZ', '0471 223601', '0471 223651', 'gd@sabes.it', 'www.sabes.it', 773750211, 21);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (506, 'AZIENDA ULSS N. 6 EUGANEA', 'VIA E. DEGLI SCROVEGNI 14', 'PD', '049 8213121', '049 8211974', 'direzione.generale@aulss6.veneto.it', 'www.aulss6.veneto.it', 349050286, 28);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (109, 'VITERBO', 'VIA ENRICO FERMI 15', 'VT', '0761 237002', '0761 237006', 'direzione.generale@asl.vt.it', 'www.asl.vt.it', 1455570562, 56);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (201, 'A.S.L. AVELLINO', 'VIA DEGLI IMBIMBO 10/12', 'AV', '825.291.111', '82.530.824', 'direzionegenerale@aslav2.it', 'www.aslavellino.it', 2600160648, 64);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (203, 'A.S.P. CATANZARO', 'VIA VINICIO CORTESE 25', 'CZ', '961703485', '961727243', 'dirgen@asl7.it', 'www.as7catanzaro.it', 1991510791, 79);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (206, 'VC', 'C.SO MARIO ABBIATE 21', 'VC', '0161 5931', '0161/210284', 'affari.generali@asl11.piemonte.it', 'www.asl11.piemonte.it', 1811110020, 2);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (210, 'CN1', 'VIA CARLO BOGGIO 12', 'CN', '171450111', '171450207', 'protocollo@aslcn1.legalmailPA.it', 'www.asl17.it', 1128930045, 4);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (327, 'ATS DELLA VAL PADANA', 'VIA DEI TOSCANI 1', 'MN', '0376 334988', '0376 331901', 'direzione.generale@ats-valpadana.it', 'www.aslmn.it', 2481970206, 20);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (328, 'ATS DI PAVIA', 'VIALE INDIPENDENZA 1', 'PV', '0382/431329', '0382/431343', 'direzione_generale@ats-pavia.it', 'www.ats-pavia.it', 2613260187, 18);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (502, 'AZIENDA ULSS N. 2 MARCA TREVIGIANA', 'VIA S. AMBROGIO IN FIERA 37', 'TV', '0422 323217', '0422 323293', 'direzione.generale@aulss2.veneto.it', 'www.aulss2.veneto.it', 3084880263, 26);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (207, 'ASU GIULIANO ISONTINA', 'Via Costantinides  2', 'TS', '403997101', '403997185', 'cs@asugi.sanita.fvg', 'www.asugi.sanita.fvg.it', 1337320327, 32);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (202, 'AZIENDA USL TOSCANA NORD-OVEST', 'VIA COCCHI 7/9', 'PI', '50954251', '50954321', 'dirgen@uslnordovest.toscana.it', 'www.uslnordovest.toscana.it', 2198590503, 50);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (203, 'ROMA 3', 'VIA CASAL BERNOCCHI 73', 'RM', '06  56487640', '06 56487635', 'direttoregenerale@aslromad.it', 'www.aslromad.it', 4733491007, 58);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (206, 'ROMA 6', 'B.GO GARIBALDI 12', 'RM', '06  93273864', '06 93273925', 'direzione.generale@aslromah.it', 'www.aslromah.it', 4737811002, 58);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (204, 'TERAMO', 'TERAMO  CIRC.NE RAGUSA 1', 'TE', '8614291', '0861 241213', 'direzione.generale@aslteramo.it', 'www.aslteramo.it', 115590671, 67);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (112, 'ASL TA', 'VIALE VIRGILIO 31', 'TA', '099 7786111', '099 4585927', 'direttoregenerale@asl.taranto.it', 'www.asl.taranto.it', 2026690731, 73);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (115, 'ASL FG', 'PIAZZA LIBERTï¿½ 1', 'FG', '881731111', '881732619', null, null, null, 71);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (201, 'AZIENDA SANITARIA LOCALE DI POTENZA ASP', 'VIA TORRACA 2', 'PZ', '0971/310278', '0971/310265', 'info@asl2.potenza.it', 'www.asl2.potenza.it', 1722360763, 76);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (201, 'ASP AGRIGENTO', 'VIA MANZONI  140', 'AG', '922596966', '922596966', 'asl1@aslagrigento.it', 'www.aslagrigento.it', 2570930848, 84);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (209, 'VCO', 'VIA MAZZINI 117', 'VB', '0323 868111', '0323 643020', 'protocollo@pec.aslvco.it', 'www.aslvco.it', 634880033, 103);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (212, 'AT', 'VIA CONTE VERDE 125', 'AT', '0141 484000', '0141 484095', 'protocollo@asl.at.it', 'portale.asl.at.it', 1120620057, 5);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (324, 'ATS DELLA BRIANZA', 'VIALE ELVEZIA 2', 'MB', '039 2384201', '039 2384266', 'segreteria.dirgen@ats-brianza.it', 'www.aslmonzabrianza.it', 9314190969, 108);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (325, 'ATS DI BERGAMO', 'VIA GALLICCIOLLI 4', 'BG', '35385111', '35385111', 'direzione.generale@ats-bg.it', 'www.ats-bg.it', 4114400163, 16);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (504, 'AZIENDA ULSS N. 4 VENETO ORIENTALE', 'P.ZZA DE GASPERI 5', 'VE', '0421 228016', '0421 228064', 'direzione.generale@aulss4.veneto.it', 'www.aulss4.veneto.it', 2799490277, 27);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (507, 'AZIENDA ULSS N. 7 PEDEMONTANA', 'VIA DEI LOTTI 40', 'VI', '0424 888556', '0424 885333', 'direzione.generale@aulss7.veneto.it', 'www.aulss7.veneto.it', 913430245, 24);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (508, 'AZIENDA ULSS N. 8 BERICA', 'V.LE RODOLFI 37', 'VI', '0444 753465', '0444 753326', 'direzione.generale@aulss8.veneto.it', 'www.aulss8.veneto.it', 2441500242, 24);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (101, 'IMPERIESE', 'VIA AURELIA PONENTE 97', 'IM', '1845361', '184536588', 'dirgen@asl1.liguria.it', 'www.asl1.liguria.it', 1083060085, 8);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (203, 'AZIENDA USL TOSCANA SUD-EST', 'VIA CURTATONE 54', 'AR', '5752551', '5752551', 'ausltoscanasudest@postacert.toscana.it', 'www.uslsudest.toscana.it', 2236310518, 51);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (112, 'FROSINONE', 'VIALE A. FABI snc', 'FR', '0775 202415', '0775 202354', 'direzione.generale@aslfrosinone.it', 'www.asl.fr.it', 1886690609, 60);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (202, 'ROMA 2', 'VIA FILIPPO MEDA 35', 'RM', '064143 3257', '064143 3256', 'direzione.generale@aslromab.it', 'www.aslromab.it', 13665151000, 58);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (202, 'LANCIANO-VASTO-CHIETI', 'CHIETI  VIA MARTIRI LANCIANESI 19', 'CH', '0871/3581', '87.163.711', 'dir.gen@aslchieti.it', 'www.aslchieti.it', 1705480695, 69);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (203, 'PESCARA', 'PESCARA  VIA R. PAOLINI 47', 'PE', '085 4251', '854253000', 'segreteria_dg@ausl.pe.it', 'www.ausl.pe.it', 1397530682, 68);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (203, 'A.S.L. CASERTA', 'VIA UNITA'' ITALIANA 28', 'CE', '0823 445123', '0823 324099', 'mail@aslcaserta1.it', 'www.aslcaserta1.it', 3519500619, 61);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (206, 'A.S.L. NAPOLI 3 SUD', 'C.SO ALCIDE DE GASPERI 167', 'NA', '081 8729751', '081 8729776', 'commissario@aslnapoli3sud.it', 'www.aslnapoli5.it', 6322711216, 63);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (114, 'ASL BA', 'LUNGOMARE STARITA 6', 'BA', '805842567', '805842563', null, null, null, 72);
INSERT INTO AZIENDE_SANITARIE (CODICE_AZIENDA, DENOMINAZIONE_AZIENDA, INDIRIZZO, SIGLA_PROVINCIA, TELEFONO, FAX, EMAIL, SITO_WEB, PARTITA_IVA, CODICE_PROVINCIA) VALUES (201, 'A.S.P. COSENZA', 'VIALE DEGLI ALIMENA 8', 'CS', '9848931', '984893490', null, 'www.as4.cosenza.it', 1987710785, 78);