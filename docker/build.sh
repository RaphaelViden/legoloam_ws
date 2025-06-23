# ~/legoloam_ws/docker/build.sh
#!/bin/bash
set -e

echo "Building Docker image lego_loam..."
docker-compose -f docker-compose.yml build
