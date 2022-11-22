DROP database IF EXISTS la_tana_del_gamer;
CREATE database la_tana_del_gamer;
USE la_tana_del_gamer;

DROP USER IF EXISTS 'lollorob'@'localhost';
CREATE USER 'lollorob'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL ON la_tana_del_gamer.* TO 'lollorob'@'localhost';

DROP TABLE IF EXISTS AccountUser;
create table AccountUser(
	username varchar(12) PRIMARY KEY NOT NULL,
    e_mail varchar(50) NOT NULL UNIQUE,
    passwd varchar(200) NOT NULL,
    nome varchar(50) NOT NULL,
    cognome varchar(50) NOT NULL,
    datadinascita date NOT NULL,
    n_ordini int NOT NULL,
    via varchar(50) NOT NULL,
    numero int NOT NULL,
    cap long NOT NULL,
    citta varchar(50) NOT NULL,
    provincia varchar(50) NOT NULL,
    is_admin boolean NOT NULL
);

DROP TABLE IF EXISTS Categoria;
create table Categoria
(
	nome varchar(30) NOT NULL,
    didascalia varchar(500) NOT NULL,
    PRIMARY KEY(nome)
);


DROP TABLE IF EXISTS Prodotto;
create table Prodotto
(
	id_prodotto int NOT NULL AUTO_INCREMENT,
	nome varchar(100) NOT NULL,
    prezzo float NOT NULL,
    descrizione varchar(500) NOT NULL,
    casaproduttrice varchar(50) NOT NULL,
    quantita int not NULL,
    copertina mediumblob NOT NULL,
    nome_categoria varchar(50) NOT NULL,
    PRIMARY KEY(id_prodotto),
    FOREIGN KEY(nome_categoria) REFERENCES Categoria(nome) ON UPDATE cascade ON DELETE cascade
);


DROP TABLE IF EXISTS Ordine;
create table Ordine(
	id_ordine int  NOT NULL AUTO_INCREMENT,
    data_ordine date NOT NULL,
    username varchar(20) NOT NULL,
    email_spedizione varchar(50) NOT NULL,
    importo float NOT NULL,
    tipo_pagamento varchar(50) not NULL,
    metodo_pagamento varchar(50) not NULL,
    PRIMARY KEY(id_ordine),
    FOREIGN KEY (username) REFERENCES AccountUser(username) ON UPDATE cascade ON DELETE cascade
);


DROP TABLE IF EXISTS Incluso;
create table Incluso
(
	id_ordine int NOT NULL,
    id_prodotto int NOT NULL,
    quantita int NOT NULL,
    PRIMARY KEY(id_ordine,id_prodotto),
    FOREIGN KEY(id_ordine) REFERENCES Ordine(id_ordine) ON UPDATE cascade ON DELETE cascade,
	FOREIGN KEY(id_prodotto) REFERENCES Prodotto(id_prodotto) ON UPDATE cascade ON DELETE cascade
);


DROP TABLE IF EXISTS Recensione;
create table Recensione
(
	id_recensione int NOT NULL AUTO_INCREMENT,
    nome varchar(20) NOT NULL,
    valutazione int NOT NULL,
    descrizione varchar(500),
    id_prodotto int NOT NULL,
    PRIMARY KEY(id_recensione),
    FOREIGN KEY(id_prodotto) REFERENCES Prodotto(id_prodotto) ON UPDATE cascade ON DELETE cascade
);

DROP TABLE IF EXISTS Galleria;
create table Galleria
(
	id_media int NOT NULL AUTO_INCREMENT,
    immagine mediumblob NOT NULL,
    video longblob NOT NULL,
    id_prodotto int NOT NULL,
    PRIMARY KEY(id_media),
    FOREIGN KEY(id_prodotto) REFERENCES Prodotto(id_prodotto) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO AccountUser VALUES ("robbest","balestrieri00@gmail.com",SHA1("Napoli1926"),"Roberto","Balestrieri","2000-10-03",2,"via Nazionale",6,80050,"Pimonte","Napoli",1);
INSERT INTO AccountUser VALUES ("lollo","lollo00@gmail.com",SHA1("lollo1926"),"Lorenzo Lucio","Ruocco","2000-04-27",0,"via Roma",48,80054,"Gragnano","Napoli",1);
INSERT INTO AccountUser VALUES ("boomy07","pako@outlook.it",SHA1("ilovepizza"),"Pasquale","Sicignano","2000-05-07",0,"via San Sebastiano",5,80054,"Gragnano","Napoli",0);
INSERT INTO AccountUser VALUES ("mason9321","antonellostarax@libero.it",SHA1("codismylife"),"Antonello","Starace","1993-10-12",0,"via Vittorio Veneto",121,80321,"Fisciano","Salerno",0);

INSERT INTO Ordine VALUES (1,"2021-05-04","robbest","giorgiameloni@gmail.com",198.46,"Master Card","5345 6548 2564 5612");
INSERT INTO Ordine VALUES (2,"2021-11-12","robbest","luciano1293@gmail.com",10.98,"Visa","4931 6548 2564 5612");



INSERT INTO Categoria VALUES ("Azione","Videogiochi basati essenzialmente sull'azione, ricchi di combattimenti frenetici, sia con armi che senza.");
INSERT INTO Categoria VALUES ("Avventura","Videogiochi caratterizzati dall'esplorazione, risoluzione di enigmi, interazione con personaggi di gioco ed e' incentrato sulla narrazione piuttosto che sulle sfide");
INSERT INTO Categoria VALUES ("Sparatutto","Videogiochi in cui l'azione predominante e' sparare con diversi tipi di armi");
INSERT INTO Categoria VALUES ("RPG","Videogiochi dove i giocatori assumono il ruolo di uno o piu' personaggi e tramite la conversazione e lo scambio dialettico creano uno spazio immaginato, dove avvengono fatti ed eventi fittizi, in un'ambientazione narrativa che puo' ispirarsi a un romanzo, a un film o a un'altra fonte creativa, storica, realistica come nella vita reale o di pura invenzione.");
INSERT INTO Categoria VALUES ("Simulazione","Videogiochi in cui si cerca di simulare un aspetto della realta'  e in genere richiede un misto di abilita' , fortuna e strategia. Si cerca per quanto possibile di riprodurre l'esperienza reale come se il giocatore fosse veramente nella situazione rappresentata");
INSERT INTO Categoria VALUES ("Indie","Videogiochi spesso sviluppati da una singola persona o da piccoli gruppi di programmatori, che lavorano senza l'ausilio economico di un editore.");
INSERT INTO Categoria VALUES ("Casual","Videogiochi caratterizzati da un regolamento molto semplice e dal minore impegno richiesto per il loro utilizzo.Non richiedono particolari abilita'  o concentrazione.");
INSERT INTO Categoria VALUES ("MMO","Videogiochi di ruolo per computer o console che viengono svolti tramite Internet contemporaneamente da piu' persone reali.Migliaia di giocatori possono interagire interpretando personaggi che si evolvono insieme al mondo persistente che li circonda e in cui vivono.");
INSERT INTO Categoria VALUES ("Arcade","Videogiochi che generalmente si giocano in una postazione pubblica apposita a gettoni o a monete, costituita fisicamente da una macchina posta all'interno di un cabinato.Ora si diffusi anche sulle moderne console.");
INSERT INTO Categoria VALUES ("Sportivi","Videogiochi che simulano, in maniera piu' o meno realistica, discipline sportive sia di squadra che individuali: tra gli sport piu' presenti vi sono baseball, calcio, automobilismo, motociclismo, football americano, pallacanestro, tennis, golf, hockey, lotta e pugilato.");
INSERT INTO Categoria VALUES ("Strategia","Videogiochi nei quali le capacita'  di prendere decisioni di un giocatore hanno un grande impatto nel determinare il risultato. Molti giochi includono questo elemento in grado minore o maggiore, rendendo difficile stabilire una demarcazione, è pertanto piu' adeguato parlare del grado di strategia di un gioco, piuttosto che del fatto che sia o meno un gioco di strategia. ");
INSERT INTO Categoria VALUES ("Corsa","Videogiochi in cui il giocatore deve pilotare un veicolo, ad esempio auto o moto, in un'ambientazione virtuale. I software cercano di rappresentare le varie gare di corse motoristiche piu' o meno fedelmente, spesso simulando con un motore fisico in modo molto complesso il comportamento reale di un veicolo in ogni situazione.");
INSERT INTO Categoria VALUES ("Picchiaduro","Videogiochi dove lo scopo principale e' quello di affrontare i nemici in incontri di lotta di vario genere, sia a mani nude che attraverso l'utilizzo di armi da mischia.  ");
INSERT INTO Categoria VALUES ("Gestionali","Videogiochi che simulano azioni della vita quotidiana e richiedono al giocatore il controllo completo su una certa attivita' . ");


INSERT INTO Prodotto VALUES (1,"Call of Duty:Modern Warfare",19.90,"Call of Duty: Modern Warfare e' un videogioco sparatutto in prima persona, sviluppato da Infinity Ward per le piattaforme PlayStation 4, Xbox One e per PC. Il videogioco e' stato pubblicato il 25 ottobre 2019.","Activision",6,"","Sparatutto");
INSERT INTO Prodotto VALUES (2,"Formula 1 2021",69.99,"F1 2021 e' il gioco F1 piu' completo di sempre, mettendo i giocatori saldamente al posto di guida mentre gareggiano contro i migliori piloti del mondo.","Codemasters",5,"","Corsa");
INSERT INTO Prodotto VALUES (3,"Fifa 2021",79.99,"Fifa 21 e' il videogioco di calcio piu'famoso di sempre.Le sue modalita' online sono le piu' amate da tutta la community","Electronic Arts",2,"","Sportivi");
INSERT INTO Prodotto VALUES (4,"Efootball Pes 2022",79.99,"Pes 2022 e' un videogioco di calcio, sviluppato da Konami e appartenente alla serie PES, uscito sul mercato nel 2020 in Nord America e in Europa, e in Giappone per le piattaforme PlayStation 4, Xbox One e Microsoft Windows. Si tratta del ventunesimo capitolo della serie.","Konami",2,"","Sportivi"); 


INSERT INTO Incluso VALUES (1,3,2);
INSERT INTO Incluso VALUES (1,2,1);
INSERT INTO Incluso VALUES (2,4,3);

INSERT INTO Recensione VALUES(1,"Giorgio",4,"A parte qualche bug,gioco molto divertente",1);
INSERT INTO Recensione VALUES(2,"Matteo",1,"GIOCO PESSIMO. SVILUPPATO SENZA VOGLIA,SOLDI BUTTATI",1);
INSERT INTO Recensione VALUES(3,"Roby",1,"",2);