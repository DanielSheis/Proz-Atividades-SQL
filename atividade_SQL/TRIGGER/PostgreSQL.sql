CREATE TABLE produtos (
  id_produto SERIAL PRIMARY KEY,
  descricao VARCHAR(30) not NULL,
  qtdes_produtos INT NOT NULL DEFAULT 0
);

CREATE TABLE vendas_produtos (
  codigo_vendas INT,
  id_produto INT,
  qte_vendas INT,
  FOREIGN KEY(id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO produtos(descricao, qtdes_produtos) VALUES
	('Laranja', 10),
    ('Maça', 5),
    ('Melancia', 20);
    
CREATE TRIGGER atulizacao_produtos
BEFORE INSERT on vendas_produtos
FOR EACH ROW
execute PROCEDURE func_atulizar_produtos();

CREATE or REPLACE FUNCTION func_atulizar_produtos() RETURNs TRIGGER
AS
$$
DECLARE
	quantidade INT;
BEGIN
	SELECT qtdes_produtos FROM produtos WHERE id_produto = NEW.cod_produto into quantidade;
    if quantidade < new.quantidade_vendida THEN
    	RAISE EXCEPTION 'A quantidade de produto a ser comprada é maior que o estoque.';
    ELSE
    	UPDATE produtos set qtdes_produtos = qtdes_produtos - NEW.quantidade_vendida
        	WHERE id_produto = new.cod_produto;
    end if;
    RETURN new;
end;
$$ LANGUAGE plpgsql;

INSERT INTO vendas_produtos(codigo_vendas, id_produto, qte_vendas) VALUES
	(1, 1, 5),
    (2, 2, 1),
    (3, 3, 7);

SELECT * FROM vendas_produtos