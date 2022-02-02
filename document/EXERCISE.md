# Exercises with a document database

We use MongoDB as example for a document store to demonstrate map reduce jobs for aggregating data.

## Get a MongoDB installation

See [INSTALL.md](https://github.com/Digital-Media/big_data/blob/main/document/INSTALL.md) for Details and Troubleshooting

## Exercises with MongoDB

Rewrite the example from [MongoDB Website]( https://docs.mongodb.com/manual/tutorial/map-reduce-examples/).
Work with the mongo shell within the provided image.

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

1. Find all rows, that have an item with quantity (qty) 8.
2. Work with map_reduce, without using variables and sum up the key total_sum for each user_id where status is “A”.
3. See [Map Reduce Documentiont](https://docs.mongodb.com/manual/core/map-reduce/) to see, how that works.
4. Write the query to show the result. Use pretty() to show in a more human readable format. 
 See [Mongo Shell Reference](https://docs.mongodb.com/manual/reference/mongo-shell/)
5. Rewrite the example in a way, that you use variables for the mapping and reduce function, that are used in db….mapReduce(); (https://docs.mongodb.com/manual/reference/method/db.collection.mapReduce/#mongodb-method-db.collection.mapReduce scroll down for examples)
6. Write the query to show the result and sort it ascending.
 See [Mongo Shell Reference](https://docs.mongodb.com/manual/reference/mongo-shell/)
7. Update the status of the order with user_id 4 and date_ordered "2020-03-23" and set the value of status = “D”
8. Rerun the map_reduce-functions written in 2+3 or 5+6 and see, if the result is different.

### Step 3: More complex map_reduce

1. You’ve got to work around an coding-error, where the prebuilt total_sum wasn’t calculated at insert.
2. Sum up the prices and quantities of each item of a user to build the sum of total_sums, that was calculated in step 2.
3. Define a variable that holds the function to do the mapping
4. Define a variable that holds the function to do the reducing.
5. Write the mapReduce()-statement and query for all orders with status = “A”
6. Write the query to show the result.

### Step 4: Rewritting Map-Reduce with Aggregation

1. Write a query using aggregation to build the sum of total_sum like in step 2
2. Write a query using aggregation to build the sum of prices*qty for every item of a user.
3. See  https://docs.mongodb.com/manual/reference/method/db.collection.mapReduce/#mongodb-method-db.collection.mapReduce for that. Scroll down for examples.
4. For more details see https://docs.mongodb.com/manual/meta/aggregation-quick-reference/

### Step 5: Deleting rows and the Database

1. Delete all rows in the collection orders
2. Drop the database onlineshop
3. https://docs.mongodb.com/manual/reference/mongo-shell/
      
### Step 6 Exercise for additional points

Build your own example to demonstrate map_reduce and aggregation


