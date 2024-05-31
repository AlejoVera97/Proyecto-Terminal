USE MASTER
Go

CREATE DATABASE Terminal
Go

USE Terminal
Go

USE master
GO

CREATE LOGIN [IIS APPPOOL\DefaultAppPool] FROM WINDOWS 
GO

USE Terminal
GO

CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool]
GO

GRANT Execute to [IIS APPPOOL\DefaultAppPool]
go


Create Table Empleado
(
	UsuLog Varchar(8) Not null Primary Key Check (Len(UsuLog)=8),
	PassLog Varchar(6) Not null Check(PassLog	Like '%[A-Z]%[A-Z]%[A-Z]%'
								  AND PassLog Like '%[0-9]%[0-9]%[0-9]%'
								  AND Len(PassLog) = 6),
	NombreComp Varchar(60) Not Null
)
Go

Create Table Compania
(
	Nombre Varchar(50) Not Null Primary Key,
	Direccion Varchar (50) Not Null,
	Telefono Varchar (9) Not Null Check (Telefono like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)
Go

	Create Table Terminal
	(
		CodT Varchar(6) Not Null Primary Key Check (Len(CodT)=6),
		Ciudad Varchar (50) Not Null,
		Activa Bit Not Null Default 1
	)
	Go

	Create Table TerminalNac
	(
		CodT Varchar(6) Not Null Foreign Key References Terminal (CodT),
		TieneT Bit Not Null,
		Primary Key (CodT)
	)
	Go

	Create Table TerminalInt
	(
		CodT Varchar(6) Not Null Foreign Key References Terminal (CodT),
		Pais Varchar (50) Not Null,
		Primary Key (CodT)
	)
	Go

Create Table Viaje
(
	CodInt Int Identity (1,1) Not Null Primary Key,
	FechaHoraS DateTime Not Null Check ((FechaHoraS) > GetDate()),
	FechaHoraLl DateTime Not Null,
	CantPas Tinyint Not Null Check (CantPas Between 25 AND 50),
	Precio Money Not Null Check ((Precio) > 0),
	Anden Tinyint Not Null Check (Anden Between 1 AND 35),
	Nombre Varchar (50) Not Null Foreign Key References Compania (Nombre),
	UsuLog Varchar (8) Not Null Foreign Key References Empleado (UsuLog),
	Constraint CHK_Llegada Check(FechaHoraLl > FechaHoraS)
)
Go

Create Table PasaPor
(
	CodInt Int Not Null Foreign Key References Viaje(CodInt),
	CodT Varchar (6) Not Null Foreign Key References Terminal (CodT),
	Orden Int Not Null Check ((Orden) > 0),
	Primary Key (CodInt, CodT, Orden)
)
Go

Insert Empleado (UsuLog, PassLog, NombreComp) VALUES ('usuario1', 'abc456', 'Nombre Usuario 1'),
														  ('usuario2', 'abc123', 'Nombre Usuario 2'),
														  ('usuario3', 'def123', 'Nombre Usuario 3'),
('usuario4', 'def456', 'Nombre Usuario 4'),
('usuario5', 'pas123', 'Nombre Usuario 5'),
('usuario6', 'abc789', 'Nombre Usuario 6'),
('usuario7', 'xyz789', 'Nombre Usuario 7'),
('usuario8', 'adm123', 'Nombre Usuario 8'),
('usuario9', 'adm456', 'Nombre Usuario 9'),
('usuario0', 'adm789', 'Nombre Usuario 0')
Go

Insert Compania (Nombre, Direccion, Telefono) VALUES
('Compañía A', 'Dirección A', '123456789'),
('Compañía B', 'Dirección B', '234567890'),
('Compañía C', 'Dirección C', '345678901'),
('Compañía D', 'Dirección D', '456789012'),
('Compañía E', 'Dirección E', '567890123'),
('Compañía F', 'Dirección F', '678901234'),
('Compañía G', 'Dirección G', '789012345'),
('Compañía H', 'Dirección H', '890123456'),
('Compañía I', 'Dirección I', '901234567'),
('Compañía J', 'Dirección J', '012345678')
Go

Insert Terminal (CodT, Ciudad) Values ('MVVURO', 'Montevideo')
Insert Terminal (CodT, Ciudad) Values ('CPAYSX', 'Colonia')
Insert Terminal (CodT, Ciudad) Values ('RODRGA', 'Rocha')
Insert Terminal (CodT, Ciudad) Values ('PSNNTE', 'Paysandú')
Insert Terminal (CodT, Ciudad) Values ('MLDONU', 'Maldonado')
Insert Terminal (CodT, Ciudad) Values ('SLTOAL', 'Salto')
Insert Terminal (CodT, Ciudad) Values ('CMPCHO', 'Carmelo')
Insert Terminal (CodT, Ciudad) Values ('TRNDAD', 'Trinidad')
Insert Terminal (CodT, Ciudad) Values ('FLORUA', 'Florida')
Insert Terminal (CodT, Ciudad) Values ('RVRBIA', 'Rivera')
Insert Terminal (CodT, Ciudad) Values ('SRJCAS', 'San Jacinto')
Insert Terminal (CodT, Ciudad) Values ('DURZNO', 'Durazno')
Insert Terminal (CodT, Ciudad) Values ('TYJUBO', 'Tacuarembó')
Insert Terminal (CodT, Ciudad) Values ('MERCDZ', 'Mercedes')
Insert Terminal (CodT, Ciudad) Values ('SNJMAY', 'San José de Mayo')
Insert Terminal (CodT, Ciudad) Values ('COLRON', 'Colonia del Sacramento')
Insert Terminal (CodT, Ciudad) Values ('PTNDEE', 'Punta del Este')
Insert Terminal (CodT, Ciudad) Values ('CNDLNS', 'Canelones')
Insert Terminal (CodT, Ciudad) Values ('FRYSOL', 'Fray Bentos')
Insert Terminal (CodT, Ciudad) Values ('ROSSLV', 'Río Negro')
Insert Terminal (CodT, Ciudad) Values ('BUENOS', 'Buenos Aires')
Insert Terminal (CodT, Ciudad) Values ('CORDBA', 'Córdoba')
Insert Terminal (CodT, Ciudad) Values ('ROSRIO', 'Rosario')
Insert Terminal (CodT, Ciudad) Values ('SALTAS', 'Salta')
Insert Terminal (CodT, Ciudad) Values ('MENDZA', 'Mendoza')
Insert Terminal (CodT, Ciudad) Values ('FLORIP', 'Florianópolis')
Insert Terminal (CodT, Ciudad) Values ('RIODJN', 'Río de Janeiro')
Insert Terminal (CodT, Ciudad) Values ('SAOPAU', 'San Pablo')
Insert Terminal (CodT, Ciudad) Values ('BRASIA', 'Brasilia')
Insert Terminal (CodT, Ciudad) Values ('CURITB', 'Curitiba')
Insert Terminal (CodT, Ciudad) Values ('SNTAGO', 'Santiago')
Insert Terminal (CodT, Ciudad) Values ('VLPARA', 'Valparaíso')
Insert Terminal (CodT, Ciudad) Values ('CNCEPC', 'Concepción')
Insert Terminal (CodT, Ciudad) Values ('VALDIV', 'Valdivia')
Insert Terminal (CodT, Ciudad) Values ('ANTOFA', 'Antofagasta')
Insert Terminal (CodT, Ciudad) Values ('ASUNCI', 'Asunción')
Insert Terminal (CodT, Ciudad) Values ('CIUEST', 'Ciudad del Este')
Insert Terminal (CodT, Ciudad) Values ('ITAUGU', 'Itauguá')
Insert Terminal (CodT, Ciudad) Values ('LLUQUE', 'Luque')
Insert Terminal (CodT, Ciudad) Values ('CAAGUA', 'Caaguazú')
Go

Insert TerminalInt (CodT, Pais) VALUES ('BUENOS', 'Argentina')
Insert TerminalInt (CodT, Pais) VALUES	('CORDBA', 'Argentina')
Insert TerminalInt (CodT, Pais) VALUES	('ROSRIO', 'Argentina')
Insert TerminalInt (CodT, Pais) VALUES	('SALTAS', 'Argentina')
Insert TerminalInt (CodT, Pais) VALUES ('MENDZA', 'Argentina')
Insert TerminalInt (CodT, Pais) VALUES	('FLORIP', 'Brasil')
Insert TerminalInt (CodT, Pais) VALUES	('RIODJN', 'Brasil')
Insert TerminalInt (CodT, Pais) VALUES	('SAOPAU', 'Brasil')
Insert TerminalInt (CodT, Pais) VALUES	('BRASIA', 'Brasil')
Insert TerminalInt (CodT, Pais) VALUES	('CURITB', 'Brasil')
Insert TerminalInt (CodT, Pais) VALUES	('SNTAGO', 'Chile')
Insert TerminalInt (CodT, Pais) VALUES	('VLPARA', 'Chile')
Insert TerminalInt (CodT, Pais) VALUES ('CNCEPC', 'Chile')
Insert TerminalInt (CodT, Pais) VALUES ('VALDIV', 'Chile')
Insert TerminalInt (CodT, Pais) VALUES ('ANTOFA', 'Chile')
Insert TerminalInt (CodT, Pais) VALUES ('ASUNCI', 'Paraguay')
Insert TerminalInt (CodT, Pais) VALUES ('CIUEST', 'Paraguay')
Insert TerminalInt (CodT, Pais) VALUES ('ITAUGU', 'Paraguay')
Insert TerminalInt (CodT, Pais) VALUES ('LLUQUE', 'Paraguay')
Insert TerminalInt (CodT, Pais) VALUES ('CAAGUA', 'Paraguay')
Go

Insert TerminalNac (CodT, TieneT) VALUES ('MVVURO', 1)
Insert TerminalNac (CodT, TieneT) VALUES ('CPAYSX', 1)
Insert TerminalNac (CodT, TieneT) VALUES ('RODRGA', 0)
Insert TerminalNac (CodT, TieneT) VALUES ('PSNNTE', 1)
Insert TerminalNac (CodT, TieneT) VALUES ('MLDONU', 1)
Insert TerminalNac (CodT, TieneT) VALUES ('SLTOAL', 0)
Insert TerminalNac (CodT, TieneT) VALUES ('CMPCHO', 0)
Insert TerminalNac (CodT, TieneT) VALUES ('TRNDAD', 1)
Insert TerminalNac (CodT, TieneT) VALUES ('FLORUA', 0)
Insert TerminalNac (CodT, TieneT) VALUES ('RVRBIA', 1)
Insert TerminalNac (CodT, TieneT) VALUES ('SRJCAS', 0)
Insert TerminalNac (CodT, TieneT) VALUES ('DURZNO', 1)
Insert TerminalNac (CodT, TieneT) VALUES ('TYJUBO', 1)
Insert TerminalNac (CodT, TieneT) VALUES ('MERCDZ', 1)
Insert TerminalNac (CodT, TieneT) VALUES ('SNJMAY', 0)
Insert TerminalNac (CodT, TieneT) VALUES ('COLRON', 1)
Insert TerminalNac (CodT, TieneT) VALUES ('PTNDEE', 0)
Insert TerminalNac (CodT, TieneT) VALUES ('CNDLNS', 1)
Insert TerminalNac (CodT, TieneT) VALUES ('FRYSOL', 0)
Insert TerminalNac (CodT, TieneT) VALUES ('ROSSLV', 1)
Go

Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 12:30', '20230827 19:30', 25, 600, 1, 'Compañía A', 'usuario1')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 12:30', '20230827 20:30', 40, 800, 2, 'Compañía B', 'usuario4')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 14:30', '20230827 19:30', 48, 600, 3, 'Compañía A', 'usuario1')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 15:30', '20230827 21:30', 26, 1800, 4, 'Compañía B', 'usuario2')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 15:30', '20230827 19:30', 30, 1650, 5, 'Compañía C', 'usuario3')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 15:40', '20230827 19:50', 50, 750, 6, 'Compañía D', 'usuario4')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 16:30', '20230827 20:30', 41, 950, 7, 'Compañía B', 'usuario5')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 16:30', '20230827 22:30', 32, 1450, 8, 'Compañía G', 'usuario7')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 16:30', '20230827 21:30', 43, 650, 9, 'Compañía H', 'usuario8')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 16:30', '20230827 21:45', 36, 400, 10, 'Compañía H', 'usuario9')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 16:45', '20230827 22:00', 28, 900, 11, 'Compañía E', 'usuario0')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 16:45', '20230827 18:00', 29, 1000, 19, 'Compañía F', 'usuario1')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 16:45', '20230827 19:40', 47, 780, 20, 'Compañía E', 'usuario2')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 17:00', '20230827 23:30', 25, 960, 21, 'Compañía J', 'usuario3')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 17:00', '20230827 23:45', 45, 780, 22, 'Compañía C', 'usuario4')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 17:15', '20230827 23:45', 48, 1550, 23, 'Compañía H', 'usuario5')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 17:15', '20230827 22:45', 37, 1360, 24, 'Compañía D', 'usuario6')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 17:15', '20230827 21:45', 36, 480, 25, 'Compañía D', 'usuario7')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 17:30', '20230827 22:45', 45, 1650, 26, 'Compañía E', 'usuario8')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 18:00', '20230828 01:00', 26, 680, 27, 'Compañía H', 'usuario9')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 18:15', '20230827 21:45', 27, 750, 28, 'Compañía G', 'usuario0')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 18:15', '20230827 22:00', 50, 1800, 29, 'Compañía F', 'usuario1')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 18:30', '20230827 21:45', 49, 800, 30, 'Compañía I', 'usuario2')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 18:45', '20230827 23:45', 48, 1450, 31, 'Compañía I', 'usuario3')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 18:45', '20230828 00:45', 31, 880, 32, 'Compañía J', 'usuario4')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 19:05', '20230827 21:45', 35, 1850, 33, 'Compañía F', 'usuario5')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 19:15', '20230828 01:45', 36, 1750, 34, 'Compañía I', 'usuario6')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 19:30', '20230827 23:45', 45, 1450, 35, 'Compañía I', 'usuario7')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 19:30', '20230827 23:45', 49, 350, 1, 'Compañía A', 'usuario8')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 19:30', '20230828 00:15', 45, 180, 2, 'Compañía A', 'usuario9')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 19:30', '20230828 00:30', 36, 600, 3, 'Compañía F', 'usuario0')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 20:00', '20230828 00:25', 47, 785, 4, 'Compañía A', 'usuario1')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 20:00', '20230827 22:45', 38, 985, 5, 'Compañía G', 'usuario2')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 20:30', '20230828 06:45', 27, 999, 6, 'Compañía C', 'usuario3')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 20:30', '20230827 23:45', 27, 450, 7, 'Compañía G', 'usuario4')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 20:30', '20230828 00:30', 45, 650, 8, 'Compañía B', 'usuario5')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230915 20:30', '20230916 02:30', 38, 780, 9, 'Compañía A', 'usuario6')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 22:30', '20230828 03:30', 45, 680, 10, 'Compañía E', 'usuariO7')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230827 23:30', '20230828 09:30', 35, 780, 11, 'Compañía D', 'usuario8')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230828 04:30', '20230828 06:30', 29, 980, 12, 'Compañía F', 'usuario9')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230828 04:45', '20230828 09:30', 45, 850, 13, 'Compañía G', 'usuario0')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230828 05:00', '20230828 08:30', 25, 780, 14, 'Compañía H', 'usuario1')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230828 05:30', '20230828 08:30', 27, 960, 15, 'Compañía J', 'usuario2')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230828 05:30', '20230828 09:30', 45, 780, 16, 'Compañía E', 'usuario3')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230828 05:30', '20230828 08:30', 49, 990, 17, 'Compañía A', 'usuario4')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230828 06:30', '20230828 09:30', 44, 890, 18, 'Compañía I', 'usuario5')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230828 06:30', '20230828 10:30', 43, 815, 19, 'Compañía E', 'usuario6')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230828 07:00', '20230828 10:20', 42, 615, 20, 'Compañía B', 'usuario7')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230828 07:45', '20230828 09:15', 27, 645, 21, 'Compañía B', 'usuario8')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230828 07:45', '20230828 11:10', 28, 350, 22, 'Compañía I', 'usuario9')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230828 08:15', '20230828 11:40', 29, 750, 23, 'Compañía C', 'usuario0')
Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values ('20230828 08:15', '20230828 12:00', 26, 685, 24, 'Compañía C', 'usuario1')
Go

Insert PasaPor (CodInt, CodT, Orden) Values (1, 'SNJMAY', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (1, 'CPAYSX', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (1, 'COLRON', 3)

Insert PasaPor (CodInt, CodT, Orden) Values (51, 'SNJMAY', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (51, 'CPAYSX', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (51, 'COLRON', 3)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (2, 'SNJMAY', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (2, 'TRNDAD', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (2, 'PSNNTE', 3)
Insert PasaPor (CodInt, CodT, Orden) Values (2, 'SLTOAL', 4)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (3, 'SNJMAY', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (3, 'TRNDAD', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (3, 'FRYSOL', 3)
Go


Insert PasaPor (CodInt, CodT, Orden) Values (4, 'CNDLNS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (4, 'MLDONU', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (4, 'RODRGA', 3)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (5, 'CNDLNS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (5, 'MLDONU', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (5, 'RODRGA', 3)
Insert PasaPor (CodInt, CodT, Orden) Values (5, 'FLORIP', 4)
Insert PasaPor (CodInt, CodT, Orden) Values (5, 'RIODJN', 5)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (6, 'CMPCHO', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (6, 'SNJMAY', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (7, 'ROSSLV', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (7, 'FRYSOL', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (7, 'BUENOS', 3)
Insert PasaPor (CodInt, CodT, Orden) Values (7, 'ROSRIO', 4)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (8, 'PTNDEE', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (8, 'RODRGA', 2)
Go


Insert PasaPor (CodInt, CodT, Orden) Values (9, 'CIUEST', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (9, 'ASUNCI', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (10, 'TYJUBO', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (10, 'RVRBIA', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (10, 'CAAGUA', 3)
Insert PasaPor (CodInt, CodT, Orden) Values (10, 'BRASIA', 4)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (11, 'SNJMAY', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (11, 'MERCDZ', 2)
Go


Insert PasaPor (CodInt, CodT, Orden) Values (12, 'SLTOAL', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (12, 'CORDBA', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (13, 'RODRGA', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (13, 'FLORIP', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (13, 'SAOPAU', 3)
Insert PasaPor (CodInt, CodT, Orden) Values (13, 'RIODJN', 4)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (14, 'MVVURO', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (14, 'RODRGA', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (14, 'SAOPAU', 3)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (15, 'SNJMAY', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (15, 'TYJUBO', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (15, 'RVRBIA', 3)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (16, 'CNDLNS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (16, 'FLORUA', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (16, 'RVRBIA', 3)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (17, 'CNDLNS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (17, 'FLORUA', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (17, 'RVRBIA', 3)
Insert PasaPor (CodInt, CodT, Orden) Values (17, 'CURITB', 4)
Insert PasaPor (CodInt, CodT, Orden) Values (17, 'ITAUGU', 5)
Insert PasaPor (CodInt, CodT, Orden) Values (17, 'LLUQUE', 6)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (18, 'CNDLNS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (18, 'CMPCHO', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (18, 'TRNDAD', 3)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (19, 'CNDLNS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (19, 'RVRBIA', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (19, 'ASUNCI', 3)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (20, 'PSNNTE', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (20, 'BUENOS', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (20, 'ROSRIO', 3)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (21, 'CNDLNS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (21, 'MLDONU', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (22, 'CNDLNS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (22, 'PTNDEE', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (23, 'SNJMAY', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (23, 'CPAYSX', 2)
Go


Insert PasaPor (CodInt, CodT, Orden) Values (24, 'SNJMAY', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (24, 'ROSSLV', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (25, 'SNJMAY', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (25, 'PSNNTE', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (26, 'PSNNTE', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (26, 'SLTOAL', 2)
Go


Insert PasaPor (CodInt, CodT, Orden) Values (27, 'PSNNTE', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (27, 'SLTOAL', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (27, 'BUENOS', 3)
Insert PasaPor (CodInt, CodT, Orden) Values (27, 'MENDZA', 4)
Go


Insert PasaPor (CodInt, CodT, Orden) Values (28, 'CNDLNS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (28, 'FLORUA', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (28, 'FRYSOL', 3)
Insert PasaPor (CodInt, CodT, Orden) Values (28, 'SALTAS', 4)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (29, 'SRJCAS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (29, 'FLORUA', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (29, 'DURZNO', 3)
Insert PasaPor (CodInt, CodT, Orden) Values (29, 'BUENOS', 4)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (30, 'SRJCAS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (30, 'FLORUA', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (31, 'MVVURO', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (31, 'CURITB', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (32, 'MVVURO', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (32, 'SRJCAS', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (33, 'FRYSOL', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (33, 'PSNNTE', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (34, 'MVVURO', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (34, 'ROSRIO', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (35, 'MVVURO', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (35, 'BUENOS', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (35, 'SNTAGO', 3)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (36, 'MVVURO', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (36, 'ANTOFA', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (36, 'VALDIV', 3)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (37, 'MVVURO', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (37, 'DURZNO', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (37, 'CAAGUA', 3)
Go


Insert PasaPor (CodInt, CodT, Orden) Values (38, 'RODRGA', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (38, 'CNDLNS', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (38, 'FLORIP', 3)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (39, 'FLORIP', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (39, 'CNDLNS', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (39, 'MVVURO', 3)
Go


Insert PasaPor (CodInt, CodT, Orden) Values (40, 'PSNNTE', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (40, 'RODRGA', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (40, 'FLORIP', 3)
Go


Insert PasaPor (CodInt, CodT, Orden) Values (41, 'PTNDEE', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (41, 'RODRGA', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (41, 'FLORIP', 3)
Go


Insert PasaPor (CodInt, CodT, Orden) Values (42, 'ROSSLV', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (42, 'CORDBA', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (42, 'SNTAGO', 3)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (43, 'CNDLNS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (43, 'RODRGA', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (44, 'CMPCHO', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (44, 'CPAYSX', 2)
Insert PasaPor (CodInt, CodT, Orden) Values (44, 'BUENOS', 3)
Insert PasaPor (CodInt, CodT, Orden) Values (44, 'CORDBA', 4)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (45, 'FLORIP', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (45, 'RIODJN', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (46, 'SNTAGO', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (46, 'VALDIV', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (47,'SRJCAS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (47, 'MERCDZ', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (48,'SRJCAS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (48, 'FRYSOL', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (49,'SRJCAS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (49, 'RODRGA', 2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (50,'BUENOS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (50, 'SALTAS',2)
Go

Insert PasaPor (CodInt, CodT, Orden) Values (52,'BUENOS', 1)
Insert PasaPor (CodInt, CodT, Orden) Values (52,'BUENOS', 2)
Go

-- Procedimientos Almacenados

--ALTAS--

Create Proc SP_AltaEmpleado
	@Usu Varchar(8), 
	@Pasw Varchar(6),
	@Nombre Varchar(60)
	As
	Begin
		If(Exists(Select * From Empleado Where UsuLog = @Usu))
			Return -1
		Insert Empleado Values(@Usu, @Pasw, @Nombre)
		If(@@ERROR !=0)
			Return -2
		Else
			Return 1
	End
Go

Create Proc SP_AltaCompania
	@Nombre Varchar(50),
	@Direccion Varchar(50),
	@Telefono Varchar (9)
	As
	Begin
		If (Exists(Select * From Compania Where Nombre = @Nombre))
			Return -1
		Insert Compania Values (@Nombre, @Direccion, @Telefono)
		If (@@Error != 0)
			Return -2
		Else
			Return 1
	End
Go

Create Proc SP_AltaTerminalNac
	@CodT Varchar(6),
	@Ciudad Varchar(50),
	@Taxi Bit
	As
	Begin
		If (Exists(Select * From Terminal Where CodT = @CodT AND Activa = 1))
		Begin	
		Return -1
		End

		If (Exists(Select * From Terminal Inner Join TerminalNac on Terminal.CodT = TerminalNac.CodT Where TerminalNac.CodT = @CodT AND Terminal.Activa = 0))
		Begin	
			BEGIN TRAN
				Update Terminal
				Set Activa = 1, Ciudad = @Ciudad
				Where CodT = @CodT
				If(@@Error !=0)
				Begin
					RollBack Tran
					Return -2
				End
				Update TerminalNac
				Set TieneT = @Taxi
				Where CodT = @CodT
				If(@@Error !=0)
				Begin
					RollBack Tran
					Return -2
				End
					Commit Tran	
		End
		
		If (Exists(Select * From TerminalInt Where CodT = @CodT))
		Begin	
		Return -3
		End

	BEGIN TRAN
		Insert Terminal (CodT, Ciudad) Values (@CodT, @Ciudad)
		If(@@Error !=0)
		Begin
			RollBack Tran
			Return -2
		End
		
		Insert TerminalNac Values (@CodT, @Taxi)
		If (@@Error != 0)
		Begin
			RollBack Tran
			Return -2
		End
			Commit Tran
	End
Go

Create Proc SP_AltaTerminalInt
	@CodT Varchar(6),
	@Ciudad Varchar(50),
	@Pais Varchar (50)
	As
	Begin
		If (Exists(Select * From Terminal Where CodT = @CodT and Activa = 1))
		Begin	
		Return -1
		End
		If (Exists(Select * From Terminal Inner Join TerminalInt on Terminal.CodT = TerminalInt.CodT where TerminalInt.CodT = @CodT AND Terminal.Activa = 0))
		Begin	
			BEGIN TRAN
				Update Terminal
				Set Activa = 1, Ciudad = @Ciudad
				Where CodT = @CodT
				If(@@Error !=0)
				Begin
					RollBack Tran
					Return -2
				End
				Update TerminalInt
				Set Pais = @Pais
				Where CodT = @CodT
				If(@@Error !=0)
				Begin
					RollBack Tran
					Return -2
				End
					Commit Tran	
		End

		If (Exists(Select * From TerminalNac Where CodT = @CodT))
		Begin	
		Return -2
		End

	BEGIN TRAN
		Insert Terminal (CodT, Ciudad) Values (@CodT, @Ciudad)
		If(@@Error !=0)
		Begin
			RollBack Tran
			Return -2
		End
		
		Insert TerminalInt Values (@CodT, @Pais)
		If (@@Error != 0)
		Begin
			RollBack Tran
			Return -2
		End
			Commit Tran
	End
Go

Create Proc SP_AltaViaje
	@FechaHoraS DateTime,
	@FechaHoraL DateTime,
	@CantPas TinyInt,
	@Precio Money,
	@Anden TinyInt,
	@Nombre Varchar(50),
    @Usu Varchar(8)
	As
	Begin
		If(Not Exists(Select * From Compania Where Nombre = @Nombre))
		Begin
		Return -1
		End
		If(Not Exists(Select * From Empleado Where UsuLog = @Usu))
		Begin
		Return -1
		End
	If Exists(Select * From Viaje Where Anden = @Anden And @FechaHoraS > (DATEADD(minute, -30, FechaHoraS)) 
	And (DATEADD(minute, +30, FechaHoraS)< @FechaHoraS)) 
		Begin
		Return -1
		End
	Insert Viaje (FechaHoraS, FechaHoraLl, CantPas, Precio, Anden, Nombre, UsuLog) Values (@FechaHoraS, @FechaHoraL, @CantPas, @Precio, @Anden, @Nombre, @Usu)
		If(@@Error = 0)
		Return @@Identity
		Else 
		Return 0
	End
Go

Create Proc SP_AltaPasaPor
	@CodInt int,
	@CodT Varchar(6),
	@Orden int
	As
	Begin
		If Not (Exists(Select * From Terminal Where CodT = @CodT AND Activa = 1))
			Return -1
		If Not (Exists(Select * From Viaje Where CodInt = @CodInt))
			Return -2
		If Exists(Select * From PasaPor Where CodInt = @CodInt AND CodT= @CodT)
			Return -3
		If Exists(Select * From PasaPor Where CodInt = @CodInt AND Orden = @Orden)
			Return -4

		Insert PasaPor (CodInt, CodT, Orden) Values (@CodInt, @CodT, @Orden)
			If @@ERROR = 0
				Return 1
			Else
				Return 0
	End
Go

--BAJAS--

Create Proc SP_EliminarTerminal
	@CodT Varchar(6)
	As
	Begin
		If(Not Exists(Select * From Terminal Where CodT = @CodT))
		Begin			
			Return -1
		End
		
		If(Exists(Select * From PasaPor Where CodT = @CodT))
		Begin
			Update Terminal
			Set Activa = 0
			Where CodT = @CodT
			If(@@Error !=0)
				Return -3
		End
		Else
		Begin
		BEGIN TRAN

			Delete From TerminalInt Where CodT = @CodT
			If(@@Error != 0)
			Begin
				RollBack Tran
				Return -2
			End

			Delete From TerminalNac Where CodT = @CodT
			If(@@Error != 0)
			Begin
				RollBack Tran
				Return -2
			End
			
			Delete From Terminal Where CodT = @CodT
			If(@@Error != 0)
			Begin
				RollBack Tran
				Return -2
			End

			Commit Tran
		End
	End
Go

--Modificaciones--

Create Proc SP_ModificarTerminalNac
	@CodT Varchar(6),
	@Ciudad Varchar(50),
	@Taxi Bit
	As
	Begin
	If (Not Exists(Select * From Terminal Inner Join TerminalNac on Terminal.CodT= TerminalNac.CodT Where TerminalNac.CodT = @CodT And Activa = 1))
		Begin	
		 	Return -1
		End
	Else 
	Begin
	BEGIN TRAN
		Update Terminal
		Set Ciudad = @Ciudad
		Where CodT = @CodT
		If(@@Error !=0)
		Begin
			RollBack Tran
			Return -2
		End
		
		Update TerminalNac
		Set TieneT = @Taxi
		Where CodT = @CodT
		If(@@Error !=0)
		Begin
			RollBack Tran
			Return -2
		End
			Commit Tran
	End
	End
Go

Create Proc SP_ModificarTerminalInt
	@CodT Varchar(6),
	@Ciudad Varchar(50), 
	@Pais Varchar(50)
	As
	Begin
	If (Not Exists(Select * From Terminal Inner Join TerminalInt on Terminal.CodT= TerminalInt.CodT Where TerminalInt.CodT = @CodT And Activa =1))
		Begin	
			Return -1
		End
	Else
		Begin
	BEGIN TRAN
		Update Terminal
		Set Ciudad = @Ciudad
		Where CodT = @CodT
		If(@@Error !=0)
		Begin
			RollBack Tran
			Return -2
		End
		
		Update TerminalInt
		Set Pais = @Pais
		Where CodT = @CodT
		If(@@Error !=0)
		Begin
			RollBack Tran
			Return -2
		End
			Commit Tran
		End
	End
Go

--BUSQUEDAS--

Create Proc SP_BuscarUsuario
	@Usu Varchar(8)
	As
	Begin
	Select * From Empleado where UsuLog = @Usu
	End
	go
Create Proc SP_BuscarUsuarioLog
	@Usu Varchar(8),
	@Pasw Varchar(6)
	As
	Begin
	Select * From Empleado Where UsuLog = @Usu And PassLog = @Pasw
	End
Go

Create Proc SP_BuscarCompania
	@Nombre Varchar(50)
	As
	Begin
	Select * From Compania Where Nombre = @Nombre
	End
Go

Create Proc SP_BuscarTerNacAct 
	@CodT Varchar(6)
	As
	Begin
	Select *
	From TerminalNac Inner Join Terminal on Terminal.CodT = TerminalNac.CodT
	Where TerminalNac.CodT = @CodT and Terminal.Activa = 1;
	End
Go

Create Proc SP_BuscarTerIntAct 
	@CodT Varchar(6)
	As
	Begin
	Select *
	From TerminalInt Inner Join Terminal on Terminal.CodT = TerminalInt.CodT
	Where TerminalInt.CodT = @CodT and Terminal.Activa = 1;
	End
Go

Create Proc SP_BuscarTodasTerNac 
	@CodT Varchar(6)
	As
	Begin
	Select *
	From TerminalNac Inner Join Terminal on Terminal.CodT = TerminalNac.CodT
	Where TerminalNac.CodT = @CodT
	End
Go

Create Proc SP_BuscarTodasTerInt 
	@CodT Varchar(6)
	As
	Begin
	Select *
	From TerminalInt Inner Join Terminal on Terminal.CodT = TerminalInt.CodT
	Where TerminalInt.CodT = @CodT
	End
Go

-- Listados -----

Create Proc SP_ListadodeCompanias
	As
	Begin
	Select Nombre, Direccion, Telefono
	From Compania
	End
Go

Create Proc SP_ListadoDeViajes
	As
	Begin
	Select *
	From Viaje
	Where Year(FechaHoraS) = Year(GETDATE()) and MONTH(FechaHoraS) = MONTH(GetDate())
	End
Go

Create Proc SP_ListadoDeViajesProximos
	As
	Begin
	Select *
	From Viaje
	Where Viaje.FechaHoraS >= GETDATE()
	End
Go

Create Proc SP_ListadoDeTerNacAct
	As
	Begin
	Select Terminal.CodT, Terminal.Ciudad, TerminalNac.TieneT
	From TerminalNac Inner Join Terminal on Terminal.CodT = TerminalNac.CodT
	Where Terminal.Activa = 1;
	End
Go

Create Proc SP_ListadoDeTerIntAct
	As
	Begin
	Select Terminal.CodT, Terminal.Ciudad, TerminalInt.Pais
	From TerminalInt Inner Join Terminal on Terminal.CodT = TerminalInt.CodT
	Where Terminal.Activa = 1;
	End
Go

Create Proc SP_ParadasPorViaje
@CodI int
	As
	Begin
	Select * From PasaPor Where CodInt=@CodI
	End
Go
