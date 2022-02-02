# Exercises with a graph database

We use Neo4j to write CQL queries and PostgreSQL for Graph-Queries based on an ER-model queried with SQL.
Apache Spark will set up CQL on top of it's SQL query interface. So it's useful to understand both ways to work with graphs.
Neo4J supports them doing this.

## Get an Neo4J installation

See [INSTALL.md](https://github.com/Digital-Media/big_data/blob/main/graph/INSTALL.md) for Details and Troubleshooting

## Exercises for graph queries

Graphs can also be built in a relational data model. 
The SQL standard supports graph queries through the RECURSIVE WITH clause.

### Step 1

Transform the recursive with examples of [this repo](https://github.com/Digital-Media/big_data/blob/main/graph/recursive_cte.sql) from MySQL to PostgreSQL. 
Use PGAdmin either in the VMWare-Image or the [free online version](https://www.katacoda.com/enterprisedb/scenarios/pgadmin-sandbox). 
Note that with the latter the database is reset at each logout.

### Step 2

For Neo4J you can use its free [AuraDB](https://neo4j.com/cloud/aura/). 
It can be used for free for ever and upgraded to max 128 GB. 
Alternatively you can download the [Desktop Version](https://neo4j.com/download-neo4j-now/). 
Use the [Cypher Reference](https://neo4j.com/docs/cypher-refcard/current/) for examples and detailed syntax.

#### Transform the data model from PostreSQL/MySQL to Neo4J

1.	Write CREATE statements for the vertices and edges analogous to the insert statements in Postgres/MySQL for the simple example
2.	Write the statement to show the whole graph.
3.	Read (return) all :Person nodes
4.	Return all names of :Person nodes
5.	CREATE a new :Person with name “Grandma Mary”
6.	CREATE edges to make “Grandmy Mary” Mother of “Mom” and “Dad”
7.	Return the ancestors of Alex as nodes. Then return the names of them in a second statement.
8.	Add “Grandpa Jim” and make him father of “Mom” and “Dad”.
9.	Return his ancestor tree.
10.	Add edges to marry “Mom” and “Dad” as well as “Grandma Mary” and “Grandpa Jim”
11.	Return the whole ancestor tree, without showing the edges for being married. (You have to uncheck “connect result nodes” in settings of the sandbox.

#### Add properties to nodes and edges
1.	Add a property to all edges, that tell who is married to whom. It should store the year, when people got married.
2.	Add a property to all nodes that stores the year, when someone was born.
3.	Use the WHERE clause to find the ancestor tree of persons born in a particular year.
4.	Find persons that have been married in a particular year.

### Step 3
Add the Nodes and Edges of the complex example in the scriptum to Neo4J.

1.	Look at the [SQL example](https://github.com/Digital-Media/big_data/blob/main/graph/recursive_cte.sql) to add missing nodes and edges.
2.	Rewrite the MATCH statement in a way that makes it clear that only nodes with a label :Person are relevant and use a different variable to return the result.
```sql
      MATCH
      (person)-[:BORN_IN]->()-[:WITHIN*0..]->(us:Location {name:'United States'}),
      (person)-[:LIVES_IN]->()-[:WITHIN*0..]->(eu:Location {name:'Europe'})
      RETURN person
```

### Step 4: Exercise for additional points
Create own example for a complexer graph-query. 3 Edge-Types, 2 Node-Types to follow.
