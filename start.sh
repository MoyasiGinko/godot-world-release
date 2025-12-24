#!/bin/bash
set -e

echo "Starting Tinybox in headless mode..."
cd /app
./Tinybox.x86_64 --headless
