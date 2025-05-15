
-- Query 1: Quantos médicos trabalham e cada bloco...
SELECT b.nome AS bloco, COUNT(*) AS n_medicos 
FROM bloco AS b
JOIN (SELECT d.ID_Departamento, f.nome, d.ID_Bloco
		FROM departamento AS d
		JOIN funcionario AS f ON f.ID_Departamento=d.ID_Departamento) AS c
ON b.ID_Bloco = c.ID_Bloco
GROUP BY b.ID_Bloco;


-- Query 2: Quantos pacientes estão no estado crítico...
SELECT COUNT(*) AS quantidade
FROM paciente
WHERE id_grupo = 5;


-- Query 3: Quais pacientes tiveram consultas com a Ângela Barros...
SELECT c.Data_hora, p.nome, c.Diagnostico
FROM consulta AS c
LEFT JOIN paciente AS p ON p.ID_Paciente = c.ID_Paciente
WHERE c.ID_Funcionario = 3;

-- Query 4: Quantas vezes foram prescritos medicamentos fabricados por cada marca...
SELECT m.fabricante, COUNT(*) AS Quantidade
FROM receita AS r
JOIN medicamento AS m ON r.ID_Medicamento = m.ID_Medicamento
GROUP BY m.fabricante;

-- Query 5: Quantos exames foram feitos por cada funcionário...
SELECT f.nome AS médico, COUNT(*) AS Quantidade
FROM exame AS e
LEFT JOIN funcionario AS f ON e.ID_Funcionario = f.ID_funcionario
GROUP BY f.nome;

