#!/bin/bash
#This is the script to run after you stop the pod and run again (you still have the checkpoints in the persistent workplace folder). This script will only setup the ComfyUI for you and will not download checkpoints
#preferrable specs:
#RTX4090 up, Container size 10GB up, Volume size 100GB up

set -e

# Define base paths
COMFY_PATH="/ComfyUI"
PERSISTENT_MODEL_PATH="/workspace/comfyui/models"

echo "Remove existing ComfyUI"
rm -rf "$COMFY_PATH"

echo "Clone ComfyUI"
git clone https://github.com/comfyanonymous/ComfyUI.git "$COMFY_PATH"

echo "Install Python requirements"
pip install -r "$COMFY_PATH/requirements.txt"

echo "Clone custom nodes"
git clone https://github.com/Comfy-Org/ComfyUI-Manager.git "$COMFY_PATH/custom_nodes/ComfyUI-Manager"
git clone https://github.com/city96/ComfyUI-GGUF.git "$COMFY_PATH/custom_nodes/ComfyUI-GGUF"

echo "Link persistent folders into ComfyUI"
ln -s "$PERSISTENT_MODEL_PATH/text_encoders" "$COMFY_PATH/models/text_encoders"
ln -s "$PERSISTENT_MODEL_PATH/vae" "$COMFY_PATH/models/vae"
ln -s "$PERSISTENT_MODEL_PATH/diffusion_models" "$COMFY_PATH/models/diffusion_models"
ln -s "$PERSISTENT_MODEL_PATH/unet" "$COMFY_PATH/models/unet"

echo "ComfyUI full setup completed."
