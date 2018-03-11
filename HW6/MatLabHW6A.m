% MatLabHW6A.m – Reed Schimmel – 10/13/2016
% Description: This program converts a colored picture to black and white 
% depending on a threshold provodided by the user.
% Usage: Press the "Run" button, enter the name of the picture and a number
% between 0 and 255 as the threshold
% keep it a positive integer.

b = true;
while (b)
    file = input('Enter the name of the picture file: ','s');

    try
        X = imread(file,'jpg');
        Pic = 0.299*X(:,:,1) + 0.587*X(:,:,2) + 0.114*X(:,:,3);
        b = false;
    catch
        disp(' ')
        disp('Not not found!')
    end
end

% Part A
b = true;
while (b)
    threshold = input('Enter threshold integer between 0 and 255 for black/white conversion: ','s');
    try
        threshold = str2num(threshold);
        if (rem(threshold,1)==0 && threshold >= 0 && threshold <= 255)
            b=false;
        else
            disp(' ');
            disp('Invalid threshold input!');
        end
    catch
        disp(' ');
        disp('Invalid threshold input!');
    end
end

NewPic = zeros (size(Pic,1), size(Pic,2), 'uint8');
imshow(Pic);title('Original grayscale');

for r = 1:size(NewPic,1)
    for c = 1:size(NewPic,2)
        if Pic(r,c) >= threshold
            NewPic(r,c) = 255;
        elseif Pic(r,c) < threshold
            NewPic(r,c) = 0;
        end
    end
end
pause(5);
imshow(NewPic);title('Black and White');

