% MatLabHW5P19.m – Reed Schimmel – 10/9/2016
% Description: This program calculates and displays the natural log
% of a number of interval (0,2] provided by the user.
% Usage: Press the "Run" button, enter a number > 0 and no larger than 2.
% to change the iterations of the calculation, change the variable "N" but
% keep it a positive integer.

x = 0;

while (x <= 0 || x > 2)
    x = input('enter a number > 0 but no larger than 2: ');
end

a = 0;
N = 20;
for (k = 1:N)
    a = a + (((-1)^(k+1))/k) * (x - 1)^k;
end

fprintf('ln(%f) = %.8f\n', x, a);



%%%%%%%% Used Code %%%%%%%%%%
%     try
%         x = str2num(x);
%     catch
%         x = 0;
%     end

% fprintf('you entered %f',x);


% n = 1;
% m = 6;

% while (n <= m)
%     a = a + (((-1)^(n+1))/n) * (x - 1)^n;
%     n = n + 1;
% end