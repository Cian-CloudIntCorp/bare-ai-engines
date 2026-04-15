#!/bin/bash
#############################################################
#    ____ _                  _ _       _         ____       #
#   / ___| | ___  _   _  ___| (_)_ __ | |_      / ___|___   #
#  | |   | |/ _ \| | | |/ __| | | '_ \| __|     | |   / _ \ #
#  | |___| | (_) | |_| | (__| | | | | | |_      | |__| (_) |#
#   \____|_|\___/ \__,_|\___|_|_|_| |_|\__|      \____\___/ #
#                                                           #
#                                                           #
#  by the Cloud Integration Corporation                     #
#############################################################
# Sovereign Fleet: Tír-na-AI Deployment Script
# Usage: ./deploy-tir-na-ai.sh <target-node-ip>

TARGET=$1

if [ -z "$TARGET" ]; then
    echo "Usage: ./deploy-tir-na-ai.sh <ip-address>"
    exit 1
fi

echo "🚀 Sending Modelfile to $TARGET..."
scp bare-ai-igpu-engine/tir-na-ai.Modelfile bare-ai@$TARGET:~/ai-engine/

echo "🧠 Building Tír-na-AI on $TARGET..."
ssh bare-ai@$TARGET "docker exec -it bare-ai-igpu-engine ollama create tir-na-ai -f ~/ai-engine/tir-na-ai.Modelfile"

echo "✅ Tír-na-AI is now live and Sovereign."
