clear;
%MatlabProject_PartA.m Betty A, Reed S, Emily U TEAM #5. 10/13/2016
%Description: This code has the user imput 3 codons in which are ran
%through a long sequence of codons comparing their first 10 locations and and number
%of occurences in the sequence.
%Usage: User inputs 3 codons with combinations of A, G, C, T. If the input
%contains unknown characters or more than 3 inputs the user is prompted to
%correct their statement with hints. The correctly entered triplet's first
%10 positions and number of occurences in the long sequence are displayed
%in a document called report_count.txt THE PROGARAM TAKES ABOUT 2 MINUTES
%TO EXECUTE. 

%The user is prompted to enter 3 triplets.

%Error checks in place if user does not enter valid characters. The
%variable err1's message displays if the characters are invaid. err2's
%message displays if the user does not enter enough characters. 

err1 = 'Input does not contain 3 valid codons, make sure to use capital A, G, C, T.' ;
err2 = 'Input does not contain the required 3 characters.';

%The file 'sequence_long.txt is read and stored as 'long.'
long = fileread('sequence_long.txt');

%For each of the codonts the content that the user enters is checked. The
%while loop runs until valid characters are entered. There is a while loop
%for each triplet entered. 

b = true;
j = 0;
while (b) %User input of codon 1
    %if the entered codon is not these letters, then prompt user for new
    %letters
    statement = ['Codon 1:\nPlease enter a triplet of character only'...
        'containing A,C,T,G  (ex. ACT): '];
    fprintf(statement);
    a = input('','s');
    
    if length(a) == 3
        j = length((strfind(a,'A'))) +...
            length((strfind(a,'G'))) + ...
            length((strfind(a,'C'))) + ...
            length((strfind(a,'T')));
        if j == 3
            trip1 = a;
            b = false;
        else
            disp(err1);
        end
    else
        disp(err2);
    end
end
b = true;
j = 0;
while (b) %User input of codon 2
    %if the entered codon is not these letters, then prompt user for new
    %letters
    statement = ['Codon 2:\nPlease enter a triplet of character only'...
        'containing A,C,T,G  (ex. ACT): '];
    fprintf(statement);
    a = input('','s');
%if statements checks the length of the entered triplet to ensure it is 3    
    if length(a) == 3
        j = length((strfind(a,'A'))) +...
            length((strfind(a,'G'))) + ...
            length((strfind(a,'C'))) + ...
            length((strfind(a,'T')));
        if j == 3
            trip2 = a;
            b = false;
        else
            disp('Input does not contain 3 valid codons, make sure to use capital A, G, C, T.');
        end
    else
        disp('Input does not contain the required 3 characters.');
    end
end
b = true;
j = 0;
while (b) %User input of codon 3
    %if the entered codon is not these letters, then prompt user for new 
    %letters
    statement = ['Codon 3:\nPlease enter a triplet of character only'...
        'containing A,C,T,G  (ex. ACT): '];
    fprintf(statement);
    a = input('','s');
 %if statement checks the length of the entered codon
    if length(a) == 3
        j = length((strfind(a,'A'))) +...
            length((strfind(a,'G'))) + ...
            length((strfind(a,'C'))) + ...
            length((strfind(a,'T')));
        if j == 3
            trip3 = a;
            b = false;
        else
            disp('Input does not contain 3 valid codons, make sure to use capital A, G, C, T.');
        end
    else
        disp('Input does not contain the required 3 characters.');
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i = 1;

%The triplets are put into arrays. 
size = length(long);
used = [];
tpl1 = [];
tpl2 = [];
tpl3 = [];

tpl = {trip1,trip2,trip3};
while (i <= (size-2))
    
    tr = strcat(long(i),long(i+1),long(i+2));
    
    if (strcmp(tr,tpl(1)))
        %used = [used i (i+1) (i+2)];
        tpl1= [tpl1 i (i+1) (i+2)];
        %         tpl(1)
        i = i + 2
    elseif (strcmp(tr,tpl(2)))
        tpl2 = [tpl2 i (i+1) (i+2)];
        %         tpl(2)
        i = i + 2
    elseif (strcmp(tr,tpl(3)))
        tpl3 = [tpl3 i (i+1) (i+2)];
        %         tpl(3)
        i = i + 2
    end
    
    i = i + 1
end

%File will be written to report_count.txt with the contents of the string.
fid = fopen('report_count.txt','wt');

string1 = ['Name: Betty A., Reed S., Emily U.,\n'...
    'Group: Group 5\n' ...
    'Date: 10/13/2016\n' ...
    'Section A: Codon Counting\n'...
    '\nFor %s Codon: \nTotal Number: %i First 10 Positions: %s\n'...
    '\nFor %s Codon: \nTotal Number: %i First 10 Positions: %s\n'...
    '\nFor %s Codon: \nTotal Number: %i First 10 Positions: %s'];


%width=the width of the array that needs to be less than 10
%If else statements will calculate the first 10 positions of the triplets
%in the sequence.
if length(tpl1)<=10
    v1=num2str(tpl1(1:length(tpl1)));
else 
    v1= num2str(tpl1(1:10));
end

if length(tpl2)<=10
    v2=num2str(tpl1(1:length(tpl2)));
else 
    v2= num2str(tpl2(1:10));
end

if length(tpl3)<=10
    v3=num2str(tpl1(1:length(tpl3)));
else 
    v3= num2str(tpl3(1:10));
end
    
%Display the # triplets divided by 3 (to avoid counting each
%letter, but a complete triplet.)

fprintf(fid, string1,trip1, length(tpl1)/3, v1,...
    trip2, length(tpl2)/3, v2,...
    trip3, length(tpl3)/3, v3);


disp('finished!');