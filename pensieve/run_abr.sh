##!/bin/bash

# Initialize the variables for the options
t=""
n="75" #number of chunk ex): 75 chunks = 5 min (video lenth / 4sec)

# Parse command-line options using getopts
while getopts "t:n:" opt; do
    case "$opt" in
        t)
            t="$OPTARG"
            ;;
        n)
            n="$OPTARG"
            ;;
        \?)
            echo "Usage: $0 -t [type] -n [num]" >&2
            exit 1
            ;;
    esac
done

# Check the value of 't' and execute the corresponding Python script
if [ "$t" == "p" ]; then
        echo "pensieve (video)"
        python rl_server_no_training.py --total_chunk $n \
                --data_dir ./ --model NAS_40000_linear_104.51_False_ultra1_average.ckpt --reward linear --linear_rebuf 4.3 --smooth 1 \
                --bitrate 400 800 1200 2400 4800 --dnn_mode 0 --buffer_threshold 15 \
                --content game --quality ultra1 --video_dir /home/jaykim305/NAS/pensieve/rl_server/                
elif [ "$t" == "n" ]; then
        echo "nas (video+DNN)"
        #nas (video+DNN)
        python rl_server_no_training.py --total_chunk $n \
                --data_dir ./ --model NAS_40000_linear_104.51_False_ultra1_average.ckpt --reward linear --linear_rebuf 4.3 --smooth 1 \
                --bitrate 400 800 1200 2400 4800 --dnn_mode 1 --buffer_threshold 15 \
                --content game --quality ultra1 --video_dir /home/jaykim305/NAS/pensieve/rl_server/        
elif [ "$t" == "r" ]; then
        echo replay trace
        python3 mimic_abr.py log_norway_train3
else
    echo "Invalid type specified."
fi