-- PESSOA
CREATE OR ALTER VIEW VW_PESSOA
AS
SELECT PES.PES_INT_ID AS ID_PESSOA,
    PES.PES_STR_NOME AS NOME_PESSOA,
    PES.PES_DAT_NASCIMENTO AS DATA_NASCIMENTO,
    PES.PES_STR_GENERO AS PESSOA_GENERO,
    PES.PES_STR_RG AS PESSOA_RG,
    PES.PES_STR_CPF AS PESSOA_CPF,
    (SELECT IIF (TTR.PES_INT_ID = PES.PES_INT_ID,'SIM','NÃO')) AS TATUADOR,
    (SELECT IIF (CLI.PES_INT_ID = CLI.PES_INT_ID,'SIM','NÃO')) AS CLIENTE
FROM PESSOA PES
	INNER JOIN TATUADOR TTR ON TTR.PES_INT_ID = PES.PES_INT_ID
	INNER JOIN CLIENTE CLI ON CLI.PES_INT_ID = PES.PES_INT_ID;

-- MUNICIPIO
CREATE OR ALTER VIEW VW_MUNICIPIO
AS
SELECT MUN.MUN_INT_ID AS ID_MUNICIPIO,
    MUN.MUN_STR_NOME AS NOME_MUNICIPIO,
    UNF.UF_STR_SIGLA AS SIGLA_UF
FROM MUNICIPIO MUN
    INNER JOIN UF UNF ON MUN.UF_INT_ID = UNF.UF_INT_ID;

-- TATUADOR
CREATE OR ALTER VIEW VW_TATUADOR
AS
SELECT
    TTR.TTR_INT_ID AS ID_TATUADOR,
    PES.PES_STR_NOME AS NOME_TATUADOR,
    TTR.TTR_DAT_ADMISSAO AS DATA_ADMISSAO,
    TTR.TTR_DAT_DESLIGAMENTO AS DATA_DESLIGAMENTO
FROM TATUADOR TTR
    INNER JOIN PESSOA PES ON TTR.PES_INT_ID = PES.PES_INT_ID;

-- HORARIO_ATENDIMENTO
CREATE OR ALTER VIEW VW_HORARIO_ATENDIMENTO
AS
SELECT
    ATE.ATE_INT_ID AS ID_HORARIO,
    PTT.PES_STR_NOME AS NOME_TATUADOR,
    ATE.ATE_STR_DIA AS DIA_SEMANA,
    ATE.ATE_TIM_INICIO AS HORA_INICIO,
    ATE.ATE_TIM_FIM AS HORA_FIM
FROM
    HORARIO_ATENDIMENTO ATE
    INNER JOIN TATUADOR TTR ON ATE.TTR_INT_ID = TTR.TTR_INT_ID
    INNER JOIN PESSOA PTT ON TTR.PES_INT_ID = PTT.PES_INT_ID;
-- EMAIL
CREATE OR ALTER VIEW VW_EMAIL
AS
SELECT EMA.EMA_INT_ID AS ID_EMAIL,
    PES.PES_STR_NOME AS NOME_PESSOA,
    EMA.EMA_STR_ENDERECO AS END_EMAIL
FROM EMAIL EMA
    INNER JOIN PESSOA PES ON EMA.PES_INT_ID = PES.PES_INT_ID;

-- CLIENTE
CREATE OR ALTER VIEW VW_CLIENTE
AS
SELECT
    CLI.CLI_INT_ID AS ID_CLIENTE,
    PES.PES_STR_NOME AS NOME_CLIENTE,
    CLI.CLI_STR_HISTORICO
FROM CLIENTE CLI
    INNER JOIN PESSOA PES ON CLI.PES_INT_ID = PES.PES_INT_ID;

-- FICHA_ANAMNESE
CREATE OR ALTER VIEW VW_FICHA_ANAMNESE
AS
SELECT ANA.ANA_INT_ID AS ID_FICHA,
    PCL.PES_STR_NOME AS NOME_CLIENTE,
    ANA.ANA_DAT_DATA_REGISTRO AS DATA_REGISTRO,
    ANA.ANA_STR_INFO_MED AS INFOS_MEDICAS,
    ANA.ANA_STR_COND_SAUDE AS CONDICAO_SAUDE,
    ANA.ANA_STR_ALERGIAS AS ALERGIAS,
    ANA.ANA_STR_MEDICAMENTO_USO AS MEDICAMENTOS_EM_USO,
    ANA.ANA_STR_OBSERVACOES AS OBSERVACOES
FROM FICHA_ANAMNESE ANA
    INNER JOIN CLIENTE CLI ON ANA.CLI_INT_ID = CLI.CLI_INT_ID
    INNER JOIN PESSOA PCL ON CLI.PES_INT_ID = PCL.PES_INT_ID;

-- PAGAMENTO
CREATE OR ALTER VIEW VW_PAGAMENTO
AS
SELECT PAG.PAG_INT_ID AS ID_PAGTO,
    PAG.PAG_DTT_DATAHORA AS DATA_HORA,
    ORC.ORC_DOU_VALOR AS VALOR_TOTAL,
    FPA.FOR_STR_NOME AS FORMA_PAGTO,
    CPA.CON_STR_NOME AS CONDICAO_PAGTO,
    CPA.CON_INT_QNT_PARCELAS AS QTD_PARCELAS,
    PAG.PAG_STR_NUM_TRANSACAO AS NUM_TRANSACAO,
    PAG.PAG_STR_OBSERVACAO AS OBSERVACAO
FROM PAGAMENTO PAG
    INNER JOIN TATUAGEM TAT ON PAG.PAG_INT_ID = TAT.PAG_INT_ID
    INNER JOIN ORCAMENTO ORC ON TAT.TAT_INT_ID = ORC.TAT_INT_ID
    INNER JOIN FORMA_PAGAMENTO FPA ON PAG.FOR_INT_ID = FPA.FOR_INT_ID
    INNER JOIN CONDICAO_PAGAMENTO CPA ON PAG.CON_INT_ID = CPA.CON_INT_ID;

-- TELEFONE
CREATE OR ALTER VIEW VW_TELEFONE AS 
SELECT  
    TEL.TEL_INT_ID AS ID_TELEFONE,
    PES.PES_STR_NOME AS PESSOA,
    DDD.DDD_STR_NUMERO AS DDD,
    TEL.TEL_STR_NUMERO AS TELEFONE
FROM TELEFONE AS TEL
	INNER JOIN PESSOA AS PES ON TEL.PES_INT_ID = PES.PES_INT_ID 
	INNER JOIN DDD AS DDD ON TEL.DDD_INT_ID = DDD.DDD_INT_ID;

-- ESPECIALIZACAO
CREATE OR ALTER VIEW VW_ESPECIALIZACAO
AS
SELECT
    PTT.PES_STR_NOME AS NOME_TATUADOR,
    EST.EST_STR_NOME AS NOME_ESTILO
FROM
    ESPECIALIZACAO ESP
    INNER JOIN TATUADOR TTR ON ESP.TTR_INT_ID = TTR.TTR_INT_ID
    INNER JOIN PESSOA PTT ON TTR.PES_INT_ID = PTT.PES_INT_ID
    INNER JOIN ESTILO EST ON ESP.EST_INT_ID = EST.EST_INT_ID;

-- ENDERECO
CREATE OR ALTER VIEW VW_ENDERECO
AS
SELECT
    EDR.END_INT_ID AS ID_ENDERECO,
    PES.PES_STR_NOME AS NOME_PESSOA,
    TPL.TPL_STR_DESCRICAO AS TIPO_LOGRADOURO,
    EDR.END_STR_LOGRADOURO AS LOGRADOURO,
    EDR.END_STR_NUMERO AS NUMERO,
    EDR.END_STR_BAIRRO AS BAIRRO,
    EDR.END_STR_CEP AS CEP,
    MUN.MUN_STR_NOME AS CIDADE,
    MUF.UF_STR_SIGLA AS ESTADO
FROM ENDERECO EDR
    INNER JOIN PESSOA PES ON EDR.PES_INT_ID = PES.PES_INT_ID
    INNER JOIN TIPO_LOGRADOURO TPL ON EDR.TPL_INT_ID = TPL.TPL_INT_ID
    INNER JOIN MUNICIPIO MUN ON EDR.MUN_INT_ID = MUN.MUN_INT_ID
    INNER JOIN UF MUF ON MUN.UF_INT_ID = MUF.UF_INT_ID;

-- TATUAGEM
CREATE OR ALTER VIEW VW_TATUAGEM
AS
SELECT TAT.TAT_INT_ID AS ID_TATUAGEM,
    EST.EST_STR_NOME AS ESTILO_NOME,
    TAT.TAT_STR_NOME AS TATUAGEM_NOME,
    TAT.TAT_STR_TAMANHO AS TATUAGEM_TAMANHO,
    TAT.TAT_STR_LOCAL_CORPO AS TATUAGEM_LOCAL_CORPO,
    TAT.TAT_STR_OBSERVACAO AS TATUAGEM_OBSERVAÇAO
FROM TATUAGEM TAT
    INNER JOIN ESTILO EST ON EST.EST_INT_ID = TAT.EST_INT_ID;

-- ORCAMENTO
CREATE OR ALTER VIEW VW_ORCAMENTO
AS
SELECT ORC.ORC_INT_ID AS ORCAMENTO_ID,
    PCL.PES_STR_NOME AS NOME_CLIENTE,
    ORC.ORC_DTT_DATAHORA AS ORCAMENTO_DATAHORA,
    ORC.ORC_DOU_VALOR AS ORCAMENTO_VALOR,
    ORC.ORC_STR_OBSERVACAO AS ORCAMENTO_OBSERVACAO
FROM ORCAMENTO ORC
    INNER JOIN CLIENTE CLI ON ORC.CLI_INT_ID = CLI.CLI_INT_ID
    INNER JOIN PESSOA PCL ON CLI.PES_INT_ID = PCL.PES_INT_ID;

-- SESSAO
CREATE OR ALTER VIEW VW_SESSAO 
AS 
SELECT
	SES.SES_INT_ID AS ID_SESSAO,
	TAT.TAT_STR_NOME AS TATUAGEM_NOME,
	SES.SES_TIM_DURACAO AS DURACAO,
	SES.SES_STR_OBSERVACAO AS OBSERVACAO,
	PTT.PES_STR_NOME AS TATUADOR,
	PCL.PES_STR_NOME AS CLIENTE,
	AGE.AGE_DTT_DATAHORA AS DATA_HORA_AGEND
FROM SESSAO AS SES
	INNER JOIN TATUAGEM AS TAT ON SES.TAT_INT_ID = TAT.TAT_INT_ID
	INNER JOIN AGENDAMENTO AS AGE ON SES.SES_INT_ID = AGE.SES_INT_ID
	INNER JOIN TATUADOR AS TTR ON AGE.TTR_INT_ID = TTR.TTR_INT_ID
	INNER JOIN CLIENTE AS CLI ON AGE.CLI_INT_ID = CLI.CLI_INT_ID
	INNER JOIN PESSOA AS PCL ON CLI.PES_INT_ID = PCL.PES_INT_ID
	INNER JOIN PESSOA AS PTT ON TTR.PES_INT_ID = PTT.PES_INT_ID;

-- AGENDAMENTO
CREATE OR ALTER VIEW VW_AGENDAMENTO
AS
SELECT
    AGE.AGE_INT_ID AS ID_AGENDAMENTO,
    PCL.PES_STR_NOME AS NOME_CLIENTE,
    PTT.PES_STR_NOME AS NOME_TATUADOR,
    AGE.AGE_DTT_DATAHORA AS DATA_HORA,
    TAT.TAT_STR_NOME AS NOME_TATUAGEM,
    SES.SES_TIM_DURACAO AS DURACAO_SESSAO,
    SES.SES_STR_OBSERVACAO AS OBSERVACOES_SESSAO
FROM
    AGENDAMENTO AGE
    INNER JOIN CLIENTE CLI ON AGE.CLI_INT_ID = CLI.CLI_INT_ID
    INNER JOIN TATUADOR TTR ON AGE.TTR_INT_ID = TTR.TTR_INT_ID
    INNER JOIN SESSAO SES ON AGE.SES_INT_ID = SES.SES_INT_ID
    INNER JOIN TATUAGEM TAT ON SES.TAT_INT_ID = TAT.TAT_INT_ID
    INNER JOIN PESSOA PCL ON CLI.PES_INT_ID = PCL.PES_INT_ID
    INNER JOIN PESSOA PTT ON TTR.PES_INT_ID = PTT.PES_INT_ID;