-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Zona_Gamer
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Zona_Gamer` ;

-- -----------------------------------------------------
-- Schema Zona_Gamer
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Zona_Gamer` DEFAULT CHARACTER SET utf8 ;
USE `Zona_Gamer` ;

-- -----------------------------------------------------
-- Table `Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Categoria` ;

CREATE TABLE IF NOT EXISTS `Categoria` (
  `id_Categoria` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Producto` ;

CREATE TABLE IF NOT EXISTS `Producto` (
  `id_Producto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `foto` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `id_Categoria` INT NOT NULL,
  `cant_like` INT NOT NULL,
  PRIMARY KEY (`id_Producto`),
  CONSTRAINT `fk_Producto_Categoria`
    FOREIGN KEY (`id_Categoria`)
    REFERENCES `Categoria` (`id_Categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comentario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Comentario` ;

CREATE TABLE IF NOT EXISTS `Comentario` (
  `id_Comentario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `puntaje` INT NOT NULL,
  `comentario` VARCHAR(250) NOT NULL,
  `id_Producto` INT NOT NULL,
  PRIMARY KEY (`id_Comentario`),
  CONSTRAINT `fk_Comentario_Producto1`
    FOREIGN KEY (`id_Producto`)
    REFERENCES `Producto` (`id_Producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Usuario` ;

CREATE TABLE IF NOT EXISTS `Usuario` (
  `id_Usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `usuario_productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuario_productos` ;

CREATE TABLE IF NOT EXISTS `usuario_productos` (
  `id_usuario_productos` INT NOT NULL AUTO_INCREMENT,
  `id_Producto` INT NOT NULL,
  `id_Usuario` INT NOT NULL,
  PRIMARY KEY (`id_usuario_productos`),
  CONSTRAINT `fk_usuario_productos_Producto1`
    FOREIGN KEY (`id_Producto`)
    REFERENCES `Producto` (`id_Producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_productos_Usuario1`
    FOREIGN KEY (`id_Usuario`)
    REFERENCES `Usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Consulta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Consulta` ;

CREATE TABLE IF NOT EXISTS `Consulta` (
  `id_Consulta` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `area_empresa` VARCHAR(45) NOT NULL,
  `comentario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Consulta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Forma_De_Pago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Forma_De_Pago` ;

CREATE TABLE IF NOT EXISTS `Forma_De_Pago` (
  `id_Forma_De_Pago` INT NOT NULL AUTO_INCREMENT,
  `forma_de_pago` VARCHAR(45) NOT NULL,
  `nombre_tarjeta` VARCHAR(45) NOT NULL,
  `numero_tarjeta` INT NOT NULL,
  `fecha_vencimiento` VARCHAR(45) NOT NULL,
  `codigo_tarjeta` INT NOT NULL,
  `id_usuario_productos` INT NOT NULL,
  `id_Persona` INT NOT NULL,
  PRIMARY KEY (`id_Forma_De_Pago`),
  CONSTRAINT `fk_Forma_De_Pago_usuario_productos1`
    FOREIGN KEY (`id_usuario_productos`)
    REFERENCES `usuario_productos` (`id_usuario_productos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Categoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `Zona_Gamer`;
INSERT INTO `Categoria` (`id_Categoria`, `categoria`) VALUES (1, 'Todos');
INSERT INTO `Categoria` (`id_Categoria`, `categoria`) VALUES (2, 'Consolas');
INSERT INTO `Categoria` (`id_Categoria`, `categoria`) VALUES (3, 'Accesorios');
INSERT INTO `Categoria` (`id_Categoria`, `categoria`) VALUES (4, 'Juegos');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Producto`
-- -----------------------------------------------------
START TRANSACTION;
USE `Zona_Gamer`;
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (1, 'PlayStation 4', 'img/productos/PlayStation4.jpg', 'Consola PlayStation 4', 10000, 'Sony', 2, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (2, 'PlayStation 5', 'img/productos/PlayStation5.jpg', 'Consola PlayStation 5', 25000, 'Sony', 2, 2);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (3, 'Xbox One', 'img/productos/XboxOne.jpg', 'Consola Xbox One', 11999, 'Microsoft', 2, 4);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (4, 'Xbox One Series X', 'img/productos/XboxOneS.jpeg', 'La Xbox Series X llegara el 10 de noviembre de 2020. La consola de Microsoft contara con un CPU personalizado ADM Zen 2 con ocho nucleos a una velocidad de 2.8GHz', 12000, 'Microsoft', 2, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (5, 'Nintendo Switch\"', 'img/productos/Switch.jpg', 'Consola Nintendo Switch', 2000, 'Nintendo', 2, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (6, 'DualShock 4', 'img/productos/Dualshock.jpeg', 'Control para consola PS4', 2000, 'Sony', 3, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (7, 'Volante PS4', 'img/productos/Volante.jpg', 'Volante para consola Ps4', 2000, 'Sony', 3, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (8, 'Control Xbox', 'img/productos/ControlXbox.jpg', 'Control para consola Xbox', 2000, 'Microsoft', 3, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (9, 'Funda Nintendo Switch', 'img/productos/FundaSwitch.jpg', 'Funda para la nintendo switch con espacio para auricular', 2000, 'Nintendo', 3, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (10, 'Mario Kart', 'img/productos/MarioSwitch.png', 'Juego Mario Kart para la consola nintendo switch', 2000, 'Nintendo', 4, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (11, 'Zelda Link\'s Awakening', 'img/productos/ZeldaSwitch.png', 'Juego Zelda Link\'s para la nintendo switch', 2000, 'Nintendo', 4, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (12, 'Splatoon 2', 'img/productos/SplatoonSwitch.png', 'Juego Splatoon 2 para nintendo switch', 2000, 'Nintendo', 4, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (13, 'Minecraft', 'img/productos/MinecraftSwitch.png', 'Juego Minecraft para la nintendo switch', 2000, 'Nintendo', 4, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (14, 'God of war', 'img/productos/god-of-war.png', 'Juego God Of War para la PlayStation 4', 2000, 'Sony', 4, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (15, 'Ghost Of Tsushima', 'img/productos/GhostPS4.png', 'Juego Ghost Of Tsushima para la PlayStation 4', 2000, 'Sony', 4, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (16, 'Ark Survival Evolved', 'img/productos/ArkPS4.png', 'Juego Ark Survival Evolved para la PlayStation 4', 2000, 'Sony', 4, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (17, 'The division 2', 'img/productos/TheDivision2.png', 'Juego The Division 2 para la PlayStation 4', 2000, 'Sony', 4, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (18, 'Gears 5', 'img/productos/Gears5.png', 'Juego Gears 5 para la Xbox One', 2000, 'Microsoft', 4, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (19, 'Avengers', 'img/productos/Avengers.png', 'Juego Avengers para la Xbox One', 2000, 'Microsoft', 4, 0);
INSERT INTO `Producto` (`id_Producto`, `nombre`, `foto`, `descripcion`, `precio`, `marca`, `id_Categoria`, `cant_like`) VALUES (20, 'Plants VS Zombies', 'img/productos/PlantsVsZombies.png', 'Juego Plants VS Zombies para la Xbox One', 2000, 'Microsoft', 4, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Comentario`
-- -----------------------------------------------------
START TRANSACTION;
USE `Zona_Gamer`;
INSERT INTO `Comentario` (`id_Comentario`, `nombre`, `mail`, `puntaje`, `comentario`, `id_Producto`) VALUES (1, 'Nicolas', 'Prueba@hotmail.com', 1, 'funciona bien', 1);
INSERT INTO `Comentario` (`id_Comentario`, `nombre`, `mail`, `puntaje`, `comentario`, `id_Producto`) VALUES (2, 'Agustin', 'Prueba@gmail.com', 3, 'funciona bien', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `Zona_Gamer`;
INSERT INTO `Usuario` (`id_Usuario`, `nombre`, `apellido`, `email`, `password`) VALUES (1, 'prueba1', 'prueba1', 'prueba1', 'prueba1');
INSERT INTO `Usuario` (`id_Usuario`, `nombre`, `apellido`, `email`, `password`) VALUES (2, 'prueba2', 'prueba2', 'prueba2', 'prueba2');

COMMIT;


-- -----------------------------------------------------
-- Data for table `usuario_productos`
-- -----------------------------------------------------
START TRANSACTION;
USE `Zona_Gamer`;
INSERT INTO `usuario_productos` (`id_usuario_productos`, `id_Producto`, `id_Usuario`) VALUES (1, 1, 1);
INSERT INTO `usuario_productos` (`id_usuario_productos`, `id_Producto`, `id_Usuario`) VALUES (2, 2, 1);
INSERT INTO `usuario_productos` (`id_usuario_productos`, `id_Producto`, `id_Usuario`) VALUES (3, 3, 1);
INSERT INTO `usuario_productos` (`id_usuario_productos`, `id_Producto`, `id_Usuario`) VALUES (4, 4, 1);
INSERT INTO `usuario_productos` (`id_usuario_productos`, `id_Producto`, `id_Usuario`) VALUES (5, 2, 2);

COMMIT;

