%This searches the long file like we did the short file expect its
%longer... duh
clear;

long = fileread('sequence_long.txt');
startCodon = 'TAC';
endCodons = {'ACT' 'ATT' 'ATC'};

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
    disp(k);
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

while true
    try %if there is stuff to check within either of the arrays continue
        if startCodonLoc(s) < endCodonLocs(e) % if the start codon appear before the end codon record both locations because this is the gene         
            geneStarts = [geneStarts startCodonLoc(s)];
            geneEnds = [geneEnds endCodonLocs(e)];
            s = s + 1;%increment both start and end condon arrays
            e = e + 1;
        else % if the end codon appears before the start codon increment the end codon by 1 and try again
            e = e + 1;
        end
    catch
        disp('Ran out of shit to check');
        break
    end
end

fprintf('Start locations: %s', mat2str(geneStarts(1:10)));
fprintf('\nEnd locations: %s', mat2str(geneEnds(1:10)));

% our next step is to create a report called 'report_long.txt'

fid = fopen('report_long.txt','wt');%use 'wt' for write and 'a' for append

string1 = ['Name: Betty A., Reed S., Emily U.,\n'...
    'Group: Group 5\n' ...
    'Date: 10/19/2016\n' ...
    'Section B: DNA Pattern Matching-Short Sequence\n'...
    '\nSequence Length: %i\nStart Postion: %i\nEnd Postion: %i'];

fprintf(fid, string1,1,1,1);


