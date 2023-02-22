# Working with Time-Series Data

Choose a data set, that you like to work with.

You can find some examples at data.world, but any interesting data set is welcome.
[Free Data on data.world](https://data.world/datasets/sensors)




## Importing into Excel for first insights: 

[See](https://answers.microsoft.com/de-de/msoffice/forum/all/csv-mit-punkt-als-dezimalzeichen-importieren-mit/f623e7fb-39ad-43dc-9e27-974674c88c68)

For smaller data sets you can start with Excel to get first insights. For always growing data you should set up a pipeline to automate data import.

## Working with ELK to setup a pipeline and analytics

- See [Docu for Data Visualizter](https://www.elastic.co/de/blog/importing-csv-and-log-data-into-elasticsearch-with-file-data-visualizer)
- For supported date formats see [Doku for supported date formats](https://www.elastic.co/guide/en/elasticsearch/reference/8.6/search-aggregations-bucket-daterange-aggregation.html#date-format-pattern)
- Call Kibana http://localhost:5601  username/password elastic/changeme
- Burger Menu -> Machine Learning -> Data Visualizer -> File -> Drag and Drop CSV data (See example given above)
- Override Settings -> Add Timestamp column 
                    -> Choose right timestamp format or give a custom format
- Click Import in left lower corner
- Choose advanced -> give an index name (data view name will be the same)
- Click Import

- Manage the index: Burger Menu -> Stack Management -> Data -> Index Management
1. Add Screenshop with individual name of YOUR index.
- Manage Data Views: Burger Menu -> Stack Management -> Kibane -> Data Views
2. Add Screenshop with individual name of YOUR data view.

- Work with Anomaly Explorer: Burger Menu -> Analytics -> Machine Learning -> Anomaly Explorer

3. See, if you can find anomalies in your time series data and add a screenshot of the dashboard to show them.
4. If not try to manipulate data and see if this is dedected and add a screenshot of the dashboard to show them.

5. Look at [Timeseries Doku of MongoDB](https://www.mongodb.com/docs/manual/core/timeseries-collections/), to find out, how you would have to prepare your time series for MongoDB, to work with dem efficiently.
6. Write a short summary, what you need to pay attentention to while working with time series in MongoDB.