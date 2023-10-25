#!/bin/bash

dirname="test"
content="LOL"
quality="ultra"

sudo mkdir -p /var/www/html/$dirname/$content
sudo mkdir -p /var/www/html/$dirname/$content/$quality

# copy html and dash.js
sudo cp ./dash.js/build/dash.all.debug.js /var/www/html/$dirname
sudo cp ./dash.js/build/dash.all.testing.js /var/www/html/$dirname
sudo cp ./html/* /var/www/html/$dirname/$content

# copy data and half precisioned dnn
# sudo cp -r ./data/$content /var/www/html/$dirname/$content
for num in {1..5}
do
    sudo cp ./sr_training/checkpoint/$content/ultra/DNN_chunk_${num}_half.pth /var/www/html/$dirname/$content/ultra/DNN_chunk_${num}.pth
    sudo cp ./sr_training/checkpoint/$content/ultra/DNN_chunk_${num}_half.pth /var/www/html/$dirname/$content/ultra/DNN_chunk_${num}.pth
done 