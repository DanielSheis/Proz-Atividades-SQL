CREATE TABLE produtos (
  id serial PRIMARY KEY,
  nome varchar(255),
  preco decimal(10,2)
);

CREATE TABLE compras (
  id serial PRIMARY KEY,
  produto_id INT REFERENCES produtos (id),
  quantidade INT,
  total decimal(10,2)
);


INSERT into produtos(nome,preco) VALUES
  ('Caderno',25.99),
  ('Lapis',1.50),
  ('Borracha',3.99),
  ('caneta',2.99);
  
INSERT into compras(produto_id, quantidade, total) VALUES
  (1, 30, 779.7),
  (2, 50, 75),
  (3, 20, 79.80),
  (4, 70, 209.30);
  
  
CREATE PROCEDURE quantidade_comprado ()
AS
$$
BEGIN
  PERFORM SELECT p.nome, c.quantidade
  FROM produtos p
  JOIN compras C ON p.id = C.produto_id
  GROUP BY p.nome, C.quantidade;
END;
$$ LANGUAGE plpgsql;

CALL quantidade_comprado();
