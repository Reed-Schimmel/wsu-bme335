trip1= 'd';%input('enter first codon  ','s');
trip2= 'd';%input('enter second codon ','s'); 
trip3= 'd';% input('enter third codon ','s');
b = true;
while (b) 
    %if the entered codon is not these letters, then prompt user for new
    %letters
    fprintf('Please enter a value that includes only A,C,T,G ','s'); 
    trip1= input('enter first codon  ','s')
    if strcmp(trip1, 'A')
        b=false; 
    elseif strcmp(trip1,'C')
        b=false;
    elseif strcmp (trip1,'T')
        b=false;
    elseif strcmp (trip1,'G')
        b=false;
    end
end
b=true
while (b) 
    fprintf('Please enter a value that includes only A,C,T,G ','s');
    trip2= input('enter second codon  ','s')
    if strcmp(trip2, 'A')
        b=false; 
    elseif strcmp(trip2,'C')
        b=false;
    elseif strcmp (trip2,'T')
        b=false;
    elseif strcmp (trip2,'G')
        b=false;
    end
end
b=true
while (b)
    fprintf('Please enter a value that includes only A,C,T,G ','s');
    trip3= input('enter third codon  ','s')
    if strcmp(trip3, 'A')
        b=false; 
    elseif strcmp(trip3,'C')
        b=false;
    elseif strcmp (trip3,'T')
        b=false;
    elseif strcmp (trip3,'G')
        b=false;
    end
end 