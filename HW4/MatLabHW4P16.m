band = input('what is your favorite band?', 's');
song = input('what is your favorite song?', 's');
restaurant = input('what is your favorite restaurant?', 's');
food = input('what is your favorite food?', 's');

fid = fopen('file.txt','wt');

string1 = [band, song];
disp(string1);
fprintf(fid, '%s\n', string1);

string2 = [restaurant, food];
disp(string2);
fprintf(fid, '%s', string2);
