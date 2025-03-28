-- Criação da estrutura do banco de dados
CREATE TABLE professor (
    codigo INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE turma (
    codigo INTEGER PRIMARY KEY,
    numero INTEGER,
    nível VARCHAR(50),
    cod_prof_responsavel INTEGER,
    nome_turma VARCHAR(50),
    
    CONSTRAINT fk_professor 
        FOREIGN KEY(cod_prof_responsavel) 
        REFERENCES professor(codigo)
);

CREATE TABLE aluno (
    codigo INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    dt_nascimento DATE,
    cod_turma INTEGER,
    
    CONSTRAINT fk_turma 
        FOREIGN KEY(cod_turma) 
        REFERENCES turma(codigo)
);

-- Atividade 1: Inserir professores
INSERT INTO professor (codigo, nome, email) VALUES
(1, 'João Souza', 'joao.souza@email.com'),
(2, 'Mariana Silva', 'mariana.silva@email.com'),
(3, 'Carlos Mendes', 'carlos.mendes@email.com');

-- Atividade 2: Inserir turmas
INSERT INTO turma (codigo, numero, nível, nome_turma, cod_prof_responsavel) VALUES
(1, 101, 'Fundamental', 'Turma A', 1),   -- João Souza
(2, 102, 'Médio', 'Turma B', 2);        -- Mariana Silva

-- Atividade 3: Atualizar e-mail do João
UPDATE professor 
SET email = 'joao.souza@novaemail.com' 
WHERE codigo = 1;

-- Atividade 4: Inserir alunos (nome = número conforme especificado)
INSERT INTO aluno (codigo, nome, dt_nascimento, cod_turma) VALUES
(1001, '1001', '2007-03-10', 1),  -- Turma A
(1002, '1002', '2006-11-25', 1),
(2001, '2001', '2005-09-14', 2),  -- Turma B
(2002, '2002', '2005-01-07', 2);

-- Atividade 5: Atualizar turma do aluno 1002
UPDATE aluno 
SET cod_turma = 2 
WHERE codigo = 1002;

-- Atividade 6: Nova turma (Turma C)
INSERT INTO turma (codigo, numero, nível, nome_turma, cod_prof_responsavel) VALUES
(3, 103, 'Fundamental', 'Turma C', 3);  -- Carlos Mendes

-- Atividade 7: Renomear turma 102
UPDATE turma 
SET nome_turma = 'Turma Avançada B' 
WHERE codigo = 2;

-- Atividade 8: Novos alunos na Turma C
INSERT INTO aluno (codigo, nome, dt_nascimento, cod_turma) VALUES
(3001, '3001', '2007-06-21', 3),
(3002, '3002', '2006-12-12', 3);

-- Atividade 9: Mudar responsável da Turma A
UPDATE turma 
SET cod_prof_responsavel = 3  -- Carlos Mendes
WHERE codigo = 1;

-- Atividade 10: Novo professor e atualização da turma 103
INSERT INTO professor (codigo, nome, email) VALUES
(4, 'Ana Costa', 'ana.costa@email.com');

UPDATE turma 
SET 
    nome_turma = 'Turma Fundamental C Avançada',
    nível = 'Fundamental Avançado'
WHERE codigo = 3;  -- Turma 103