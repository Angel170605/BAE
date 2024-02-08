# TAREA 10 
## 1.Proporciona una consulta que muestre solo los clientes de Brasil.
```sql
select * from customers where Country = "Brazil";
CustomerId  FirstName  LastName   Company                                           Address                          City                 State  Country  PostalCode  Phone               Fax                 Email                          SupportRepId
----------  ---------  ---------  ------------------------------------------------  -------------------------------  -------------------  -----  -------  ----------  ------------------  ------------------  -----------------------------  ------------
1           Luís       Gonçalves  Embraer - Empresa Brasileira de Aeronáutica S.A.  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP     Brazil   12227-000   +55 (12) 3923-5555  +55 (12) 3923-5566  luisg@embraer.com.br           3           
10          Eduardo    Martins    Woodstock Discos                                  Rua Dr. Falcão Filho, 155        São Paulo            SP     Brazil   01007-010   +55 (11) 3033-5446  +55 (11) 3033-4564  eduardo@woodstock.com.br       4           
11          Alexandre  Rocha      Banco do Brasil S.A.                              Av. Paulista, 2022               São Paulo            SP     Brazil   01310-200   +55 (11) 3055-3278  +55 (11) 3055-8131  alero@uol.com.br               5           
12          Roberto    Almeida    Riotur                                            Praça Pio X, 119                 Rio de Janeiro       RJ     Brazil   20040-020   +55 (21) 2271-7000  +55 (21) 2271-7070  roberto.almeida@riotur.gov.br  3           
13          Fernanda   Ramos                                                        Qe 7 Bloco G                     Brasília             DF     Brazil   71020-677   +55 (61) 3363-5547  +55 (61) 3363-7855  fernadaramos4@uol.com.br       4           



```
## 2.Proporciona una consulta que muestre las facturas de clientes que son de Brasil.
```sql
select * from customers as c, invoices as i where c.customerid = i.customerid and Country = "Brazil";
CustomerId  FirstName  LastName   Company                                           Address                          City                 State  Country  PostalCode  Phone               Fax                 Email                          SupportRepId  InvoiceId  CustomerId  InvoiceDate          BillingAddress                   BillingCity          BillingState  BillingCountry  BillingPostalCode  Total
----------  ---------  ---------  ------------------------------------------------  -------------------------------  -------------------  -----  -------  ----------  ------------------  ------------------  -----------------------------  ------------  ---------  ----------  -------------------  -------------------------------  -------------------  ------------  --------------  -----------------  -----
1           Luís       Gonçalves  Embraer - Empresa Brasileira de Aeronáutica S.A.  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP     Brazil   12227-000   +55 (12) 3923-5555  +55 (12) 3923-5566  luisg@embraer.com.br           3             98         1           2010-03-11 00:00:00  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP            Brazil          12227-000          3.98 
1           Luís       Gonçalves  Embraer - Empresa Brasileira de Aeronáutica S.A.  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP     Brazil   12227-000   +55 (12) 3923-5555  +55 (12) 3923-5566  luisg@embraer.com.br           3             121        1           2010-06-13 00:00:00  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP            Brazil          12227-000          3.96 
1           Luís       Gonçalves  Embraer - Empresa Brasileira de Aeronáutica S.A.  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP     Brazil   12227-000   +55 (12) 3923-5555  +55 (12) 3923-5566  luisg@embraer.com.br           3             143        1           2010-09-15 00:00:00  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP            Brazil          12227-000          5.94 
1           Luís       Gonçalves  Embraer - Empresa Brasileira de Aeronáutica S.A.  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP     Brazil   12227-000   +55 (12) 3923-5555  +55 (12) 3923-5566  luisg@embraer.com.br           3             195        1           2011-05-06 00:00:00  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP            Brazil          12227-000          0.99 
1           Luís       Gonçalves  Embraer - Empresa Brasileira de Aeronáutica S.A.  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP     Brazil   12227-000   +55 (12) 3923-5555  +55 (12) 3923-5566  luisg@embraer.com.br           3             316        1           2012-10-27 00:00:00  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP            Brazil          12227-000          1.98 
1           Luís       Gonçalves  Embraer - Empresa Brasileira de Aeronáutica S.A.  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP     Brazil   12227-000   +55 (12) 3923-5555  +55 (12) 3923-5566  luisg@embraer.com.br           3             327        1           2012-12-07 00:00:00  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP            Brazil          12227-000          13.86
1           Luís       Gonçalves  Embraer - Empresa Brasileira de Aeronáutica S.A.  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP     Brazil   12227-000   +55 (12) 3923-5555  +55 (12) 3923-5566  luisg@embraer.com.br           3             382        1           2013-08-07 00:00:00  Av. Brigadeiro Faria Lima, 2170  São José dos Campos  SP            Brazil          12227-000          8.91 
10          Eduardo    Martins    Woodstock Discos                                  Rua Dr. Falcão Filho, 155        São Paulo            SP     Brazil   01007-010   +55 (11) 3033-5446  +55 (11) 3033-4564  eduardo@woodstock.com.br       4             25         10          2009-04-09 00:00:00  Rua Dr. Falcão Filho, 155        São Paulo            SP            Brazil          01007-010          8.91 
10          Eduardo    Martins    Woodstock Discos                                  Rua Dr. Falcão Filho, 155        São Paulo            SP     Brazil   01007-010   +55 (11) 3033-5446  +55 (11) 3033-4564  eduardo@woodstock.com.br       4             154        10          2010-11-14 00:00:00  Rua Dr. Falcão Filho, 155        São Paulo            SP            Brazil          01007-010          1.98 
10          Eduardo    Martins    Woodstock Discos                                  Rua Dr. Falcão Filho, 155        São Paulo            SP     Brazil   01007-010   +55 (11) 3033-5446  +55 (11) 3033-4564  eduardo@woodstock.com.br       4             177        10          2011-02-16 00:00:00  Rua Dr. Falcão Filho, 155        São Paulo            SP            Brazil          01007-010          3.96 
10          Eduardo    Martins    Woodstock Discos                                  Rua Dr. Falcão Filho, 155        São Paulo            SP     Brazil   01007-010   +55 (11) 3033-5446  +55 (11) 3033-4564  eduardo@woodstock.com.br       4             199        10          2011-05-21 00:00:00  Rua Dr. Falcão Filho, 155        São Paulo            SP            Brazil          01007-010          5.94 
10          Eduardo    Martins    Woodstock Discos                                  Rua Dr. Falcão Filho, 155        São Paulo            SP     Brazil   01007-010   +55 (11) 3033-5446  +55 (11) 3033-4564  eduardo@woodstock.com.br       4             251        10          2012-01-09 00:00:00  Rua Dr. Falcão Filho, 155        São Paulo            SP            Brazil          01007-010          0.99 
10          Eduardo    Martins    Woodstock Discos                                  Rua Dr. Falcão Filho, 155        São Paulo            SP     Brazil   01007-010   +55 (11) 3033-5446  +55 (11) 3033-4564  eduardo@woodstock.com.br       4             372        10          2013-07-02 00:00:00  Rua Dr. Falcão Filho, 155        São Paulo            SP            Brazil          01007-010          1.98 
10          Eduardo    Martins    Woodstock Discos                                  Rua Dr. Falcão Filho, 155        São Paulo            SP     Brazil   01007-010   +55 (11) 3033-5446  +55 (11) 3033-4564  eduardo@woodstock.com.br       4             383        10          2013-08-12 00:00:00  Rua Dr. Falcão Filho, 155        São Paulo            SP            Brazil          01007-010          13.86
11          Alexandre  Rocha      Banco do Brasil S.A.                              Av. Paulista, 2022               São Paulo            SP     Brazil   01310-200   +55 (11) 3055-3278  +55 (11) 3055-8131  alero@uol.com.br               5             57         11          2009-09-06 00:00:00  Av. Paulista, 2022               São Paulo            SP            Brazil          01310-200          1.98 
11          Alexandre  Rocha      Banco do Brasil S.A.                              Av. Paulista, 2022               São Paulo            SP     Brazil   01310-200   +55 (11) 3055-3278  +55 (11) 3055-8131  alero@uol.com.br               5             68         11          2009-10-17 00:00:00  Av. Paulista, 2022               São Paulo            SP            Brazil          01310-200          13.86
11          Alexandre  Rocha      Banco do Brasil S.A.                              Av. Paulista, 2022               São Paulo            SP     Brazil   01310-200   +55 (11) 3055-3278  +55 (11) 3055-8131  alero@uol.com.br               5             123        11          2010-06-17 00:00:00  Av. Paulista, 2022               São Paulo            SP            Brazil          01310-200          8.91 
11          Alexandre  Rocha      Banco do Brasil S.A.                              Av. Paulista, 2022               São Paulo            SP     Brazil   01310-200   +55 (11) 3055-3278  +55 (11) 3055-8131  alero@uol.com.br               5             252        11          2012-01-22 00:00:00  Av. Paulista, 2022               São Paulo            SP            Brazil          01310-200          1.98 
11          Alexandre  Rocha      Banco do Brasil S.A.                              Av. Paulista, 2022               São Paulo            SP     Brazil   01310-200   +55 (11) 3055-3278  +55 (11) 3055-8131  alero@uol.com.br               5             275        11          2012-04-25 00:00:00  Av. Paulista, 2022               São Paulo            SP            Brazil          01310-200          3.96 
11          Alexandre  Rocha      Banco do Brasil S.A.                              Av. Paulista, 2022               São Paulo            SP     Brazil   01310-200   +55 (11) 3055-3278  +55 (11) 3055-8131  alero@uol.com.br               5             297        11          2012-07-28 00:00:00  Av. Paulista, 2022               São Paulo            SP            Brazil          01310-200          5.94 
11          Alexandre  Rocha      Banco do Brasil S.A.                              Av. Paulista, 2022               São Paulo            SP     Brazil   01310-200   +55 (11) 3055-3278  +55 (11) 3055-8131  alero@uol.com.br               5             349        11          2013-03-18 00:00:00  Av. Paulista, 2022               São Paulo            SP            Brazil          01310-200          0.99 
12          Roberto    Almeida    Riotur                                            Praça Pio X, 119                 Rio de Janeiro       RJ     Brazil   20040-020   +55 (21) 2271-7000  +55 (21) 2271-7070  roberto.almeida@riotur.gov.br  3             34         12          2009-05-23 00:00:00  Praça Pio X, 119                 Rio de Janeiro       RJ            Brazil          20040-020          0.99 
12          Roberto    Almeida    Riotur                                            Praça Pio X, 119                 Rio de Janeiro       RJ     Brazil   20040-020   +55 (21) 2271-7000  +55 (21) 2271-7070  roberto.almeida@riotur.gov.br  3             155        12          2010-11-14 00:00:00  Praça Pio X, 119                 Rio de Janeiro       RJ            Brazil          20040-020          1.98 
12          Roberto    Almeida    Riotur                                            Praça Pio X, 119                 Rio de Janeiro       RJ     Brazil   20040-020   +55 (21) 2271-7000  +55 (21) 2271-7070  roberto.almeida@riotur.gov.br  3             166        12          2010-12-25 00:00:00  Praça Pio X, 119                 Rio de Janeiro       RJ            Brazil          20040-020          13.86
12          Roberto    Almeida    Riotur                                            Praça Pio X, 119                 Rio de Janeiro       RJ     Brazil   20040-020   +55 (21) 2271-7000  +55 (21) 2271-7070  roberto.almeida@riotur.gov.br  3             221        12          2011-08-25 00:00:00  Praça Pio X, 119                 Rio de Janeiro       RJ            Brazil          20040-020          8.91 
12          Roberto    Almeida    Riotur                                            Praça Pio X, 119                 Rio de Janeiro       RJ     Brazil   20040-020   +55 (21) 2271-7000  +55 (21) 2271-7070  roberto.almeida@riotur.gov.br  3             350        12          2013-03-31 00:00:00  Praça Pio X, 119                 Rio de Janeiro       RJ            Brazil          20040-020          1.98 
12          Roberto    Almeida    Riotur                                            Praça Pio X, 119                 Rio de Janeiro       RJ     Brazil   20040-020   +55 (21) 2271-7000  +55 (21) 2271-7070  roberto.almeida@riotur.gov.br  3             373        12          2013-07-03 00:00:00  Praça Pio X, 119                 Rio de Janeiro       RJ            Brazil          20040-020          3.96 
12          Roberto    Almeida    Riotur                                            Praça Pio X, 119                 Rio de Janeiro       RJ     Brazil   20040-020   +55 (21) 2271-7000  +55 (21) 2271-7070  roberto.almeida@riotur.gov.br  3             395        12          2013-10-05 00:00:00  Praça Pio X, 119                 Rio de Janeiro       RJ            Brazil          20040-020          5.94 
13          Fernanda   Ramos                                                        Qe 7 Bloco G                     Brasília             DF     Brazil   71020-677   +55 (61) 3363-5547  +55 (61) 3363-7855  fernadaramos4@uol.com.br       4             35         13          2009-06-05 00:00:00  Qe 7 Bloco G                     Brasília             DF            Brazil          71020-677          1.98 
13          Fernanda   Ramos                                                        Qe 7 Bloco G                     Brasília             DF     Brazil   71020-677   +55 (61) 3363-5547  +55 (61) 3363-7855  fernadaramos4@uol.com.br       4             58         13          2009-09-07 00:00:00  Qe 7 Bloco G                     Brasília             DF            Brazil          71020-677          3.96 
13          Fernanda   Ramos                                                        Qe 7 Bloco G                     Brasília             DF     Brazil   71020-677   +55 (61) 3363-5547  +55 (61) 3363-7855  fernadaramos4@uol.com.br       4             80         13          2009-12-10 00:00:00  Qe 7 Bloco G                     Brasília             DF            Brazil          71020-677          5.94 
13          Fernanda   Ramos                                                        Qe 7 Bloco G                     Brasília             DF     Brazil   71020-677   +55 (61) 3363-5547  +55 (61) 3363-7855  fernadaramos4@uol.com.br       4             132        13          2010-07-31 00:00:00  Qe 7 Bloco G                     Brasília             DF            Brazil          71020-677          0.99 
13          Fernanda   Ramos                                                        Qe 7 Bloco G                     Brasília             DF     Brazil   71020-677   +55 (61) 3363-5547  +55 (61) 3363-7855  fernadaramos4@uol.com.br       4             253        13          2012-01-22 00:00:00  Qe 7 Bloco G                     Brasília             DF            Brazil          71020-677          1.98 
13          Fernanda   Ramos                                                        Qe 7 Bloco G                     Brasília             DF     Brazil   71020-677   +55 (61) 3363-5547  +55 (61) 3363-7855  fernadaramos4@uol.com.br       4             264        13          2012-03-03 00:00:00  Qe 7 Bloco G                     Brasília             DF            Brazil          71020-677          13.86
13          Fernanda   Ramos                                                        Qe 7 Bloco G                     Brasília             DF     Brazil   71020-677   +55 (61) 3363-5547  +55 (61) 3363-7855  fernadaramos4@uol.com.br       4             319        13          2012-11-01 00:00:00  Qe 7 Bloco G                     Brasília             DF            Brazil          71020-677          8.91 

```
## 3.Proporciona una consulta que muestre solo los empleados que son Agentes de Ventas.
```sql
select c.FirstName, c.LastName, i.Invoiceid, i.InvoiceDate, i.BillingCountry from customers as c, invoices as i where c.customerid = i.customerid and Country = "Brazil";
FirstName  LastName   InvoiceId  InvoiceDate          BillingCountry
---------  ---------  ---------  -------------------  --------------
Luís       Gonçalves  98         2010-03-11 00:00:00  Brazil        
Luís       Gonçalves  121        2010-06-13 00:00:00  Brazil        
Luís       Gonçalves  143        2010-09-15 00:00:00  Brazil        
Luís       Gonçalves  195        2011-05-06 00:00:00  Brazil        
Luís       Gonçalves  316        2012-10-27 00:00:00  Brazil        
Luís       Gonçalves  327        2012-12-07 00:00:00  Brazil        
Luís       Gonçalves  382        2013-08-07 00:00:00  Brazil        
Eduardo    Martins    25         2009-04-09 00:00:00  Brazil        
Eduardo    Martins    154        2010-11-14 00:00:00  Brazil        
Eduardo    Martins    177        2011-02-16 00:00:00  Brazil        
Eduardo    Martins    199        2011-05-21 00:00:00  Brazil        
Eduardo    Martins    251        2012-01-09 00:00:00  Brazil        
Eduardo    Martins    372        2013-07-02 00:00:00  Brazil        
Eduardo    Martins    383        2013-08-12 00:00:00  Brazil        
Alexandre  Rocha      57         2009-09-06 00:00:00  Brazil        
Alexandre  Rocha      68         2009-10-17 00:00:00  Brazil        
Alexandre  Rocha      123        2010-06-17 00:00:00  Brazil        
Alexandre  Rocha      252        2012-01-22 00:00:00  Brazil        
Alexandre  Rocha      275        2012-04-25 00:00:00  Brazil        
Alexandre  Rocha      297        2012-07-28 00:00:00  Brazil        
Alexandre  Rocha      349        2013-03-18 00:00:00  Brazil        
Roberto    Almeida    34         2009-05-23 00:00:00  Brazil        
Roberto    Almeida    155        2010-11-14 00:00:00  Brazil        
Roberto    Almeida    166        2010-12-25 00:00:00  Brazil        
Roberto    Almeida    221        2011-08-25 00:00:00  Brazil        
Roberto    Almeida    350        2013-03-31 00:00:00  Brazil        
Roberto    Almeida    373        2013-07-03 00:00:00  Brazil        
Roberto    Almeida    395        2013-10-05 00:00:00  Brazil        
Fernanda   Ramos      35         2009-06-05 00:00:00  Brazil        
Fernanda   Ramos      58         2009-09-07 00:00:00  Brazil        
Fernanda   Ramos      80         2009-12-10 00:00:00  Brazil        
Fernanda   Ramos      132        2010-07-31 00:00:00  Brazil        
Fernanda   Ramos      253        2012-01-22 00:00:00  Brazil        
Fernanda   Ramos      264        2012-03-03 00:00:00  Brazil        
Fernanda   Ramos      319        2012-11-01 00:00:00  Brazil        

```
## 4.Proporciona una consulta que muestre una lista única de países de facturación de la tabla de Facturas.
```sql
select distinct BillingCountry from invoices;
┌────────────────┐
│ BillingCountry │
├────────────────┤
│ Germany        │
│ Norway         │
│ Belgium        │
│ Canada         │
│ USA            │
│ France         │
│ Ireland        │
│ United Kingdom │
│ Australia      │
│ Chile          │
│ India          │
│ Brazil         │
│ Portugal       │
│ Netherlands    │
│ Spain          │
│ Sweden         │
│ Czech Republic │
│ Finland        │
│ Denmark        │
│ Italy          │
│ Poland         │
│ Austria        │
│ Hungary        │
│ Argentina      │
└────────────────┘

```
## 5.Proporciona una consulta que muestre las facturas de clientes que son de Brasil.
```sql
select * from invoices where BillingCountry = "Brazil";
┌───────────┬────────────┬─────────────────────┬─────────────────────────────────┬─────────────────────┬──────────────┬────────────────┬───────────────────┬───────┐
│ InvoiceId │ CustomerId │     InvoiceDate     │         BillingAddress          │     BillingCity     │ BillingState │ BillingCountry │ BillingPostalCode │ Total │
├───────────┼────────────┼─────────────────────┼─────────────────────────────────┼─────────────────────┼──────────────┼────────────────┼───────────────────┼───────┤
│ 25        │ 10         │ 2009-04-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 8.91  │
│ 34        │ 12         │ 2009-05-23 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 0.99  │
│ 35        │ 13         │ 2009-06-05 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │
│ 57        │ 11         │ 2009-09-06 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │
│ 58        │ 13         │ 2009-09-07 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 3.96  │
│ 68        │ 11         │ 2009-10-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 13.86 │
│ 80        │ 13         │ 2009-12-10 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 5.94  │
│ 98        │ 1          │ 2010-03-11 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.98  │
│ 121       │ 1          │ 2010-06-13 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.96  │
│ 123       │ 11         │ 2010-06-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 8.91  │
│ 132       │ 13         │ 2010-07-31 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 0.99  │
│ 143       │ 1          │ 2010-09-15 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 5.94  │
│ 154       │ 10         │ 2010-11-14 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │
│ 155       │ 12         │ 2010-11-14 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │
│ 166       │ 12         │ 2010-12-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 13.86 │
│ 177       │ 10         │ 2011-02-16 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 3.96  │
│ 195       │ 1          │ 2011-05-06 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 0.99  │
│ 199       │ 10         │ 2011-05-21 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 5.94  │
│ 221       │ 12         │ 2011-08-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 8.91  │
│ 251       │ 10         │ 2012-01-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 0.99  │
│ 252       │ 11         │ 2012-01-22 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │
│ 253       │ 13         │ 2012-01-22 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │
│ 264       │ 13         │ 2012-03-03 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 13.86 │
│ 275       │ 11         │ 2012-04-25 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 3.96  │
│ 297       │ 11         │ 2012-07-28 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 5.94  │
│ 316       │ 1          │ 2012-10-27 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 1.98  │
│ 319       │ 13         │ 2012-11-01 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 8.91  │
│ 327       │ 1          │ 2012-12-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 13.86 │
│ 349       │ 11         │ 2013-03-18 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 0.99  │
│ 350       │ 12         │ 2013-03-31 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │
│ 372       │ 10         │ 2013-07-02 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │
│ 373       │ 12         │ 2013-07-03 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 3.96  │
│ 382       │ 1          │ 2013-08-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 8.91  │
│ 383       │ 10         │ 2013-08-12 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 13.86 │
│ 395       │ 12         │ 2013-10-05 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 5.94  │
└───────────┴────────────┴─────────────────────┴─────────────────────────────────┴─────────────────────┴──────────────┴────────────────┴───────────────────┴───────┘

```
## 6.Proporciona una consulta que muestre las facturas asociadas con cada agente de ventas. La tabla resultante debe incluir el nombre completo del Agente de Ventas.
```sql

```
## 7.Proporciona una consulta que muestre el Total de la Factura, nombre del cliente, país y nombre del Agente de Ventas para todas las facturas y clientes.
```sql

```
## 8.¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?
```sql

```
## 9.Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para el ID de factura 37.
```sql

```
## 10.Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para cada Factura. PISTA: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)
```sql

```
## 11.Proporciona una consulta que incluya el nombre de la pista con cada ítem de línea de factura.
```sql

```
## 12.Proporciona una consulta que incluya el nombre de la pista comprada Y el nombre del artista con cada ítem de línea de factura.
```sql

```
## 13.Proporciona una consulta que muestre el número total de pistas en cada lista de reproducción. El nombre de la lista de reproducción debe estar incluido en la tabla resultante.
```sql

```
## 14.Proporciona una consulta que muestre todas las pistas, pero no muestre IDs. La tabla resultante debe incluir el nombre del álbum, el tipo de medio y el género.
```sql

```
## 15.Proporciona una consulta que muestre todas las facturas.
```sql

```
## 16.Proporciona una consulta que muestre las ventas totales realizadas por cada agente de ventas.
```sql

```
## 17.¿Qué agente de ventas realizó más ventas en 2009?
```sql

```
## 18.Escribir una consulta que muestre todas las playlists de la base de datos.
```sql

```
## 19.Escribe una consulta que liste todas las canciones de una playlist.
```sql

```
## 20.Escribe una consulta que liste **exclusivamente** el nombre de las canciones de una playlist concreta, con el nombre de su género y el nombre de tipo de medio.
```sql

```
