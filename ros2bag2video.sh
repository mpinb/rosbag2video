#!/bin/bash

# Set the path to the ros2bag2video.py script
ROSBAG2VIDEO_SCRIPT="./ros2bag2video.py"

# Path to the bag files
BAGFILES_DIR="../bagfiles/29082023"

# Path to the videos directory
VIDEOS_DIR="../videos/$(date +'%d%m%Y')"

# Create the videos directory if it doesn't exist
mkdir -p "$VIDEOS_DIR"

# Iterate through each bag file in the bagfiles directory
for bagfile in "$BAGFILES_DIR"/*; do
    # Extract the bag filename without the path
    bagfilename=$(basename "$bagfile")
    
    # Create a directory for the current bag file's videos
    mkdir -p "$VIDEOS_DIR/$bagfilename"
    
    # Convert the rosbag topics to videos
    python3 "$ROSBAG2VIDEO_SCRIPT" -o "$VIDEOS_DIR/$bagfilename/camera1.mp4" -t /camera1/pylon_camera_node/image_raw "$bagfile" 
    python3 "$ROSBAG2VIDEO_SCRIPT" -o "$VIDEOS_DIR/$bagfilename/camera2.mp4"  -t /camera2/pylon_camera_node/image_raw "$bagfile" 
done
