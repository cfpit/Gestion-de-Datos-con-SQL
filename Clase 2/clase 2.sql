CREATE SCHEMA `prueba` ;

CREATE TABLE `prueba`.`clientes` (
  `idcliente` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `edad` INT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;

INSERT INTO `prueba`.`clientes` (`nombre`, `edad`) VALUES ('Juan Perez', '23');
INSERT INTO `prueba`.`clientes` (`nombre`, `edad`) VALUES ('Maria Garcia', '34');

SELECT * FROM prueba.clientes;
