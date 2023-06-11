%% Matlab Video to Frames
vid=VideoReader('video.mov');
n = vid.NumberOfFrames;

for i = 1:2:n
    frames = read(vid,i);
    imwrite(frames,['Image' int2str(i), '.bmp']);
    im(i)=image(frames);
end
