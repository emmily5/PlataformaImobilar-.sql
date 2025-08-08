CREATE TABLE Usuario (
  idusuario INTEGER   NOT NULL ,
  nome VARCHAR    ,
  cpf VARCHAR(11)    ,
  email VARCHAR    ,
  detalhes VARCHAR      ,
PRIMARY KEY(idusuario));



CREATE TABLE Perfil_Anunciante (
  idPerfil_Anunciante INTEGER   NOT NULL ,
  idusuario INTEGER   NOT NULL ,
  porcentagemNegociacao INTEGER    ,
  notaReputação INTEGER    ,
  qntImoveis INTEGER    ,
  ultimoContrato DATE    ,
  primeiroContrato DATE    ,
  tipoAnunciante VARCHAR      ,
PRIMARY KEY(idPerfil_Anunciante),
  FOREIGN KEY(idusuario)
    REFERENCES Usuario(idusuario));



CREATE TABLE Telefone (
  idTelefone INTEGER   NOT NULL ,
  idusuario INTEGER   NOT NULL ,
  ddd VARCHAR    ,
  numeroTelefone VARCHAR      ,
PRIMARY KEY(idTelefone),
  FOREIGN KEY(idusuario)
    REFERENCES Usuario(idusuario));



CREATE TABLE Perfil_Cliente (
  idperfil_cliente INTEGER   NOT NULL ,
  idusuario INTEGER   NOT NULL ,
  biografia VARCHAR    ,
  precoMedio INTEGER    ,
  qntAvaliacoes INTEGER      ,
PRIMARY KEY(idperfil_cliente),
  FOREIGN KEY(idusuario)
    REFERENCES Usuario(idusuario));



CREATE TABLE Configuracoes (
  idConfiguracoes INTEGER   NOT NULL ,
  Usuario_idusuario INTEGER   NOT NULL ,
  senha VARCHAR    ,
  dataCriacao DATE    ,
  isActive BOOL    ,
  notificacao BOOL    ,
  temaApp INTEGER      ,
PRIMARY KEY(idConfiguracoes),
  FOREIGN KEY(Usuario_idusuario)
    REFERENCES Usuario(idusuario));



CREATE TABLE Imovel (
  idImovel INTEGER   NOT NULL ,
  idAnunciante INTEGER   NOT NULL ,
  nome VARCHAR    ,
  descricao VARCHAR    ,
  qntQuartos INTEGER    ,
  qntBanheiros INTEGER    ,
  metragem INTEGER    ,
  isDisponivel BOOL    ,
  valor INTEGER      ,
  tipoImovel VARCHAR,
PRIMARY KEY(idImovel),
  FOREIGN KEY(idAnunciante)
    REFERENCES Perfil_Anunciante(idPerfil_Anunciante));


CREATE TABLE Endereco (
  idEndereco INTEGER   NOT NULL ,
  idImovel INTEGER   NOT NULL ,
  cep VARCHAR    ,
  logradouro VARCHAR    ,
  rua VARCHAR    ,
  bairro VARCHAR    ,
  cidade VARCHAR    ,
  estado VARCHAR      ,
PRIMARY KEY(idEndereco),
  FOREIGN KEY(idImovel)
    REFERENCES Imovel(idImovel));



CREATE TABLE Apartamento (
  idApartamento INTEGER   NOT NULL ,
  idImovel INTEGER   NOT NULL ,
  andar INTEGER    ,
  elevador BOOL    ,
  descricaoLazer VARCHAR    ,
  valorCondominio INTEGER    ,
  garagem BOOL      ,
PRIMARY KEY(idApartamento),
  FOREIGN KEY(idImovel)
    REFERENCES Imovel(idImovel));



CREATE TABLE Casa (
  idCasa INTEGER   NOT NULL ,
  idImovel INTEGER   NOT NULL ,
  isCondominio BOOL    ,
  qntPavimentos INTEGER    ,
  totalTerreno INTEGER    ,
  quintal BOOL      ,
PRIMARY KEY(idCasa),
  FOREIGN KEY(idImovel)
    REFERENCES Imovel(idImovel));



CREATE TABLE Comercial (
  idComercial INTEGER   NOT NULL ,
  idImovel INTEGER   NOT NULL ,
  qntSalas INTEGER    ,
  elevador BOOL    ,
  almoxarifado BOOL    ,
  estacionamento VARCHAR      ,
PRIMARY KEY(idComercial),
  FOREIGN KEY(idImovel)
    REFERENCES Imovel(idImovel));



CREATE TABLE Anuncio (
  idAnuncio INTEGER   NOT NULL ,
  idImovel INTEGER   NOT NULL ,
  idAnunciante INTEGER   NOT NULL ,
  dataAnuncio DATE    ,
  isVisivel BOOL      ,
  tipoAnuncio VARCHAR , 
  descricaoAnuncio VARCHAR , 
PRIMARY KEY(idAnuncio),
  FOREIGN KEY(idAnunciante)
    REFERENCES Perfil_Anunciante(idPerfil_Anunciante),
  FOREIGN KEY(idImovel)
    REFERENCES Imovel(idImovel));


CREATE TABLE Proposta (
  idProposta INTEGER   NOT NULL ,
  idAnuncio INTEGER   NOT NULL ,
  idcliente INTEGER   NOT NULL ,
  valorInicial VARCHAR    ,
  valorProposta VARCHAR    ,
  dataProposta INTEGER    ,
  observacoes VARCHAR    ,
  isAceita BOOL      ,
PRIMARY KEY(idProposta),
  FOREIGN KEY(idcliente)
    REFERENCES Perfil_Cliente(idperfil_cliente),
  FOREIGN KEY(idAnuncio)
    REFERENCES Anuncio(idAnuncio));



CREATE TABLE AvaliacaoFinal (
  idAvaliacaoFinal INTEGER   NOT NULL ,
  idProposta INTEGER   NOT NULL ,
  nota INTEGER    ,
  comentario VARCHAR    ,
  dataAvaliacao DATE      ,
PRIMARY KEY(idAvaliacaoFinal),
  FOREIGN KEY(idProposta)
    REFERENCES Proposta(idProposta));



CREATE TABLE Contrato (
  idContrato INTEGER   NOT NULL ,
  idProposta INTEGER   NOT NULL ,
  tipoContrato VARCHAR    ,
  valorFinal INTEGER    ,
  documentacao VARCHAR    ,
  isFinalizado BOOL    ,
  porcentagemAnunciante INTEGER    ,
  dataFinalizacao DATE      ,
PRIMARY KEY(idContrato),
  FOREIGN KEY(idProposta)
    REFERENCES Proposta(idProposta));


CREATE TABLE Partes (
  idPartes INTEGER   NOT NULL ,
  idContrato INTEGER   NOT NULL ,
  nomeComprador VARCHAR    ,
  nomeProprietario VARCHAR    ,
  conjugeComprador BOOL    ,
  nomeConjComprador VARCHAR    ,
  conjugeProprietario BOOL    ,
  nomeConjProprietario VARCHAR      ,
PRIMARY KEY(idPartes),
  FOREIGN KEY(idContrato)
    REFERENCES Contrato(idContrato));



CREATE TABLE Venda (
  idVenda INTEGER   NOT NULL ,
  idContrato INTEGER   NOT NULL ,
  nomeProprietario VARCHAR    ,
  valorEntrada VARCHAR    ,
  parcelamento INTEGER    ,
  dataEscritura DATE      ,
PRIMARY KEY(idVenda),
  FOREIGN KEY(idContrato)
    REFERENCES Contrato(idContrato));



CREATE TABLE Aluguel (
  idAluguel INTEGER   NOT NULL ,
  idContrato INTEGER   NOT NULL ,
  dataFim DATE    ,
  caucao VARCHAR    ,
  duracao INTEGER    ,
  renovacao BOOL      ,
PRIMARY KEY(idAluguel),
  FOREIGN KEY(idContrato)
    REFERENCES Contrato(idContrato));


-- Inserir usuários
INSERT INTO Usuario (idusuario, nome, cpf, email) VALUES 
(1, 'Ana Maria Lima', '12345678901', 'limamaria@bol.com'),
(2, 'Gabrielle Borja', '98765432109', 'gabiborja@gmail.com'),
(3, 'Emilly Miller', '34529088709', 'milleremilly@gmail.com'),
(4, 'José Oliveira', '01244533305', 'joseoli@gmail.com'),
(5, 'Mariana Timbó', '12144539801', 'mariitimbo@hotmail.com'),
(6, 'Flawbert Lorran', '88732156709', 'flawberttt@outlook.com'),
(7, 'Andriel Fernandes', '33409123805', 'andrielvinicius@gmail.com'),
(8, 'Anna Clarice Batista', '65972102308', 'anninha_0901@hotmail.com'),
(9, 'Alice Barbosa', '18234882909', 'licevbm@gmail.com'),
(10, 'Luiz Augusto Lopes', '87223156802', 'contatoluizlopes@outlook.com');

-- Inserir perfis
INSERT INTO Perfil_Anunciante (idPerfil_Anunciante, idusuario, porcentagemNegociacao, notaReputação, 
qntImoveis, primeiroContrato, ultimoContrato, tipoAnunciante) VALUES (1, 1, 12, 3, 2,CURRENT_DATE - INTERVAL '1 year', CURRENT_DATE - INTERVAL '2 months', 'Profissional');
INSERT INTO Perfil_Anunciante (idPerfil_Anunciante, idusuario, porcentagemNegociacao, notaReputação, 
qntImoveis, primeiroContrato, ultimoContrato, tipoAnunciante) VALUES (2, 4, 8, 4, 3,CURRENT_DATE - INTERVAL '3 years', CURRENT_DATE - INTERVAL '6 months', 'Profissional');
INSERT INTO Perfil_Anunciante (idPerfil_Anunciante, idusuario, porcentagemNegociacao, notaReputação, 
qntImoveis, primeiroContrato, ultimoContrato, tipoAnunciante) VALUES (3, 6, 15, 5, 1,CURRENT_DATE - INTERVAL '1 month', CURRENT_DATE - INTERVAL '1 month', 'Iniciante');
INSERT INTO Perfil_Anunciante (idPerfil_Anunciante, idusuario, porcentagemNegociacao, notaReputação, 
qntImoveis, primeiroContrato, ultimoContrato, tipoAnunciante) VALUES (4, 10, 10, 2, 2,CURRENT_DATE - INTERVAL '9 months', CURRENT_DATE - INTERVAL '8 months', 'Intermediario');


INSERT INTO Perfil_Cliente (idperfil_cliente, idusuario, biografia, precoMedio, qntAvaliacoes) VALUES (1, 2, 'Interesse em casa ampla para compra ou apartamento de luxo para aluguel', 12000, 2);
INSERT INTO Perfil_Cliente (idperfil_cliente, idusuario, biografia, precoMedio, qntAvaliacoes) VALUES (2, 3, 'Procuro sala comercial com bom acesso para alugar', 6000, 0);
INSERT INTO Perfil_Cliente (idperfil_cliente, idusuario, biografia, precoMedio, qntAvaliacoes) VALUES (3, 5, 'Interesse em casa de campo para comprar ou salas comerciais para alugar', 2500, 3);
INSERT INTO Perfil_Cliente (idperfil_cliente, idusuario, biografia, precoMedio, qntAvaliacoes) VALUES (4, 7, 'Buscando kitnet mobiliada perto da universidade para alugar', 1500, 1);
INSERT INTO Perfil_Cliente (idperfil_cliente, idusuario, biografia, precoMedio, qntAvaliacoes) VALUES (5, 8, 'Quero apartamento comprado na planta para compra em condomínio', 228000, 2);
INSERT INTO Perfil_Cliente (idperfil_cliente, idusuario, biografia, precoMedio, qntAvaliacoes) VALUES (6, 9, 'Apto com vista para o mar, ideal para aluguel de médio prazo', 10000, 1);



-- Imóveis disponíveis e indisponíveis
INSERT INTO Imovel (idImovel, idAnunciante, nome, valor, isDisponivel, descricao, qntQuartos, qntBanheiros, metragem, tipoImovel) VALUES
(1, 1, 'Casa Terrea', 350000, TRUE, 'Casa ampla e ventilada', 3, 2, 140, 'Casa'),
(2, 1, 'Apartamento Luxo', 10000, FALSE, 'Apartamento beira mar', 4, 5, 210, 'Apartamento'),
(3, 2, 'Salão Comercial', 5000, TRUE, 'Salão em rua', 1, 1, 32, 'Comercial'),
(4, 2, 'Salão Comercial Luxo', 15000, FALSE, 'Sala ampla em shopping', 1, 1, 60, 'Comercial'),
(5, 2, 'Meia Sala Comercial', 2000, TRUE, 'Sala com coshare', 1, 1, 15, 'Comercial'),
(6, 3, 'Casa anos 90', 580000, FALSE, 'Casa de campo dos anos 90', 5, 3, 430, 'Casa'),
(7, 4, 'Apartamento Kitnet', 1200, FALSE, 'Kitnet mobiliada', 1, 1, 24, 'Apartamento'),
(8, 4, 'Apartamento recém-entregue', 200000, TRUE, 'Apto vazio primeiro dono', 2, 2, 75, 'Apartamento');


-- Inserir endereço
INSERT INTO Endereco (idEndereco, idImovel, cidade, estado) VALUES
(1, 1, 'Natal', 'RN'),
(2, 2, 'Mossoró', 'RN'),
(3, 3, 'Natal', 'RN'),
(4, 4, 'Mossoró', 'RN'),
(5, 5, 'Parnamirim', 'RN'),
(6, 6, 'Natal', 'RN'),
(7, 7, 'Mossoró', 'RN'),
(8, 8, 'Parnamirim', 'RN');



INSERT INTO Casa (idCasa, idImovel, isCondominio, qntPavimentos, totalTerreno, quintal)
VALUES (1, 1, TRUE, 1, 200, TRUE);
INSERT INTO Casa (idCasa, idImovel, isCondominio, qntPavimentos, totalTerreno, quintal)
VALUES (2, 6, FALSE, 2, 480, TRUE);

INSERT INTO Apartamento (idApartamento, idImovel, andar, elevador, descricaoLazer, valorCondominio, garagem)
VALUES (1, 2, 12, TRUE, 'Piscina, salão de festas, academia', 1800, TRUE);
INSERT INTO Apartamento (idApartamento, idImovel, andar, elevador, descricaoLazer, valorCondominio, garagem)
VALUES (2, 7, 2, FALSE, 'Próxima à universidade, com área de convivência', 100, FALSE);
INSERT INTO Apartamento (idApartamento, idImovel, andar, elevador, descricaoLazer, valorCondominio, garagem)
VALUES (3, 8, 5, TRUE, 'Playground, portaria 24h', 750, TRUE);

INSERT INTO Comercial (idComercial, idImovel, qntSalas, elevador, almoxarifado, estacionamento)
VALUES (1, 3, 2, FALSE, TRUE, '2 vagas');
INSERT INTO Comercial (idComercial, idImovel, qntSalas, elevador, almoxarifado, estacionamento)
VALUES (2, 4, 4, TRUE, TRUE, 'Estacionamento interno');
INSERT INTO Comercial (idComercial, idImovel, qntSalas, elevador, almoxarifado, estacionamento)
VALUES (3, 5, 1, TRUE, FALSE, 'Compartilhado com coworking');



-- Inserir anúncio
INSERT INTO Anuncio (idAnuncio, idImovel, idAnunciante, dataAnuncio, isVisivel, tipoAnuncio, descricaoAnuncio) VALUES
(1, 1, 1, CURRENT_DATE - INTERVAL '1 month', TRUE, 'VENDA','Vendo casa terrea, ampla e ventilada, 350000 documentacao em dia'),
(2, 2, 1, CURRENT_DATE - INTERVAL '3 months', FALSE, 'ALUGUEL', 'Apartamento de luxo com acesso à praia disponivel para aluguel 210m2 10000 por mês'),
(3, 3, 2, CURRENT_DATE - INTERVAL '1 week', TRUE, 'ALUGUEL', 'Alugo sala comercial com acesso a rua 5000 por mês'),
(4, 4, 2, CURRENT_DATE - INTERVAL '6 months', FALSE, 'ALUGUEL', 'Salão comercial em shopping, amplo e já reformado disponivel para aluguel 15000'),
(5, 5, 2, CURRENT_DATE - INTERVAL '1 year', TRUE, 'ALUGUEL', '2000 reais: Alugo sala comercial dividida com coworking para setor de alimentacao 15m2'),
(6, 6, 3, CURRENT_DATE - INTERVAL '2 months', FALSE, 'VENDA', 'Venda: Casa de campo dos anos 90 580000'),
(7, 7, 4, CURRENT_DATE - INTERVAL '3 weeks', FALSE, 'ALUGUEL', 'Kitnet estudantil mobiliada perto da universidade 1200 condominio 100'),
(8, 8, 4, CURRENT_DATE - INTERVAL '2 months', TRUE, 'VENDA', 'Vendo apartamento recém entregue, comprado na planta, 75m2 200000');



-- PROPOSTAS (vinculadas a diferentes anúncios e clientes)
INSERT INTO Proposta (idProposta, idAnuncio, idcliente, valorInicial, valorProposta, dataProposta, observacoes, isAceita) VALUES 
(1, 1, 1, '330000', '350000', 20240620, 'Negociando valor final', TRUE),
(2, 3, 2, '4500', '5000', 20240622, 'Fechado aluguel por 12 meses', TRUE),
(3, 5, 3, '1800', '2000', 20240615, 'Aceita com desconto', TRUE),
(4, 2, 1, '9500', '10000', 20240618, 'Tentando renegociar', TRUE),
(5, 5, 3, '1700', '1800', 20240610, 'Proposta de aluguel finalizada', TRUE),
(6, 6, 3, '550000', '580000', 20240530, 'Compra direta aceita', TRUE),
(7, 7, 4, '1000', '1200', 20240612, 'Kitnet no centro', TRUE),
(8, 8, 5, '190000', '200000', 20240601, 'Apto novo em condomínio', TRUE),
(9, 1, 5, '300000', '330000', 20240525, 'Revisando proposta', TRUE),
(10, 2, 6, '9500', '9800', 20240605, 'Discutindo valores ainda', TRUE);

-- AVALIAÇÕES (ativa triggers de nota e reputação)
INSERT INTO AvaliacaoFinal (idAvaliacaoFinal, idProposta, nota, comentario, dataAvaliacao) VALUES 
(1, 1, 5, 'Ótimo atendimento!', CURRENT_DATE),
(2, 2, 4, 'Anunciante prestativo', CURRENT_DATE - INTERVAL '1 day'),
(3, 3, 2, 'Não respondeu rapidamente', CURRENT_DATE - INTERVAL '2 day'),
(4, 4, 4, 'Anunciante flexível com valores.', CURRENT_DATE - INTERVAL '3 day'),
(5, 5, 3, 'Negociação razoável, mas demorou.', CURRENT_DATE - INTERVAL '10 day'),
(6, 6, 5, 'Atendimento excelente, recomendo.', CURRENT_DATE - INTERVAL '15 day'),
(7, 7, 4, 'Boa comunicação, imóvel limpo.', CURRENT_DATE - INTERVAL '4 day'),
(8, 8, 5, 'Imóvel exatamente como anunciado.', CURRENT_DATE - INTERVAL '5 day'),
(9, 9, 4, 'Negociação bem conduzida.', CURRENT_DATE - INTERVAL '6 day'),
(10, 10, 3, 'Anunciante educado, mas indeciso.', CURRENT_DATE - INTERVAL '1 day');

-- CONTRATOS (vendas e aluguéis distintos)
INSERT INTO Contrato (idContrato, idProposta, tipoContrato, valorFinal, documentacao, isFinalizado, porcentagemAnunciante, dataFinalizacao) VALUES 
(1, 1, 'Venda', 350000, 'Contrato assinado digitalmente', FALSE, 12, NULL),
(2, 2, 'Aluguel', 5000, 'Contrato de aluguel eletrônico', FALSE, 10, NULL),
(3, 3, 'Aluguel', 2000, 'Contrato simples de locação', TRUE, 10, CURRENT_DATE - INTERVAL '2 month'),
(4, 4, 'Aluguel', 10000, 'Contrato locação digital', TRUE, 10, CURRENT_DATE - INTERVAL '1 month'),
(5, 5, 'Aluguel', 1800, 'Contrato padrão', FALSE, 10, CURRENT_DATE - INTERVAL '2 month'),
(6, 6, 'Venda', 580000, 'Contrato de venda com cartório', FALSE, 12, NULL),
(7, 7, 'Aluguel', 1200, 'Contrato curto prazo', TRUE, 10, CURRENT_DATE),
(8, 8, 'Venda', 200000, 'Contrato eletrônico com autenticação', FALSE, 8, NULL),
(9, 9, 'Venda', 330000, 'Contrato físico assinado', TRUE, 10, CURRENT_DATE - INTERVAL '1 month'),
(10, 10, 'Aluguel', 9800, 'Contrato digital via sistema', FALSE, 10, NULL);


-- VENDAS (vinculadas a contratos do tipo Venda)
INSERT INTO Venda (idVenda, idContrato, nomeProprietario, valorEntrada, parcelamento, dataEscritura) VALUES 
(1, 1, 'Ana Maria Lima', '70000', 24, CURRENT_DATE + INTERVAL '1 month'),
(2, 6, 'José Oliveira', '80000', 36, CURRENT_DATE + INTERVAL '2 months'),
(3, 8, 'Ana Maria Lima', '50000', 24, CURRENT_DATE + INTERVAL '1 month'),
(4, 9, 'Ana Maria Lima', '100000', 12, CURRENT_DATE - INTERVAL '15 day');

-- ALUGUEIS (vinculados a contratos do tipo Aluguel)
INSERT INTO Aluguel (idAluguel, idContrato, dataFim, caucao, duracao, renovacao) VALUES 
(1, 2, CURRENT_DATE + INTERVAL '1 year', '1000', 12, TRUE),
(2, 3, CURRENT_DATE - INTERVAL '1 month', '500', 6, FALSE),
(3, 4, CURRENT_DATE + INTERVAL '6 months', '1000', 6, TRUE),
(4, 5, CURRENT_DATE + INTERVAL '12 months', '800', 12, FALSE),
(5, 7, CURRENT_DATE + INTERVAL '3 months', '400', 3, TRUE),
(6, 10, CURRENT_DATE + INTERVAL '18 months', '1500', 18, TRUE);

-- PARTES (dados de envolvidos nos contratos)
INSERT INTO Partes (idPartes, idContrato, nomeComprador, nomeProprietario, conjugeComprador, nomeConjComprador, conjugeProprietario, nomeConjProprietario) VALUES 
(1, 1, 'Gabrielle Borja', 'Ana Maria Lima', TRUE, 'Carlos Borja', FALSE, NULL),
(2, 2, 'Emilly Miller', 'José Oliveira', FALSE, NULL, TRUE, 'Maria Oliveira');

-- TELEFONES
INSERT INTO Telefone (idTelefone, idusuario, ddd, numeroTelefone) VALUES 
(1, 1, '84', '987654321'),
(2, 2, '84', '998877665'),
(3, 3, '11', '912345678');

-- CONFIGURAÇÕES DE CONTA
INSERT INTO Configuracoes (idConfiguracoes, Usuario_idusuario, senha, dataCriacao, isActive, notificacao, temaApp) VALUES 
(1, 1, 'senha123', CURRENT_DATE - INTERVAL '2 year', TRUE, TRUE, 1),
(2, 2, 'senha456', CURRENT_DATE - INTERVAL '6 months', TRUE, FALSE, 2),
(3, 3, 'senha789', CURRENT_DATE - INTERVAL '1 year', TRUE, TRUE, 3);


--Validação da Nota (CHECK Constraint) Garantir que as notas estejam sempre entre 1 e 5
ALTER TABLE AvaliacaoFinal
ADD CONSTRAINT chk_nota_avaliacao 
CHECK (nota >= 1 AND nota <= 5);

--Triggers

CREATE EXTENSION IF NOT EXISTS pg_trgm;

--Calcular similaridade anuncio -> biografia do cliente
CREATE OR REPLACE FUNCTION verificar_similaridade_proposta()
RETURNS TRIGGER AS $$
DECLARE
    grau_similaridade NUMERIC;
    descricao_anuncio TEXT;
    texto_cliente TEXT;
BEGIN
    -- descrição do anúncio
    SELECT a.descricaoAnuncio INTO descricao_anuncio
    FROM Anuncio a
    WHERE a.idAnuncio = NEW.idAnuncio;

    -- biografia + precoMedio do cliente
    SELECT CONCAT(pf.biografia, ' ', pf.precoMedio) INTO texto_cliente
    FROM perfil_cliente pf
    WHERE pf.idPerfil_Cliente = NEW.idCliente;

    SELECT similarity(descricao_anuncio, texto_cliente) INTO grau_similaridade;
    RAISE NOTICE 'Similaridade da nova proposta : %.', 
        grau_similaridade;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE or replace TRIGGER trg_similaridade_proposta
AFTER INSERT ON Proposta
FOR EACH ROW
EXECUTE FUNCTION verificar_similaridade_proposta();


-- Calcular similaridade contrato -> anuncio
CREATE OR REPLACE FUNCTION mostrar_similaridade_contrato()
RETURNS TRIGGER AS $$
DECLARE
    grau_similaridade NUMERIC;
    descricao_anuncio TEXT;
    contrato_info TEXT;
BEGIN
    IF NEW.isFinalizado = TRUE AND OLD.isFinalizado = FALSE THEN
        -- descrição do anúncio
        SELECT a.descricaoAnuncio INTO descricao_anuncio
        FROM Proposta p
        JOIN Anuncio a ON a.idAnuncio = p.idAnuncio
        WHERE p.idProposta = NEW.idProposta;

        --  contrato (tipo + valor)
        contrato_info := CONCAT(NEW.tipoContrato, NEW.valorFinal);
 
 		SELECT similarity(descricao_anuncio, contrato_info) INTO grau_similaridade;
    	RAISE NOTICE 'Similaridade entre contrato e anúncio : %.', 
        	grau_similaridade;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_mostrar_similaridade_contrato
AFTER UPDATE ON Contrato
FOR EACH ROW
EXECUTE FUNCTION mostrar_similaridade_contrato();


--PRA O CLIENTE AVALIAR O ANUNCIANTE 
CREATE OR REPLACE FUNCTION criar_avaliacao_vazia()
RETURNS TRIGGER AS $$
DECLARE
    novo_id INTEGER;
BEGIN
    -- Gerar novo id (se não usar SERIAL ou IDENTITY)
    SELECT COALESCE(MAX(idAvaliacaoFinal), 0) + 1 INTO novo_id FROM AvaliacaoFinal;

    -- Inserir avaliação com campos vazios e data atual
    INSERT INTO AvaliacaoFinal (idAvaliacaoFinal, idProposta, nota, comentario, dataAvaliacao)
    VALUES (novo_id, NEW.idProposta, NULL, NULL, CURRENT_DATE);

    RAISE NOTICE 'Avaliação em aberto criada';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE or replace TRIGGER trg_criar_avaliacao_vazia
AFTER INSERT ON Contrato
FOR EACH ROW
EXECUTE FUNCTION criar_avaliacao_vazia();


-- Validar proprietário do contrato
CREATE OR REPLACE FUNCTION verificar_anunciante_imovel()
RETURNS TRIGGER AS $$
DECLARE
    id_anunciante_imovel INTEGER;
BEGIN
    SELECT idAnunciante INTO id_anunciante_imovel
    FROM Imovel
    WHERE idImovel = NEW.idImovel;

    -- Comparar com o anunciante informado no anúncio
    IF NEW.idAnunciante IS DISTINCT FROM id_anunciante_imovel THEN
        RAISE EXCEPTION 'O anunciante do anúncio (%), não é o mesmo do imóvel (%)', 
            NEW.idAnunciante, id_anunciante_imovel;
    END IF;

    RAISE NOTICE 'Anunciante validado: imóvel e anúncio com mesmo anunciante (%).', NEW.idAnunciante;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_verificar_anunciante_imovel
BEFORE INSERT OR UPDATE ON Anuncio
FOR EACH ROW
EXECUTE FUNCTION verificar_anunciante_imovel();


-- Função para atualizar disponibilidade do imóvel 
CREATE OR REPLACE FUNCTION atualizar_disponibilidade_imovel()
RETURNS TRIGGER AS $$
DECLARE
    id_imovel_alvo INTEGER;
BEGIN
    -- Verificar se o contrato foi finalizado
    IF NEW.isFinalizado THEN
        -- Obter o ID do imóvel relacionado ao contrato
        SELECT a.idImovel INTO id_imovel_alvo
        FROM Proposta p
        JOIN Anuncio a ON p.idAnuncio = a.idAnuncio
        WHERE p.idProposta = NEW.idProposta;

        -- Atualizar a disponibilidade do imóvel para FALSE (indisponível)
        UPDATE Imovel 
        SET isDisponivel = FALSE 
        WHERE idImovel = id_imovel_alvo;
        
        RAISE NOTICE 'Disponibilidade do imóvel ID % atualizada para indisponível devido ao contrato finalizado', id_imovel_alvo;
    ELSE
        RAISE NOTICE 'Contrato não finalizado - disponibilidade do imóvel mantida';
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_atualizar_disponibilidade_imovel
AFTER INSERT OR UPDATE ON Contrato
FOR EACH ROW
EXECUTE FUNCTION atualizar_disponibilidade_imovel();


-- Impedir contratos duplicados 
CREATE OR REPLACE FUNCTION impedir_contratos_duplicados()
RETURNS TRIGGER AS $$
DECLARE
    id_imovel_alvo INTEGER;
    existe_contrato_ativo INTEGER;
    imovel_disponivel BOOLEAN;
BEGIN
    -- Obtém o ID do imóvel e sua disponibilidade
    SELECT 
        a.idImovel, 
        i.isDisponivel 
    INTO 
        id_imovel_alvo,
        imovel_disponivel
    FROM Proposta p
    JOIN Anuncio a ON p.idAnuncio = a.idAnuncio
    JOIN Imovel i ON a.idImovel = i.idImovel
    WHERE p.idProposta = NEW.idProposta;

    -- Verifica se o imóvel está disponível
    IF NOT imovel_disponivel THEN
        RAISE EXCEPTION 'Não é possível criar contrato. O imóvel ID % não está disponível.', id_imovel_alvo;
    END IF;

    -- Verifica se já existe contrato ativo para o mesmo imóvel
    SELECT COUNT(*) INTO existe_contrato_ativo
    FROM Contrato c
    JOIN Proposta p ON p.idProposta = c.idProposta
    JOIN Anuncio a ON p.idAnuncio = a.idAnuncio
    WHERE a.idImovel = id_imovel_alvo AND c.isFinalizado = FALSE;

    IF existe_contrato_ativo > 0 THEN
        RAISE EXCEPTION 'Já existe um contrato ativo para este imóvel (ID: %).', id_imovel_alvo;
    END IF;
    
    RAISE NOTICE 'Verificação concluída: imóvel ID % está disponível e sem contratos ativos.', id_imovel_alvo;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_impedir_contratos_duplicados
BEFORE INSERT ON Contrato
FOR EACH ROW
EXECUTE FUNCTION impedir_contratos_duplicados();

-- Validar data do aluguel
CREATE OR REPLACE FUNCTION validar_data_aluguel()
RETURNS TRIGGER AS $$
DECLARE
    data_contrato DATE;
BEGIN
    SELECT dataFinalizacao INTO data_contrato
    FROM Contrato
    WHERE idContrato = NEW.idContrato;

    -- Validar se a data de fim do aluguel é anterior à do contrato
    IF NEW.dataFim < data_contrato THEN
        RAISE EXCEPTION 'A data de fim do aluguel (%), não pode ser anterior à data de finalização do contrato (%).', NEW.dataFim, data_contrato;
    END IF;

    RAISE NOTICE 'Data do aluguel validada com sucesso: dataFim = %, dataFinalizacao = %', NEW.dataFim, data_contrato;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE or replace TRIGGER trg_validar_data_aluguel
BEFORE INSERT OR UPDATE ON Aluguel
FOR EACH ROW
EXECUTE FUNCTION validar_data_aluguel();

-- Validar tipo de contrato (Aluguel/Venda)
CREATE OR REPLACE FUNCTION validar_tipo_contrato()
RETURNS TRIGGER AS $$
DECLARE
    tipo_contrato VARCHAR;
BEGIN
    -- Obter o tipo de contrato da tabela Contrato
    SELECT c.tipoContrato INTO tipo_contrato
    FROM Contrato c
    WHERE c.idContrato = NEW.idContrato;
    
    -- Verificar consistência para Aluguel
    IF TG_TABLE_NAME = 'aluguel' AND tipo_contrato != 'Aluguel' THEN
        RAISE EXCEPTION 'Tipo de contrato inconsistente. Esperado: Aluguel, Encontrado: %', tipo_contrato;
    END IF;
    
    -- Verificar consistência para Venda
    IF TG_TABLE_NAME = 'venda' AND tipo_contrato != 'Venda' THEN
        RAISE EXCEPTION 'Tipo de contrato inconsistente. Esperado: Venda, Encontrado: %', tipo_contrato;
    END IF;
    
    RAISE NOTICE 'Tipo de contrato validado com sucesso para % (Tipo: %)', TG_TABLE_NAME, tipo_contrato;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_tipo_aluguel
BEFORE INSERT OR UPDATE ON Aluguel
FOR EACH ROW
EXECUTE FUNCTION validar_tipo_contrato();
CREATE TRIGGER trg_validar_tipo_venda
BEFORE INSERT OR UPDATE ON Venda
FOR EACH ROW
EXECUTE FUNCTION validar_tipo_contrato();



--VIEWS

-- CALCULA E MOSTRA AS NOTAS DOS ANUNCIANTES
-- CAMPO CALCULAVEL 
CREATE OR REPLACE VIEW vw_reputacao_anunciante AS
SELECT 
  pa.idPerfil_Anunciante,
  u.nome AS nomeAnunciante,
  COUNT(af.idAvaliacaoFinal) AS totalAvaliacoes,
  ROUND(AVG(af.nota)::numeric, 2) AS reputacao_atual
FROM Perfil_Anunciante pa
JOIN Usuario u ON u.idUsuario = pa.idUsuario
JOIN Imovel i ON i.idAnunciante = pa.idPerfil_Anunciante
JOIN Anuncio a ON a.idImovel = i.idImovel
JOIN Proposta p ON p.idAnuncio = a.idAnuncio
JOIN AvaliacaoFinal af ON af.idProposta = p.idProposta
GROUP BY pa.idPerfil_Anunciante, u.nome;

--MOSTRA AS CASAS DISPONIVEIS
-- COM ENDERECO, DETALHES DO IMOVEL, E DA CASA
CREATE OR REPLACE VIEW vw_casas_disponiveis AS
SELECT 
    i.idImovel,
    i.nome,
    i.valor,
    i.descricao,
    i.qntQuartos,
    i.qntBanheiros,
    i.metragem,
    e.cidade,
    e.estado,
    c.isCondominio,
    c.qntPavimentos,
    c.totalTerreno,
    c.quintal
FROM Imovel i
JOIN Endereco e ON i.idImovel = e.idImovel
JOIN Casa c ON i.idImovel = c.idImovel
WHERE i.isDisponivel = TRUE
ORDER BY i.valor DESC;

--MOSTRA OS APARTAMENTOS DISPONIVEIS
-- COM ENDERECO, DETALHES DO IMOVEL, E DO APARTAMENTO
CREATE OR REPLACE VIEW vw_apartamentos_disponiveis AS
SELECT 
    i.idImovel,
    i.nome,
    i.valor,
    i.descricao,
    i.qntQuartos,
    i.qntBanheiros,
    i.metragem,
    e.cidade,
    e.estado,
    ap.andar,
    ap.elevador,
    ap.descricaoLazer,
    ap.valorCondominio,
    ap.garagem
FROM Imovel i
JOIN Endereco e ON i.idImovel = e.idImovel
JOIN Apartamento ap ON i.idImovel = ap.idImovel
WHERE i.isDisponivel = TRUE
ORDER BY i.valor DESC;

--MOSTRA OS COMERCIAIS DISPONIVEIS
-- COM ENDERECO, DETALHES DO IMOVEL, E DO COMERCIAL
CREATE OR REPLACE VIEW vw_comerciais_disponiveis AS
SELECT 
    i.idImovel,
    i.nome,
    i.valor,
    i.descricao,
    i.qntQuartos,
    i.qntBanheiros,
    i.metragem,
    e.cidade,
    e.estado,
    co.qntSalas,
    co.elevador,
    co.almoxarifado,
    co.estacionamento
FROM Imovel i
JOIN Endereco e ON i.idImovel = e.idImovel
JOIN Comercial co ON i.idImovel = co.idImovel
WHERE i.isDisponivel = TRUE
ORDER BY i.valor DESC;

--CONTRATOS ATIVOS
CREATE OR REPLACE VIEW vw_contratos_ativos AS
SELECT 
    c.idContrato,
    c.tipoContrato,
    c.valorFinal,
    c.dataFinalizacao,
    p.dataProposta,
    i.nome AS nome_imovel,
    u.nome AS nome_cliente
FROM Contrato c
JOIN Proposta p ON c.idProposta = p.idProposta
JOIN Anuncio a ON p.idAnuncio = a.idAnuncio
JOIN Imovel i ON a.idImovel = i.idImovel
JOIN Perfil_Cliente pc ON p.idcliente = pc.idperfil_cliente
JOIN Usuario u ON pc.idusuario = u.idusuario
WHERE c.isFinalizado = FALSE;

--DETALHES DOS CONTRATOS
CREATE OR REPLACE VIEW vw_detalhes_contrato AS
SELECT 
  c.idContrato,
  c.tipoContrato,
  c.valorFinal,
  c.porcentagemAnunciante,
  c.isFinalizado,
  p.dataProposta,
  i.nome AS nome_imovel,
  pa.tipoAnunciante,
  u.nome AS nome_anunciante,
  uc.nome AS nome_cliente
FROM Contrato c
JOIN Proposta p ON c.idProposta = p.idProposta
JOIN Anuncio a ON p.idAnuncio = a.idAnuncio
JOIN Imovel i ON a.idImovel = i.idImovel
JOIN Perfil_Anunciante pa ON i.idAnunciante = pa.idPerfil_Anunciante
JOIN Usuario u ON pa.idusuario = u.idusuario
JOIN Perfil_Cliente pc ON p.idcliente = pc.idperfil_cliente
JOIN Usuario uc ON pc.idusuario = uc.idusuario;

--IMOVEIS ORDENADOS POR ANUNCIANTES
CREATE OR REPLACE VIEW vw_imoveis_por_anunciante AS
SELECT 
    pa.idPerfil_Anunciante,
    u.nome AS nome_anunciante,
    i.idImovel,
    i.nome AS nome_imovel,
    i.valor,
    i.metragem,
    i.isDisponivel
FROM Perfil_Anunciante pa
JOIN Usuario u ON pa.idusuario = u.idusuario
JOIN Imovel i ON i.idAnunciante = pa.idPerfil_Anunciante;

--DETALHES DOS CONTRATOS FINALIZADOS
--COM INFO DAS PARTES ENVOLVIDAS
CREATE OR REPLACE VIEW vw_partes_contrato_finalizados AS
SELECT
    c.idContrato,
    c.tipoContrato,
    c.valorFinal,
    c.dataFinalizacao,

    -- Dados legais formais do contrato
    pt.nomeComprador,
    pt.conjugeComprador,
    pt.nomeConjComprador,
    pt.nomeProprietario,
    pt.conjugeProprietario,
    pt.nomeConjProprietario

FROM Contrato c
JOIN Proposta p ON c.idProposta = p.idProposta
JOIN Anuncio a ON p.idAnuncio = a.idAnuncio
JOIN Perfil_Cliente cli ON p.idCliente = cli.idPerfil_Cliente
JOIN Usuario u_cli ON cli.idUsuario = u_cli.idUsuario
JOIN Perfil_Anunciante anu ON a.idAnunciante = anu.idPerfil_Anunciante
JOIN Usuario u_anu ON anu.idUsuario = u_anu.idUsuario
JOIN Partes pt ON pt.idContrato = c.idContrato
WHERE c.isFinalizado = TRUE;

--PROPOSTAS 
--COM INFO DO ANUNCIANTE, CLIENTE, ANUNCIO E IMOVEL
CREATE OR REPLACE VIEW vw_propostas_completa AS
SELECT
    p.idProposta,
    p.valorInicial,
    p.valorProposta,
    p.dataProposta,
    p.observacoes,
    p.isAceita,
    u_cli.nome AS nomeCliente,
    u_anu.nome AS nomeAnunciante,
    i.idImovel,
    i.valor AS valorImovel,
    i.metragem,
    i.tipoimovel,
    e.cidade,
    a.idAnuncio,
    a.tipoAnuncio,
    a.dataAnuncio

FROM Proposta p
JOIN Anuncio a ON p.idAnuncio = a.idAnuncio
JOIN Imovel i ON a.idImovel = i.idImovel
JOIN Endereco e ON i.idImovel = e.idImovel
JOIN Perfil_Cliente cli ON p.idCliente = cli.idPerfil_Cliente
JOIN Usuario u_cli ON cli.idUsuario = u_cli.idUsuario
JOIN Perfil_Anunciante anu ON a.idAnunciante = anu.idPerfil_Anunciante
JOIN Usuario u_anu ON anu.idUsuario = u_anu.idUsuario;
