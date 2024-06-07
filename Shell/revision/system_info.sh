#!/bin/bash

# Display system information

echo "##########################################"
echo "System Uptime and Load"
uptime  # Display system uptime and load averages
echo "##########################################"

echo "Memory Utilization"
free -m  # Display memory utilization in MB
echo "##########################################"

echo "Disk Utilization"
df -h  # Display disk utilization in human-readable format
echo "##########################################"
