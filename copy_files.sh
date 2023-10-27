#!/bin/bash

dirname="test"
content="LOL"
quality="ultra"
dnn_url="watermelon3.inalab.net" # url for abr and dnn server


sudo mkdir -p /var/www/html/$dirname/$content
sudo mkdir -p /var/www/html/$dirname/$content/$quality

./replace_url.sh ./dash.js/build/dash.all.debug.js localhost $dnn_url

# copy html and dash.js
sudo cp ./dash.js/build/dash.all.debug.js /var/www/html/$dirname
sudo cp ./html/* /var/www/html/$dirname/$content

#####
# below processes are for copying the video and dnn used for your own transcoding and training
#####

# copy data 
resolutions=("240p" "360p" "480p" "720p" "1080p")
for resolution in "${resolutions[@]}"; 
do
    sudo cp -r ./sr_training/data/$content/$resolution /var/www/html/$dirname/$content/$resolution
done

# copy half precision dnn
# python ./super_resolution/save_half_prec.py # convert to half: original NAS_public code generates full float32 precision
for num in {1..5}
do
    sudo cp ./sr_training/checkpoint/$content/$quality/DNN_chunk_${num}_half.pth /var/www/html/$dirname/$content/$quality/DNN_chunk_${num}.pth
    sudo cp ./sr_training/checkpoint/$content/$quality/DNN_chunk_${num}_half.pth /var/www/html/$dirname/$content/$quality/DNN_chunk_${num}.pth
done 