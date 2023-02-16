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

### Step 4: Use MongoDB Atlas Aggregation to build a pipeline

1. Write a query using aggregation to build the sum of total_sum.
2. Write a query using aggregation to build the sum of prices*qty for every item of a user.
3. See  [Map Reduce Doku](https://docs.mongodb.com/manual/reference/method/db.collection.mapReduce/#mongodb-method-db.collection.mapReduce) for a example aggregation. Scroll down for examples.
4. For more details see [Aggregation Quick Reference](https://docs.mongodb.com/manual/meta/aggregation-quick-reference/)
5. Or use the Aggregation Tab in MongoDB Atlas

### Step 5: Deleting rows and the Database

1. Delete all rows in the collection orders
2. Drop the database onlineshop
3. If you use the shell see [Doku](https://docs.mongodb.com/manual/reference/mongo-shell/)
      
### Step 6 Exercise for additional points

Build your own example to demonstrate a complexer aggregation.


