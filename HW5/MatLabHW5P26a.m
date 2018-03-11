load PB24;

vector
matrix

Max = max(vector);%a
[Max Loc] = max(vector);%b

Max = max(matrix);%c
[Max Loc] = max(matrix);%d

Max = max(matrix,[],2);%e

Max = max(max(matrix));%f

Total = sum(vector);%g
Total = sum(vector(4:10));%h
Total = sum(matrix);%i
Total = sum(matrix,2);%j
Total = sum(sum(matrix));%k
Total = sum(matrix(3:6,4))%l