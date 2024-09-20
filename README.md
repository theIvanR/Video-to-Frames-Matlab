# Video Frame Extraction Tool

This repository contains a MATLAB script for extracting frames from video files. The script reads all .mp4 videos from a specified source directory and saves the extracted frames as .bmp files in a designated output directory.

Features

    Batch Processing: Automatically processes all video files in the specified source directory.
    Frame Extraction: Extracts frames at defined intervals (binning).
    Parallel Processing: Utilizes MATLAB's parfor to speed up frame extraction on multi-core systems.
    Customizable Paths: Easily set source and destination directories.

Requirements

    MATLAB (version R2016b or later)
    MATLAB Parallel Computing Toolbox (optional for parallel processing)

Installation

    Clone the repository or download the script file.
    Ensure that you have MATLAB installed on your system.

Usage

    Set Directories:
        Modify the srcDir variable to point to your source directory containing .mp4 files.
        Set the destDir variable to specify the output directory for the extracted frames.

    Run the Script:
        Open MATLAB and navigate to the directory where the script is located.
        Run the script by entering its name in the command window.
        Feel free to submit pull requests or create issues for any enhancements or bugs you encounter.

Contributing

    Feel free to submit pull requests or create issues for any enhancements or bugs you encounter.

License

    This project is licensed under the MIT License. See the LICENSE file for more details.
