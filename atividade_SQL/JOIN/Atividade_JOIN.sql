SELECT nome_loja, endereco from loja
INNER join produtos
on produtos.id_produtos = loja.id_loja;

SELECT nome_loja, endereco from loja
LEFT join produtos
on produtos.id_produtos = loja.id_loja;

SELECT nome_loja, endereco from loja
RIGHT join produtos
on produtos.id_produtos = loja.id_loja;

SELECT nome_loja, endereco from loja
FULL join produtos
on produtos.id_produtos = loja.id_loja;
