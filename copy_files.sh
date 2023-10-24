#!/bin/bash

dirname="test"
content="LOL"

sudo mkdir -p /var/www/html/$dirname/$content

sudo cp ./dash.js/build/dash.all.debug.js /var/www/html/$dirname
sudo cp ./dash.js/build/dash.all.testing.js /var/www/html/$dirname

sudo cp ./html/* /var/www/html/$dirname/$content

# sudo cp -r ./data/$content /var/www/html/$dirname/$content