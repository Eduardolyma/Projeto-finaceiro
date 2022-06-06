-- comentários
-- a linha de baixo cria um banco de dados 
create database dbpf;
-- a linha a abaixo escolhe o banco de daddos
use dbpf;
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);
-- o comando a baixo descreve a tabela 
describe tbusuarios;
-- a linha abaixo insere dados na tabela (CRUD)
-- create
insert into tbusuarios(iduser,usuario,fone,login,senha)
value(1, 'jose de assis', '9999-9999', 'joseassis', '12345');
insert into tbusuarios(iduser,usuario,fone,login,senha)
value(2, 'administrador','9999-9999', 'admin', 'admin');
-- a linha a baixo exibe os dados da tabela (CRUD)
-- read -> select
select * from tbusuarios;

-- a linha abaixo modifica dados na tabela (CRUD)
-- update - > update
update tbusuarios set fone='8888-8888' where iduser=2;

-- a linha abaixo apaga um registro na tabela
-- delete -> delete
delete from tbusuarios where iduser=1;
select * from tbusuarios;

-- a linha abaixo cria tabela de clintes
-- create -> table
create table tbcliente(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50)not null,
emailcli varchar(50)not null,
cpfcli varchar(20)not null
);
describe tbcliente;
insert into tbcliente(nomecli,endcli,fonecli,emailcli,cpfcli)
values('Linus torvalds', 'Rua tux, 2015', '9999-9999', 'linus@linux.com', '52125478965');
select * from tbcliente;

user dbpf;
-- linha a baixo os de chamadas

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150),
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbcliente(idcli)
);

describe tbos;

insert into tbos (equipamento,defeito,servico,tecnico,valor,idcli)
values ('notebook', 'nao liga', 'troca da fonte', 'ze', 87.50,1);
select * from tbos;

-- o codigo abaixo traz informação de duas tabelas

select
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from tbos as O
inner join tbcliente as C
on(O.idcli = C.idcli);









