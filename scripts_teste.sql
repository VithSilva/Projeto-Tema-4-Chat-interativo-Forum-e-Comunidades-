-- ========================================================
-- 3. INSERIR DADOS DE TESTE (MOCK DATA)
-- ========================================================

-- Inserir Tipos de Perfil
INSERT INTO `mydb`.`TIPO_PERFIL` (`nome`, `descricao`) VALUES 
('Administrador', 'Acesso total a todas as configurações e moderação do sistema.'),
('Moderador', 'Pode gerir mensagens e comentários.'),
('Membro', 'Utilizador comum.');

-- Inserir Grupos / Canais
INSERT INTO `mydb`.`GRUPO_CANAL` (`nome`, `descricao`, `data_criacao`) VALUES 
('Programação Web', 'Espaço para dúvidas de HTML, CSS e Flask.', NOW()),
('Banco de Dados', 'Discussões sobre modelagem SQL e MySQL.', NOW()),
('Geral', 'Conversas livres.', NOW());

-- Inserir Utilizadores
INSERT INTO `mydb`.`USUARIO` (`nome`, `email`, `senha`, `username`, `data_cadastro`, `TIPO_PERFIL_id_perfil`, `GRUPO_CANAL_id_grupo`) VALUES 
('Vinicius Silva', 'vinicius@email.com', 'hash1', 'vini_dev', NOW(), 1, 1),
('Ana Souza', 'ana@email.com', 'hash2', 'anasouza', NOW(), 2, 2),
('Carlos Eduardo', 'carlos@email.com', 'hash3', 'carlosedu', NOW(), 3, 1),
('Mariana Lima', 'mariana@email.com', 'hash4', 'marilima', NOW(), 3, 3);

-- Inserir Membros dos Grupos
INSERT INTO `mydb`.`MEMBRO_GRUPO` (`data_entrada`, `GRUPO_CANAL_id_grupo`, `USUARIO_id_usuario`) VALUES 
(NOW(), 1, 1),
(NOW(), 2, 1),
(NOW(), 2, 2),
(NOW(), 1, 3);

-- Inserir Mensagens
INSERT INTO `mydb`.`MENSAGEM` (`conteudo`, `data_envio`, `USUARIO_id_usuario`, `GRUPO_CANAL_id_grupo`) VALUES 
('Olá pessoal! Alguém me sabe dizer como estruturar chaves estrangeiras?', NOW(), 1, 1),
('Sim, Vinicius! Deves usar a restrição FOREIGN KEY.', NOW(), 3, 1),
('Bom dia a todos!', NOW(), 2, 2);

-- Inserir Comentários
INSERT INTO `mydb`.`COMENTARIO` (`texto`, `data_comentario`, `MENSAGEM_id_mensagem`, `USUARIO_id_usuario`, `COMENTARIO_id_comentario`) VALUES 
('Obrigado pela explicação, Carlos!', NOW(), 2, 1, NULL),
('De nada, Vinicius!', NOW(), 2, 3, 1),
('Bom dia Mariana!', NOW(), 3, 4, NULL);

-- Inserir Reações / Curtidas
INSERT INTO `mydb`.`REACAO_CURTIDA` (`tipo_reacao`, `data_reacao`, `MENSAGEM_id_mensagem`, `USUARIO_id_usuario`) VALUES 
('Gosto', NOW(), 1, 2),
('Amei', NOW(), 2, 1);
