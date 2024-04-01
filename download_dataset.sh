#!/bin/bash
path_to_dataset="/archive/ferrari/event_scape"
cd $path_to_dataset 

# Download
wget http://rpg.ifi.uzh.ch/data/RAM_Net/dataset/Town01-03_train.zip && unzip Town01-03_train.zip
wget http://rpg.ifi.uzh.ch/data/RAM_Net/dataset/Town05_val.zip && unzip Town05_val.zip
wget http://rpg.ifi.uzh.ch/data/RAM_Net/dataset/Town05_test.zip && unzip Town05_test.zip

# Rename folders
rename_folders() {
    local town_name=$1
    local dataset_type_name=$2 
    for folder in "$path_to_dataset/$town_name/"*/; do
        # Rename each sequence folder name
        new_folder_name="$(basename "$folder")_${town_name}"
        path_to_new_folder="$path_to_dataset/${dataset_type_name}/$new_folder_name"
        mv "$folder" "$path_to_new_folder"
    done
}

mkdir train
rename_folders "Town01" "train"
rename_folders "Town02" "train"
rename_folders "Town03" "train"

mkdir val
rename_folders "Town05" "val"