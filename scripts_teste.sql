-- ========================================================
-- 3. INSERIR DADOS DE TESTE (MOCK DATA)
-- ========================================================

-- Inserir Tipos de Perfil
INSERT INTO `mydb`.`TIPO_PERFIL` (`nome`, `descricao`) VALUES 
('Administrador', 'Acesso total a todas as configurações e moderação do sistema.'),
('Moderador', 'Pode gerir mensagens e comentários.'),
('Membro', 'Utilizador comum.');

-- Inserir Grupos / Canais
INSERT INTO `mydb`.`GRUPO_CANAL` (`nome`, `descricao`) VALUES 
('Programação Web', 'Espaço para dúvidas de HTML, CSS e Flask.'),
('Banco de Dados', 'Discussões sobre modelagem SQL e MySQL.'),
('Geral', 'Conversas livres.');

-- Inserir Utilizadores
INSERT INTO `mydb`.`USUARIO` (`nome`, `email`, `senha`, `username`, `TIPO_PERFIL_id_perfil`, `GRUPO_CANAL_id_grupo`) VALUES 
('Vinicius Silva', 'vinicius@email.com', 'hash1', 'vini_dev', 1, 1),
('Ana Souza', 'ana@email.com', 'hash2', 'anasouza', 2, 2),
('Carlos Eduardo', 'carlos@email.com', 'hash3', 'carlosedu', 3, 1),
('Mariana Lima', 'mariana@email.com', 'hash4', 'marilima', 3, 3);

-- Inserir Membros dos Grupos
INSERT INTO `mydb`.`MEMBRO_GRUPO` (`GRUPO_CANAL_id_grupo`, `USUARIO_id_usuario`) VALUES 
(1, 1),
(2, 1),
(2, 2),
(1, 3);

-- Inserir Mensagens
INSERT INTO `mydb`.`MENSAGEM` (`conteudo`, `USUARIO_id_usuario`, `GRUPO_CANAL_id_grupo`) VALUES 
('Olá pessoal! Alguém me sabe dizer como estruturar chaves estrangeiras?', 1, 1),
('Sim, Vinicius! Deves usar a restrição FOREIGN KEY.', 3, 1),
('Bom dia a todos!', 2, 2);

-- Inserir Comentários
INSERT INTO `mydb`.`COMENTARIO` (`texto`, `MENSAGEM_id_mensagem`, `USUARIO_id_usuario`, `COMENTARIO_id_comentario`) VALUES 
('Obrigado pela explicação, Carlos!', 2, 1, NULL),
('De nada, Vinicius!', 2, 3, 1),
('Bom dia Mariana!', 3, 4, NULL);

-- Inserir Reações / Curtidas
INSERT INTO `mydb`.`REACAO_CURTIDA` (`tipo_reacao`, `MENSAGEM_id_mensagem`, `USUARIO_id_usuario`) VALUES 
('Gosto', 1, 2),
('Amei', 2, 1);
