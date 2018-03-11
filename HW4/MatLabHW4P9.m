filename = 'D:\Reed Schimmel\Google Drive\Education\Wichita State University\Fall 2016\Biomedical Comp App\MatLab\HW4\ProjectileData.xlsx';
time = xlsread(filename,'A2:A52');
distance = xlsread(filename,'B2:B52');
height = xlsread(filename,'C2:C52');

g = 9.81; %m/s^2
%theta;
%v0;
%y0;
%yPosition = -(1/2)*g*time^2 + (v0*sind(theta))*time +y0;

%part (a)
y = distance;
x = time;

plot(x,y);xlabel('time (seconds)');ylabel('distance (meters)');title('time (s) vs distance (m)');

%part (b)
%y = height;
%x = time;

%plot(x,y);xlabel('time (seconds)');ylabel('height (meters)');title('time (s) vs height (m)');

%part (c)
