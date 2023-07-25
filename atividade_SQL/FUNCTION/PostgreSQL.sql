CREATE TABLE cadastro_cliente (
   id_cadastro SERIAL PRIMARY KEY,
   nome_cliente VARCHAR(80) NOT NULL,
   idade INT NOT NULL,
   email VARCHAR(261) NOT NULL,
   data_cadastro DATE NOT NULL DEFAULT CURRENT_DATE
)
 
INSERT INTO cadastro_cliente(nome_cliente,idade,email) VALUES
  ('John Doe', 30, 'john.doe@example.com'),
  ('Jane Smith', 25, 'jane.smith@example.com'),
  ('Michael Johnson', 42, 'michael.johnson@example.com'),
  ('Emily Brown', 35, 'emily.brown@example.com');
  
CREATE or REPLACE FUNCTION cadastro_diario ()
RETURNs INT
AS
$$
DECLARE
  total_cliente INT;
BEGIN
  SELECT COUNT(*) INTO total_cliente FROM cadastro_cliente WHERE data_cadastro = CURRENT_DATE;
  RETURN total_cliente;
END;
$$
LANGUAGE plpgsql;

SELECT cadastro_diario()
