% MatLabHW6B.m – Reed Schimmel – 10/13/2016
% Description: This program converts an image to 4 bit grayscale using
% thresholds provided by the user.
% Usage: Press the "Run" button, enter a the name of the picture and an
% integer vector of 4 numbers between 0 and 255.

clear;
b = true;
while (b)
    file = input('Enter the name of the picture file: ','s');
    %file = 'Garden';
    try
        X = imread(file,'jpg');
        Pic = 0.299*X(:,:,1) + 0.587*X(:,:,2) + 0.114*X(:,:,3);
        b = false;
    catch
        disp(' ')
        disp('Not not found!')
    end
end

threshold = zeros(1,4);

b = true;
while (b)
    statement = ['Enter a vector of 4 Threshold values ranging from'...
        ' 0 to 255 enclosed in square brackets: '];
    a = input(statement,'s');
    %My code onlt work for single digits, separate by ' ' and []
    if (strcmp(a(1),'[') && strcmp(a(length(a)),']') )
        v = strfind(a,' ');
        if (length(v) == 3)
            l = str2num(a(2:(v(1)-1)));
            if (rem(l,1)==0 && l >= 0 && l <= 255)
                threshold(1) = l;
            end
            l = str2num(a((v(1)-1):(v(2)-1)));
            if (rem(l,1)==0 && l >= 0 && l <= 255)
                threshold(2) = l;
            end
            l = str2num(a((v(2)-1):(v(3)-1)));
            if (rem(l,1)==0 && l >= 0 && l <= 255)
                threshold(3) = l;
            end
            l = str2num(a((v(3)-1):length(a)));
            if (rem(l,1)==0 && l >= 0 && l <= 255)
                threshold(1) = l;
            end
            disp(threshold);

        elseif (length(strfind(a,' ')) ~= 3)
            disp('Make sure to separate your values with 1 space');
            
        elseif ~(strcmp(a(1),'[') && strcmp(a(length(a)),']') )
            disp('Make sure to enclose your answer inside []');
        end
    end
    if i == 5;
        b = false;
    end
end


NewPic = zeros (size(Pic,1), size(Pic,2), 'uint8');
imshow(Pic);title('Original grayscale');

for r = 1:size(NewPic,1)
    for c = 1:size(NewPic,2)
        if Pic(r,c) <= threshold(1)
            NewPic(r,c) = 50;
        elseif Pic(r,c) > threshold(1) && Pic(r,c) <= threshold(2)
            NewPic(r,c) = 100;
        elseif Pic(r,c) > threshold(2) && Pic(r,c) <= threshold(3)
            NewPic(r,c) = 150;
        elseif Pic(r,c) > threshold(4)
            NewPic(r,c) = 200;
        end
    end
end
pause(5);
imshow(NewPic);title('Four Level Grayscale');

%%%%%%%%%%old code%%%%%%%%%%%%%%%%

%level = threshold / 255;
%NewPic = im2bw(Pic,level); %cheating

% Part B

%                         threshold(i) = l;
%             for k=2:(length(a)-1)
%                 try
%                     l = str2num(a(k));
%                     if (rem(l,1)==0 && l >= 0 && l <= 255)
%                         threshold(i) = l;
%                         i = i + 1;
%                     else
%                         disp('Make to sure to enter 4 integers between 0 and 255');
%                     end
%                 catch
%                 end
%             end


% % Part B
% threshold = zeros(1,4);
% i = 1;
% while (i <= 4)
%     lower = ((i * 50) -50 );
%     higher = (i * 50);
%     statement = 'Enter threshold integer between %i and %i for black/white conversion of threshold %i: ';
%     fprintf(statement, lower, higher, i);
%     answer = input('','s');
%     try
%         answer = str2num(answer);
%         if (rem(answer,1)==0 && answer >= lower && answer <= higher)
%             threshold(i) = answer;
%             i = i + 1;
%         else
%             disp(' ');
%             disp('Invalid threshold input!');
%         end
%     catch
%         disp(' ');
%         disp('Invalid threshold input!');
%     end
% end
