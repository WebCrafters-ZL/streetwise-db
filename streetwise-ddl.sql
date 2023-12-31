CREATE DATABASE STREETWISE;

GO 

USE STREETWISE;

GO 

CREATE TABLE PESSOA (
    PES_INT_ID INT NOT NULL IDENTITY(1, 1),
    PES_STR_NOME VARCHAR(125) NOT NULL,
    PES_DAT_NASCIMENTO DATE NOT NULL,
    PES_STR_GENERO VARCHAR(15),
    PES_STR_RG VARCHAR(9) NOT NULL,
    PES_STR_CPF CHAR(11) NOT NULL,
    CONSTRAINT PK_PESSOA_ID PRIMARY KEY(PES_INT_ID),
    CONSTRAINT UK_PESSOA_CPF UNIQUE(PES_STR_CPF)
  );

GO 

CREATE TABLE ESTILO (
    EST_INT_ID INT NOT NULL IDENTITY(1, 1),
    EST_STR_NOME VARCHAR(40) NOT NULL,
    CONSTRAINT PK_ESTILO_ID PRIMARY KEY(EST_INT_ID)
  );

GO 

CREATE TABLE DDD (
    DDD_INT_ID INT NOT NULL IDENTITY(1, 1),
    DDD_STR_NUMERO CHAR(2) NOT NULL,
    CONSTRAINT PK_DDD_ID PRIMARY KEY(DDD_INT_ID),
    CONSTRAINT UK_DDD_NUMERO UNIQUE(DDD_STR_NUMERO)
  );

GO 

CREATE TABLE TIPO_LOGRADOURO (
    TPL_INT_ID INT NOT NULL IDENTITY(1, 1),
    TPL_STR_DESCRICAO VARCHAR(40) NOT NULL,
    CONSTRAINT PK_TIPOLOGR_ID PRIMARY KEY(TPL_INT_ID)
  );

GO 

CREATE TABLE UF (
    UF_INT_ID INT NOT NULL IDENTITY(1, 1),
    UF_STR_NOME VARCHAR(40) NOT NULL,
    UF_STR_SIGLA CHAR(2) NOT NULL,
    CONSTRAINT PK_UF_IF PRIMARY KEY(UF_INT_ID),
    CONSTRAINT UK_UF_SIGLA UNIQUE(UF_STR_SIGLA)
  );

GO 

CREATE TABLE MUNICIPIO (
    MUN_INT_ID INT NOT NULL IDENTITY(1, 1),
    MUN_STR_NOME VARCHAR(25) NOT NULL,
    UF_INT_ID INT NOT NULL,
    CONSTRAINT PK_MUNICIPIO_ID PRIMARY KEY(MUN_INT_ID),
    CONSTRAINT FK_UF_MUNICIPIO FOREIGN KEY(UF_INT_ID) REFERENCES UF(UF_INT_ID)
  );

GO 

CREATE INDEX IDX_UF_MUNICIPIO ON MUNICIPIO(UF_INT_ID);

GO 

CREATE TABLE TATUADOR (
    TTR_INT_ID INT NOT NULL IDENTITY(1, 1),
    PES_INT_ID INT NOT NULL,
    TTR_DAT_ADMISSAO DATE NOT NULL,
    TTR_DAT_DESLIGAMENTO DATE,
    CONSTRAINT PK_TATUADOR_ID PRIMARY KEY(TTR_INT_ID),
    CONSTRAINT UK_PESSOA_TATUADOR UNIQUE(PES_INT_ID),
    CONSTRAINT FK_PESSOA_TATUADOR FOREIGN KEY(PES_INT_ID) REFERENCES PESSOA(PES_INT_ID)
  );

GO 

CREATE TABLE HORARIO_ATENDIMENTO (
    ATE_INT_ID INT NOT NULL IDENTITY(1, 1),
    TTR_INT_ID INT NOT NULL,
    ATE_STR_DIA CHAR(3) NOT NULL,
    ATE_TIM_INICIO TIME NOT NULL,
    ATE_TIM_FIM TIME NOT NULL,
    CONSTRAINT PK_ATEND_ID PRIMARY KEY(ATE_INT_ID),
    CONSTRAINT FK_TATUADOR_HORARIO_ATEND FOREIGN KEY(TTR_INT_ID) REFERENCES TATUADOR(TTR_INT_ID)
  );

GO 

CREATE INDEX IDX_TATUADOR_HORARIO_ATEND ON HORARIO_ATENDIMENTO(TTR_INT_ID);

GO 

CREATE TABLE EMAIL (
    EMA_INT_ID INT NOT NULL IDENTITY(1, 1),
    EMA_STR_ENDERECO VARCHAR(70) NOT NULL,
    PES_INT_ID INT NOT NULL,
    CONSTRAINT PK_EMAIL_ID PRIMARY KEY(EMA_INT_ID), 
    CONSTRAINT UK_PESSOA_EMAIL UNIQUE(PES_INT_ID),
    CONSTRAINT UK_EMAIL_ENDERECO UNIQUE(EMA_STR_ENDERECO),
    CONSTRAINT FK_PESSOA_EMAIL FOREIGN KEY(PES_INT_ID) REFERENCES PESSOA(PES_INT_ID)
  );

GO 

CREATE INDEX IDX_PESSOA_EMAIL ON EMAIL(PES_INT_ID);

GO 

CREATE TABLE CONDICAO_PAGAMENTO (
    CON_INT_ID INT NOT NULL IDENTITY(1, 1),
    CON_STR_NOME VARCHAR(40) NOT NULL,
    CON_INT_QNT_PARCELAS INT NOT NULL,
    CONSTRAINT PK_CONDICAO_ID PRIMARY KEY(CON_INT_ID)
  );

GO 

CREATE TABLE CLIENTE (
    CLI_INT_ID INT NOT NULL IDENTITY(1, 1),
    PES_INT_ID INT NOT NULL,
    CLI_STR_HISTORICO TEXT,
    CONSTRAINT PK_CLIENTE_ID PRIMARY KEY(CLI_INT_ID),
    CONSTRAINT UK_PESSOA_CLIENTE UNIQUE(PES_INT_ID),
    CONSTRAINT FK_PESSOA_CLIENTE FOREIGN KEY(PES_INT_ID) REFERENCES PESSOA(PES_INT_ID)
  );

GO 

CREATE TABLE FICHA_ANAMNESE (
    ANA_INT_ID INT NOT NULL IDENTITY(1, 1),
    CLI_INT_ID INT NOT NULL,
    ANA_DAT_DATA_REGISTRO DATE NOT NULL,
    ANA_STR_INFO_MED TEXT NOT NULL,
    ANA_STR_COND_SAUDE TEXT NOT NULL,
    ANA_STR_ALERGIAS TEXT NOT NULL,
    ANA_STR_MEDICAMENTO_USO TEXT NOT NULL,
    ANA_STR_OBSERVACOES TEXT,
    CONSTRAINT PK_ANAMNESE_ID PRIMARY KEY(ANA_INT_ID),
    CONSTRAINT UK_CLIENTE_ANAMNESE UNIQUE(CLI_INT_ID),
    CONSTRAINT FK_CLIENTE_ANAMNESE FOREIGN KEY(CLI_INT_ID) REFERENCES CLIENTE(CLI_INT_ID)
  );

GO 

CREATE TABLE FORMA_PAGAMENTO (
    FOR_INT_ID INT NOT NULL IDENTITY(1, 1),
    FOR_STR_NOME VARCHAR(40) NOT NULL,
    CONSTRAINT PK_FORMA_ID PRIMARY KEY(FOR_INT_ID)
  );

GO 

CREATE TABLE PAGAMENTO (
    PAG_INT_ID INT NOT NULL IDENTITY(1, 1),
    FOR_INT_ID INT NOT NULL,
    CON_INT_ID INT NOT NULL,
    PAG_DTT_DATAHORA DATETIME NOT NULL,
    PAG_STR_NUM_TRANSACAO VARCHAR(8),
    PAG_STR_OBSERVACAO TEXT,
    CONSTRAINT PK_PAGAMENTO_ID PRIMARY KEY(PAG_INT_ID),
    CONSTRAINT FK_PAGAMENTO_FORMA FOREIGN KEY(FOR_INT_ID) REFERENCES FORMA_PAGAMENTO(FOR_INT_ID),
    CONSTRAINT FK_PAGAMENTO_CONDICAO FOREIGN KEY(CON_INT_ID) REFERENCES CONDICAO_PAGAMENTO(CON_INT_ID)
  );

GO 

CREATE TABLE TELEFONE (
    TEL_INT_ID INT NOT NULL IDENTITY(1, 1),
    PES_INT_ID INT NOT NULL,
    DDD_INT_ID INT NOT NULL,
    TEL_STR_NUMERO VARCHAR(9) NOT NULL,
    CONSTRAINT PK_TELEFONE_ID PRIMARY KEY(TEL_INT_ID),
    CONSTRAINT UK_PESSOA_TELEFONE UNIQUE(PES_INT_ID),
    CONSTRAINT FK_PESSOA_TELEFONE FOREIGN KEY(PES_INT_ID) REFERENCES PESSOA(PES_INT_ID),
    CONSTRAINT FK_DDD_TELEFONE FOREIGN KEY(DDD_INT_ID) REFERENCES DDD(DDD_INT_ID),
  );

GO 

CREATE INDEX IDX_PESSOA_TELEFONE ON TELEFONE(PES_INT_ID);

GO 

CREATE INDEX IDX_DDD_TELEFONE ON TELEFONE(DDD_INT_ID);

GO 

CREATE TABLE ESPECIALIZACAO (
    EST_INT_ID INT NOT NULL,
    TTR_INT_ID INT NOT NULL,
    CONSTRAINT FK_TATUADOR_ESPECIALIZACAO FOREIGN KEY(TTR_INT_ID) REFERENCES TATUADOR(TTR_INT_ID),
    CONSTRAINT FK_ESTILO_ESPECIALIZACAO FOREIGN KEY(EST_INT_ID) REFERENCES ESTILO(EST_INT_ID)
  );

GO 

CREATE INDEX IDX_TATUADOR_ESPECIALIZACAO ON ESPECIALIZACAO(TTR_INT_ID);

GO 

CREATE INDEX IDX_ESTILO_ESPECIALIZACAO ON ESPECIALIZACAO(EST_INT_ID);

GO 

CREATE TABLE ENDERECO (
    END_INT_ID INT NOT NULL IDENTITY(1, 1),
    TPL_INT_ID INT NOT NULL,
    END_STR_LOGRADOURO VARCHAR(70) NOT NULL,
    END_STR_NUMERO VARCHAR(6) NOT NULL,
    END_STR_BAIRRO VARCHAR(40) NOT NULL,
    END_STR_CEP CHAR(8) NOT NULL,
    MUN_INT_ID INT NOT NULL,    
    PES_INT_ID INT NOT NULL,
    CONSTRAINT PK_ENDERECO_ID PRIMARY KEY(END_INT_ID),
    CONSTRAINT UK_PESSOA_ENDERECO UNIQUE(PES_INT_ID),
    CONSTRAINT FK_PESSOA_ENDERECO FOREIGN KEY(PES_INT_ID) REFERENCES PESSOA(PES_INT_ID),
    CONSTRAINT FK_MUNICIPIO_ENDERECO FOREIGN KEY(MUN_INT_ID) REFERENCES MUNICIPIO(MUN_INT_ID),
    CONSTRAINT FK_TIPOLOGR_ENDERECO FOREIGN KEY(TPL_INT_ID) REFERENCES TIPO_LOGRADOURO(TPL_INT_ID)
  );

GO 

CREATE INDEX IDX_PESSOA_ENDERECO ON ENDERECO(PES_INT_ID);

GO 

CREATE INDEX IDX_MUNICIPIO_ENDERECO ON ENDERECO(MUN_INT_ID);

GO 

CREATE INDEX IDX_TIPOLOGR_ENDERECO ON ENDERECO(TPL_INT_ID);

GO 

CREATE TABLE TATUAGEM (
    TAT_INT_ID INT NOT NULL IDENTITY(1, 1),
    TAT_STR_NOME VARCHAR(75) NOT NULL,
    TAT_STR_TAMANHO VARCHAR(40) NOT NULL,
    TAT_STR_LOCAL_CORPO VARCHAR(70) NOT NULL,
    EST_INT_ID INT NOT NULL,
    PAG_INT_ID INT NOT NULL,
    TAT_STR_OBSERVACAO TEXT,
    CONSTRAINT PK_TATUAGEM_ID PRIMARY KEY(TAT_INT_ID),
    CONSTRAINT UK_PAGAMENTO_TATUAGEM UNIQUE(PAG_INT_ID),
    CONSTRAINT FK_ESTILO_TATUAGEM FOREIGN KEY(EST_INT_ID) REFERENCES ESTILO(EST_INT_ID),
    CONSTRAINT FK_PAGAMENTO_TATUAGEM FOREIGN KEY(PAG_INT_ID) REFERENCES PAGAMENTO(PAG_INT_ID)
  );

GO 

CREATE INDEX IDX_ESTILO_TATUAGEM ON TATUAGEM(EST_INT_ID);

GO 

CREATE TABLE ORCAMENTO (
    ORC_INT_ID INT NOT NULL IDENTITY(1, 1),
    ORC_DTT_DATAHORA DATETIME NOT NULL,
    CLI_INT_ID INT NOT NULL,
    TAT_INT_ID INT,
    ORC_DOU_VALOR DECIMAL(6, 2) NOT NULL,
    ORC_STR_OBSERVACAO TEXT,
    CONSTRAINT PK_ORCAMENTO_ID PRIMARY KEY(ORC_INT_ID),
    CONSTRAINT UK_TATUAGEM_ORCAMENTO UNIQUE(TAT_INT_ID),
    CONSTRAINT FK_CLIENTE_ORCAMENTO FOREIGN KEY(CLI_INT_ID) REFERENCES CLIENTE(CLI_INT_ID),
    CONSTRAINT FK_TATUAGEM_ORCAMENTO FOREIGN KEY(TAT_INT_ID) REFERENCES TATUAGEM(TAT_INT_ID)
  );

GO 

CREATE INDEX IDX_CLIENTE_ORCAMENTO ON ORCAMENTO(CLI_INT_ID);

GO 

CREATE TABLE SESSAO (
    SES_INT_ID INT NOT NULL IDENTITY(1, 1),
    SES_TIM_DURACAO TIME NOT NULL,
    TAT_INT_ID INT NOT NULL, 
    SES_STR_OBSERVACAO TEXT,
    CONSTRAINT PK_SESSAO_ID PRIMARY KEY(SES_INT_ID),
    CONSTRAINT FK_TATUAGEM_SESSAO FOREIGN KEY(TAT_INT_ID) REFERENCES TATUAGEM(TAT_INT_ID)
  );

GO 

CREATE INDEX IDX_TATUAGEM_SESSAO ON SESSAO(TAT_INT_ID);

GO 

CREATE TABLE AGENDAMENTO (
    AGE_INT_ID INT NOT NULL IDENTITY(1, 1),
    AGE_DTT_DATAHORA DATETIME NOT NULL,
    CLI_INT_ID INT NOT NULL,
    TTR_INT_ID INT NOT NULL,
    SES_INT_ID INT NOT NULL,
    CONSTRAINT PK_AGENDAMENTO_ID PRIMARY KEY(AGE_INT_ID),
    CONSTRAINT UK_SESSAO_AGENDAMENTO UNIQUE (SES_INT_ID),
    CONSTRAINT FK_CLIENTE_AGENDAMENTO FOREIGN KEY(CLI_INT_ID) REFERENCES CLIENTE(CLI_INT_ID),
    CONSTRAINT FK_TATUADOR_AGENDAMENTO FOREIGN KEY(TTR_INT_ID) REFERENCES TATUADOR(TTR_INT_ID),
    CONSTRAINT FK_SESSAO_AGENDAMENTO FOREIGN KEY(SES_INT_ID) REFERENCES SESSAO(SES_INT_ID)
  );

GO 

CREATE INDEX IDX_CLIENTE_AGENDAMENTO ON AGENDAMENTO(CLI_INT_ID);

GO 

CREATE INDEX IDX_TATUADOR_AGENDAMENTO ON AGENDAMENTO(TTR_INT_ID);

GO
