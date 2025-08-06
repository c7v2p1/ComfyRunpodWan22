#!/bin/bash

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

echo "Create persistent model folders"
mkdir -p "$PERSISTENT_MODEL_PATH/text_encoders"
mkdir -p "$PERSISTENT_MODEL_PATH/vae"
mkdir -p "$PERSISTENT_MODEL_PATH/diffusion_models"
mkdir -p "$PERSISTENT_MODEL_PATH/unet"

echo "Download models"
wget -P "$PERSISTENT_MODEL_PATH/text_encoders" https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors
wget -P "$PERSISTENT_MODEL_PATH/vae" https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors
wget -P "$PERSISTENT_MODEL_PATH/diffusion_models" https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors
wget -P "$PERSISTENT_MODEL_PATH/diffusion_models" https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors
wget -O "$PERSISTENT_MODEL_PATH/unet/wan2.2_i2v_high_noise_14B_Q2_K.gguf" "https://huggingface.co/bullerwins/Wan2.2-I2V-A14B-GGUF/resolve/main/wan2.2_i2v_high_noise_14B_Q2_K.gguf?download=true"
wget -O "$PERSISTENT_MODEL_PATH/unet/wan2.2_i2v_low_noise_14B_Q2_K.gguf" "https://huggingface.co/bullerwins/Wan2.2-I2V-A14B-GGUF/resolve/main/wan2.2_i2v_low_noise_14B_Q2_K.gguf?download=true"

echo "Link persistent folders into ComfyUI"
ln -s "$PERSISTENT_MODEL_PATH/text_encoders" "$COMFY_PATH/models/text_encoders"
ln -s "$PERSISTENT_MODEL_PATH/vae" "$COMFY_PATH/models/vae"
ln -s "$PERSISTENT_MODEL_PATH/diffusion_models" "$COMFY_PATH/models/diffusion_models"
ln -s "$PERSISTENT_MODEL_PATH/unet" "$COMFY_PATH/models/unet"

echo "ComfyUI full setup completed."
