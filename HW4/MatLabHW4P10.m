%ln(C(t)) = -kt + ln(C0)
filename = 'D:\Reed Schimmel\Google Drive\Education\Wichita State University\Fall 2016\Biomedical Comp App\MatLab\HW4\HydrogenPeroxide.xlsx';
t = xlsread(filename,'A2:A38');
conc280K = xlsread(filename,'B2:B38');
conc285K = xlsread(filename,'C2:C38');
conc290K = xlsread(filename,'D2:D38');
conc295K = xlsread(filename,'E2:E38');
conc300K = xlsread(filename,'F2:F38');

y = (-k*t) + log(conc280K);
plot(t,y);xlabel('Time (seconds)');ylabel('Concentration (M)');title('Time (s) vs Concentration (M) @ 280K');

y = (-k*t) + log(conc285K);
plot(t,y);xlabel('Time (seconds)');ylabel('Concentration (M)');title('Time (s) vs Concentration (M) @ 285K');

y = (-k*t) + log(conc290K);
plot(t,y);xlabel('Time (seconds)');ylabel('Concentration (M)');title('Time (s) vs Concentration (M) @ 290K';

y = (-k*t) + log(conc295K);
plot(t,y);xlabel('Time (seconds)');ylabel('Concentration (M)');title('Time (s) vs Concentration (M) @ 295K');

y = (-k*t) + log(conc300K);
plot(t,y);xlabel('Time (seconds)');ylabel('Concentration (M)');title('Time (s) vs Concentration (M) @ 300K');