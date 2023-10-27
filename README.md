# NAS_demo
This repository holds the full end-to-end prototype for NAS with instructions for playing demo.  
It composes of server-side html files, client-side player, content-aware SR DNN processor, and Integrated ABR server.  
For the integrated ABR, we provide the pre-trained RL models for Pensieve and NAS Integrated ABR for demo testing.

## Project structure
```
./NAS_demo
├── dash.js                # JavaScript: modified DASH video player for NAS
├── dnn_processor          # Python: SR DNN inference processor
├── html                   # HTML: files for different schemes (NAS/Pensieve/robustMPC/BufferBased)
├── pensieve               # Python: ABR inferece server with pre-trained RL models
├── sr_training            # Python: training code for content-aware SR DNN
├── super_resolution       # Python: NAS MDSR super_resolution models and tools
```

## Prerequisites
- Client OS: Ubuntu 18.04 or higher 
- Client HW: NVIDIA GPU (2080 ti for real-time SR processing)
- Server: lighttpd or apache2 webserver
- Dataset: DASH video chunks, NAS DNNs

## Quick Setup
In this setup, we provide the Dataset.
To use your own video for this demo, go to xx.

### Client-side
- Clone repo

- Install conda env 

- (Optional) Using Docker

- Disable cache in chrome

### Server-side

- Install lighttpd (or apache2)

- Copy dataset to /var/www/html/your_dirname

- Change lighttpd config and restart

- (Optional) Change DNN processing url in dash script


## Play Demo (Client-side)

### Run ABR server 
- run pen
- run xx
### Run DNN processor (Only required for NAS)
- xx
### Play video with Chrome browser
- play xx


## Testing with your own video
Follow the setup in Client-xx
The process is from DASH_public xx
Download video using xx

### Prepare DASH video
Place it in xx

### Prepare DNN

### Add DNN config in MPD file

### Place all your content at Server
use copy files

### Play demo
now you are ready. play


## Authors