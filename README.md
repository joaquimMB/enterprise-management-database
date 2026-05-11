# Enterprise Management Database — SQL Study

A comprehensive relational database project modeling a complete enterprise system, built during the Associate Degree in Information Systems (ADS).

The system covers all major departments of a company — HR, Finance, Marketing, IT, Sales, Logistics, Purchasing, Production and Customer Support.

## Database Structure

| Table                    | Description                                      |
|--------------------------|--------------------------------------------------|
| Departamento             | Company departments                              |
| RH_Funcionario           | Employees linked to departments                  |
| Financeiro               | Financial entries (revenue and expenses)         |
| Marketing                | Marketing campaigns with budget and timeline     |
| Vendas                   | Sales records linked to employees and clients    |
| TI_Equipamentos          | IT equipment inventory                           |
| Pesquisa_Desenvolvimento | R&D projects with budget and timeline            |
| Producao                 | Production records with cost and quantity        |
| Suporte_Cliente          | Customer support tickets and solutions           |
| Logistica                | Transport and delivery records                   |
| Compras                  | Purchase orders from suppliers                   |
| Cliente                  | Customer records                                 |
| Produto                  | Product catalog with stock and pricing           |
| Pedido                   | Orders linked to customers and employees         |
| Item_Pedido              | Individual items within each order               |

## Relationships

```
Departamento     1 ----< RH_Funcionario
RH_Funcionario   1 ----< Financeiro
RH_Funcionario   1 ----< Marketing
RH_Funcionario   1 ----< Vendas
RH_Funcionario   1 ----< TI_Equipamentos
RH_Funcionario   1 ----< Pesquisa_Desenvolvimento
RH_Funcionario   1 ----< Producao
RH_Funcionario   1 ----< Suporte_Cliente
RH_Funcionario   1 ----< Compras
RH_Funcionario   1 ----< Pedido
Cliente          1 ----< Vendas
Cliente          1 ----< Suporte_Cliente
Cliente          1 ----< Pedido
Produto          1 ----< Producao
Produto          1 ----< Compras
Produto          1 ----< Item_Pedido
Pedido           1 ----< Item_Pedido
Pedido           1 ----< Logistica
```

## Technologies

- SQL (MySQL syntax)
- Relational Database Design
- Entity-Relationship Modeling

## How to Run

1. Open your preferred SQL client (MySQL Workbench, DBeaver, etc.)
2. Run the full `schema.sql` script
3. All tables will be created and populated with sample data

## What I Learned

- Modeling a complete multi-department enterprise system
- Primary and foreign key constraints across multiple tables
- One-to-many relationships between entities
- Real business data structures — HR, Finance, Sales, Logistics
- SQL INSERT, SELECT across related tables

## Status

> 📌 Academic project built during ADS degree. Some tables reference columns declared inline (not in CREATE TABLE) and insert order was adjusted during development — known limitations kept as-is to document the learning process.
