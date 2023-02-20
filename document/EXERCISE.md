# Exercises with a document database

We use MongoDB as example for a document store to demonstrate map reduce jobs for aggregating data.

## Get a MongoDB installation

See [INSTALL.md](https://github.com/Digital-Media/big_data/blob/main/document/INSTALL.md) for Details and Troubleshooting

## Exercises with MongoDB

Rewrite the example from [MongoDB Website]( https://docs.mongodb.com/manual/tutorial/map-reduce-examples/).
Work with the mongo shell within the provided image or get an Account on MongoDB Atlas.

### Step 1: Adding Data

1. Start `mongo`
2. Show available databases
3. Create database onlineshop
4. Insert the following data sets

```
db.orders.insertMany([
      { _id: 1, user_id: 1, date_ordered: new Date("2020-03-01"), total_sum: 25, items: [ { sku: "oranges", qty: 5, price: 2.5 }, { sku: "apples", qty: 5, price: 2.5 } ], status: "A" },
      { _id: 2, user_id: 1, date_ordered: new Date("2020-03-08"), total_sum: 70, items: [ { sku: "oranges", qty: 8, price: 2.5 }, { sku: "chocolates", qty: 5, price: 10 } ], status: "A" },
      { _id: 3, user_id: 2, date_ordered: new Date("2020-03-08"), total_sum: 50, items: [ { sku: "oranges", qty: 10, price: 2.5 }, { sku: "pears", qty: 10, price: 2.5 } ], status: "A" },
      { _id: 4, user_id: 2, date_ordered: new Date("2020-03-18"), total_sum: 25, items: [ { sku: "oranges", qty: 10, price: 2.5 } ], status: "A" },
      { _id: 5, user_id: 2, date_ordered: new Date("2020-03-19"), total_sum: 50, items: [ { sku: "chocolates", qty: 5, price: 10 } ], status: "A"},
      { _id: 6, user_id: 3, date_ordered: new Date("2020-03-19"), total_sum: 35, items: [ { sku: "carrots", qty: 10, price: 1.0 }, { sku: "apples", qty: 10, price: 2.5 } ], status: "A" },
      { _id: 7, user_id: 3, date_ordered: new Date("2020-03-20"), total_sum: 25, items: [ { sku: "oranges", qty: 10, price: 2.5 } ], status: "A" },
      { _id: 8, user_id: 4, date_ordered: new Date("2020-03-20"), total_sum: 75, items: [ { sku: "chocolates", qty: 5, price: 10 }, { sku: "apples", qty: 10, price: 2.5 } ], status: "A" },
      { _id: 9, user_id: 4, date_ordered: new Date("2020-03-20"), total_sum: 55, items: [ { sku: "carrots", qty: 5, price: 1.0 }, { sku: "apples", qty: 10, price: 2.5 }, { sku: "oranges", qty: 10, price: 2.5 } ], status: "A" },
      { _id: 10, user_id: 4, date_ordered: new Date("2020-03-23"), total_sum: 25, items: [ { sku: "oranges", qty: 10, price: 2.5 } ], status: "A" }
      ]);
```

5. Find all rows of collection orders.

### Step 2: Working with map_reduce 

Map-Reduce is no longer supported for versions above 5.0 or in MongoDB Atlas Cloud.

Read the Doku to understand a principle introduced by Goolge for GFS and the open source hadoop Filesystem, that is based on the idea of GFS.

See [Map Reduce Documention](https://docs.mongodb.com/manual/core/map-reduce/) to see, how that works.

### Step 3: Use MongoDB Atlas Aggregation to build a pipeline

Create an Atlas Account for free [here](https://www.mongodb.com/cloud/atlas/register), if you'd like to work in the cloud.

If you use the shell see [Doku](https://docs.mongodb.com/manual/reference/mongo-shell/)

1. Write a query using aggregation to build the sum of total_sum.
2. Write a query using aggregation to build the sum of prices*qty for every item of a user.
3. See  [Map Reduce Doku](https://docs.mongodb.com/manual/reference/method/db.collection.mapReduce/#mongodb-method-db.collection.mapReduce) for a example aggregation. Scroll down for examples.
4. For more details see [Aggregation Quick Reference](https://docs.mongodb.com/manual/meta/aggregation-quick-reference/)
5. Or use the Aggregation Tab in MongoDB Atlas

### Step 4: Deleting rows and the Database

1. Delete all rows in the collection orders
2. Drop the database onlineshop
      
### Step 5 Exercise for additional points

Build your own example to demonstrate a complexer aggregation with a stage `geonear`, `search` (based on Lucene in Atlas Cloud)


# Work with MongoDB Atlas Data API

Create an Atlas Account for free [here](https://www.mongodb.com/cloud/atlas/register)
Create an API Key.

Create a database onlineshop, if not already done before.
Create a collection product with pname, price and status ('published', 'revision')
Create a collection user with frist_name, last_name, email, password, date_registered and a subcollection for phone numbers (mobile, private, fax)

Add some data manually.

## Test and work with API:
- [Data API Basics](https://www.mongodb.com/docs/atlas/api/data-api/)
- [Advanced Atlas Client](https://www.mongodb.com/developer/products/atlas/advanced-data-api-with-atlas-cli/)
- [Standard Data API Resources](https://www.mongodb.com/docs/atlas/api/data-api-resources/#std-label-data-api-resources)

## In Linux bash:

Write curl query for
1. findOne
2. find many
3. insertOne
4. updateOne
5. deleteOne


### In Powershell

You can use `curl`, if WSL is installed on your Windows 10 system. Otherwise you have to install it manually.

Eventually you have to remove curl alias to CmdLet Invoke-WebRequest
- [see](https://stackoverflow.com/questions/25044010/running-curl-on-64-bit-windows)

Open Powershell

PS> `Remove-item alias:curl`

Do not use blanks, escape each `"` as `\"`
``` shell
curl --location --request POST 'https://us-east-2.aws.data.mongodb-api.com/app/data-qtljr/endpoint/data/v1/action/findOne'`
   --header 'Content-Type: application/json'`
   --header 'api-key: zupCA6QP7I2olVJteLOWCnChWoQJjMVYA8jqY9A2t80wKgnfxiRKqsqcYObwiG8V'`
   --data-raw '{\"collection\":\"product\",\"database\":\"onlineshop\",\"dataSource\":\"Cluster0\",\"projection\":{\"price\":1,\"pname\":1}}'
```
*Result*
`{"document":{"_id":"6357bb172e6f63735a75b2ab","pname":"product1","price":10.99}}`




