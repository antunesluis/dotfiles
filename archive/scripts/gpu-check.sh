#!/bin/bash

echo "=== GPU Status ==="
echo
echo "Current renderer:"
glxinfo | grep "OpenGL renderer"
echo
echo "NVIDIA GPU usage:"
nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,power.draw --format=csv,noheader
echo
echo "Intel GPU (integrated):"
cat /sys/class/drm/card1/device/driver/module/drivers/pci:i915
