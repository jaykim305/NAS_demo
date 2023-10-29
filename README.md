# NAS_demo
This repository holds the full end-to-end prototype for NAS with instructions for playing demo.  
It composes of server-side html files, client-side player, content-aware SR DNN processor, and Integrated ABR server.  
For the integrated ABR, we provide the pre-trained RL models for Pensieve and NAS Integrated ABR for testing demo.

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
- Client (Player) OS: Ubuntu 18.04 or higher with Chrome Browser
- Client (Player) HW: NVIDIA GPU (2080 ti or better recommended for real-time SR processing)
- Server (CDN): lighttpd or apache2 webserver
- Dataset: DASH video chunks and NAS DNN Chunks. These are served at the CDN server. 

## Setup

### Client-side (Player)
- Clone repo and install conda env:
    ```
    git clone https://github.com/jaykim305/NAS_demo.git && cd NAS_demo && ./setup
    ```

- (Optional) Using Docker
    - Build docker
        ```
        sudo docker build -t nas-demo
        ```
    - Run docker and execute rest of the instruction inside the docker 
        ```
        sudo docker run -it --gpus all -p 8333:8333 -p 5000:5000 -v $HOME/NAS_demo:/root/NAS_demo nas-demo /bin/bash
        ```
    - Or you can pull the provided docker image (Ubuntu 18.04,  pytorch-cuda=11.8).  
        This might takes some time due to large image size.
        ```
        sudo docker pull jaykim305/nas-demo:v1
        ```        

- Disable cache in Chrome browser. Refer [this.](https://www.webinstinct.com/faq/how-to-disable-browser-cache#:~:text=When%20you're%20in%20Google,the%20box%20to%20Disable%20cache.)

### Server-side (CDN server)
In this setup, we provide the Dataset. All you have to do is to host t
To use your own video for this demo, go to xx.

- Install and start lighttpd (or apache2)
    ```
    sudo apt-get install lighttpd
    sudo systemctl start lighttpd
    sudo systemctl enable lighttpd
    sudo systemctl status lighttpd
    ```
- Download our dataset and copy it to ```/var/www/html```
    ```
    sudo cp -r [dataset] /var/www/html/[your_dir_name]
    ```
    - The structure should look like this:
    ```
    /var/www/html/[your_dir_name]
    ├── dash.all.debug.js      # JavaScript: modified DASH video player for NAS
    ├── [content name]         # Python: SR DNN inference processor
        ├── xx                   # HTML: files for different schemes (NAS/Pensieve/robustMPC/BufferBased)
        ├── xx               # Python: ABR inferece server with pre-trained RL models
        ├── xx            # Python: training code for content-aware SR DNN
        ├── xx 
    ```
- Change lighttpd config and restart
    - Add `server.dir-listing = "enable"` in `/etc/lighttpd/lighttpd.conf`
    - Restart 
        ```
        sudo /etc/init.d/lighttpd restart
        ```
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