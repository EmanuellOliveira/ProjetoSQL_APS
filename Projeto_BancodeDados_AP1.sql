CREATE DATABASE projetoBD;
USE projetoBD;
DROP DATABASE projetoBD;

CREATE TABLE cliente(
	ID_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    empresa VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    telefone_celular VARCHAR(20) NOT NULL
    );
    
INSERT INTO cliente (nome, empresa, email, telefone_celular)
VALUES
	("Hemera", "Lumis Hemera S.A.", "hemera_lumis@gmail.com", "(85)98543-2345"),
    ("Éris", "Construtora Éris", "construtora_eris@gmail.com", "(65)98887-6535"),
    ("Geras", "Lar de idosos Geras", "lar_geras@gmail.com", "(43)96587-9999"),
    ("Hipnos", "Hipnos Colchões LTDA", "colchoes_hipnos@gmail.com", "(43)9557-9652"),
	("Harmonia", "Advogada Harmonia", "harmonia_advogada@gmail.com", "(53)9877-4333");
    
CREATE TABLE equipe(
	ID_equipe INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    descricao TEXT NOT NULL
    );
    
INSERT INTO equipe (nome, descricao)
VALUES
	("Alfa", "Equipe responsável pelo Levantamento e Análise de Requisitos."),
    ("Bravo", "Equipe responsável pelo Design do projeto."),
    ("Charlie", "Equipe responsável pela implementação."),
    ("Delta", "Equipe responsável pelos testes do projeto."),
    ("Echo", "Equipe responsável pela implantação do projeto."),
    ("Fox", "Equipe responsável pela Manutenção do projeto.");

CREATE TABLE etapa(
	ID_etapa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL, 
    descricao TEXT NOT NULL,
    ID_equipe INT NOT NULL UNIQUE,
    FOREIGN KEY (ID_equipe) REFERENCES equipe(ID_equipe)
    );
    
INSERT INTO etapa (nome, descricao, ID_equipe)
VALUES
	("Etapa de Requisitos", "Nessa etapa, os requisitos do software são coletados a partir de reuniões com o cliente ou usuários finais do sistema. Os requisitos são documentados e utilizados para orientar o desenvolvimento do software.", 1),
    ("Etapa de Design do projeto", "O design do software é criado com base nos requisitos e análise, incluindo a arquitetura, interfaces e fluxo de dados.", 2),
    ("Etapa de Implementação", "Nessa etapa, o software é programado e testado para garantir que esteja funcionando corretamente.", 3),
    ("Etapa de Testes", "O software é testado para garantir que atenda aos requisitos e funcione de forma esperada. Isso pode incluir testes de unidade, testes de integração, testes de aceitação do usuário, entre outros.", 4),
    ("Etapa de Implantação", "O software é preparado para ser implantado no ambiente de produção, incluindo a instalação, configuração e treinamento do usuário final.", 5),
    ("Etapa de Manutenção", "Depois que o software é implantado, ele requer manutenção contínua para corrigir bugs, adicionar novos recursos e atualizar a funcionalidade.", 6);

CREATE TABLE projetos(
	ID_projeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    data_inicio DATE NOT NULL,
    data_final DATE NOT NULL,
    orcamento decimal(10,2) NOT NULL,
    status VARCHAR(30),
    ID_cliente INT NOT NULL,
    FOREIGN KEY (ID_cliente) REFERENCES cliente(ID_cliente)
    );

    
INSERT INTO projetos (nome, descricao, data_inicio, data_final, orcamento, status, ID_cliente)
VALUES
	("Sistema de gestão de energia", "Monitorização e controlo de consumo de energia em tempo real.", "2020-01-01", "2022-04-24", 10000.00, "Finalizado", 1),
    ("Sistema de inteligência artificial", "Prever falhas em equipamentos de iluminação, permitindo manutenção preventiva e reduzindo custos.", "2023-04-10", "2024-04-10", 15000.00, "Iniciado", 1),
	("Aplicativo para gestão de projetos de construção", "Permite que os clientes possam acompanhar em tempo real o andamento da obra.", "2021-11-19", "2025-05-24", 20000.00, "Em andamento", 2),
    ("Aplicativo de monitoramento de saúde para idosos", "Permite que os cuidadores possam acompanhar em tempo real os sinais vitais e fornecer cuidados mais personalizados.", "2019-05-20", "2024-03-05", 35000.00, "Em andamento", 3),
    ("Sistema de gestão de processos judiciais", "Permite que os clientes possam acompanhar em tempo real o andamento de seus casos.", "2023-05-03", "2025-03-15", 20000.00,"Iniciado", 5),
    ("Aplicativo para simulação de sono", "Permite que os clientes possam testar diferentes tipos de colchão virtualmente.", "2023-02-10", "2024-11-09", 25000.00, "Em andamento", 4),
    ("Plataforma de treinamento para funcionários", "Fornece cursos online para aprimoramento das habilidades técnicas e de segurança.", "2023-01-23", "2025-12-11", 10000.00, "Em andamento", 2),
    ("Sistema de agendamento automatizado", "Para consultas médicas, simplificando o processo de marcação de consultas para os idosos.", "2023-03-04", "2024-03-04", 20000.00, "Em andamento", 3),
    ("Aplicativo para agendar consultas", "Permite que os clientes possam agendar uma consulta com a advogada Harmonia de forma rápida e fácil.", "2022-01-03", "2023-03-24", 25000.00, "Finalizado", 5),
    ("Sistema de gestão de inventário automatizado", "Capaz de monitorar o estoque de colchões em tempo real e facilitar o processo de reposição.", "2022-06-06", "2023-05-15", 27000.00, "Em andamento", 4);

CREATE TABLE etapas_projeto(
	ID_etapasprojeto INT PRIMARY KEY AUTO_INCREMENT,
	ID_projeto INT NOT NULL,
    ID_etapa INT NOT NULL,
    status_etapa VARCHAR(50) NOT NULL,
    data_inicio DATE NOT NULL,
    data_final DATE NOT NULL,
    FOREIGN KEY (ID_projeto) REFERENCES projetos(ID_projeto),
    FOREIGN KEY (ID_etapa) REFERENCES etapa(ID_etapa)
    );
    
INSERT INTO etapas_projeto (ID_projeto, ID_etapa, status_etapa, data_inicio, data_final)
VALUES
	(1, 6, "Finalizando", "2022-01-24", "2022-04-24"),
    (2, 1, "Iniciando", "2023-04-10", "2023-07-10"),
    (3, 5, "Andamento", "2024-03-14", "2024-11-12"),
    (4, 3, "Andamento", "2020-03-20", "2021-03-20"),
    (5, 1, "Náo iniciado", "2023-05-03", "2023-07-03"),
    (6, 2, "Andamento", "2023-08-10", "2023-12-10"),
    (7, 4, "Finalizando", "2024-07-11", "2024-11-11"),
    (8, 2, "Iniciando", "2023-09-04", "2024-01-04"),
    (9, 6, "Finalizando", "2022-11-24", "2023-03-24"),
    (10, 4, "Andamento", "2022-07-15", "2022-11-15");

CREATE TABLE membros_de_equipe(
	ID_membros INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefone_celular VARCHAR(20) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    ID_equipe INT NOT NULL,
    FOREIGN KEY (ID_equipe) REFERENCES equipe(ID_equipe)
    );

INSERT INTO membros_de_equipe (nome, email, telefone_celular, cargo, ID_equipe)
VALUES
	("João Silva", "joao.silva@gmail.com", "(11)99999-1111", "Analista de Requisitos", 1),
    ("Maria Santos", "maria.santos@gmail.com", "(11)99999-2222", "Especialista em Levantamento de Requisitos", 1),
    ("Pedro Oliveira", "pedro.oliveira@gmail.com", "(11)99999-3333", "Coordenador de Requisitos", 1),
    ("Carla Costa", "carla.costa@gmail.com", "(11)99999-4444", "Analista de Negócios", 1),
    ("Rafael Souza", "rafael.souza@gmail.com", "(11)99999-5555", "Especialista em Requisitos", 1),
    ("Lucas Lima", "lucas.lima@gmail.com", "(11)77777-1111", "Designer de Interfaces", 2),
    ("Mariana Castro", "mariana.castro@gmail.com", "(11)99999-8888", "Desenvolvedor Back-End", 2),
    ("Guilherme Santos", "guilherme.santos@gmail.com", "(11)99999-9999", "Desenvolvedor Front-End", 2),
    ("Mariana Alves", "mariana.alves@gmail.com", "(11)77777-2222", "Especialista em UX/UI", 2),
    ("José Santos", "jose.santos@gmail.com", "(11)77777-3333", "Coordenador de Design", 2),
    ("Gabriel Fernandes", "gabriel.fernandes@gmail.com", "(11)77777-4444", "Analista de Desenvolvimento", 3),
    ("Luana Silva", "luana.silva@gmail.com", "(11)77777-5555", "Especialista em Desenvolvimento", 3),
    ("Aline Costa", "aline.costa@gmail.com", "(11)77777-6666", "Coordenadora de Implementação", 3),
    ("Victor Lima", "victor.lima@gmail.com", "(11)88888-1111", "Gerente de Projeto", 3),
    ("Carlos Oliveira", "carlos.oliveira@gmail.com", "(11)77777-1111", "Analista de Sistemas", 4),
    ("Felipe Sousa", "felipe.sousa@gmail.com", "(11)77777-3333", "Desenvolvedor .NET", 4),
    ("Renata Santos", "renata.santos@gmail.com", "(11)77777-4444", "Analista de Testes Automatizados", 4),
    ("Luciana Oliveira", "luciana.oliveira@gmail.com", "(11)77777-5555", "Gerente de TI", 4),
    ("Marcelo Almeida", "marcelo.almeida@gmail.com", "(11)88888-1111", "Especialista em Implantação", 5),
    ("Renata Oliveira", "renata.oliveira@gmail.com", "(11)88888-2222", "Coordenadora de Implantação", 5),
    ("Andréa Silva", "andrea.silva@gmail.com", "(11)77777-5555", "Especialista em Manutenção", 6),
    ("Henrique Oliveira", "henrique.oliveira@gmail.com", "(11)77777-6666", "Analista de Sistemas", 6),
    ("Fernanda Castro", "fernanda.castro@gmail.com", "(11)77777-7777", "Coordenadora de Manutenção", 6),
    ("Gustavo Costa", "gustavo.costa@gmail.com", "(11)77777-8888", "Analista de Suporte Técnico", 6);


-- VIEW 1 --

CREATE VIEW view_projetos_cliente AS
SELECT projetos.nome AS "Nome do projeto" , projetos.orcamento AS "Orçamento do Projeto", cliente.nome AS "Nome do Cliente", cliente.empresa AS "Empresa do Cliente"
FROM projetos
JOIN cliente
ON projetos.ID_cliente = cliente.ID_cliente;

SELECT * FROM view_projetos_cliente;

-- VIEW 2 --

 CREATE VIEW view_equipe_etapas AS
 SELECT equipe.nome AS "Equipe responsável", etapa.nome AS "Nome da Etapa", etapa.descricao "Descrição da Etapa"
 FROM equipe
 JOIN etapa
 ON etapa.ID_equipe = equipe.ID_equipe;

SELECT * FROM view_equipe_etapas;

-- VIEW 3 --

CREATE VIEW view_membros_equipe AS
SELECT membros_de_equipe.nome AS "Nome dos Membros", membros_de_equipe.cargo AS "Cargo do Membro", equipe.nome AS "Nome da equipe do membro"
FROM membros_de_equipe
JOIN equipe
ON membros_de_equipe.ID_equipe = equipe.ID_equipe;

SELECT * FROM view_membros_equipe;

-- STORED PROCEDURE 1 --

DELIMITER //
CREATE PROCEDURE inserir_cliente(
	IN c_nome VARCHAR(30),
    IN c_empresa VARCHAR(30),
    IN c_email VARCHAR(30),
    IN c_telefone_celular VARCHAR(20)
)
BEGIN
	INSERT INTO cliente (nome, empresa, email, telefone_celular)
    VALUES (c_nome, c_empresa, c_email, c_telefone_celular);
END //
DELIMITER ;

CALL inserir_cliente ("SEILA", "SEILA", "SEILA@SEILA", "99192318");
SELECT * FROM cliente;

-- STORED PROCEDURE 2 --

DELIMITER //
CREATE PROCEDURE atualizar_cliente(
	IN c_id_cliente INT,
    IN c_nome VARCHAR(30),
    IN c_empresa VARCHAR(30),
    IN c_email VARCHAR(30),
    IN c_telefone_celular VARCHAR(20)
)
BEGIN
	UPDATE cliente
    SET nome = c_nome, empresa = c_empresa, email = c_email, telefone_celular = c_telefone_celular
    WHERE ID_cliente = c_id_cliente;
END //
DELIMITER ;

CALL atualizar_cliente(7, "ASDJASDJASD","ÄSDBHJASK","ASDASDAS","ADSDASD");
SELECT * FROM cliente;

-- STORED PROCEDURE 3 --

DELIMITER //
CREATE PROCEDURE excluir_cliente(
	IN c_id_cliente INT
)
BEGIN
	DELETE FROM cliente
    WHERE id_cliente = c_id_cliente;
END //
DELIMITER ;

CALL excluir_cliente(7);
SELECT * FROM cliente;

-- FUNCTION --

DELIMITER //
CREATE FUNCTION quant_projetos_por_cliente(q_id_cliente INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE total INT;
	SELECT COUNT(*) INTO total
    FROM projetos
    WHERE ID_cliente = q_id_cliente;
    
    RETURN total;
END //
DELIMITER ;

SELECT quant_projetos_por_cliente (2) AS "Quantidade de projetos do Cliente";

-- TRIGGERS -- 

DELIMITER //
CREATE TRIGGER atualizar_status_projeto
AFTER INSERT ON projetos
FOR EACH ROW
BEGIN
    IF NEW.data_inicio > CURDATE() THEN
        UPDATE projetos SET status = 'Pendente' WHERE ID_projeto = NEW.ID_projeto;
    ELSEIF NEW.data_final < CURDATE() THEN
        UPDATE projetos SET status = 'Atrasado' WHERE ID_projeto = NEW.ID_projeto;
    ELSE
        UPDATE projetos SET status = 'Em andamento' WHERE ID_projeto = NEW.ID_projeto;
    END IF;
END //
CREATE TRIGGER atualizar_status_projeto_update
AFTER UPDATE ON projetos
FOR EACH ROW
BEGIN
    IF NEW.data_inicio > CURDATE() THEN
        UPDATE projetos SET status = 'Pendente' WHERE ID_projeto = NEW.ID_projeto;
    ELSEIF NEW.data_final < CURDATE() THEN
        UPDATE projetos SET status = 'Atrasado' WHERE ID_projeto = NEW.ID_projeto;
    ELSE
        UPDATE projetos SET status = 'Em andamento' WHERE ID_projeto = NEW.ID_projeto;
    END IF;
END //
DELIMITER ;

SELECT * FROM projetos;

-----------------------------------

UPDATE clientes SET email = 'emailteste@gmail.com' WHERE ID_cliente = 1;