%Priors
maxVal_16 = 65535; maxVal_img = 4095;

% Define source and destination directories
srcDir = 'C:\Users\Admin\Desktop\ImProcessor\Input';  % Replace with the actual path to your RAW images
destDir = 'C:\Users\Admin\Desktop\ImProcessor\Output';  % Replace with the destination path for saving TIFF images

% Get list of all RAW files in the source directory
rawFiles = dir(fullfile(srcDir, '*.arw'));  % Change extension based on the RAW format (e.g., .arw for Sony, .cr2 for Canon, etc.)
disp(['Raw Files: ', num2str(length(rawFiles))]);

% Loop over each RAW file, save as 16 bit tiff
tic
for i = 1:length(rawFiles)
    % Construct full file path
    rawFilePath = fullfile(rawFiles(i).folder, rawFiles(i).name);
    
    % Load the RAW image
    cfaImage = rawread(rawFilePath);  % Use rawread or another compatible function for loading the RAW image

    % Demosaic the loaded image
    colorImage = double(demosaic(cfaImage, 'RGGB'));  % Adjust the pattern if different
    %colorImage(:, :, 2) = colorImage(:, :, 2)/2; %prescaler for green, remove for IR!
    
    colorImage = uint16(maxVal_16 * colorImage / maxVal_img);


    % Construct the destination file path (change extension to .tiff)
    [~, fileName, ~] = fileparts(rawFiles(i).name);
    tiffFilePath = fullfile(destDir, [fileName, '.tiff']);

    % Save the image as a TIFF file
    imwrite(colorImage, tiffFilePath, 'tiff', 'Compression', 'lzw'); %try turning off for speed
end

elapsedTime = toc;
disp(['Done! ', num2str(elapsedTime), ' sec']);