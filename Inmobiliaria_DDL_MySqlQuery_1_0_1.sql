CREATE SCHEMA `inmobiliaria` ;

CREATE DATABASE `inmobiliaria_DB`;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

USE inmobiliaria_DB;

-----------------------------------------------------------------------
CREATE TABLE inmobiliaria
(
IdInmobiliaria INT UNSIGNED NOT NULL AUTO_INCREMENT, nombre VARCHAR(15) NOT NULL, mail VARCHAR(200) NOT NULL, ubicacion VARCHAR(200) NOT NULL, PRIMARY KEY (IdInmobiliaria)
);
-----------------------------------------------------------------------
CREATE TABLE Inmuebles
(
IdInmueble INT UNSIGNED NOT NULL AUTO_INCREMENT, Direccion VARCHAR(200) NOT NULL, Superficie INT(10) NOT NULL, IdTipoInmueble INT UNSIGNED NOT NULL, IdCliente INT UNSIGNED NOT NULL, PRIMARY KEY (IdInmueble)
);
-----------------------------------------------------------------------
CREATE TABLE Clientes
(
IdCliente INT UNSIGNED NOT NULL AUTO_INCREMENT, nombre VARCHAR(15) NOT NULL, Apellido VARCHAR(15) NOT NULL, Dni TEXT(11) NOT NULL, Direccion VARCHAR(200) NOT NULL, `Tel.:` INT(20) NOT NULL, PRIMARY KEY (IdCliente)
);
-----------------------------------------------------------------------
CREATE TABLE Operaciones
(
IdOperacion INT UNSIGNED NOT NULL AUTO_INCREMENT, `Fecha Op.` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, `Monto Op.` INT(10) NOT NULL, `Monto Comision` INT(10) NOT NULL, PRIMARY KEY (IdOperacion)
);
-----------------------------------------------------------------------
CREATE TABLE Ofertas
(
IdOferta INT UNSIGNED NOT NULL AUTO_INCREMENT, `Fecha Lanzamiento` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, `Fecha Caducidad` TIMESTAMP DEFAULT NOT NULL, Descripcion VARCHAR(20) NOT NULL, PRIMARY KEY (IdOferta)
);
-----------------------------------------------------------------------
CREATE TABLE `Tipo Of-Op`
(
`IdTipo Of-Op` INT UNSIGNED NOT NULL AUTO_INCREMENT, Tipo VARCHAR(20) NOT NULL, PRIMARY KEY (`IdTipo Of-Op`)
);
-----------------------------------------------------------------------
CREATE TABLE TipoInmueble
(
IdInmueble INT UNSIGNED NOT NULL AUTO_INCREMENT, Tipo VARCHAR(20) NOT NULL, PRIMARY KEY (IdInmueble)
);
-----------------------------------------------------------------------
ALTER TABLE Inmuebles;
ADD FOREIGN KEY (IdTipoInmueble) REFERENCES TipoInmueble (IdTipoInmueble), FOREIGN KEY (IdCliente) REFERENCES Clientes (IdCliente);
-----------------------------------------------------------------------
ALTER TABLE Operaciones;
ADD FOREIGN KEY (IdInmueble) REFERENCES Inmuebles (IdInmueble), FOREIGN KEY (IdCliente) REFERENCES Clientes (IdCliente), FOREIGN KEY (IdCliente) REFERENCES Clientes (IdCliente), FOREIGN KEY (`IdTipo Of-Op`) REFENCES `Tipo Of-Op` (`IdTipo Of-Op`), FOREIGN KEY (IdOferta) REFENCES (IdOferta);
-----------------------------------------------------------------------
ALTER TABLE Ofertas;
ADD FOREIGN KEY (`IdTipo Of-Op`) REFERENCES `Tipo Of-Op` (`IdTipo Of-Op`);
-----------------------------------------------------------------------
