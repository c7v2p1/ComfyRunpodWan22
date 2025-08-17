This script helps you to setup Runpod for ComfyUI to run Wan2.2 with one button installation.
It will automatically install the newest ComfyUI, Comfy Manager, and GGUF nodes.
It will also download all the necessary checkpoints of Wan2.2 automatically and store everything in the persistent folder so they will not be lost when you stop the pod.
To use the script, use the following commands:

Start up a new runpod:
<pre>git clone https://github.com/c7v2p1/ComfyRunpodWan22.git</pre>

<pre>chmod u+x /ComfyRunpodWan22/comfyrunpod.sh</pre>

<pre>./ComfyRunpodWan22/comfyrunpod.sh</pre>

Restart a stopped runpod:
<pre>git clone https://github.com/c7v2p1/ComfyRunpodWan22.git</pre>

<pre>chmod u+x /ComfyRunpodWan22/restartpodscript.sh</pre>

<pre>./ComfyRunpodWan22/restartpodscript.sh</pre>
