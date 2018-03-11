% MatLabHW5P19.m – Reed Schimmel – 10/9/2016
% Description: Cube roots a number given by the user.
% Usage: Press the "Run" button, enter the number to cube root and your
% estimation of the answer

b = true;
num = '';
est = '';
err = 1;

while (b)
    num = input('Enter a number to cube root: ','s');
    est = input('Enter a number as an initial estimate: ','s');
    num = str2num(num);
    est = str2num(est);
    try
        num(1);
        est(1);
        b = false;
    catch
        disp('Your input is invalid, please try again.')
    end
end

i = 0;
estm = est;
while (err > 1e-9)
    estm = (1/3)*((2*estm)+(num/estm^2));
    err = abs(num - estm^3);
    i = i + 1;
end
statement = 'You entered: %.3f, the estimated cube root is %.3f\nIt took %i iterations.\n';
fprintf(statement,num,estm,i);


