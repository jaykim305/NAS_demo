#!/bin/bash

# replay trace
python3 mimic_abr.py log_norway_train3

# python rl_server_no_training.py --run_vid_trace trace_norway_train_3 --total_chunk 75 \
#         --data_dir ./ --model NAS_40000_linear_104.51_False_ultra1_average.ckpt --reward linear --linear_rebuf 4.3 --smooth 1 \
#         --bitrate 400 800 1200 2400 4800 --dnn_mode 1 --dnn_method 1 --dnn_byte_size 200000 --buffer_threshold 15 --dnn_vid_rate 0.6 \
#         --content game --quality ultra1 --video_dir /home/jaykim305/NAS/pensieve/rl_server/