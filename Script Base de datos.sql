drop database promoview;
CREATE DATABASE promoview DEFAULT CHARACTER SET utf8 ;
USE promoview;

/*Table Contratos */

CREATE TABLE Contratos (
  IDContrato INT NOT NULL UNIQUE,
  IDClientes INT NOT NULL,
  FechaActivacion DATETIME NOT NULL,
  Fecha_Vencimiento DATETIME NOT NULL,
  Descripcion VARCHAR(200),
  PRIMARY KEY (IDContrato));
  alter table Contratos add foreign key(IDClientes) references Clientes(IDClientes) ON DELETE NO ACTION;


/*Table Pagos */

CREATE TABLE Pagos (
  IDPagos INT NOT NULL UNIQUE,
  IDClientes INT NOT NULL,
  Cantidad DOUBLE NOT NULL,
  Fecha DATETIME NOT NULL,
  Periodo int(1) NOT NULL,
  Comentario VARCHAR(80),
  PRIMARY KEY (IDPagos));
 
 alter table Pagos add foreign key(IDClientes) references Clientes(IDClientes) ON DELETE NO ACTION;

/*Table Empresas */

CREATE TABLE Empresas(
  IDEmpresa INT NOT NULL,
  IDCliente INT NOT NULL,
  IDContrato INT NOT NULL,
  Nombre VARCHAR(30)NOT NULL,
  AreaMercado VARCHAR(40) NOT NULL,
  Ubicacion VARCHAR(50) NOT NULL,
  PRIMARY KEY (IDEmpresa));
  
  alter table Empresas add FOREIGN KEY (IDCliente) REFERENCES Clientes (ClienteID)ON DELETE NO ACTION;
  alter table Empresas add FOREIGN KEY (IDContrato) REFERENCES Contratos (IDContrato)ON DELETE NO ACTION;

/*Table Clientes */
CREATE Table Clientes(
 IDClientes INT NOT NULL UNIQUE,
 IDEmpresa INT NOT NULL,
 IDContrato INT NOT NULL,
 Nombre VARCHAR(20) NOT NULL,
 ApellidoMaterno VARCHAR(25) NOT NULL,
 ApellidoPaterno VARCHAR(25) NOT NULL,
 Edad int(2) NOT NULL,
 CorreoElectronico VARCHAR(35)NOT NULL,
 Telefono VARCHAR(15),
 Direccion VARCHAR(50),
 PRIMARY KEY (IDClientes));
 
 ALTER TABLE Clientes add foreign key(IDEmpresa) REFERENCES Empresas(IDEmpresa) ON DELETE NO ACTION;
 ALTER TABLE Clientes add foreign key(IDContrato) REFERENCES Contratos(IDContrato)ON DELETE NO ACTION;
/*Table Usuarios */

CREATE TABLE Usuarios (
  IDUsuarios INT NOT NULL UNIQUE,
  Nombre VARCHAR(25) NOT NULL,
  ApellidoMaterno VARCHAR(25) NOT NULL,
  ApellidoPaterno VARCHAR(25) NOT NULL,
  Edad int(2) NOT NULL,
  Sexo CHAR(1) NOT NULL,
  PRIMARY KEY (IdUsuarios));


/* Table Marcadores */
CREATE TABLE Marcadores (
  IDMarcador INT NOT NULL,
  IDEmpresa INT NOT NULL,
  IDModelo INT NOT NULL,
  TipoMarcador VARCHAR(10) NOT NULL,
  Descripcion VARCHAR(45) NOT NULL,
  PRIMARY KEY (idMarcador)
  );
  
alter table Marcadores add foreign key(IDEmpresa) REFERENCES Empresas(IDEmpresa) ON DELETE NO ACTION;
alter table Marcadores add  foreign key(IDModelo) REFERENCES Modelos(IDModelo)ON DELETE NO ACTION;


/* Table Modelo */
CREATE TABLE Modelos(
  IDModelo INT NOT NULL,
  IDMarcador INT NOT NULL,
  Nombre VARCHAR(25) NOT NULL,
  Animacion BOOLEAN NOT NULL,
  Descripcion VARCHAR(45)NOT NULL,
  PRIMARY KEY (IDModelo));

  alter table Modelos add foreign key (IDMarcador)REFERENCES Marcadores (IDMarcador)ON DELETE NO ACTION;