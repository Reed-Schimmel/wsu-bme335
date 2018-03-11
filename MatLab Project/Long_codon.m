%This searches the long file like we did the short file expect its
%longer... duh
clear;

long = fileread('sequence_long.txt');
startCodon = 'TAC';
endCodons = {'ACT' 'ATT' 'ATC'};

%Find all the start codon locations
startCodonLoc = strfind(long,startCodon);
startCodonLoc = sort(startCodonLoc);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO FIGURE OUT WHY NEWLONG IS A CELL ARRAY
newLong = strrep(long, startCodon, '***'); %after finding locations of start
%codons, replace the character with * to prevent overlapping.

%Find all the end codon locations without overlap
endCodonLocs = [];
for k=1:length(endCodons)
    endCodonLocs = [endCodonLocs strfind(newLong,endCodons(k))];
    newLong = strrep(long, endCodons(k), '***'); %after finding locations of start
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

while true %while we have shit to check
    try
        if startCodonLoc(s) < endCodonLocs(e)          
            geneStarts = [geneStarts startCodonLoc(s)];
            geneEnds = [geneEnds endCodonLocs(e)];
            s = s + 1;
            e = e + 1;
        else
            e = e + 1;
        end
    catch
        disp('Ran out of shit to check')
        break
    end
end

fprintf('Start locations: %s', mat2str(geneStarts(1:10)));
fprintf('\nEnd locations: %s', mat2str(geneEnds(1:10)));

% 
% lastCodon = length(endCodonLocs);
% [i,s,e] = deal(1); %assign 3 new vars with value of 1
% while i <= 8
%     if (startCodonLoc(s) < endCodonLocs(e)) %if start codon is before end codon and we are looking for the starts codons
%         geneStarts = [geneStarts startCodonLoc(s)];
%         %compare all ending codons to start codon and find the first value
%         %greater
%         for (k=e:length(endCodonLocs))
%             if (endCodonLocs(k) > startCodonLoc(s))
%                 geneEnds = [geneEnds endCodonLocs(k)];
%                 [e,s] = deal(k);
%                 break
%             end
%         end
%         %s = s + 1;
%         b=0;
%     elseif (startCodonLoc(s) > endCodonLocs(e) && b==0)% looking for end codons
%         
%     end
% end


%our next step is to create a report called 'report_short.txt'
% 
% fid = fopen('report_long.txt','wt');
% 
% string1 = ['Name: Betty A., Reed S., Emily U.,\n'...
%     'Group: Group 5\n' ...
%     'Date: 10/13/2016\n' ...
%     'Section B: DNA Pattern Matching-Short Sequence\n'...
%     '\nSequence Length: %i\nStart Postion: %i\nEnd Postion: %i'];
    
%fprintf(fid, regexp(short,'TAC'), );



% %Loop through array and record the beginning and end of genes.
% s = 0;% 0=looking for start 1 = looking for ends
% for k=1:length(long-2)
%     comp = strcat(long(k),long(k+1),long(k+2));
%     if ( strcmp(comp,startCodon) && s == 0 )
%         geneStarts = [geneStarts k];
%         s = 1;
%     end
%     
%     for i=1:length(endCodons)%check all comp string against all 3 end codons
%         if ( strcmp(comp,endCodons(i)) && s == 1 )
%             geneEnds = [geneEnds k];
%             s = 0;
%         end
%     end
% end


%start codon is TAC
%end codons are ACT,ATT, and ATC

%to check the location of the start codon in the short sequence,
%, we used the regexp function


%to find the locations of the end codons in the short sequence,
%we used the regexp function as follows
%l = [regexp(long,'ACT') regexp(long,'ATT') regexp(long,'ATC')];
%sort(l);
%h = min(regexp(long,'TAC'));
% i = 1;
% while (i <= length(l))
%     if l(i) > h
%         break
%     else
%         i = i + 1;
%     end
% end

% sequencelength=l(i)-h;
%regexp(short,'TAC')

