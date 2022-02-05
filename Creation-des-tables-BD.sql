CREATE TABLE Acteur  (IdActeur DECIMAL(5),
		       NomAC VARCHAR (20),
                       PrenomAC VARCHAR (15),
                       nom_artistiqueAC VARCHAR (15),
		       date_naissanceAC date ,
		       PRIMARY KEY (IdActeur));
-----------------------------------------------------------
CREATE TABLE Musicien (IdMusicien DECIMAL(5),
		       NomM VARCHAR (20),
                       PrenomM VARCHAR (15),
                       nom_artistiqueM VARCHAR (15),
		       date_naissanceM date ,
                       CodeOA DECIMAL(5),
		       PRIMARY KEY (IdMusicien),
                       FOREIGN KEY (CodeOA) REFERENCES Album (CodeOA));
-----------------------------------------------------------
CREATE TABLE Auteur  (IdAuteur DECIMAL(5),
		       NomA VARCHAR (20),
                       PrenomA VARCHAR (15),
                       nom_artistiqueAU VARCHAR (15),
		       date_naissanceAU date ,
                       CodeOL DECIMAL(5),
		       PRIMARY KEY (IdAuteur),
                       FOREIGN KEY (CodeOL) REFERENCES Livre (CodeOL));

-----------------------------------------------------------	
CREATE TABLE realisateur (Idrealisateur DECIMAL(5),
		       NomR VARCHAR (20),
                       PrenomR VARCHAR (15),
                       nom_artistiqueR VARCHAR (15),
		       date_naissanceR date ,
		       CodeOF DECIMAL(5), 
                       PRIMARY KEY (Idrealisateur),
                       FOREIGN KEY (CodeOF) REFERENCES Film (CodeOF));

-----------------------------------------------------------			   
CREATE TABLE Film  (CodeOF DECIMAL(5),
                    TitreF    VARCHAR (30),
                    IdActeur DECIMAL(5),
                    dateSortieF date ,
                    studioF VARCHAR (20),
	            PRIMARY KEY (CodeOF));
	            
-----------------------------------------------------------
CREATE TABLE Livre  (CodeOL DECIMAL(5),
                     TitreL    VARCHAR (30),
                     dateEdition date ,
                     NbPages DECIMAL(5),
	             PRIMARY KEY (CodeOL));
	            
-----------------------------------------------------------
CREATE TABLE Album  (CodeOA DECIMAL(5)NOT NULL,
                     TitreA    VARCHAR (30),
                     dateSortieA date ,
                     studioA VARCHAR (20),
	             PRIMARY KEY (CodeOA));
	            
-----------------------------------------------------------
CREATE TABLE ActFilm  ( Role  VARCHAR(20) NOT NULL, 
                        CodeOF  DECIMAL(5)NOT NULL,
                        IdActeur DECIMAL(5),
			PRIMARY KEY (CodeOF, IdActeur),
			FOREIGN KEY (CodeOF) REFERENCES Film(CodeOF),
			FOREIGN KEY (IdActeur) REFERENCES Acteur(IdActeur)
			);
--------------------------------------------------------------
CREATE TABLE LivAuteur  (CodeOL  DECIMAL(5)NOT NULL,
                         IdAuteur DECIMAL(5),
			 PRIMARY KEY (CodeOL, IdAuteur),
			 FOREIGN KEY (CodeOL) REFERENCES Livre(CodeOL),
			 FOREIGN KEY (IdAuteur) REFERENCES Auteur(IdAuteur)
			);
--------------------------------------------------------------
CREATE TABLE LivFilm  ( 
                        CodeOF  DECIMAL(5)NOT NULL,
                        CodeOL  DECIMAL(5)NOT NULL,                      
			PRIMARY KEY (CodeOF, CodeOL),
			FOREIGN KEY (CodeOF) REFERENCES Film(CodeOF),
			FOREIGN KEY (CodeOL) REFERENCES Livre(CodeOL)
			);
--------------------------------------------------------------
CREATE TABLE MusFilm  ( 
                        CodeOF  DECIMAL(5)NOT NULL,
                        CodeOA  DECIMAL(5)NOT NULL,                      
			PRIMARY KEY (CodeOF, CodeOA),
			FOREIGN KEY (CodeOF) REFERENCES Film(CodeOF),
			FOREIGN KEY (CodeOA) REFERENCES Album(CodeOA)
			);
--------------------------------------------------------------
CREATE TABLE presentoir (CodeRP DECIMAL(5),
                        CodeOL DECIMAL(5),
                        CodeOF DECIMAL(5),
                        CodeOA DECIMAL(5),
		        capaciteP DECIMAL(5),
                        themeP VARCHAR (15),
		        PRIMARY KEY (CodeRP),
                        FOREIGN KEY (CodeOF) REFERENCES Film(CodeOF),
			FOREIGN KEY (CodeOL) REFERENCES Livre(CodeOL),
                        FOREIGN KEY (CodeOA) REFERENCES Album(CodeOA)
			);
-------------------------------------------------------------------
CREATE TABLE etagere (CodeRE DECIMAL(5),
                        CodeOL DECIMAL(5),
                        CodeOF DECIMAL(5),
                        CodeOA DECIMAL(5),
		        capaciteE DECIMAL(5),
                        themeE VARCHAR (15),
		        PRIMARY KEY (CodeRE),
                        FOREIGN KEY (CodeOF) REFERENCES Film(CodeOF),
			FOREIGN KEY (CodeOL) REFERENCES Livre(CodeOL),
                        FOREIGN KEY (CodeOA) REFERENCES Album(CodeOA)
			);
------------------------------------------------------------------
CREATE TABLE rayon  (   numRayon DECIMAL(5),
                        theme VARCHAR(15),
                        id DECIMAL(5),
                        CodeRP  DECIMAL(5)NOT NULL,
                        CodeRE  DECIMAL(5)NOT NULL, 
                        PRIMARY KEY (id),               
			FOREIGN KEY (CodeRP) REFERENCES presentoir(CodeRP),
			FOREIGN KEY (CodeRE) REFERENCES etagere(CodeRE)                    
			)
------------------------------------------------------------------
CREATE TABLE etage ( NUMERO DECIMAL(5),
                        categorie VARCHAR (15),                      
		        PRIMARY KEY (NUMERO)                                             
		);
