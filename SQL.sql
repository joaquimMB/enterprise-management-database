create table Departamento(
DepartamentoId varchar(80) not null primary key,
Nome varchar(80) not null,
Descricao varchar(80) not null
);
insert into Departamento values ('D001', 'Recursos Humanos', 'Gestão de pessoas'),
insert into Departamento values ('D002', 'Financeiro', 'Controle financeiro'),
insert into Departamento values ('D003', 'Marketing', 'Estratégias de mercado'),
insert into Departamento values ('D004', 'TI', 'Tecnologia da informação');
select * from Departamento;
create table RH_Funcionario (
FuncionarioId varchar(78) not null primary key,
Nome varchar(78) not null,
Sobrenome varchar(78) not null,
DataNascimento date not null,
Cargo varchar(78) not null,
Salario decimal(10,2) not null,
DataContratacao date not null,
DepartamentoId varchar(80) not null,
foreign key (DepartamentoId) references Departamento(DepartamentoId)
);
insert into RH_Funcionario values ('F001', 'João', 'Silva', '1985-06-15', 'Gerente', 7500.00,
'2010-03-01', 'D001'),
insert into RH_Funcionario values ('F002', 'Maria', 'Oliveira', '1990-09-23', 'Analista
Financeiro', 5500.00, '2015-08-15', 'D002'),
insert into RH_Funcionario values ('F003', 'Carlos', 'Santos', '1988-11-05', 'Analista de
Marketing', 6000.00, '2013-04-21', 'D003'),
insert into RH_Funcionario values ('F004', 'Ana', 'Costa', '1992-01-17', 'Analista de TI',
6200.00, '2016-07-11', 'D004');
select * from RH_Funcionario;
create table Financeiro (
FinanceiroId varchar(98) not null primary key,
TipoLancamento varchar(98) not null,
Valor decimal(10,2) not null,
DataLancamento date not null,
Descricao varchar(98) not null,
FuncionarioId varchar(78) not null,
foreign key (FuncionarioId) references RH_Funcionario(FuncionarioId)
);
insert into Financeiro values ('FIN001', 'Receita', 15000.00, '2023-01-10', 'Venda de
produtos', 'F002'),
insert into Financeiro values ('FIN002', 'Despesa', 5000.00, '2023-01-15', 'Compra de
materiais', 'F002');
select * from Financeiro;
create table Marketing (
CampanhaId varchar(56) not null primary key,
NomeCampanha varchar(56) not null,
DataInicio date not null,
DataFim date not null,
Orcamento decimal(10,2) not null,
Descricao varchar(87) not null,
ResponsavelId varchar(78) not null,
foreign key (ResponsavelId) references RH_Funcionario(FuncionarioId)
);
insert into Marketing values ('MKT001', 'Campanha de Verão', '2023-06-01', '2023-08-31',
20000.00, 'Promoção de verão para novos clientes', 'F003');
select * from Marketing;
create table Vendas(
VendaId varchar (89) not null primary key,
DataVenda date not null,
foreign key (ClienteId) references RH_Funcionario(FuncionarioId),
foreign key (FuncionarioId) references RH_Funcionario(FuncionarioId),
ValorTotal decimal (10,2) not null
);
insert into Vendas values ('VND001', '2023-03-15', 'C001', 'F001', 500.00),
insert into Vendas values ('VND002', '2023-03-20', 'C002', 'F003', 1500.00);
select * from Vendas;
create table TI_Equipamentos (
EquipamentoId varchar(78) not null primary key,
Nome varchar(78) not null,
Tipo varchar(78) not null,
DataAquisicao date not null,
Valor decimal(10,2) not null,
Status varchar(78) not null,
foreign key (ResponsavelId) references RH_Funcionario(FuncionarioId)
);
insert into TI_Equipamentos values ('TI001', 'Notebook HP', 'Computador', '2022-01-10',
3500.00, 'Em uso', 'F004'),
insert into TI_Equipamentos values ('TI002', 'Impressora Epson', 'Impressora', '2021-11-05',
1200.00, 'Em uso', 'F004');
select * from TI_Equipamentos;
create table Pesquisa_Desenvolvimento (
ProjetoId varchar(78) not null primary key,
NomeProjeto varchar(78) not null,
DataInicio date not null,
DataFim date not null,
Orcamento decimal(10,2) not null,
Descricao varchar(200),
foreign key (ResponsavelId) references RH_Funcionario(FuncionarioId)
);
insert into Pesquisa_Desenvolvimento values ('PESQ001', 'Novo Produto XYZ',
'2023-02-01', '2023-12-31', 50000.00, 'Desenvolvimento de novo produto', 'F003');
select * from Pesquisa_Desenvolvimento;
create table Producao (
ProducaoId varchar(78) not null primary key,
foreign key (ProdutoId) references Produto(ProdutoId),
QuantidadeProduzida int not null,
DataProducao date not null,
Custo decimal(10,2) not null,
foreign key (ResponsavelId) references RH_Funcionario(FuncionarioId)
);
insert intoProducao values ('PROD001', 'P001', 100, '2023-04-10', 20000.00, 'F001');
select * from Producao;
create table Suporte_Cliente (
AtendimentoId varchar(78) not null primary key,
foreign key (ClienteId) references Cliente(ClienteId),
DataAtendimento date not null,
DescricaoProblema varchar(200) not null,
Solucao varchar(200),
foreign key (ResponsavelId) references RH_Funcionario(FuncionarioId)
);
insert into Suporte_Cliente values ('SUP001', 'C001', '2023-05-20', 'Problema com o produto
X', 'Produto substituído', 'F002');
select * from Suporte_Cliente;
create table Logistica (
TransporteId varchar(78) not null primary key,
TipoTransporte varchar(78) not null,
DataEnvio date not null,
DataEntrega date,
CustoTransporte decimal(10,2) not null,
foreign key (PedidoId) references Pedido(PedidoId)
);
insert into Logistica values ('LOG001', 'Terrestre', '2023-06-01', '2023-06-03', 500.00,
'PED001');
select * from Logistica;
create table Compras (
CompraId varchar(78) not null primary key,
Fornecedor varchar(78) not null,
foreign key (ProdutoId) references Produto(ProdutoId),
Quantidade int not null,
DataCompra date not null,
ValorTotal decimal(10,2) not null,
foreign key (ResponsavelId) references RH_Funcionario(FuncionarioId)
);
insert into Compras values ('COMP001', 'Fornecedor ABC', 'P001', 200, '2023-03-25',
3000.00, 'F002');
select * from Compras;
create table Cliente (
ClienteId varchar(78) not null primary key,
Nome varchar(78) not null,
Sobrenome varchar(78) not null,
Email varchar(100) not null,
Telefone varchar(20) not null,
Endereco varchar(200) not null
);
insert into Clientes values ('C001', 'Lucas', 'Moura', 'lucas.moura@example.com', '555-1234',
'Rua A, 123, Cidade X'),
select * from Cliente;
create table Produto (
ProdutoId varchar(78) not null primary key,
Nome varchar(78) not null,
Descricao varchar(200),
Preco decimal(10,2) not null,
Estoque int not null
);
insert into Produto values ('P002', 'Celular', 'O celular é novo e de boa qualidade', 200.00,
30);
select * from Produto;
create table Pedido (
PedidoId varchar(78) not null primary key,
DataPedido date not null,
foreign key (ClienteId) references Cliente(ClienteId),
foreign key (ResponsavelId) references RH_Funcionario(FuncionarioId),
Total decimal(10,2) not null
);
insert into Pedidos values ('PED001', '2023-05-01', 'C001', 'F001', 500.00);
select * from Pedido;
create table Item_Pedido (
ItemPedidoId varchar(78) not null primary key,
foreign key (PedidoId) references Pedido(PedidoId),
foreign key (ProdutoId) references Produto(ProdutoId),
Quantidade int not null,
PrecoUnitario decimal(10,2) not null
);
insert into Item_Pedido values ('ITEM001', 'PED001', 'P001', 2, 150.00);
select * from Item_Pedido;