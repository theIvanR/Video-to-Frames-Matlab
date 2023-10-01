%% Advanced Video to Frame tool

% Specify the source and frames folder paths
sourceFolder = 'Source'; 
framesFolder = 'Frames';

% Get a list of all video files in the source folder
videoFiles = dir(fullfile(sourceFolder, '*.avi')); % Update the file extension if necessary

% Loop through each video file
for fileIndex = 1:length(videoFiles)
    videoFileName = videoFiles(fileIndex).name;
    videoFilePath = fullfile(sourceFolder, videoFileName);

    % Create a VideoReader object for the current video file
    vid = VideoReader(videoFilePath);
    n = vid.NumFrames;
    fprintf('Video Files: %d\n', n);

    % Create a folder for frames with the same name as the video file
    frameSubFolder = fullfile(framesFolder, videoFileName(1:end-4)); % Remove the file extension
    if ~exist(frameSubFolder, 'dir')
        mkdir(frameSubFolder);
    end

    % Loop through frames and save them with the source file name and frame number
    for frameIndex = 1:2:n 
        frames = read(vid, frameIndex);

        % Save as either same name or with index name
            frameFileName = sprintf('%d_Frame%d.bmp', fileIndex, frameIndex);
            %frameFileName = sprintf('Frame%d.bmp', frameIndex);


        frameFilePath = fullfile(frameSubFolder, frameFileName);
        imwrite(frames, frameFilePath);

        % Display progress
        fprintf('Done: %d/%d\n', fileIndex, n);
    end
end
