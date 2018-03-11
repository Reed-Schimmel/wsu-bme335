clear;

%trip1= 'ddd';%input('enter first codon  ','s');
%trip2= 'ddd';%input('enter second codon ','s');
%trip3= 'ddd';% input('enter third codon ','s');
%b = true;
error= 'Invalid Input';

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
            disp('you did done fucked up');
        end
    else
        disp('you did done fucked up');
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
    
    if length(a) == 3
        j = length((strfind(a,'A'))) +...
            length((strfind(a,'G'))) + ...
            length((strfind(a,'C'))) + ...
            length((strfind(a,'T')));
        if j == 3
            trip2 = a;
            b = false;
        else
            disp('you did done fucked up');
        end
    else
        disp('you did done fucked up');
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
    
    if length(a) == 3
        j = length((strfind(a,'A'))) +...
            length((strfind(a,'G'))) + ...
            length((strfind(a,'C'))) + ...
            length((strfind(a,'T')));
        if j == 3
            trip3 = a;
            b = false;
        else
            disp('you did done fucked up');
        end
    else
        disp('you did done fucked up');
    end
end




% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i = 1;
long = fileread('sequence_long.txt');
% short = fileread('sequence_short.txt');
size = length(long);
used = [];
tpl1 = [];
tpl2 = [];
tpl3 = [];

%trip1 = 'AAA';
%trip2 = 'CCC';
%trip3 = 'GGG';
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
    
    %     j = 1;
    %     while (j <= 3)
    %         if(strcmp(tr,tpl(j)))
    %         end
    %         j = j + 1;
    %     end
    i = i + 1
end

fid = fopen('report_count.txt','wt');

string1 = ['Name: Betty A., Reed S., Emily U.,\n'...
    'Group: Group 5\n' ...
    'Date: 10/13/2016\n' ...
    'Section A: Codon Counting\n'...
    '\nFor %s Codon: \nTotal Number: %i First 10 Positions: %s\n'...
    '\nFor %s Codon: \nTotal Number: %i First 10 Positions: %s\n'...
    '\nFor %s Codon: \nTotal Number: %i First 10 Positions: %s'];

fprintf(fid, string1,trip1, length(tpl1)/3, num2str(tpl1(1:10)),...
    trip2, length(tpl2)/3, num2str(tpl2(1:10)),...
    trip3, length(tpl3)/3, num2str(tpl3(1:10)));

disp('finished!');