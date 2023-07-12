CREATE TABLE aluno(
  	aluno_id SERIAL PRIMARY KEY,
	nome VARCHAR(35) not NULL,
  	matricula INT not NULL,
 	email VARCHAR(256),
  	endereco VARCHAR(300) not NULL,
  	telefone INT not NULL
)