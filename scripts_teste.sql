-- ========================================================
-- 1. Verificar quais são os usuários que estão cadastrados em um determinado grupo
--EX: Quais são os usuários que estão cadastrados no grupo "Banco de Dados":
-- ========================================================
SELECT 
    u.id_usuario,
    gc.nome AS nome_grupo,
    u.nome AS nome_utilizador,
    u.username,
    u.email,
    mg.data_entrada
FROM `mydb`.`MEMBRO_GRUPO` mg
JOIN `mydb`.`USUARIO` u ON mg.USUARIO_id_usuario = u.id_usuario
JOIN `mydb`.`GRUPO_CANAL` gc ON mg.GRUPO_CANAL_id_grupo = gc.id_grupo
WHERE mg.GRUPO_CANAL_id_grupo = 2
ORDER BY mg.data_entrada ASC;
