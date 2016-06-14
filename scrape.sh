#!/bin/bash

./states.py | parallel --results cache/states ./scrape_index.py {} > cache/index.csv

echo "url,post_id,title,listed_date,price,location,city,state,description,registered,category,manufacturer,caliber,action,firearm_type,party,img" > cache/listings.csv
csvcut -c 1 cache/index.csv | parallel ./scrape_listing.py {} >> cache/listings.csv
