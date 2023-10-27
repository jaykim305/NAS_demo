import numpy as np
from read_sr_bitrate_simple import *

M_IN_K = 1000.0
smooth_factor = 1
linear_rebuf = 4.3

bitrates = [400, 800, 1200, 2400, 4800]

num_vid_chunks = 75
num_dnn_chunks = 5

def eval_video_dl():
    # log_name = "NAS_ultra_0.9mbps_400ms.log"
    log_name = "../Pensieve_0.9mbps_400ms.log"

    cnt = 0
    rebuf = []    
    bitrate = []
    smooth = []
    
    qoe = []
    
    last_quality = bitrates[1] #default quality
    
    with open(log_name, 'r') as f:
        for line in f:
            if cnt == num_vid_chunks:
                break
            
            parse = line.split()
            
            eff_bitrate = float(parse[1])
            print(eff_bitrate)
                        
            bitrate.append(eff_bitrate/M_IN_K)
            rebuf.append(float(parse[3]))
            smooth.append(smooth_factor * np.abs(bitrate[-1] - last_quality)/M_IN_K)
            
            last_quality = bitrate[-1]
            
            calculate_reward=bitrate[-1]- linear_rebuf * rebuf[-1]- smooth_factor * smooth[-1]
        
            qoe.append(calculate_reward)
            cnt += 1
    
    qoe_np = np.asarray(qoe)
    bitrate_np = np.asarray(bitrate)
    
    
    print(f"QOE {np.mean(qoe_np):.2f}, Bitrate {np.mean(bitrate_np):.2f}")


def eval_video_DNN_dl():
    log_name = "../NAS_ultra_0.9mbps_400ms.log"
    # log_name = "Pensieve_0.9mbps_400ms.log"

    cnt = 0
    dnn_chunk = 0    
    rebuf = []    
    bitrate = []
    smooth = []
    
    qoe = []
    
    bitrates = [400, 800, 1200, 2400, 4800]
    
    last_quality = bitrates[1] #default quality
    with open(log_name, 'r') as f:
        for line in f:
            if cnt == num_vid_chunks: 
                break
            
            parse = line.split()
            
            if str(parse[1]) == 'dnndownload':
                dnn_chunk += 1
                eff_bitrates = get_partial_sr_bitrate(dnn_chunk=dnn_chunk, content="LOL", dnn_quality="ultra")
                eff_psnrs = get_partial_sr_psnr(dnn_chunk=dnn_chunk, content="LOL", dnn_quality="ultra")
    
                continue
            
            
            eff_bitrate = float(parse[1])
            if dnn_chunk > 0:
                q_idx = bitrates.index(int(eff_bitrate))
                eff_bitrate = eff_bitrates[q_idx]
            
            print(eff_bitrate)
            bitrate.append(float(eff_bitrate)/M_IN_K)
            rebuf.append(float(parse[3]))
            smooth.append(smooth_factor * np.abs(bitrate[-1] - last_quality)/M_IN_K)
            
            last_quality = bitrate[-1]
            
            calculate_reward=bitrate[-1]- linear_rebuf * rebuf[-1]- smooth_factor * smooth[-1]
        
            qoe.append(calculate_reward)
            cnt += 1
    
    qoe_np = np.asarray(qoe)
    bitrate_np = np.asarray(bitrate)
    
    print(f"QOE {np.mean(qoe_np):.2f}, Bitrate {np.mean(bitrate_np):.2f}")
    

if __name__ == '__main__':
    eval_video_dl()
    eval_video_DNN_dl()