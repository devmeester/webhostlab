-- =====================================================================
-- WebHost Lab - Script de criacao do banco de dados
-- Disciplina: Server and Data Center Administration (UniFECAF)
-- Servidor: WEB-SRV01 (Windows Server 2022 + IIS + MySQL)
-- Autor: Kainã
--
-- Este script cria o banco, a tabela e os registros de teste.
-- Nao contem senhas nem comandos de criacao de usuarios.
-- =====================================================================

-- Garante que acentos sejam lidos corretamente pelo cliente do Windows
SET NAMES utf8mb4;

-- 1. Banco de dados
CREATE DATABASE IF NOT EXISTS webhost_lab
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE webhost_lab;

-- 2. Tabela: sites hospedados no servidor
CREATE TABLE IF NOT EXISTS sites_hospedados (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    nome_site     VARCHAR(100) NOT NULL,
    dominio       VARCHAR(100) NOT NULL UNIQUE,
    cliente       VARCHAR(100) NOT NULL,
    status        ENUM('ativo', 'em_manutencao', 'inativo') NOT NULL DEFAULT 'ativo',
    data_criacao  DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Registros de teste (INSERT IGNORE evita duplicar se o script rodar de novo)
INSERT IGNORE INTO sites_hospedados (nome_site, dominio, cliente, status, data_criacao) VALUES
    ('Site Institucional WebCore', 'webcore.lab',        'WebCore Solutions',       'ativo',         '2026-11-01'),
    ('Padaria Boa Massa',          'boamassa.lab',       'Padaria Boa Massa Ltda',  'ativo',         '2026-11-03'),
    ('Clínica Vida Plena',         'vidaplena.lab',      'Clínica Vida Plena',      'em_manutencao', '2026-11-05'),
    ('Escritório Silva & Costa',   'silvacosta.lab',     'Silva & Costa Advocacia', 'ativo',         '2026-11-08'),
    ('Portal Interno RH',          'rh.webcore.lab',     'WebCore Solutions',       'inativo',       '2026-11-10');

-- 4. Consultas de verificacao
DESCRIBE sites_hospedados;

SELECT * FROM sites_hospedados;

SELECT COUNT(*) AS total_de_sites FROM sites_hospedados;

SELECT status, COUNT(*) AS quantidade
FROM sites_hospedados
GROUP BY status;

Claude finished the response
