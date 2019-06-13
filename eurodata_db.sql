-- Die Datenbank "eurodata"
-- in mysql einlesen mit "mysql -u root -p < eurodata_db.sql"


CREATE database eurodata;
use eurodata;

CREATE TABLE IF NOT EXISTS `abteilung` (
  `ID` smallint(2) unsigned zerofill NOT NULL default '00',
  `Bezeichnung` varchar(30) NOT NULL default '',
  `Etat` double NOT NULL default '0',
  `A_Leiter` smallint(4) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `A_Leiter` (`A_Leiter`)
) ENGINE=MyISAM;

-- 
-- Daten für Tabelle `abteilung`
-- 

INSERT INTO `abteilung` (`ID`, `Bezeichnung`, `Etat`, `A_Leiter`) VALUES (01, 'Rechnungswesen', 4000, 611);
INSERT INTO `abteilung` (`ID`, `Bezeichnung`, `Etat`, `A_Leiter`) VALUES (02, 'Projektabwicklung', 20000, 809);
INSERT INTO `abteilung` (`ID`, `Bezeichnung`, `Etat`, `A_Leiter`) VALUES (03, 'Personalwesen', 3000, 710);
INSERT INTO `abteilung` (`ID`, `Bezeichnung`, `Etat`, `A_Leiter`) VALUES (04, 'Kindergarten', 1550, 105);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `kind`
-- 

CREATE TABLE IF NOT EXISTS `kind` (
  `MNr` smallint(4) NOT NULL default '0',
  `Vorname` varchar(30) NOT NULL default '',
  `GebDatum` date ,
  KEY `MNr` (`MNr`),
  KEY `Vorname` (`Vorname`)
) ENGINE=MyISAM;

-- 
-- Daten für Tabelle `kind`
-- 

INSERT INTO `kind` (`MNr`, `Vorname`, `GebDatum`) VALUES (100, 'Pia', '2001-08-05');
INSERT INTO `kind` (`MNr`, `Vorname`, `GebDatum`) VALUES (101, 'Benedikt', '2000-07-20');
INSERT INTO `kind` (`MNr`, `Vorname`, `GebDatum`) VALUES (101, 'Heidi', '1998-02-02');
INSERT INTO `kind` (`MNr`, `Vorname`, `GebDatum`) VALUES (101, 'Martin', '1999-07-20');
INSERT INTO `kind` (`MNr`, `Vorname`, `GebDatum`) VALUES (207, 'Gudrun', '1998-06-04');
INSERT INTO `kind` (`MNr`, `Vorname`, `GebDatum`) VALUES (701, 'Patrick', '2001-09-01');
INSERT INTO `kind` (`MNr`, `Vorname`, `GebDatum`) VALUES (711, 'Daniela', '2000-07-17');
INSERT INTO `kind` (`MNr`, `Vorname`, `GebDatum`) VALUES (711, 'Sarah', '2000-08-05');
INSERT INTO `kind` (`MNr`, `Vorname`, `GebDatum`) VALUES (711, 'Toni', '2000-08-05');
INSERT INTO `kind` (`MNr`, `Vorname`, `GebDatum`) VALUES (805, 'Daniela', '2001-05-05');
INSERT INTO `kind` (`MNr`, `Vorname`, `GebDatum`) VALUES (805, 'Tobias', '1999-07-06');
INSERT INTO `kind` (`MNr`, `Vorname`, `GebDatum`) VALUES (809, 'Kathrin', '1998-03-04');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `mitarbeiter`
-- 

CREATE TABLE IF NOT EXISTS `mitarbeiter` (
  `MNr` smallint(4) unsigned zerofill NOT NULL default '0000',
  `Name` varchar(30) NOT NULL default '',
  `Vorname` varchar(30) NOT NULL default '',
  `Strasse` varchar(30) NOT NULL default '',
  `PLZ` varchar(5) NOT NULL default '',
  `Ort` varchar(30) NOT NULL default '',
  `Telefon` varchar(20) default NULL,
  `Geschlecht` enum('m','w') NOT NULL default 'm',
  `eingestellt` date ,
  `KFZ1` varchar(10) NOT NULL default '',
  `KFZ2` varchar(10) NOT NULL default '',
  `Abteilung` smallint(2) unsigned zerofill NOT NULL default '00',
  PRIMARY KEY  (`MNr`),
  KEY `Abteilung` (`Abteilung`),
  KEY `Name` (`Name`)
) ENGINE=MyISAM;

-- 
-- RELATIONEN DER TABELLE `mitarbeiter`:
--   `Abteilung`
--       `abteilung` -> `ID`
-- 

-- 
-- Daten für Tabelle `mitarbeiter`
-- 

INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0100, 'Meier', 'Inge', 'Amselweg 11', '53101', 'Bonn', '0228/124578', 'w', '1995-01-01', 'BN-X 123', 'BN-A 911', 02);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0101, 'Schneider', 'Ute', 'Hauptstr. 17', '50012', 'Köln', '0221/215211', 'w', '1995-01-01', 'K-OK 777', '', 03);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0105, 'Berg', 'Anton', 'Am Funkturm 156', '65203', 'Wiesbaden', '0611/928792', 'm', '1995-09-01', 'WI-AK 421', '', 04);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0108, 'Wasser', 'Ute', 'Weststr. 20', '52074', 'Aachen', '0241/875554', 'w', '1995-12-01', 'AC-UW 222', 'AW-UW 333', 02);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0200, 'Huber', 'Sepp', 'Bodenseestr. 123', '81243', 'München', '089/8744397', 'm', '1996-02-01', 'M-A 6666', 'M-A 7777', 02);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0207, 'Schmitz', 'Hans', 'Siegburger Str. 51', '50679', 'Köln', '0221/814447', 'm', '1996-05-01', 'K-XR 333', '', 03);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0209, 'Schmidt', 'Jürgen', 'Osdorfer Weg 7', '22607', 'Hamburg', '040/899899', 'm', '1996-05-01', 'HH-H 111', '', 01);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0611, 'Kammer', 'Ulrike', 'Hauptstr. 171', '52146', 'Würselen', '02405/712217', 'w', '1998-06-01', '', '', 00);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0700, 'Klein', 'Kurth', 'Jollystr. 99', '76137', 'Karlsruhe', '0721/9812124', 'm', '1996-09-15', 'KA-RU 55', 'KA-MK 917', 02);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0701, 'Huber', 'Anke', 'Gabelsberger Str. 70', '86199', 'Augsburg', '0821/98666', 'w', '1996-12-01', 'A-VV 454', 'A-XX 123', 02);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0710, 'Schmidt', 'Beate', 'Klosterstr. 1', '40211', 'Düsseldorf', '0211/363636', 'w', '1997-04-01', 'D-K6767', 'D-K 6666', 02);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0711, 'Bauer', 'Klaus', 'Spielhagenstr. 113', '30107', 'Hannover', '0511/833883', 'm', '1997-04-01', 'H-RR 309', 'H-ZU 777', 02);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0800, 'Meier', 'Anton', 'Tiroler Weg 32', '79111', 'Freiburg', '0761/443444', 'm', '1997-06-01', 'FR-GG 373', '', 02);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0802, 'Meier', 'Doris', 'Hauptstr.32', '98528', 'Suhl', '03681/440044', 'w', '1998-01-01', 'SUIH-L 111', '', 02);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0803, 'Schmidt', 'Barbara', 'Rößlerstr. 33', '09120', 'Chemnitz', '0371/525212', 'w', '1998-01-01', 'CH-GE 919', '', 01);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0804, 'Walczak', 'Hildegard', 'Altleubnitz 21', '01219', 'Dresden', '0351/788285', 'w', '1998-05-15', 'DR-DN 5421', '', 02);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0805, 'Schmitz', 'Klaus', 'Vogelsanger Str.77', '50666', 'Köln', '0221/561112', 'm', '1998-06-01', 'K-Q 3456', '', 02);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0806, 'Lausen', 'Werner', 'Münstereifeler Str. 22', '53879', 'Euskirchen', '02251/868657', 'm', '1998-06-01', 'EU-R 9999', '', 03);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0807, 'Görner', 'Heidrun', 'Waldstr. 97', '51145', 'Köln-Porz', '02203/912778', 'w', '1998-06-01', 'K-P 5555', 'K-P 6666', 02);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0809, 'Preuß', 'Karl', 'Peter-Paul-Str. 67', '52249', 'Eschweiler', '02403/151515', 'm', '1998-06-01', '', '', 01);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0810, 'Messner', 'Bärbel', 'Levenstr. 88', '50259', 'Pulheim', '02238/980021', 'w', '1998-06-01', 'K-ZT 850', '', 01);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0788, 'Schmitt', 'Hannelore', 'Im Roßberg 123', '53505', 'Altenahr', '02643/996633', 'w', '1985-06-18', 'AW-BA 13', 'AW-BB 13', 03);
INSERT INTO `mitarbeiter` (`MNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `Telefon`, `Geschlecht`, `eingestellt`, `KFZ1`, `KFZ2`, `Abteilung`) VALUES (0777, 'Schmied', 'Olga', 'Ahrallee 77', '53474', 'Bad Neuenahr - Ahrweiler', '02641/909090', 'w', '1986-09-17', 'AW-XY 34', '', 02);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `projekt`
-- 

CREATE TABLE IF NOT EXISTS `projekt` (
  `ProjNr` int(2) unsigned zerofill NOT NULL default '00',
  `Bezeichnung` varchar(50) NOT NULL default '',
  `Auftragswert` double NOT NULL default '0',
  `bezahlt` double default NULL,
  `Beginn` date ,
  `Ende` date default NULL,
  `Storno` enum('0','1') NOT NULL default '0',
  `Leiter` int(4) NOT NULL default '0',
  PRIMARY KEY  (`ProjNr`),
  KEY `Leiter` (`Leiter`)
) ENGINE=MyISAM;

-- 
-- RELATIONEN DER TABELLE `projekt`:
--   `Leiter`
--       `mitarbeiter` -> `MNr`
-- 

-- 
-- Daten für Tabelle `projekt`
-- 

INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES (77, 'Umzug Stein AG', 50000, 12000, '2006-06-30', NULL, '0', 100);
INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES (78, 'Einrichtung Apache-WEB-Server, Moberg GmbH', 8000, 0, '2006-07-01', '2006-07-15', '0', 810);
INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES (79, 'Aufbau Intranet, Druckerei Wolff', 35000, 7500, '2006-09-01', NULL, '0', 200);
INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES (80, 'Vernetzung, Bau AG', 60000, NULL, '1998-07-01', '2006-07-31', '1', 800);
INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES (81, 'Vernetzung, Großmann', 24000, 5000, '2006-07-05', NULL, '0', 100);
INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES (82, 'DV-Labor, BBS III', 40000, 0, '2006-08-01', NULL, '0', 101);
INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES (84, 'Umzug Stadtanzeiger', 180000, 30000, '2006-08-01', NULL, '0', 805);
INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES (85, 'Umrüstung Neumann OHG', 12000, NULL, '2006-07-01', NULL, '1', 700);
INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES (86, 'Linux-Server, Stadtverwaltung Brühl', 15000, NULL, '2006-08-10', NULL, '0', 809);
INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES (87, 'Win-Server, Lacke Hansen', 25000, NULL, '2006-06-01', '2006-06-10', '1', 803);
INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES (88, 'Adabas-SQL-Server, MTech', 20000, 3000, '2006-09-01', NULL, '0', 804);
INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES (89, 'Office-Schulung, BATIX', 6000, NULL, '2006-10-01', NULL, '0', 803);
INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES (90, 'Umstellung Windows- auf Linux-Server, Zuckmann', 9500, NULL, '2006-10-08', NULL, '0', 200);
INSERT INTO `projekt` (`ProjNr`, `Bezeichnung`, `Auftragswert`, `bezahlt`, `Beginn`, `Ende`, `Storno`, `Leiter`) VALUES (91, 'Schulung, Naumann & Co.', 5000, NULL, '2006-10-15', NULL, '0', 810);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `projektmitarbeiter`
-- 

CREATE TABLE IF NOT EXISTS `projektmitarbeiter` (
  `ProjNr` int(2) unsigned zerofill NOT NULL default '00',
  `MNr` smallint(4) unsigned zerofill NOT NULL default '0000',
  `Zeitanteil` tinyint(3) default NULL,
  KEY `ProjNr` (`ProjNr`),
  KEY `MNr` (`MNr`)
) ENGINE=MyISAM;

-- 
-- RELATIONEN DER TABELLE `projektmitarbeiter`:
--   `MNr`
--       `mitarbeiter` -> `MNr`
--   `ProjNr`
--       `projekt` -> `ProjNr`
-- 

-- 
-- Daten für Tabelle `projektmitarbeiter`
-- 

INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (77, 0100, 10);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (77, 0701, 5);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (77, 0805, 20);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (78, 0804, 6);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (78, 0810, 8);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (79, 0200, 10);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (79, 0701, 30);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (80, 0105, 20);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (80, 0108, 5);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (80, 0711, 3);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (80, 0800, 5);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (80, 0803, 5);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (80, 0804, 5);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (81, 0100, 3);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (81, 0806, 10);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (81, 0807, 10);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (81, 0809, 20);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (82, 0101, 5);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (82, 0207, 30);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (82, 0710, 5);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (84, 0108, 5);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (84, 0700, 3);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (84, 0710, 5);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (85, 0700, 35);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (86, 0804, 6);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (86, 0809, 10);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (87, 0803, 10);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (88, 0101, 3);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (88, 0711, 5);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (88, 0804, 15);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (89, 0803, 20);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (89, 0807, 10);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (90, 0200, 5);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (90, 0802, 25);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (91, 0108, 8);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (91, 0800, 12);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (91, 0810, 5);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (89, 0803, 20);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (89, 0807, 10);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (90, 0200, 5);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (90, 0802, 25);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (91, 0108, 8);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (91, 0800, 12);
INSERT INTO `projektmitarbeiter` (`ProjNr`, `MNr`, `Zeitanteil`) VALUES (91, 0810, 5);
