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

Transform the examples from the [repo](https://github.com/Digital-Media/big_data/blob/main/graph/recursive_cte.sql) from MySQL to PostgreSQL. 
Use PGAdmin either in the VMWare-Image or the [free online version](https://www.katacoda.com/enterprisedb/scenarios/pgadmin-sandbox). 
Note that with the latter the database is reset at each logout.