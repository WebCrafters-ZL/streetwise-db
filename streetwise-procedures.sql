-- PESSOA
CREATE OR ALTER PROCEDURE USP_PESSOA_INS (
    @PES_STR_NOME VARCHAR(125),
    @PES_DAT_NASCIMENTO DATE,
    @PES_STR_GENERO VARCHAR(15),
    @PES_STR_RG VARCHAR(9),
    @PES_STR_CPF CHAR(11),
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        INSERT INTO PESSOA (PES_STR_NOME, PES_DAT_NASCIMENTO, PES_STR_GENERO, PES_STR_RG, PES_STR_CPF)
        VALUES (@PES_STR_NOME, @PES_DAT_NASCIMENTO, @PES_STR_GENERO, @PES_STR_RG, @PES_STR_CPF);

        SET @RETURN = 'Pessoa cadastrada com sucesso';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar pessoa. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_PESSOA_UPD (
    @PES_STR_NOME VARCHAR(125),
    @PES_DAT_NASCIMENTO DATE,
    @PES_STR_GENERO VARCHAR(15),
    @PES_STR_RG VARCHAR(9),
    @PES_STR_CPF CHAR(11),
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        UPDATE PESSOA
        SET PES_STR_NOME = @PES_STR_NOME,
        PES_DAT_NASCIMENTO = @PES_DAT_NASCIMENTO,
        PES_STR_GENERO = @PES_STR_GENERO,
        PES_STR_RG = @PES_STR_RG
        WHERE PES_STR_CPF = @PES_STR_CPF;

        SET @RETURN = 'Pessoa atualizada com sucesso';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar pessoa. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_PESSOA_DEL (
    @PES_STR_CPF CHAR(11),
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        DELETE FROM PESSOA
        WHERE PES_STR_CPF = @PES_STR_CPF;

        SET @RETURN = 'Pessoa deletada com sucesso';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar pessoa. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_PESSOA_SEL
AS
BEGIN
    SELECT * FROM PESSOA;
END;

GO

-- ESTILO
CREATE OR ALTER PROCEDURE USP_ESTILO_INS
    (@EST_STR_NOME VARCHAR(40),
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        INSERT INTO ESTILO (EST_STR_NOME)
        VALUES (@EST_STR_NOME);

        SET @RETURN = 'Estilo cadastrado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar o estilo. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_ESTILO_UPD
    (@EST_INT_ID INT,
    @EST_STR_NOME VARCHAR(40),
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        UPDATE ESTILO
        SET EST_STR_NOME = @EST_STR_NOME
        WHERE EST_INT_ID = @EST_INT_ID;

        SET @RETURN = 'Estilo atualizado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar o estilo. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_ESTILO_DEL
    (@EST_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        DELETE FROM ESTILO WHERE EST_INT_ID = @EST_INT_ID;

        SET @RETURN = 'Estilo deletado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar o estilo. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_ESTILO_SEL
AS
BEGIN
    SELECT * FROM ESTILO;
END;

GO

-- DDD
CREATE OR ALTER PROCEDURE USP_DDD_INS
    (@DDD_STR_NUMERO CHAR(2),
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        INSERT INTO DDD (DDD_STR_NUMERO)
        VALUES (@DDD_STR_NUMERO);

        SET @RETURN = 'DDD cadastrado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar o DDD. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_DDD_DEL
    (@DDD_STR_NUMERO CHAR(2),
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        DELETE FROM DDD WHERE DDD_STR_NUMERO = @DDD_STR_NUMERO;

        SET @RETURN = 'DDD deletado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar o DDD. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_DDD_SEL
AS
BEGIN
    SELECT * FROM DDD;
END;

GO

-- TIPO_LOGRADOURO
CREATE OR ALTER PROCEDURE USP_TIPOLOGR_INS
    (@TPL_STR_DESCRICAO VARCHAR(40),
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        INSERT INTO TIPO_LOGRADOURO (TPL_STR_DESCRICAO)
            VALUES (@TPL_STR_DESCRICAO);

            SET @RETURN = 'Tipo de logradouro cadastrado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar tipo de logradouro. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_TIPOLOGR_UPD
    (@TPL_INT_ID INT,
    @TPL_STR_DESCRICAO VARCHAR(40),
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        UPDATE TIPO_LOGRADOURO
        SET TPL_STR_DESCRICAO = @TPL_STR_DESCRICAO
        WHERE TPL_INT_ID = @TPL_INT_ID;

        SET @RETURN = 'Tipo de logradouro atualizado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar tipo de logradouro. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_TIPOLOGR_DEL
    (@TPL_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        DELETE FROM TIPO_LOGRADOURO
        WHERE TPL_INT_ID = @TPL_INT_ID;

        SET @RETURN = 'Tipo de logradouro deletado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar tipo de logradouro. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_TIPOLOGR_SEL
AS
BEGIN
    SELECT * FROM TIPO_LOGRADOURO;
END;

GO

-- UF
CREATE OR ALTER PROCEDURE USP_UF_INS (
	@UF_STR_NOME VARCHAR(40),
	@UF_STR_SIGLA CHAR(2),
    @RETURN VARCHAR(200) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        INSERT INTO UF (UF_STR_NOME, UF_STR_SIGLA)
        VALUES (@UF_STR_NOME, @UF_STR_SIGLA);

        SET @RETURN = 'UF cadastrada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar UF. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_UF_UPD (
	@UF_INT_ID INT,
    @UF_STR_NOME VARCHAR(40),
	@UF_STR_SIGLA CHAR(2),
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        UPDATE UF
        SET UF_STR_NOME = @UF_STR_NOME,
        UF_STR_SIGLA = @UF_STR_SIGLA
        WHERE UF_INT_ID = @UF_INT_ID;

        SET @RETURN = 'UF atualizada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar UF. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_UF_DEL 
    (@ID_ESTADO INT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        DELETE FROM UF
        WHERE UF_INT_ID = @ID_ESTADO;

        SET @RETURN = 'UF deletada com sucesso.';
    END TRY        
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar UF. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_UF_SEL
AS
BEGIN
    SELECT * FROM UF;
END;

GO

-- MUNICIPIO
CREATE OR ALTER PROCEDURE USP_MUNICIPIO_INS (
    @MUN_STR_NOME VARCHAR(25),
    @UF_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        INSERT INTO MUNICIPIO (MUN_STR_NOME, UF_INT_ID)
        VALUES (@MUN_STR_NOME, @UF_INT_ID);

        SET @RETURN = 'Município cadastrado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar município. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_MUNICIPIO_UPD (
    @MUN_INT_ID INT,
    @MUN_STR_NOME VARCHAR(25),
    @UF_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        UPDATE MUNICIPIO
        SET MUN_STR_NOME = @MUN_STR_NOME,
        UF_INT_ID = @UF_INT_ID
        WHERE MUN_INT_ID = @MUN_INT_ID;

        SET @RETURN = 'Município atualizado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar município. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_MUNICIPIO_DEL (
    @MUN_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        DELETE FROM MUNICIPIO
        WHERE MUN_INT_ID = @MUN_INT_ID;

        SET @RETURN = 'Município deletado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar município. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_MUNICIPIO_SEL
AS
BEGIN
    SELECT * FROM MUNICIPIO;
END;

GO

-- TATUADOR
CREATE OR ALTER PROCEDURE USP_TATUADOR_INS (
	@PES_INT_ID INT,
	@TTR_DAT_ADMISSAO DATE,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        INSERT INTO TATUADOR (PES_INT_ID, TTR_DAT_ADMISSAO)
        VALUES (@PES_INT_ID, @TTR_DAT_ADMISSAO);

        SET @RETURN = 'Tatuador cadastrado com sucesso.'
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar tatuador. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_TATUADOR_UPD (
    @TTR_INT_ID INT,
    @TTR_DAT_ADMISSAO DATE,
    @TTR_DAT_DESLIGAMENTO DATE,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        UPDATE TATUADOR
        SET TTR_DAT_ADMISSAO = @TTR_DAT_ADMISSAO,
        TTR_DAT_DESLIGAMENTO = @TTR_DAT_DESLIGAMENTO
        WHERE TTR_INT_ID = @TTR_INT_ID;

        SET @RETURN = 'Tatuador atualizado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar tatuador. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_TATUADOR_DEL (
@TTR_INT_ID INT,
@RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        DELETE FROM TATUADOR
        WHERE TTR_INT_ID = @TTR_INT_ID;

        SET @RETURN = 'Tatuador apagado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar tatuador. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_TATUADOR_SEL
AS
BEGIN
    SELECT * FROM TATUADOR;
END;

GO

-- HORARIO_ATENDIMENTO
CREATE OR ALTER PROCEDURE USP_HORARIO_ATENDIMENTO_INS
    (@TTR_INT_ID INT,
    @ATE_STR_DIA CHAR(3),
    @ATE_TIM_INICIO TIME,
    @ATE_TIM_FIM TIME,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1 
            FROM HORARIO_ATENDIMENTO 
            WHERE 
                TTR_INT_ID = @TTR_INT_ID 
                AND ATE_STR_DIA = @ATE_STR_DIA 
                AND (
                    (@ATE_TIM_INICIO BETWEEN ATE_TIM_INICIO AND ATE_TIM_FIM) 
                    OR (@ATE_TIM_FIM BETWEEN ATE_TIM_INICIO AND ATE_TIM_FIM)
                )
        )
        BEGIN
            INSERT INTO HORARIO_ATENDIMENTO (TTR_INT_ID, ATE_STR_DIA, ATE_TIM_INICIO, ATE_TIM_FIM)
            VALUES (@TTR_INT_ID, @ATE_STR_DIA, @ATE_TIM_INICIO, @ATE_TIM_FIM);
            SET @RETURN = 'Horário de atendimento cadastrado com sucesso.';
        END
        ELSE
        BEGIN
            SET @RETURN = 'ERRO! Já existe um horário de atendimento para o tatuador no dia e intervalo informados.';
        END
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar horário de atendimento. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_HORARIO_ATENDIMENTO_UPD
    (@ATE_INT_ID INT,
    @TTR_INT_ID INT,
    @ATE_TIM_INICIO TIME,
    @ATE_TIM_FIM TIME,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1 
            FROM HORARIO_ATENDIMENTO 
            WHERE 
                ATE_INT_ID <> @ATE_INT_ID 
                AND TTR_INT_ID = @TTR_INT_ID
                AND ATE_STR_DIA = (SELECT ATE_STR_DIA FROM HORARIO_ATENDIMENTO WHERE ATE_INT_ID = @ATE_INT_ID)
                AND (
                    (@ATE_TIM_INICIO BETWEEN ATE_TIM_INICIO AND ATE_TIM_FIM) 
                    OR (@ATE_TIM_FIM BETWEEN ATE_TIM_INICIO AND ATE_TIM_FIM)
                )
        )
        BEGIN
            UPDATE HORARIO_ATENDIMENTO
            SET ATE_TIM_INICIO = @ATE_TIM_INICIO, ATE_TIM_FIM = @ATE_TIM_FIM
            WHERE ATE_INT_ID = @ATE_INT_ID;

            SET @RETURN = 'Horário de atendimento atualizado com sucesso.';
        END
        ELSE
        BEGIN
            SET @RETURN = 'ERRO! Já existe outro horário de atendimento para o tatuador no dia e intervalo informados.';
        END
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar horário de atendimento. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_HORARIO_ATENDIMENTO_DEL
    (@ATE_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        DELETE FROM HORARIO_ATENDIMENTO WHERE ATE_INT_ID = @ATE_INT_ID;

        SET @RETURN = 'Horário de atendimento deletado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar horário de atendimento. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_HORARIO_ATENDIMENTO_SEL
AS
BEGIN
    SELECT * FROM HORARIO_ATENDIMENTO;
END;

GO

-- EMAIL
CREATE OR ALTER PROCEDURE USP_EMAIL_INS
    (@PES_INT_ID INT,
    @END_EMAIL_STR VARCHAR(70),
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        INSERT INTO EMAIL (PES_INT_ID, EMA_STR_ENDERECO)
        VALUES (@PES_INT_ID, @END_EMAIL_STR);

        SET @RETURN = 'E-mail cadastrado com sucesso';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar e-mail. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_EMAIL_UPD
    (@PES_INT_ID INT,
    @END_EMAIL_STR VARCHAR(70),
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        UPDATE EMAIL
        SET EMA_STR_ENDERECO = @END_EMAIL_STR
        WHERE PES_INT_ID = @PES_INT_ID;

        SET @RETURN = 'E-mail atualizado com sucesso';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar e-mail. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_EMAIL_DEL
     (@PES_INT_ID INT,
     @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        DELETE FROM EMAIL
        WHERE PES_INT_ID = @PES_INT_ID;

        SET @RETURN = 'E-mail deletado com sucesso';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar e-mail. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_EMAIL_SEL
AS
BEGIN
    SELECT * FROM EMAIL;
END;

GO

-- CONDICAO_PAGAMENTO
CREATE OR ALTER PROCEDURE USP_CONDICAO_PAGTO_INS
    (@CON_STR_NOME VARCHAR(40),
    @CON_INT_QNT_PARCELAS INT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        INSERT INTO CONDICAO_PAGAMENTO (CON_STR_NOME, CON_INT_QNT_PARCELAS)
        VALUES (@CON_STR_NOME, @CON_INT_QNT_PARCELAS);

        SET @RETURN = 'Condição de pagamento cadastrada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar a condição de pagamento. Detalhes: ' + ERROR_MESSAGE();;
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_CONDICAO_PAGTO_UPD
    (@CON_INT_ID INT,
    @CON_STR_NOME VARCHAR(40),
    @CON_INT_QNT_PARCELAS INT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        UPDATE CONDICAO_PAGAMENTO
        SET CON_STR_NOME = @CON_STR_NOME,
        CON_INT_QNT_PARCELAS = CON_INT_QNT_PARCELAS
        WHERE CON_INT_ID = @CON_INT_ID;

        SET @RETURN = 'Condição de pagamento atualizada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar a condição de pagamento. Detalhes: ' + ERROR_MESSAGE();;
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_CONDICAO_PAGTO_DEL
    (@CON_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        DELETE FROM CONDICAO_PAGAMENTO WHERE CON_INT_ID = @CON_INT_ID;

        SET @RETURN = 'Condição de pagamento deletada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar a condição de pagamento. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_CONDICAO_PAGTO_SEL
AS
BEGIN
    SELECT * FROM CONDICAO_PAGAMENTO;
END;

GO

-- CLIENTE
CREATE OR ALTER PROCEDURE USP_CLIENTE_INS
    @PES_INT_ID INT,
    @CLI_STR_HISTORICO TEXT,
    @RETURN VARCHAR(200) OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO CLIENTE (PES_INT_ID, CLI_STR_HISTORICO)
        VALUES (@PES_INT_ID, @CLI_STR_HISTORICO);

        SET @RETURN = 'Cliente cadastrado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar cliente. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_CLIENTE_UPD (
    @PES_INT_ID INT,
    @CLI_STR_HISTORICO TEXT,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        UPDATE CLIENTE
        SET CLI_STR_HISTORICO = @CLI_STR_HISTORICO
        WHERE PES_INT_ID = @PES_INT_ID;

        SET @RETURN = 'Cliente atualizado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar cliente. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_CLIENTE_DEL(
    @PES_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        DELETE FROM CLIENTE
        WHERE PES_INT_ID = @PES_INT_ID;

        SET @RETURN = 'Cliente deletado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar cliente. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_CLIENTE_SEL
AS
BEGIN
    SELECT * FROM CLIENTE;
END;

GO

-- FICHA_ANAMNESE
CREATE OR ALTER PROCEDURE USP_FICHA_ANAMNESE_INS (
    @CLI_INT_ID INT,
    @ANA_DAT_DATA_REGISTRO DATE,
    @ANA_STR_INFO_MED TEXT,
    @ANA_STR_COND_SAUDE TEXT,
    @ANA_STR_ALERGIAS TEXT,
    @ANA_STR_MEDICAMENTO_USO TEXT,
    @ANA_STR_OBSERVACOES TEXT,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        INSERT INTO FICHA_ANAMNESE (CLI_INT_ID, ANA_DAT_DATA_REGISTRO, ANA_STR_INFO_MED, ANA_STR_COND_SAUDE, ANA_STR_ALERGIAS, ANA_STR_MEDICAMENTO_USO, ANA_STR_OBSERVACOES)
        VALUES (@CLI_INT_ID, @ANA_DAT_DATA_REGISTRO, @ANA_STR_INFO_MED, @ANA_STR_COND_SAUDE, @ANA_STR_ALERGIAS, @ANA_STR_MEDICAMENTO_USO, @ANA_STR_OBSERVACOES);

        SET @RETURN = 'Ficha de anamnese cadastrada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar ficha de anamnese. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_FICHA_ANAMNESE_UPD (
    @CLI_INT_ID INT,
    @ANA_DAT_DATA_REGISTRO DATE,
    @ANA_STR_INFO_MED TEXT,
    @ANA_STR_COND_SAUDE TEXT,
    @ANA_STR_ALERGIAS TEXT,
    @ANA_STR_MEDICAMENTO_USO TEXT,
    @ANA_STR_OBSERVACOES TEXT,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        UPDATE FICHA_ANAMNESE
        SET ANA_STR_INFO_MED = @ANA_STR_INFO_MED,
            ANA_STR_COND_SAUDE = @ANA_STR_COND_SAUDE,
            ANA_STR_ALERGIAS = @ANA_STR_ALERGIAS,
            ANA_STR_MEDICAMENTO_USO = @ANA_STR_MEDICAMENTO_USO,
            ANA_STR_OBSERVACOES = @ANA_STR_OBSERVACOES
        WHERE CLI_INT_ID = @CLI_INT_ID;

        SET @RETURN = 'Ficha de anamnese atualizada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar ficha de anamnese. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_FICHA_ANAMNESE_DEL
    (@CLI_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        DELETE FROM FICHA_ANAMNESE WHERE CLI_INT_ID = @CLI_INT_ID;

        SET @RETURN = 'Ficha de anamnese deletada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar ficha de anamnese. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_FICHA_ANAMNESE_SEL
AS
BEGIN
    SELECT * FROM FICHA_ANAMNESE;
END;

GO

-- FORMA_PAGAMENTO
CREATE OR ALTER PROCEDURE USP_FORMA_PAGTO_INS
    (@FOR_STR_NOME VARCHAR(40),
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        INSERT INTO FORMA_PAGAMENTO (FOR_STR_NOME)
        VALUES (@FOR_STR_NOME);

        SET @RETURN = 'Forma de pagamento cadastrada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar a forma de pagamento. Detalhes: ' + ERROR_MESSAGE();;
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_FORMA_PAGTO_UPD
    (@FOR_INT_ID INT,
    @FOR_STR_NOME VARCHAR(40),
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        UPDATE FORMA_PAGAMENTO
        SET FOR_STR_NOME = @FOR_STR_NOME
        WHERE FOR_INT_ID = @FOR_INT_ID;

        SET @RETURN = 'Forma de pagamento atualizada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar a forma de pagamento. Detalhes: ' + ERROR_MESSAGE();;
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_FORMA_PAGTO_DEL
    (@FOR_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        DELETE FROM FORMA_PAGAMENTO WHERE FOR_INT_ID = @FOR_INT_ID;

        SET @RETURN = 'Forma de pagamento deletada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar a forma de pagamento. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_FORMA_PAGTO_SEL
AS
BEGIN
    SELECT * FROM FORMA_PAGAMENTO;
END;

GO

-- PAGAMENTO
CREATE OR ALTER PROCEDURE USP_PAGAMENTO_INS
    (@FOR_INT_ID INT,
    @CON_INT_ID INT,
    @PAG_DTT_DATAHORA DATETIME,
    @PAG_STR_NUM_TRANSACAO VARCHAR(8),
    @PAG_STR_OBSERVACAO TEXT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        INSERT INTO PAGAMENTO (FOR_INT_ID, CON_INT_ID, PAG_DTT_DATAHORA, PAG_STR_NUM_TRANSACAO, PAG_STR_OBSERVACAO)
        VALUES (@FOR_INT_ID, @CON_INT_ID, @PAG_DTT_DATAHORA, @PAG_STR_NUM_TRANSACAO, @PAG_STR_OBSERVACAO);

        SET @RETURN = 'Pagamento cadastrado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar o pagamento. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_PAGAMENTO_UPD
    (@PAG_INT_ID INT,
    @FOR_INT_ID INT,
    @CON_INT_ID INT,
    @PAG_DTT_DATAHORA DATETIME,
    @PAG_STR_NUM_TRANSACAO VARCHAR(8),
    @PAG_STR_OBSERVACAO TEXT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        UPDATE PAGAMENTO
        SET FOR_INT_ID = @FOR_INT_ID,
            CON_INT_ID = @CON_INT_ID,
            PAG_DTT_DATAHORA = @PAG_DTT_DATAHORA,
            PAG_STR_NUM_TRANSACAO = @PAG_STR_NUM_TRANSACAO,
            PAG_STR_OBSERVACAO = @PAG_STR_OBSERVACAO
        WHERE PAG_INT_ID = @PAG_INT_ID;

        SET @RETURN = 'Pagamento atualizado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar o pagamento. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_PAGAMENTO_DEL
    (@PAG_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        DELETE FROM PAGAMENTO WHERE PAG_INT_ID = @PAG_INT_ID;

        SET @RETURN = 'Pagamento deletado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar o pagamento. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_PAGAMENTO_SEL
AS
BEGIN   
    SELECT * FROM PAGAMENTO;
END;

GO

-- TELEFONE
CREATE OR ALTER PROCEDURE USP_TELEFONE_INS
    @PES_INT_ID INT,
    @DDD_INT_ID INT,
    @TEL_STR_NUMERO VARCHAR(9),
    @RETURN VARCHAR(200) OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO TELEFONE (PES_INT_ID, DDD_INT_ID, TEL_STR_NUMERO)
            VALUES (@PES_INT_ID, @DDD_INT_ID, @TEL_STR_NUMERO);

            SET @RETURN = 'Telefone cadastrado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar telefone. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_TELEFONE_UPD (
    @DDD_INT_ID INT,
    @TEL_STR_NUMERO VARCHAR(9),
    @PES_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        UPDATE TELEFONE
        SET DDD_INT_ID = @DDD_INT_ID,
        TEL_STR_NUMERO = @TEL_STR_NUMERO
        WHERE PES_INT_ID = @PES_INT_ID;

        SET @RETURN = 'Telefone atualizado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar telefone. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_TELEFONE_DEL (
    @PES_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        DELETE FROM TELEFONE
        WHERE PES_INT_ID = @PES_INT_ID;

        SET @RETURN = 'Telefone deletado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar telefone. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_TELEFONE_SEL
AS
BEGIN
    SELECT * FROM TELEFONE;
END;

GO

-- ESPECIALIZACAO
CREATE OR ALTER PROCEDURE USP_ESPECIALIZACAO_INS
    (@EST_INT_ID INT,
    @TTR_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        INSERT INTO ESPECIALIZACAO (EST_INT_ID, TTR_INT_ID)
        VALUES (@EST_INT_ID, @TTR_INT_ID);

        SET @RETURN = 'Especialização cadastrada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar especialização. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_ESPECIALIZACAO_DEL
    (@EST_INT_ID INT,
    @TTR_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        DELETE FROM ESPECIALIZACAO WHERE EST_INT_ID = @EST_INT_ID AND TTR_INT_ID = @TTR_INT_ID;

        SET @RETURN = 'Especialização deletada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar especialização. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_ESPECIALIZACAO_SEL
AS
BEGIN
    SELECT * FROM ESPECIALIZACAO;
END;

GO

-- ENDERECO
CREATE OR ALTER PROCEDURE USP_ENDERECO_INS (
	@TPL_INT_ID INT,
	@END_STR_LOGRADOURO VARCHAR(70),
	@END_STR_NUMERO VARCHAR(6),
	@END_STR_BAIRRO VARCHAR(40),
	@END_STR_CEP CHAR(8),
	@MUN_INT_ID INT,
	@PES_INT_ID INT,
	@RETURN VARCHAR(200) OUTPUT
) AS 
BEGIN
	BEGIN TRY
		INSERT INTO ENDERECO (
			TPL_INT_ID,
			END_STR_LOGRADOURO,
			END_STR_NUMERO,
			END_STR_BAIRRO,
			END_STR_CEP,
			MUN_INT_ID,
			PES_INT_ID
		)
		VALUES (
			@TPL_INT_ID,
			@END_STR_LOGRADOURO,
			@END_STR_NUMERO,
			@END_STR_BAIRRO,
			@END_STR_CEP,
			@MUN_INT_ID,
			@PES_INT_ID
		);
		SET @RETURN = 'Endereço cadastrado com sucesso.';
	END TRY
	BEGIN CATCH
		SET @RETURN = 'ERRO! Não foi possível cadastrar endereço. Detalhes: ' + ERROR_MESSAGE();
	END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_ENDERECO_UPD (
	@TPL_INT_ID INT,
	@END_STR_LOGRADOURO VARCHAR(70),
	@END_STR_NUMERO VARCHAR(6),
	@END_STR_BAIRRO VARCHAR(40),
	@END_STR_CEP CHAR(8),
	@MUN_INT_ID INT,
	@PES_INT_ID INT,
	@RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
	BEGIN TRY
		UPDATE ENDERECO
		SET TPL_INT_ID = @TPL_INT_ID,
		END_STR_LOGRADOURO = @END_STR_LOGRADOURO,
		END_STR_NUMERO = @END_STR_NUMERO,
		END_STR_BAIRRO = @END_STR_BAIRRO,
		END_STR_CEP = @END_STR_CEP,
		MUN_INT_ID = @MUN_INT_ID
		WHERE PES_INT_ID = @PES_INT_ID;

		SET @RETURN = 'Endereço atualizado com sucesso.';
	END TRY
	BEGIN CATCH
		SET @RETURN = 'ERRO! Não foi possível atualizar endereço. Detalhes: ' + ERROR_MESSAGE();
	END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_ENDERECO_DEL (
@PES_INT_ID INT, 
@RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
	BEGIN TRY
		DELETE FROM ENDERECO
		WHERE PES_INT_ID = @PES_INT_ID;
		SET @RETURN = 'Endereço deletado com sucesso.';
	END TRY
	BEGIN CATCH
		SET @RETURN = 'ERRO! Não foi possível deletar endereço. Detalhes: ' + ERROR_MESSAGE();
	END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_ENDERECO_SEL 
AS
BEGIN
	SELECT * FROM ENDERECO;
END;

GO

-- TATUAGEM
CREATE OR ALTER PROCEDURE USP_TATUAGEM_INS
    (@PAG_INT_ID INT,
    @TAT_STR_NOME VARCHAR(75),
    @TAT_STR_TAMANHO VARCHAR(40),
    @TAT_STR_LOCAL_CORPO VARCHAR(70),
    @EST_INT_ID INT,
    @TAT_STR_OBSERVACAO TEXT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
       INSERT INTO TATUAGEM(PAG_INT_ID, TAT_STR_NOME, TAT_STR_TAMANHO, TAT_STR_LOCAL_CORPO, EST_INT_ID, TAT_STR_OBSERVACAO)
       VALUES (@PAG_INT_ID,@TAT_STR_NOME, @TAT_STR_TAMANHO, @TAT_STR_LOCAL_CORPO, @EST_INT_ID, @TAT_STR_OBSERVACAO)

       SET @RETURN = 'Tatuagem cadastrada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar tatuagem. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_TATUAGEM_UPD
    (@TAT_INT_ID INT,
    @TAT_STR_NOME VARCHAR(75),
    @TAT_STR_TAMANHO VARCHAR(40),
    @TAT_STR_LOCAL_CORPO VARCHAR(70),
    @EST_INT_ID INT,
    @TAT_STR_OBSERVACAO TEXT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
       UPDATE TATUAGEM
       SET TAT_STR_NOME = @TAT_STR_NOME,
       TAT_STR_TAMANHO = @TAT_STR_TAMANHO,
       TAT_STR_LOCAL_CORPO = @TAT_STR_LOCAL_CORPO,
       EST_INT_ID = @EST_INT_ID,
       TAT_STR_OBSERVACAO = @TAT_STR_OBSERVACAO
       WHERE TAT_INT_ID = @TAT_INT_ID;

        SET @RETURN = 'Tatuagem atualizada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar tatuagem. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_TATUAGEM_DEL
    (@TAT_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
       DELETE FROM TATUAGEM
       WHERE TAT_INT_ID = @TAT_INT_ID;

        SET @RETURN = 'Tatuagem deletada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar tatuagem. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_TATUAGEM_SEL
AS
BEGIN
    SELECT * FROM TATUAGEM;
END;

GO

-- ORCAMENTO
CREATE OR ALTER PROCEDURE USP_ORCAMENTO_INS
    (@ORC_DTT_DATAHORA DATETIME,
    @CLI_INT_ID INT,
    @TAT_INT_ID INT,
    @ORC_DOU_VALOR DECIMAL(6, 2),
    @ORC_STR_OBSERVACAO TEXT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
       INSERT INTO ORCAMENTO (ORC_DTT_DATAHORA, CLI_INT_ID, TAT_INT_ID,ORC_DOU_VALOR, ORC_STR_OBSERVACAO)
            VALUES (@ORC_DTT_DATAHORA, @CLI_INT_ID, @TAT_INT_ID, @ORC_DOU_VALOR, @ORC_STR_OBSERVACAO);

            SET @RETURN = 'Orçamento cadastrado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar orçamento. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_ORCAMENTO_UPD
    (@ORC_INT_ID INT,
    @TAT_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
       UPDATE ORCAMENTO
        SET TAT_INT_ID = @TAT_INT_ID 
        WHERE ORC_INT_ID = @ORC_INT_ID;
        
        SET @RETURN = 'Orçamento atualizado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar orçamento. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_ORCAMENTO_DEL
     (@ORC_INT_ID INT,
     @RETURN VARCHAR(200) OUTPUT)
AS
BEGIN
    BEGIN TRY
        DELETE FROM ORCAMENTO
        WHERE ORC_INT_ID = @ORC_INT_ID;
       
        SET @RETURN = 'Orçamento deletado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar orçamento. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_ORCAMENTO_SEL
AS
BEGIN
    SELECT * FROM ORCAMENTO;
END;

GO

-- SESSAO
CREATE OR ALTER PROCEDURE USP_SESSAO_INS (
    @SES_TIM_DURACAO TIME,
    @TAT_INT_ID INT,
    @SES_STR_OBSERVACAO TEXT,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        INSERT INTO SESSAO (TAT_INT_ID, SES_TIM_DURACAO, SES_STR_OBSERVACAO)
            VALUES (@TAT_INT_ID, @SES_TIM_DURACAO, @SES_STR_OBSERVACAO);

            SET @RETURN = 'Sessão cadastrada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar sessão. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_SESSAO_UPD (
    @SES_TIM_DURACAO TIME,
    @TAT_INT_ID INT,
    @SES_STR_OBSERVACAO TEXT,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        UPDATE SESSAO
        SET SES_TIM_DURACAO = @SES_TIM_DURACAO,
            SES_STR_OBSERVACAO = @SES_STR_OBSERVACAO
        WHERE TAT_INT_ID = @TAT_INT_ID;

        SET @RETURN = 'Sessão atualizada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar sessão. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_SESSAO_DEL (
    @SES_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        DELETE FROM SESSAO
        WHERE SES_INT_ID = @SES_INT_ID;

        SET @RETURN = 'Sessão deletada com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar sessão. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_SESSAO_SEL
AS
BEGIN
    SELECT * FROM SESSAO;
END;

GO

-- AGENDAMENTO
CREATE OR ALTER PROCEDURE USP_AGENDAMENTO_INS (
    @CLI_INT_ID INT,
    @TTR_INT_ID INT,
    @SES_INT_ID INT,
    @AGE_DTT_DATAHORA DATETIME,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        INSERT INTO AGENDAMENTO (CLI_INT_ID, TTR_INT_ID, SES_INT_ID, AGE_DTT_DATAHORA)
        VALUES (@CLI_INT_ID, @TTR_INT_ID, @SES_INT_ID, @AGE_DTT_DATAHORA);

        SET @RETURN = 'Agendamento cadastrado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível cadastrar agendamento. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_AGENDAMENTO_UPD (
    @SES_INT_ID INT,
    @AGE_DTT_DATAHORA DATETIME,
    @RETURN VARCHAR(200) OUTPUT
) AS
BEGIN
    BEGIN TRY
        UPDATE AGENDAMENTO
        SET AGE_DTT_DATAHORA = @AGE_DTT_DATAHORA
        WHERE SES_INT_ID = @SES_INT_ID;

        SET @RETURN = 'Agendamento atualizado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível atualizar agendamento. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_AGENDAMENTO_DEL
    @SES_INT_ID INT,
    @RETURN VARCHAR(200) OUTPUT
AS
BEGIN
    BEGIN TRY
        DELETE FROM AGENDAMENTO WHERE SES_INT_ID = @SES_INT_ID;

        SET @RETURN = 'Agendamento deletado com sucesso.';
    END TRY
    BEGIN CATCH
        SET @RETURN = 'ERRO! Não foi possível deletar agendamento. Detalhes: ' + ERROR_MESSAGE();
    END CATCH
END;

GO

CREATE OR ALTER PROCEDURE USP_AGENDAMENTO_SEL
AS
BEGIN
    SELECT * FROM AGENDAMENTO;
END;

GO
