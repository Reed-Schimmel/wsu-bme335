filename = 'D:\Reed Schimmel\Google Drive\Education\Wichita State University\Fall 2016\Biomedical Comp App\MatLab\HW4\Lesson4_PB14.xlsx';
t = xlsread(filename,'A2:A22');
volt = xlsread(filename,'B2:B22');

t_int = 0:0.001:1;
%(a)
% method = 'nearest';
% volt_int = interp1(t,volt,t_int,method);
% plot(t,volt,'ro',t_int,volt_int, 'k');xlabel('Time (seconds)');ylabel('Voltage');title('Time (s) vs Voltage');

% %(b)
% method = 'linear';
% volt_int = interp1(t,volt,t_int,method);
% plot(t,volt,'ro',t_int,volt_int, 'k');xlabel('Time (seconds)');ylabel('Voltage');title('Time (s) vs Voltage');
% 
%(c)
method = 'spline';
volt_int = interp1(t,volt,t_int,method);
plot(t,volt,'ro',t_int,volt_int, 'k');xlabel('Time (seconds)');ylabel('Voltage');title('Time (s) vs Voltage');

%(d)