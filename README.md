# ReverseEngineering-DB-Covid19
La seguente trattazione è mirata al Reverse Engineering di una complessa base di dati sull’andamento del contagio del Coronavirus COVID-19 a partire dai primi contagi in Italia: 25 febbraio 2020 fino al 3 Maggio 2020. La decostruzione avverrà sulla base di una tabella master comprendendo, riscrivendo e ricostruendo l’architettura del database con un ulteriore studio di analisi e sviluppo del database con un’analisi più approfondita eliminando anche ulteriori ridondanze attraverso il processo di normalizzazione. Lo sviluppo della base di dati sarà poi espanso nel raccogliere tutti dati necessari per determinare l’andamento del contagio nelle province, regioni e nel mondo.

N.B Dati prelevati da <a title="datiDPCM" href="https://github.com/pcm-dpc/COVID-19" target="_blank" > Dati COVID-19 Italia, Protezione Civile</a>

# Altre info sulla documentazione DB-Covid19
Si è pensato di documentare e di coinvolgere l’uso e la creazione della base di dati
supportando il lettore con una guida alla lettura dei dati usando un linguaggio semplice e basilare
e non noioso. Infatti, si è cercato di seguire la traccia assegnata per la realizzazione del progetto
usando e aggiungendo nostre idee affinché diventasse un progetto completo arricchendolo inoltre
di link ipertestuali collegati al codice di realizzazione delle base di dati realizzata su DataGrip 20.1
connesso ad un DBMS ORACLE 18c Express Edition

# Simulatore della base di dati DB_COVID19
Si è realizzato una piccola base di dati su Oracle Live, caratterizzata da tutte le regole imposte sulla trattazione ma con indice di data ristretto per questioni di dimensione (dal 19 Marzo al 25 Marzo) seguendo le linee guida descritte nel Cap.5, Cap.6 e 7
Grazie ad Oracle Live Tutorial è possibile simulare il run delle DDL e delle DML definite su
questa trattazione.<br>
<a href="https://livesql.oracle.com/apex/livesql/file/tutorial_J6ZPO3GWTIOPQBJ48RHTTFJXB.html" target="blank" style="display:inline-block;border:18px solid rgb(194, 0, 0);border-radius:8px;padding:1px;background:linear-gradient(to left,rgb(194, 0, 0),rgb(194, 0, 0));color:rgb(255, 255, 255)" target="_blank"> Vai al Simulatore <br><img src="https://www.oracle.com/technetwork/database/live-sql-logo-2715850.png" alt="LiveSQL" ></a>


# Progetto realizzato per soli scopi dimostrativi ed educativi
La seguente trattazione è mirata alla realizzazione di un progetto di una Base di dati per l'esame di Basi di Dati all'Università degli Studi di Napoli Federico II seguendo una documentazione adeguata.

# Realizzato da
<a title="Antonio Romano" href="https://github.com/LaErre9" target="_blank" > Antonio Romano, </a><a title="Giuseppe Riccio" href="https://github.com/giuseppericcio" target="_blank" > Giuseppe Riccio.</a>
