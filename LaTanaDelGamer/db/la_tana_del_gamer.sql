DROP database IF EXISTS la_tana_del_gamer;
CREATE database la_tana_del_gamer;
USE la_tana_del_gamer;

DROP USER IF EXISTS 'lollorob'@'localhost';
CREATE USER 'lollorob'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL ON la_tana_del_gamer.* TO 'lollorob'@'localhost';

DROP TABLE IF EXISTS AccountUser;
create table AccountUser(
	username varchar(20) PRIMARY KEY NOT NULL,
    e_mail varchar(50) NOT NULL UNIQUE,
    passwd varchar(100) NOT NULL,
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
	nome varchar(70) NOT NULL,
    prezzo float NOT NULL,
    descrizione varchar(500) NOT NULL,
    datadiuscita date NOT NULL,
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

DROP TABLE IF EXISTS ItemOrdine;
create table ItemOrdine(
id_ordine int NOT NULL,
nome_prodotto varchar(70) NOT NULL,
prezzo_prodotto float NOT NULL,
descrizione_prodotto varchar(500) NOT NULL,
quantita_prodotto int NOT NULL,
FOREIGN KEY(id_ordine) REFERENCES Ordine(id_ordine) ON UPDATE cascade ON DELETE cascade
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

INSERT INTO AccountUser VALUES ("robbest","balestrieri00@gmail.com",SHA1("Napoli1926"),"Roberto","Balestrieri","2000-10-03",3,"via Nazionale",6,80050,"Pimonte","Napoli",0);
INSERT INTO AccountUser VALUES ("lollo","lollo00@gmail.com",SHA1("lollo1926"),"Lorenzo Lucio","Ruocco","2000-04-27",0,"via Roma",48,80054,"Gragnano","Napoli",1);
INSERT INTO AccountUser VALUES ("boomy07","pako@outlook.it",SHA1("ilovepizza"),"Pasquale","Sicignano","2000-05-07",2,"via San Sebastiano",5,80054,"Gragnano","Napoli",0);
INSERT INTO AccountUser VALUES ("mason9321","antonellostarax@libero.it",SHA1("codismylife"),"Antonello","Starace","1993-10-12",1,"via Vittorio Veneto",121,80321,"Fisciano","Salerno",0);

INSERT INTO Ordine VALUES (1,"2021-05-04","robbest","giorgiameloni@gmail.com",79.99,"Master Card","5345 6548 2564 5612");
INSERT INTO Ordine VALUES (2,"2021-11-12","robbest","luciano1293@gmail.com",69.99,"Visa","4931 6548 2564 5612");
INSERT INTO Ordine VALUES (3,"2021-05-08","robbest","luciano1293@gmail.com",149.98,"Visa","4931 6548 2564 5612");
INSERT INTO Ordine VALUES (4,"2020-04-01","boomy07","pasqualepako@hotmail.it",43.50,"Visa","4652 3211 9865 4875");
INSERT INTO Ordine VALUES (5,"2019-03-12","boomy07","giusysic@gmail.com",95.98,"Visa","4652 3211 9865 4875");
INSERT INTO Ordine VALUES (6,"2022-12-05","mason9321","antonellostarax@libero.it",29.99,"Visa","5432 2198 7652 4159");

INSERT INTO ItemOrdine VALUES (3,"Formula 1 2021",69.99,"F1 2021 e' il gioco F1 piu' completo di sempre, mettendo i giocatori saldamente al posto di guida mentre gareggiano contro i migliori piloti del mondo.",1);
INSERT INTO ItemOrdine VALUES (3,"Efootball Pes 2022",79.99,"Pes 2022 e' un videogioco di calcio, sviluppato da Konami e appartenente alla serie PES, uscito sul mercato nel 2020 in Nord America e in Europa, e in Giappone per le piattaforme PlayStation 4, Xbox One e Microsoft Windows. Si tratta del ventunesimo capitolo della serie.",1);
INSERT INTO ItemOrdine VALUES (2,"Formula 1 2021",69.99,"F1 2021 e' il gioco F1 piu' completo di sempre, mettendo i giocatori saldamente al posto di guida mentre gareggiano contro i migliori piloti del mondo.",1);
INSERT INTO ItemOrdine VALUES (1,"Efootball Pes 2022",79.99,"Pes 2022 e' un videogioco di calcio, sviluppato da Konami e appartenente alla serie PES, uscito sul mercato nel 2020 in Nord America e in Europa, e in Giappone per le piattaforme PlayStation 4, Xbox One e Microsoft Windows. Si tratta del ventunesimo capitolo della serie.",1);
INSERT INTO ItemOrdine VALUES (4,"Formula 1 2020",43.50,"F1 2020 e' il gioco F1 piu' completo di sempre, mettendo i giocatori saldamente al posto di guida mentre gareggiano contro i migliori piloti del mondo.",1);
INSERT INTO ItemOrdine VALUES (5,"MotoGP 2021",50.99,"MotoGP 2021 e' il gioco MotoGP piu' completo di sempre, gareggia contro i migliori piloti del mondo.",1);
INSERT INTO ItemOrdine VALUES (5,"Fifa 22",44.99,"Fifa 22 e' il gioco di calcio piu' completo di sempre",1);
INSERT INTO ItemOrdine VALUES (6,"COD : Modern Warfare",29.99,"Call of Duty : Modern Warfare e' il migliore sparatutto in prima persona",1);


INSERT INTO Categoria VALUES ("Azione","Videogiochi basati essenzialmente sull'azione, ricchi di combattimenti frenetici, sia con armi che senza.");
INSERT INTO Categoria VALUES ("Avventura","Videogiochi caratterizzati dall'esplorazione, risoluzione di enigmi, interazione con personaggi di gioco ed e' incentrato sulla narrazione piuttosto che sulle sfide");
INSERT INTO Categoria VALUES ("Sparatutto","Videogiochi in cui l'azione predominante e' sparare con diversi tipi di armi");
INSERT INTO Categoria VALUES ("RPG","Videogiochi dove i giocatori assumono il ruolo di uno o piu' personaggi e tramite la conversazione e lo scambio dialettico creano uno spazio immaginato, dove avvengono fatti ed eventi fittizi, in un'ambientazione narrativa che puo' ispirarsi a un romanzo, a un film o a un'altra fonte creativa, storica, realistica come nella vita reale o di pura invenzione.");
INSERT INTO Categoria VALUES ("Simulazione","Videogiochi in cui si cerca di simulare un aspetto della realta' e in genere richiede un misto di abilita', fortuna e strategia. Si cerca per quanto possibile di riprodurre l'esperienza reale come se il giocatore fosse veramente nella situazione rappresentata.");
INSERT INTO Categoria VALUES ("Indie","Videogiochi spesso sviluppati da una singola persona o da piccoli gruppi di programmatori, che lavorano senza l'ausilio economico di un editore.");
INSERT INTO Categoria VALUES ("Casual","Videogiochi caratterizzati da un regolamento molto semplice e dal minore impegno richiesto per il loro utilizzo.Non richiedono particolari abilita' o concentrazione.");
INSERT INTO Categoria VALUES ("MMO","Videogiochi di ruolo per computer o console che viengono svolti tramite Internet contemporaneamente da piu' persone reali. Migliaia di giocatori possono interagire interpretando personaggi che si evolvono insieme al mondo persistente che li circonda e in cui vivono.");
INSERT INTO Categoria VALUES ("Arcade","Videogiochi che generalmente si giocano in una postazione pubblica apposita a gettoni o a monete, costituita fisicamente da una macchina posta all'interno di un cabinato.Ora si diffusi anche sulle moderne console.");
INSERT INTO Categoria VALUES ("Sportivi","Videogiochi che simulano, in maniera piu' o meno realistica, discipline sportive sia di squadra che individuali: tra gli sport presenti vi sono baseball, calcio, automobilismo, motociclismo, football americano, pallacanestro, tennis, golf, hockey, lotta e pugilato.");
INSERT INTO Categoria VALUES ("Strategia","Videogiochi nei quali le capacita'  di prendere decisioni di un giocatore hanno un grande impatto nel determinare il risultato. Molti giochi includono questo elemento in grado minore o maggiore, rendendo difficile stabilire una demarcazione,pertanto piu' adeguato parlare del grado di strategia di un gioco, piuttosto che del fatto che sia o meno un gioco di strategia.");
INSERT INTO Categoria VALUES ("Corsa","Videogiochi in cui il giocatore deve pilotare un veicolo, ad esempio auto o moto, in un'ambientazione virtuale. I software cercano di rappresentare le varie gare di corse motoristiche piu' o meno fedelmente, spesso simulando con un motore fisico in modo molto complesso il comportamento reale di un veicolo in ogni situazione.");
INSERT INTO Categoria VALUES ("Picchiaduro","Videogiochi dove lo scopo principale e' quello di affrontare i nemici in incontri di lotta di vario genere, sia a mani nude che attraverso l'utilizzo di armi da mischia.");
INSERT INTO Categoria VALUES ("Gestionali","Videogiochi che simulano azioni della vita quotidiana e richiedono al giocatore il controllo completo su una certa attivita'.");


INSERT INTO Prodotto VALUES (1,"Call of Duty:Modern Warfare",19.90,"Call of Duty: Modern Warfare un videogioco sparatutto in prima persona, sviluppato da Infinity Ward per le piattaforme PlayStation 4, Xbox One e per PC. Il videogioco e' stato pubblicato il 25 ottobre 2019.","2019-10-25","Activision",6,"","Sparatutto");
INSERT INTO Prodotto VALUES (2,"Formula 1 2022",69.99,"F1 2021 e' il gioco F1 piu' completo di sempre, mettendo i giocatori saldamente al posto di guida mentre gareggiano contro i migliori piloti del mondo.","2022-06-28","Codemasters",5,"","Corsa");
INSERT INTO Prodotto VALUES (3,"Fifa 2023",79.99,"Fifa 21 e' il videogioco di calcio piu'famoso di sempre.Le sue modalita' online sono le piu' amate da tutta la community","2022-09-26","Electronic Arts",2,"","Sportivi");
INSERT INTO Prodotto VALUES (4,"Efootball Pes 2022",79.99,"Pes 2022 e' un videogioco di calcio, sviluppato da Konami e appartenente alla serie PES, uscito sul mercato nel 2020 in Nord America e in Europa, e in Giappone per le piattaforme PlayStation 4, Xbox One e Microsoft Windows. Si tratta del ventunesimo capitolo della serie.","2020-09-15","Konami",2,"","Sportivi"); 
INSERT INTO Prodotto VALUES (5,"The Witcher 3",15.27,"In The Witcher si indossano i panni di un esperto cacciatore di taglie, Geralt di Rivia, incaricato di trovare una ragazza oggetto di una profezia in un universo fantasy aperto ricco di citta' mercantili, isole abitate da pirati vichinghi, pericolosi valichi di montagna e caverne da esplorare.","2015-05-18","CD Project",5,"","RPG");
INSERT INTO Prodotto VALUES (6,"Farming Simulator 22",40.99,"Con Farming Simulator 22, inizia la tua impresa agricola in uno dei quattro dettagliati ambienti europei e americani, dove potrai cimentarti con le coltivazioni, la silvicoltura e l'allevamento. Sono a tua disposizione piu' di 500 macchinari e attrezzi autentici di oltre 100 celebri marchi da tutto il mondo.","2021-11-21","Giants Software",5,"","Simulazione");
INSERT INTO Prodotto VALUES (7,"The Chant",40.98,"Un gioco di azione/avventura horror in terza persona per giocatore singolo, ambientato in un'isola remota durante un ritiro spirituale.","2022-11-03","PrimeMatter",6,"","Azione");
INSERT INTO Prodotto VALUES (8,"Deathloop - Deluxe Edition",69.99,"Nei panni di Colt, i giocatori sono intrappolati in un loop temporale sulla misteriosa isola di Blackreef, condannata a rivivere lo stesso giorno in eterno. L' unica possibilita' di fuga e' spezzare il loop scoprendo utili informazioni e assassinando otto bersagli chiave prima che il giorno si azzeri.","2021-09-14","Bethesda Softworks",6,"","Avventura");
INSERT INTO Prodotto VALUES (9,"Life is Strange: True Colors",34.99,"Un nuovo capitolo della pluripremiata serie Life is Strange ha inizio, con una nuova protagonista e un elettrizzante mistero da risolvere!Alex Chen ha sempre nascosto la sua maledizione: l'abilita' sovrannaturale di percepire, assorbire e manipolare le emozioni piu' intense delle altre persone, che lei vede come delle aure colorate.","2021-09-10","SquareEnix",2,"","Azione");
INSERT INTO Prodotto VALUES (10,"Biomutant",39.98,"BIOMUTANT e' un RPG open-world post apocalittico, con tecniche uniche di arti marziali che uniscono combattimenti corpo a corpo ad armi da fuoco e abilita' da mutante.","2021-05-25","THQ Nordic",4,"","Azione");
INSERT INTO Prodotto VALUES (11,"MotoGP 21",19.99,"Proprio come i veri piloti, anche tu dovrai seguire le regole del campionato ufficiale, o ne affronterai le conseguenze tra le quali, per la prima volta, il Long Lap Penalty. Divertiti con l'esperienza di MotoGP piu' autentica che mai!","2021-04-22","Milestone",4,"","Corsa");
INSERT INTO Prodotto VALUES (12,"HITMAN 3",29.99,"HITMAN 3 e' la drammatica conclusione della trilogia del mondo degli assassini e porta i giocatori in giro per il mondo in un'avventura attraverso vaste locations sandbox.","2021-01-20","SquareEnix",8,"","Azione");
INSERT INTO Prodotto VALUES (13,"Expeditions Rome",29.99,"Il futuro di Roma e' nelle tue mani: come passerai alla storia? Impersona un giovane Legato, fuggito da Roma dopo l'assassinio del padre per mano di un avversario politico ignoto e costretto a unirsi a una campagna militare per sedare una rivolta greca.","2022-01-22","THQ Nordic",4,"","Strategia");
INSERT INTO Prodotto VALUES (14,"Outriders - Day One Edition",14.99,"Outriders e' uno shooter GdR cooperativo da 1 a 3 giocatori ambientato in un universo fantascientifico oscuro e spietato.","2021-04-01","Square Enix",4,"","Sparatutto");
INSERT INTO Prodotto VALUES (15,"Empire of Sin",15.00,"Empire of Sin ti trasporta nello spietato mondo del crimine della Chicago proibizionista degli anni '20. Stara' a te usare una combinazione di fascino e intimidazione per scalare le gerarchie della malavita","2020-03-21","Paradox Interactive",3,"","RPG");
INSERT INTO Prodotto VALUES (16,"Cyberpunk 2077",89.98,"Cyberpunk 2077 e' un'avventura a mondo aperto ambientata a Night City, una megalopoli ossessionata dal potere, dalla moda e dalle modifiche cibernetiche. Vestirai i panni di V, un mercenario fuorilegge alla ricerca di un impianto unico in grado di conferire l'immortalita'.","2020-12-10","CD Project",6,"","RPG");
INSERT INTO Prodotto VALUES (17,"Marvel's Avengers",15.99,"Riunisci la squadra degli eroi piu' potenti della Terra, scatena i tuoi poteri e vivi il tuo sogno di supereroe.Marvel Entertainment e Square Enix sono orgogliose di presentare Marvel's Avengers, un epico gioco di azione-avventura che combina una narrazione cinematografica con meccaniche di gioco in solitario e cooperativo.","2020-08-14","Square Enix",5,"","Azione");
INSERT INTO Prodotto VALUES (18,"Fallout 76 - Wastelanders",14.98,"In Fallout 76: Wastelanders, la Virginia Occidentale torna a popolarsi. Due fazioni sono in lizza per ottenere il controllo della Virginia Occidentale mentre ne scoprono i segreti. I coloni sono alla ricerca di una nuova casa, mentre i predoni vogliono sfruttarne gli sforzi.","2018-10-23","Bethesda Softworks",8,"","Avventura");
INSERT INTO Prodotto VALUES (19,"Desperados III",2.98,"Desperados III e' un moderno gioco tattico in tempo reale ambientato in uno spietato e selvaggio West.Trasforma una banda sgangherata in un efficiente gruppo di improbabili eroi ed eroine.","2020-06-16","THQ Nordic",2,"","Strategia");
INSERT INTO Prodotto VALUES (20,"Detroit Become Human",12.99,"E' l'anno 2038. Questa e' la storia di Kara.Scrivi il futuro.Immergiti in una visione inquieta della Detroit del futuro, dove umani e androidi conducono una fragile convivenza e le tue decisioni costruiscono la storia che ti circonda.","2019-12-10","Quantic Dreams",4,"","Azione");
INSERT INTO Prodotto VALUES (21,"Football Manager 2023",60.99,"In Football Manager 2023 non basta scegliere le tattiche e costruire una squadra. Devi affrontare sfide e farti largo per imporre il tuo stile.Guida la tua squadra con un livello di profondita' senza uguali. Scrivi la tua storia e diventa un allenatore di successo conquistando la fiducia e il rispetto dei tifosi e dominando sul campo.","2022-10-20","Sega",2,"","Simulazione");
INSERT INTO Prodotto VALUES (22,"Pro Cycling Manager 2022",34.99,"Con Pro Cycling Manager 2022 vestirai i panni di un direttore sportivo. Prendi tutte le decisioni necessarie per portare la tua squadra alla vetta: le tue responsabilita' includono il reclutamento, la pianificazione degli obiettivi e dei programmi di gara, la gestione degli sponsor, lo scouting dei futuri talenti, l'allenamento, la strategia di gara e molto altro.","2022-08-03","Nacon",1,"","Simulazione");
INSERT INTO Prodotto VALUES (23,"Beyond Two Souls",4.99,"Dai creatori del premiato Heavy Rain arriva un nuovo thriller psicologico interattivo con protagoniste le star di Hollywood Ellen Page e Willem Dafoe. Vesti i panni di Jodie Holmes, una ragazza con poteri soprannaturali derivati dal legame psichico con un'entita' invisibile.Vivi i momenti piu' profondi della vita di Jodie in un arco di tempo di 15 anni, dall'infanzia confusa fino all'ingresso nella CIA, e scopri chi e' realmente.","2013-10-08","Quantic Dreams",7,"","Azione");
INSERT INTO Prodotto VALUES (24,"The Surge",49.99,"Un evento catastrofico ti ha fatto perdere i sensi al primo giorno di lavoro... Ti sei svegliato in un avveniristico esoscheletro in un'area distrutta del complesso. Robot impazziti, una sadica intelligenza artificiale e colleghi psicopatici e dai poteri sovrumani ti aspettano per ucciderti.Sconfiggi nemici letali e imponenti boss in scontri corpo a corpo brutali e tesissimi.","2017-05-16","Focus Home Interactive",8,"","Azione");
INSERT INTO Prodotto VALUES (25,"Rime",39.98,"La storia di un ragazzo che usa l'intelligenza e l'ingegno per sopravvivere e infine fuggire da un'isola misteriosa e da una maledizione terribile.Una fine e un nuovo inizio.Un'isola misteriosa con un segreto sinistro e un'avventura open-world un po' diversa","2017-05-26","Greybox",4,"","Avventura");
INSERT INTO Prodotto VALUES (26,"Call of Duty: Black Ops III",49.96,"Diamo il benvenuto a Call of Duty: Black Ops 3, un oscuro e drammatico futuro dal quale emerge una nuova tipologia di soldati Black Ops e dove il confine tra la nostra umanita' e la nostra tecnologia si assottiglia sempre di piu', in un mondo dove la guerra si combatte con la corsa alla robotica militare piu' avanzata.","2015-11-05","Activision",3,"","Sparatutto");
INSERT INTO Prodotto VALUES (27,"DayZ",9.98,"DayZ e' un gioco di sopravvivenza estrema open world con una regola: sopravvivere a tutti i costi. Ma, data la miriade di minacce in agguato, e' piu' facile a dirsi che a farsi...","2013-12-16","Bohemia Interactive",5,"","Indie");
INSERT INTO Prodotto VALUES (28,"SpeedRunners",3.50,"SpeedRunners e' un gioco a piattaforme competitivo per 4 giocatori con rampini, potenziamenti, e ambienti interattivi. Corri, salta, oscilla intorno, spara razzi, usa i rampini sulla gente per buttarla fuori dallo schermo.","2013-01-02","TinyBuild",3,"","Casual");
INSERT INTO Prodotto VALUES (29,"World Of Warcraft: Dragonflight",49.99,"World of Warcraft e' l'MMO piu' giocato al mondo,World of Warcraft e' ambientato nell'universo di Warcraft, e riprende l'omonima serie di videogiochi strategici in tempo reale.","2022-11-28","Blizzard",2,"","MMO");
INSERT INTO Prodotto VALUES (30,"Duke Nukem Manhattan Project",12.06,"Manhattan Project ha come protagonista Duke Nukem, impegnato a combattere contro Mech Morphix, uno scienziato pazzo che sta usando una melma radioattiva chiamata G.L.O.P.P. (Gluon Liquid Omega-Phased Plasma) per mutare le creature terrestri in mostri mortali per conquistare Manhattan, a New York.","2002-05-21","GameDivision",4,"","Arcade");


INSERT INTO Recensione VALUES(1,"Giorgio",4,"A parte qualche bug,gioco molto divertente",1);
INSERT INTO Recensione VALUES(2,"Matteo",1,"GIOCO PESSIMO. SVILUPPATO SENZA VOGLIA,SOLDI BUTTATI",1);
INSERT INTO Recensione VALUES(3,"Roby",1,"Veramente mi domando se sia legale vendere un gioco simile. XD",2);
INSERT INTO Recensione VALUES(4,"Xanonimo",3,"Piccole incongruenze nella storia ma Gran Gioco",3);
INSERT INTO Recensione VALUES(5,"Bombarolo",3,"Consigliato se non pretendete troppo",3);
INSERT INTO Recensione VALUES(6,"Lupogamer",2,"Trovo questo gioco veramente fatto male...",4);
INSERT INTO Recensione VALUES(7,"Matty00",2,"Bisognerebbe migliorare molto il multiplayer",4);
INSERT INTO Recensione VALUES(8,"Carseb",4,"Nonostante la storia non mi piaccia mi ci sono Chiuso...",5);
INSERT INTO Recensione VALUES(9,"Nonsonodread",4,"Ottimo per chi vuole nerdare maledettamente",5);
INSERT INTO Recensione VALUES(10,"Demon",4,"Amo questo gioco.. Aspetto il sequel con ansia",5);
INSERT INTO Recensione VALUES(11,"Vampirix",5,"Finito in due giorni... non so che giorno e'...",5);
INSERT INTO Recensione VALUES(12,"Mattogig",5,"Ci sto passando ore ed ore... PERFETTO",6);
INSERT INTO Recensione VALUES(13,"Ilsupremo",5,"AMO QUESTO TIPO DI GIOCHI",6);
INSERT INTO Recensione VALUES(14,"Filippo",1,"Gioco ottimizzato con i piedi... Con una RTX3070 laggo tantissimo",7);
INSERT INTO Recensione VALUES(15,"Marco",1,"Esigo il rimborsoooo",7);
INSERT INTO Recensione VALUES(16,"Creeper",1,"Fa veramente penaaa... toglietelo dalla vendita",7);
INSERT INTO Recensione VALUES(17,"Pycho",2,"Basterebbero alcune migliorie e sarebbe un gran gioco.",8);
INSERT INTO Recensione VALUES(18,"Lamandowsky",2,"Troppo Hype... mi aspettavo molto meglio",8);
INSERT INTO Recensione VALUES(19,"Lebon",3,"Ci sono molti bug ma a questo titolo gli perdono tutto",8);
INSERT INTO Recensione VALUES(20,"Mastino22",3,"Videogioco mediocre",9);
INSERT INTO Recensione VALUES(21,"Ilcecchino",1,"Arrestate la casa produttriceeee",9);
INSERT INTO Recensione VALUES(22,"Sparalollo",1,"Un vero e proprio furto di soldi",9);
INSERT INTO Recensione VALUES(23,"Surrywastaken",3,"Nulla da dire.... tutto sommato bel gioco",10);
INSERT INTO Recensione VALUES(24,"Masterchief",5,"Mi sono letteralmente innamoratoo",10);
INSERT INTO Recensione VALUES(25,"Ronin",2,"Troppe cose che non vannoo... Necessita di una patch",11);
INSERT INTO Recensione VALUES(26,"Decay",2,"Sviluppato veramente maleeee",11);
INSERT INTO Recensione VALUES(27,"Mietitore",4,"Spettacoloo... alcuni bug si possono perdonare",12);
INSERT INTO Recensione VALUES(28,"Gianmarco",4,"Compratelo subitoo.. non ve ne pentirete",12);
INSERT INTO Recensione VALUES(29,"Domenico",5,"Ho dimenticato perche' sono qui.. torno a giocareee",12);
INSERT INTO Recensione VALUES(30,"MikeKiller",3,"Sto imparando ad apprezzarlo nonostante i problemi che ha.",1);
INSERT INTO Recensione VALUES(31,"Masterbomb",5,"Nulla da direeee... Chapeau!",13);
INSERT INTO Recensione VALUES(32,"HarryDotter",4,"E' questo di cui abbiamo bisogno",14);
INSERT INTO Recensione VALUES(33,"CerealKiller",4,"Apettavo solo questo titolo",15);
INSERT INTO Recensione VALUES(34,"KillMeAgain",5,"Poi i miei si lamentano che sono nerd",16);
INSERT INTO Recensione VALUES(35,"Smufus",5,"Non riesco a staccarmi dalla tv Aiutooo.. Anzi no non aiutatemi",17);
INSERT INTO Recensione VALUES(36,"Brocode",1,"Per favore.. Delete subito",18);
INSERT INTO Recensione VALUES(37,"DonkeyBong",1,"Toglietelo dal commercio",19);
INSERT INTO Recensione VALUES(38,"BreadPitt",2,"Male maleee",20);
INSERT INTO Recensione VALUES(39,"HarryPoster",2,"Non so cosa dire. 2 stelle sulla fiducia",21);
INSERT INTO Recensione VALUES(40,"IWinEveryTime",3,"Poco impegno ma le idee ci sono",22);
INSERT INTO Recensione VALUES(41,"SealTeamThiccc",3,"I programmatori hanno molto da lavoraree",22);
INSERT INTO Recensione VALUES(42,"Ultre",4,"Molto bello ma ci sono alcune cose che non vanno",23);
INSERT INTO Recensione VALUES(43,"Minimalism",4,"Vi benedico ogni singolo euro speso",24);
INSERT INTO Recensione VALUES(44,"Tonio",5,"Che lavoro che avete fattooooo",25);
INSERT INTO Recensione VALUES(45,"MarcoTognonee",5,"Aspettare 2 anni ne e' valsa la pena",26);
INSERT INTO Recensione VALUES(46,"DizzyFrizzy",1,"Mi hanno regalato questo titolo.. Vergognoso",27);
INSERT INTO Recensione VALUES(47,"Halzenut",1,"Avevo speranzeee ma nienteee",28);
INSERT INTO Recensione VALUES(48,"Nutellino",2,"Come buttare soldi?? comprate sto gioco",29);
INSERT INTO Recensione VALUES(49,"Marcellino",2,"Non so veramente da dove iniziare... parlano le stelle",29);
INSERT INTO Recensione VALUES(50,"MikeKiller",3,"Sto imparando ad apprezzarlo nonostante i problemi che ha.",30);



