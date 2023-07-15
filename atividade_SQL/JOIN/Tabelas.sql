create table loja(
  id_loja SERIAL PRIMARY KEY,
  nome VARCHAR(20) not NULL,
  quant_trabalhadores INT,
  endereco VARCHAR(40) not NULL
 );
 
 CREATE TABLE produtos(
   id_produtos SERIAL PRIMARY KEY,
   nome VARCHAR(40) NOT NULL,
   preco MONEY NOT NULL,
   id_loja INT,
   CONSTRAINT fk_loja_produtos
   FOREIGN KEY (id_loja)
   REFERENCES loja(id_loja)
  )