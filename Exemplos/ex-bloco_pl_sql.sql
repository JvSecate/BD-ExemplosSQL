--1- crie um bloco pl/sql para imprimir o nome e a cidade do professor de código: p003.

declare
v_nome_prof varchar(20);
v_cidade_prof varchar(20);

begin
    select a.nome_professor, c.nome_cidade
        into nome_prof, cidade_prof
        from professor a, cidade c
        where a.cod_professor = 'p003' and
            a.id_cidade = c.id_cidade;
    dbms_output.put_line('Nome: ' || nome_prof);
    dbms_output.put_line('Cidade: '|| cidade_prof);
end;

--2 - Crie um bloco PL/SQL para imprimir o nome e a cidade do professor de código: P003 utilizando %TYPE.

declare
nome_professor professor.nome_professor%type;
nome_cidade cidade.nome_cidade%type;

begin
select p.nome_professor, c.nome_cidade
into nome_professor, nome_cidade
from professor p, cidade c
where p.id_cidade = c.id_cidade
and p.cod_professor = 'p003';
dbms_output.put('Nome do professor: '|| nome_professor);
dbms_output.put_line(' e nome da cidade: '|| nome_cidade);
end;

--3 - Crie um bloco PL/SQL para imprimir o nome e a cidade do professor de código: P003 utilizando %ROWTYPE.

declare
v_professor professor%rowtype;
v_cidade cidade%rowtype;

begin
select *
into v_professor,v_cidade
from professor,cidade
where cod_professor = 'p003'and 
id_cidade = v_professor.id_cidade;

dbms_output.put_line('Nome do professor: ' || v_professor.nome_professor);
dbms_output.put_line('Nome da cidade: ' || v_cidade.nome_cidade);
end;
