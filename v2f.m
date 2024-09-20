%% Define source and destination directories
srcDir = 'source directory';  % Path to your video files
destDir = 'save directory';  % Path for saving frames
binning = 1;
fprintf("Binning: %d \n", binning)

% Get a list of all video files in the source directory
videoFiles = dir(fullfile(srcDir, '*.mp4')); % Update the file extension if necessary

%% Loop through each video file
for fileIndex = 1:length(videoFiles)
    % Find the videos in path and show name
    videoFileName = videoFiles(fileIndex).name;
    videoFilePath = fullfile(srcDir, videoFileName);
    fprintf('%d: "%s"', fileIndex, videoFileName)

    % Create a VideoReader object for the current video file
    vid = VideoReader(videoFilePath);
    n = vid.NumFrames;
    fprintf(' %d Frames\n', n);

    % Loop through frames and save them in the destination folder
    parfor frameIndex = 1:binning:n 
        frames = read(vid, frameIndex);

        % Save as either same name or with index name
        frameFileName = sprintf('%s_Frame%d.bmp', videoFileName(1:end-4), frameIndex);
        
        frameFilePath = fullfile(destDir, frameFileName);
        imwrite(frames, frameFilePath);

        % Display progress
        % fprintf('Done: %d/%d\n', frameIndex, n);
    end

    fprintf("   Done\n");
end
