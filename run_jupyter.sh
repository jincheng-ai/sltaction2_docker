#!/bin/bash
docker run -d -p 8888:8888 --gpus "device=0" --shm-size 8G \
	--name slt jincheng_jcs/mmaction2:main \
	jupyter notebook --ip 0.0.0.0 --no-browser --allow-root

docker cp -L ./sltaction2 slt:/workspace/
docker cp -L ./data slt:/workspace/
docker cp -L ./weights slt:/workspace/
docker cp -L ./outputs slt:/workspace/

docker exec slt jupyter server list
