-- =========================================================
-- SCRIPT DDL - SISTEMA DE GERENCIAMENTO DE LOTES
-- PostgreSQL
-- =========================================================

-- =========================================================
-- TABELA: lote
-- =========================================================

CREATE TABLE lote (

    id BIGSERIAL PRIMARY KEY,

    operador VARCHAR(100) NOT NULL,

    processo VARCHAR(100) NOT NULL,

    status VARCHAR(20) NOT NULL,

    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_status
        CHECK (
            status IN (
                'PENDENTE',
                'EXPORTADO',
                'REJEITADO'
            )
        )
);

-- =========================================================
-- TABELA: documento
-- =========================================================

CREATE TABLE documento (

    id BIGSERIAL PRIMARY KEY,

    lote_id BIGINT NOT NULL,

    tipo VARCHAR(50) NOT NULL,

    nome VARCHAR(255) NOT NULL,

    CONSTRAINT fk_documento_lote
        FOREIGN KEY (lote_id)
        REFERENCES lote(id)
        ON DELETE CASCADE
);

-- =========================================================
-- ÍNDICES
-- =========================================================

-- Índice criado para otimizar consultas por status.
-- O endpoint GET /api/lotes possui filtro por status,
-- então este índice melhora a performance de busca
-- principalmente em cenários com grande volume de dados.

CREATE INDEX idx_lote_status
    ON lote(status);

-- Índice criado para otimizar consultas por operador,
-- já que a API também permite filtro por operador.

CREATE INDEX idx_lote_operador
    ON lote(operador);

-- Índice criado para melhorar joins entre
-- documento e lote.

CREATE INDEX idx_documento_lote_id
    ON documento(lote_id);


-- =========================================================
-- RELATÓRIO GERENCIAL POR OPERADOR
-- Últimos 30 dias
-- PostgreSQL
-- =========================================================

SELECT
    l.operador,
    COUNT(DISTINCT l.id) AS total_lotes,
    COUNT(d.id) AS total_documentos,
    COUNT(DISTINCT CASE
        WHEN l.status = 'PENDENTE'
        THEN l.id
    END) AS total_pendentes,
    COUNT(DISTINCT CASE
        WHEN l.status = 'EXPORTADO'
        THEN l.id
    END) AS total_exportados,
    COUNT(DISTINCT CASE
        WHEN l.status = 'REJEITADO'
        THEN l.id
    END) AS total_rejeitados,
    ROUND(COUNT(d.id)::NUMERIC/NULLIF(COUNT(DISTINCT l.id), 0),2) AS media_documentos_por_lote
FROM lote l
LEFT JOIN documento d ON d.lote_id = l.id
WHERE l.data_criacao >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY l.operador
ORDER BY total_lotes DESC;


-- =========================================================
-- DIAGNÓSTICO
-- =========================================================

O que pode estar causando lentidão:
Consulta completa da tabela, visto que possui 8 milhões de registros. Também tem o uso de JOIN, GROUP BY e ORDER BY sem índices.

Usaria o EXPLAIN do POstgreSQL para identificar gargalos e otimizar a consulta.
Criaria índices nas colunas usadas para filtragem (status, operador) e para joins (lote_id) para melhorar a performance.

Reescreveria a query para evitar o uso de COUNT(DISTINCT).

Faria algo do tipo:

SELECT l.operador, COUNT(d.id) AS total_docs
FROM (
    SELECT id, operador
    FROM lote
    WHERE status = 'PENDENTE'
      AND data_criacao > NOW() - INTERVAL '90 days'
) l
JOIN documento d
    ON d.lote_id = l.id
WHERE d.tipo = 'RG'
GROUP BY l.operador
ORDER BY total_docs DESC;