%MatlabProject_PartB.m Betty A, Reed S, Emily U TEAM #5. 10/19/2016

%Description: This script finds the location of the start and end codons.
%It then finds the length of the gene.
%Usage: The user will need to import the sequence_long.txt document for
%this porgram to function properly.A for loop will find all of the end locations of the codons 
%without an overlap and a while loop continues until all of the data has been checked. The results 
%can be viewed from the report_long.txt.
clear;

long = fileread('sequence_long.txt');
startCodon = 'TAC';
endCodons = {'ACT' 'ATT' 'ATC'};
filename = 'report_longnew.txt'; %name of output report file.

%Find all the start codon locations
startCodonLoc = strfind(long,startCodon);
startCodonLoc = sort(startCodonLoc);

newLong = strrep(long, startCodon, '***'); %after finding locations of start

%codons, replace the character with * to prevent overlapping.



%Find all the end codon locations without overlap
endCodonLocs = [];
for k=1:length(endCodons)
    endCodonLocs = [endCodonLocs regexp(char(newLong),char(endCodons(k)))];
    newLong = char(strrep(newLong, endCodons(k), '***')); %after finding locations of start
end
endCodonLocs = sort(endCodonLocs);

%Start locations of Genes
geneStarts = [];
%End location of genes
geneEnds = [];

%Start looking for start codons, then next end codon in the sequence.
%Then start after the end codon and look for another start codon.


lookForStart = true;
lookForEnd = false;
[i,s,e] = deal(1);
tmp = 0;
while true
    try %if there is stuff to check within either of the arrays continue
        if (startCodonLoc(s) < endCodonLocs(e) && startCodonLoc(s) > tmp) % if the start codon appear before the end codon record both locations because this is the gene         
            geneStarts = [geneStarts startCodonLoc(s)];
            geneEnds = [geneEnds endCodonLocs(e)];
            tmp = endCodonLocs(e);
            s = s + 1;%increment both start and end condon arrays
            e = e + 1;
        elseif (startCodonLoc(s) >= endCodonLocs(e))% if the end codon appears before the start codon increment the end codon by 1 and try again
            e = e + 1;
        elseif (startCodonLoc(s) < tmp)
            s = s + 1;
        end
    catch
        disp('Ran out of data to check');
        break
    end
end

% our next step is to create a report called 'report_long.txt'
fid = fopen(filename,'wt');%use 'wt' for write and 'a' for append

string1 = ['Name: Betty A., Reed S., Emily U.\n'...
    'Group: Group 5\n' ...
    'Date: 10/19/2016\n' ...
    'Section B Long: DNA Pattern Matching-Long Sequence\n'...
    '\n'...
    'Sequence Length: %i\n'...
    'Number of Genes: %i\n'...
    'First 6 gene locations:\n'];

fprintf(fid, string1,length(long),length(geneEnds));

%Structured output of gene locations
fid = fopen(filename,'a');
for k=1:6
    geneLocs = 'Gene #%i (%i,%i)\n';
    fprintf(fid,geneLocs,k,geneStarts(k),geneEnds(k));
end
