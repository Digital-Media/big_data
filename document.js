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
db.orders.find().pretty();
