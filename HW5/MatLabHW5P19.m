% MatLabHW5P19.m – Reed Schimmel – 10/9/2016
% Description: This program takes user input of 4 color bands for a resistor
% then calculates and displays the restistance of that resistor.
% Usage: Press the "Run" button and when the menu pops up select the color 
% of the bands in the order they appear from left to right.

answers = [];
j = 1;
while j <= 3
    message = strcat('Band #: ', num2str(j));
    v = menu(message,'Black','Brown','Red','Orange','Yellow','Green','Blue','Violet','Gray','White');
    answers = [answers, v];
    %disp(answers);
    j = j + 1;
end

message = 'Band #: 4';
v = menu(message, 'Missing','Silver','Gold');
answers = [answers, v];

v1 = answers(1) - 1;
v2 = answers(2) - 1;
v3 = answers(3) - 1;
tol = 0;
switch answers(4)
    case 1
        tol = 0.20;
    case 2
        tol = 0.10;
    case 3
        tol = 0.05;
end

nomR = (v1*10 + v2) * 10^v3;%?
range = [(nomR - tol*nomR) (nomR + tol*nomR)];

unit = char(8486);
formatSpec = '';
if (nomR < 1000)
    unit = char(8486);
    formatSpec = 'Nominal value is %1.0f%s and the range is from %1.2f%s to %1.2f%s\n';
elseif (nomR >= 1000 && nomR < 1000000)
    unit = strcat('k',char(8486));
    nomR = nomR / 1000;
    range = range ./ 1000;
    formatSpec = 'Nominal value is %4.1f%s and the range is from %4.2f%s to %4.2f%s\n';
else
    unit = strcat('M',char(8486));
    nomR = nomR / 1000000;
    range = range ./ 1000000;
    formatSpec = 'Nominal value is %4.1f%s and the range is from %4.2f%s to %4.2f%s\n';
end

fprintf(formatSpec,nomR,unit,range(1),unit,range(2),unit);


%%%%%%%% Used Code %%%%%%%%%%
% Old code
% colorCode = {
%     %'Color' 'Tolerance';
%     'Black' 0;
%     'Brown' 1;
%     'Red' 2;
%     'Orange' 3;
%     'Yellow' 4;
%     'Green' 5;
%     'Blue' 6;
%     'Violet' 7;
%     'Gray' 8;
%     'White' 9;
%     'Missing' 0.20;
%     'Silver' 0.10;
%     'Gold' 0.05;};


%opt = colorCode(1,1);

% %iterates through array; works but is too complitcated for this usecase
% :-(
% i = 1;
% l = size(colorCode);
% while i <= (l(1))
%     color = colorCode(i);
%     value = colorCode(i,2);
%     %disp(color);disp(value);
%     %if color = userInput
%     %return value
%     i = i + 1;
% end
