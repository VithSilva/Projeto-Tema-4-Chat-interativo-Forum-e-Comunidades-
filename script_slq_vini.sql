-- CRIAR O BANCO DE DADOS
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8;

-- Table `mydb`.`TIPO_PERFIL`
CREATE TABLE IF NOT EXISTS `mydb`.`TIPO_PERFIL` (
  `id_perfil` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL UNIQUE,
  `descricao` VARCHAR(255) NULL,
  PRIMARY KEY (`id_perfil`)
);

-- Table `mydb`.`GRUPO_CANAL`
CREATE TABLE IF NOT EXISTS `mydb`.`GRUPO_CANAL` (
  `id_grupo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL UNIQUE,
  `descricao` VARCHAR(255) NOT NULL,
  `data_criacao` DATETIME NOT NULL,
  PRIMARY KEY (`id_grupo`)
  );


-- Table `mydb`.`USUARIO`
CREATE TABLE IF NOT EXISTS `mydb`.`USUARIO` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `senha` VARCHAR(100) NOT NULL,
  `username` VARCHAR(50) NOT NULL UNIQUE,
  `data_cadastro` DATETIME NOT NULL,
  `TIPO_PERFIL_id_perfil` INT NOT NULL,
  `GRUPO_CANAL_id_grupo` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  FOREIGN KEY (`TIPO_PERFIL_id_perfil`)
   REFERENCES `mydb`.`TIPO_PERFIL` (`id_perfil`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
  FOREIGN KEY (`GRUPO_CANAL_id_grupo`)
   REFERENCES `mydb`.`GRUPO_CANAL` (`id_grupo`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
   );

-- Table `mydb`.`MEMBRO_GRUPO`
CREATE TABLE IF NOT EXISTS `mydb`.`MEMBRO_GRUPO` (
  `id_membro_grupo` INT NOT NULL AUTO_INCREMENT,
  `data_entrada` DATETIME NOT NULL,
  `GRUPO_CANAL_id_grupo` INT NOT NULL,
  `USUARIO_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_membro_grupo`),
  FOREIGN KEY (`GRUPO_CANAL_id_grupo`)
   REFERENCES `mydb`.`GRUPO_CANAL` (`id_grupo`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
  FOREIGN KEY (`USUARIO_id_usuario`)
   REFERENCES `mydb`.`USUARIO` (`id_usuario`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
   );

-- Table `mydb`.`MENSAGEM`
CREATE TABLE IF NOT EXISTS `mydb`.`MENSAGEM` (
  `id_mensagem` INT NOT NULL AUTO_INCREMENT,
  `conteudo` TEXT(1000) NOT NULL,
  `data_envio` DATETIME NOT NULL,
  `USUARIO_id_usuario` INT NOT NULL,
  `GRUPO_CANAL_id_grupo` INT NOT NULL,
  PRIMARY KEY (`id_mensagem`),
  FOREIGN KEY (`USUARIO_id_usuario`)
   REFERENCES `mydb`.`USUARIO` (`id_usuario`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
  FOREIGN KEY (`GRUPO_CANAL_id_grupo`)
   REFERENCES `mydb`.`GRUPO_CANAL` (`id_grupo`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);

-- Table `mydb`.`COMENTARIO`
CREATE TABLE IF NOT EXISTS `mydb`.`COMENTARIO` (
  `id_comentario` INT NOT NULL AUTO_INCREMENT,
  `texto` VARCHAR(500) NOT NULL,
  `data_comentario` DATETIME NOT NULL,
  `MENSAGEM_id_mensagem` INT NOT NULL,
  `USUARIO_id_usuario` INT NOT NULL,
  `COMENTARIO_id_comentario` INT NOT NULL,
  PRIMARY KEY (`id_comentario`),
  FOREIGN KEY (`MENSAGEM_id_mensagem`)
   REFERENCES `mydb`.`MENSAGEM` (`id_mensagem`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
  FOREIGN KEY (`USUARIO_id_usuario`)
   REFERENCES `mydb`.`USUARIO` (`id_usuario`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
  FOREIGN KEY (`COMENTARIO_id_comentario`)
   REFERENCES `mydb`.`COMENTARIO` (`id_comentario`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);

-- Table `mydb`.`REAÇÃO_CURTIDA`
CREATE TABLE IF NOT EXISTS `mydb`.`REAÇÃO_CURTIDA` (
  `id_reacao` INT NOT NULL AUTO_INCREMENT,
  `tipo_reacao` VARCHAR(25) NOT NULL,
  `data_reacao` DATETIME NULL,
  `MENSAGEM_id_mensagem` INT NOT NULL,
  `USUARIO_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_reacao`),
  FOREIGN KEY (`MENSAGEM_id_mensagem`)
   REFERENCES `mydb`.`MENSAGEM` (`id_mensagem`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
  FOREIGN KEY (`USUARIO_id_usuario`)
   REFERENCES `mydb`.`USUARIO` (`id_usuario`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
