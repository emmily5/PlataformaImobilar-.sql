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
