% Define the folder containing your images and the prefix to add
folderPath = 'C:\Users\Ivan\Desktop\NGC6826 luminance\Frames\F'
prefixToAdd = 'F_'; % Replace with the desired prefix

% List all files in the folder
files = dir(fullfile(folderPath, '*.bmp')); % Replace '*.bmp' with the desired file extension

% Loop through each file and rename it
for i = 1:numel(files)
    oldFileName = fullfile(folderPath, files(i).name);
    newFileName = fullfile(folderPath, [prefixToAdd, files(i).name]);
    movefile(oldFileName, newFileName);
end