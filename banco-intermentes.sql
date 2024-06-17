CREATE DATABASE BD_INTERMENTES;
USE BD_INTERMENTES;

-- Criar tabela Tb_Pagamento
CREATE TABLE Tb_Pagamento (
  Pk_Id_Meio_Pagamento INT PRIMARY KEY AUTO_INCREMENT,
  Valor DOUBLE NOT NULL,
  Data DATE NOT NULL,
  FK_ID_CPF_Paciente INT,
  FK_ID_Agendamento INT,
  FK_ID_Profissional INT);
  
  

-- Criar tabela Tb_Pacientes
CREATE TABLE Tb_Pacientes (
  Pk_Id_Cpf_Paciente INT PRIMARY KEY AUTO_INCREMENT,
  Senha_Paciente VARCHAR(200) NOT NULL,
  Etnia_Paciente ENUM('Negro', 'Branco', 'Pardo', 'Amarelo', 'Indígena', 'Todos') NOT NULL,
  Nome_Completo_Paciente VARCHAR(255) NOT NULL,
  Genero_Paciente ENUM('Masculino', 'Feminino', 'Outro') NOT NULL,
  Data_Nasc_Paciente DATE NOT NULL,
  Email_Paciente VARCHAR(255) NOT NULL,
  Telefone_Celular_Paciente VARCHAR(20) NOT NULL,
  Contato_Emergencia VARCHAR(20),
  Fk_id_pagamento INT);
  
  
-- Criar tabela Tb_Profissional
CREATE TABLE Tb_Profissional (
  Pk_Id_Cpf_Profissional INT PRIMARY KEY,
  Nome_Profissional VARCHAR(100),
  Telefone_Celular_Profissional VARCHAR(15),
  CRP VARCHAR(10),
  Especialidade VARCHAR(100),
  Genero_Profissional VARCHAR(20),
  Email_Profissional VARCHAR(100),
  Pontos_Sociais INT,
  Formacao_Academica TEXT,
  Data_Nasc_Profissional DATE,
  Biografia_Profissional TEXT,
  Foto_Profissional BLOB,
  Etnia_Profissional VARCHAR(50),
  Historico_Profissional TEXT,
  Senha_Profissional VARCHAR(255),
  Avaliacoes_Dos_Pacientes TEXT,
  Avaliacao_Geral FLOAT,
  Agenda_Profissional TEXT,
  Subcategorias TEXT,
  Data_Validade_Cartao_CVV VARCHAR(5),
  Num_Cartao VARCHAR(16),
  Nome_Completo_Titular VARCHAR(100),
  Data_Expiracao DATE,
  Metodo_Pagamento ENUM('Credito', 'Debito'),
  Fk_id_rembolso INT);
  

-- Criar tabela Tb_Rembolso
CREATE TABLE Tb_Rembolso (
  Pk_Id_Rembolso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Fk_Id_Pagamento INT NOT NULL,
  Fk_Id_CPF_Paciente INT NOT NULL,
  Metodo_Pagamento ENUM('Credito', 'Debito', 'Pix') NOT NULL,
  Motivo VARCHAR(255) NOT NULL);
  
  

-- Criar tabela Tb_Agendamento
CREATE TABLE Tb_Agendamento (
  Pk_Id_Consulta INT PRIMARY KEY AUTO_INCREMENT,
  Data DATE NOT NULL,
  Hora TIME NOT NULL,
  Status_Pagamento ENUM('Pendente', 'Pago', 'Cancelado') NOT NULL,
  FK_ID_CPF_Paciente INT,
  FK_ID_CPF_Profissional INT);
  
-- Constraint

ALTER TABLE Tb_Pagamento
ADD CONSTRAINT FK_Pagamento_Paciente
FOREIGN KEY (FK_ID_CPF_Paciente)
REFERENCES Tb_Pacientes(Pk_Id_Cpf_Paciente);


ALTER TABLE Tb_Pagamento
ADD CONSTRAINT FK_Pagamento_Agendamento
FOREIGN KEY (FK_ID_Agendamento)
REFERENCES Tb_Agendamento(Pk_Id_Consulta);

ALTER TABLE Tb_Pagamento
ADD CONSTRAINT FK_Pagamento_Profissional
FOREIGN KEY (FK_ID_Profissional)
REFERENCES Tb_Profissional(Pk_Id_Cpf_Profissional);

ALTER TABLE Tb_Pacientes
ADD CONSTRAINT FK_Pacientes_Pagamento
FOREIGN KEY (Fk_id_pagamento)
REFERENCES Tb_Pagamento(Pk_Id_Meio_Pagamento);

ALTER TABLE Tb_Profissional
ADD CONSTRAINT FK_Profissional_Rembolso
FOREIGN KEY (Fk_id_rembolso)
REFERENCES Tb_Rembolso(Pk_Id_Rembolso);

select * from Tb_Pagamento;





