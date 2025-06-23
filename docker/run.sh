# ~/legoloam_ws/docker/run.sh
#!/bin/bash
echo "Running lego_loam container..."
docker-compose -f docker-compose.yml run lego_loam bash
