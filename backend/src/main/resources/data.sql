-- LOTES

INSERT INTO lote (
    id,
    operador,
    processo,
    status,
    data_criacao
) VALUES
      (1, 'joao.silva', 'ABERTURA_CONTA', 'PENDENTE', NOW()),
      (2, 'maria.souza', 'EMPRESTIMO', 'EXPORTADO', NOW()),
      (3, 'carlos.lima', 'CARTAO_CREDITO', 'REJEITADO', NOW()),
      (4, 'ana.costa', 'ABERTURA_CONTA', 'PENDENTE', NOW()),
      (5, 'pedro.alves', 'FINANCIAMENTO', 'EXPORTADO', NOW()),
      (6, 'fernanda.rocha', 'ABERTURA_CONTA', 'PENDENTE', NOW()),
      (7, 'lucas.melo', 'EMPRESTIMO', 'REJEITADO', NOW()),
      (8, 'juliana.ribeiro', 'CARTAO_CREDITO', 'PENDENTE', NOW()),
      (9, 'rafael.santos', 'ABERTURA_CONTA', 'EXPORTADO', NOW()),
      (10, 'patricia.gomes', 'FINANCIAMENTO', 'PENDENTE', NOW()),
      (11, 'roberto.lima', 'EMPRESTIMO', 'PENDENTE', NOW()),
      (12, 'aline.ferreira', 'CARTAO_CREDITO', 'EXPORTADO', NOW()),
      (13, 'gabriel.costa', 'ABERTURA_CONTA', 'REJEITADO', NOW()),
      (14, 'camila.silva', 'FINANCIAMENTO', 'PENDENTE', NOW()),
      (15, 'thiago.pereira', 'EMPRESTIMO', 'EXPORTADO', NOW()),
      (16, 'bruna.martins', 'ABERTURA_CONTA', 'PENDENTE', NOW()),
      (17, 'ricardo.oliveira', 'CARTAO_CREDITO', 'REJEITADO', NOW()),
      (18, 'larissa.santos', 'FINANCIAMENTO', 'EXPORTADO', NOW()),
      (19, 'marcos.ferreira', 'ABERTURA_CONTA', 'PENDENTE', NOW()),
      (20, 'renata.almeida', 'EMPRESTIMO', 'PENDENTE', NOW());



-- DOCUMENTOS

INSERT INTO documento (
    id,
    lote_id,
    tipo,
    nome
) VALUES

      (1, 1, 'RG', 'rg_1.jpg'),
      (2, 1, 'CPF', 'cpf_1.pdf'),

      (3, 2, 'RG', 'rg_2.jpg'),
      (4, 2, 'CPF', 'cpf_2.pdf'),

      (5, 3, 'RG', 'rg_3.jpg'),
      (6, 3, 'CPF', 'cpf_3.pdf'),

      (7, 4, 'RG', 'rg_4.jpg'),
      (8, 4, 'CPF', 'cpf_4.pdf'),

      (9, 5, 'RG', 'rg_5.jpg'),
      (10, 5, 'CPF', 'cpf_5.pdf'),

      (11, 6, 'RG', 'rg_6.jpg'),
      (12, 6, 'CPF', 'cpf_6.pdf'),

      (13, 7, 'RG', 'rg_7.jpg'),
      (14, 7, 'CPF', 'cpf_7.pdf'),

      (15, 8, 'RG', 'rg_8.jpg'),
      (16, 8, 'CPF', 'cpf_8.pdf'),

      (17, 9, 'RG', 'rg_9.jpg'),
      (18, 9, 'CPF', 'cpf_9.pdf'),

      (19, 10, 'RG', 'rg_10.jpg'),
      (20, 10, 'CPF', 'cpf_10.pdf'),

      (21, 11, 'RG', 'rg_11.jpg'),
      (22, 11, 'CPF', 'cpf_11.pdf'),

      (23, 12, 'RG', 'rg_12.jpg'),
      (24, 12, 'CPF', 'cpf_12.pdf'),

      (25, 13, 'RG', 'rg_13.jpg'),
      (26, 13, 'CPF', 'cpf_13.pdf'),

      (27, 14, 'RG', 'rg_14.jpg'),
      (28, 14, 'CPF', 'cpf_14.pdf'),

      (29, 15, 'RG', 'rg_15.jpg'),
      (30, 15, 'CPF', 'cpf_15.pdf'),

      (31, 16, 'RG', 'rg_16.jpg'),
      (32, 16, 'CPF', 'cpf_16.pdf'),

      (33, 17, 'RG', 'rg_17.jpg'),
      (34, 17, 'CPF', 'cpf_17.pdf'),

      (35, 18, 'RG', 'rg_18.jpg'),
      (36, 18, 'CPF', 'cpf_18.pdf'),

      (37, 19, 'RG', 'rg_19.jpg'),
      (38, 19, 'CPF', 'cpf_19.pdf'),

      (39, 20, 'RG', 'rg_20.jpg'),
      (40, 20, 'CPF', 'cpf_20.pdf');