# SQL - Challenge

Suppose you have the following database:

![tables](tables.png)

Write a SQL query to retrieve the names of women who have pets in Bogota. Write the
names that the query would return.

# Solution

```sql
select "clienteID", nombre, ciudad.valor, genero.valor, mascota.valor from a.clientes
join a.datos as genero on a.clientes."clienteID" = genero.cliente
join a.datos as ciudad on a.clientes."clienteID" = ciudad.cliente
join a.datos as mascota on a.clientes."clienteID" = mascota.cliente
where ciudad.variable = 'Ciudad' and ciudad.valor = 'Bogota' and
genero.variable = 'Genero' and genero.valor = 'F' and
mascota.variable = 'Mascota' and mascota.valor = 'Si'
```

This query will return only the customer `Maria`.
