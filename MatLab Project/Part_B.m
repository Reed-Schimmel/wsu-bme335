
%MatlabProject_PartB.m Betty A, Reed S, Emily U TEAM #5. 10/19/2016

%Description: This script finds the location of the start and end codons.
%It then finds the length of the gene.

%Usage: The user will need to import the sequence_short.txt document for
%this porgram to function properly. The results can be viewed from the 
%report_short.txt


short= fileread('sequence_short.txt');
%start codon is TAC
%end codons are ACT, ATT, and ATC

%to check the location of the start codon in the short sequence,
% we used the regexp function and assigned variable m
m = regexp(short,'TAC');

%to find the first appearing start codon, we use the min function
h = min(m);

%to find the locations of the end codons in the short sequence,
%we used the regexp function as follows
l = [regexp(short,'ACT') regexp(short,'ATT') regexp(short,'ATC')];

%we need the first end codon location that appears after the start codon,
%so we use the sort funciton to put them in order
sort(l)

%To find the length of the gene, we take the difference between the first start
%codon location by the first end codon that appears after the start codon. 
%Our results for the locations of the end codons have the potential to appear 
%before the start codon, which would give us a negative value for gene length. 
%Therefore, we use a while loop to find the first positive difference. 

i = 1;
while (i <= length(l))
    if l(i) > h
        break
    else
        i = i + 1;
    end
end

%Now that we have found the value of the first end codon that appears after
%the start codon, we can subtract to find the sequence length.

sequencelength=l(i)- h


%our next step is to create a report called 'report_short.txt'

fid = fopen('report_short.txt','wt');

string1 = ['Name: Betty A., Reed S., Emily U.,\n'...
    'Group: Group 5\n' ...
    'Date: 10/19/2016\n' ...
    'Section B: DNA Pattern Matching-Short Sequence\n'...
    '\nSequence Length: %i\nStart Postion: %i\nEnd Postion: %i']
    
fprintf(fid, string1, sequencelength, h, l(i))  

%view teh results by opening the report_short.txt