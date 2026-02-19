CREATE TABLE pessoa (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL,
    updated_by VARCHAR(255) NOT NULL
);

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    pessoa_id INT REFERENCES pessoa(id) ON DELETE CASCADE,
    matricula VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL,
    updated_by VARCHAR(255) NOT NULL
);

CREATE TABLE responsavel_financeiro (
    id SERIAL PRIMARY KEY,
    pessoa_id INT REFERENCES pessoa(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL,
    updated_by VARCHAR(255) NOT NULL
);

CREATE TABLE aluno_responsavel_financeiro (
    aluno_id INT REFERENCES aluno(id) ON DELETE CASCADE,
    responsavel_id INT REFERENCES responsavel_financeiro(id) ON DELETE CASCADE,
    PRIMARY KEY (aluno_id, responsavel_id)
);

CREATE TABLE contrato (
    id SERIAL PRIMARY KEY,
    aluno_id INT REFERENCES aluno(id) ON DELETE CASCADE,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL,
    updated_by VARCHAR(255) NOT NULL
);

CREATE TABLE parcela (
    id SERIAL PRIMARY KEY,
    contrato_id INT REFERENCES contrato(id) ON DELETE CASCADE,
    numero_parcela INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_vencimento DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL,
    updated_by VARCHAR(255) NOT NULL
);

CREATE TABLE atendimento (
    id SERIAL PRIMARY KEY,
    aluno_id INT REFERENCES aluno(id) ON DELETE CASCADE,
    data_atendimento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descricao TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL,
    updated_by VARCHAR(255) NOT NULL
);

CREATE TABLE regra_split (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    percentual DECIMAL(5, 2) NOT NULL CHECK (percentual >= 0 AND percentual <= 100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL,
    updated_by VARCHAR(255) NOT NULL
);

CREATE TABLE repasse (
    id SERIAL PRIMARY KEY,
    contrato_id INT REFERENCES contrato(id) ON DELETE CASCADE,
    valor DECIMAL(10, 2) NOT NULL,
    data_repassado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL,
    updated_by VARCHAR(255) NOT NULL
);