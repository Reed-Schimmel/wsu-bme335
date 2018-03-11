% Take Test: Matlab Quiz, Question 1 – Reed Schimmel – 10/23/2016
% Description: This program performes a root mean square filter to emg data
% from Force_vs_EMG_DATA.xlsx using a window length selected by the user
% Usage: Press the "Run" button and when the menu pops up select the window
% length

clear; %clear the workspace

%setup field variables
% dt = 0.001;%sec
try %try to load excel file
    fileEmg = 'Force_vs_EMG_DATA.xlsx';
    RAW_EMG = xlsread(fileEmg,'Sheet1','B:B'); %set RAW_EMG to emg column
    t = xlsread(fileEmg,'Sheet1','A:A');
catch
    string1 = 'File %s does not exist!\n'; %display error if file not found
    fprintf(string1,fileEmg)
end

%init resulting variable(s)
Filter_EMG = zeros(length(RAW_EMG),1);

%User input for window size
message = 'Enter window size';
a = menu(message,'200','400','750','1000');
switch a
    case 1
        window = 200;
        outFile = 'RMS_window200.csv';
    case 2
        window = 400;
        outFile = 'RMS_window400.csv';
    case 3
        window = 750;
        outFile = 'RMS_window750.csv';
    case 4
        window = 1000;
        outFile = 'RMS_window1000.csv';
end
labl = strcat('Time (s) vs RMS Filtered EMG; window=',num2str(window));

%RMS
for (i = 1:length(RAW_EMG))
    filtered = zeros(1,window);
    %perform on data until we reach window length away from the end
    %then shrink the window by 1 per interation
    if (i > (length(RAW_EMG) + 1 - window))
        window = window - 1;
    end
    
    for (k=1:window)
        filtered(k) = (RAW_EMG(i))^2;
    end
    Filter_EMG(i) = (sqrt(sum(filtered)))/length(filtered);
end

%Graph results
plot(t,Filter_EMG);xlabel('Time (seconds)');ylabel('EMG');title(labl);

try
    csvwrite(outFile,Filter_EMG); % write results to csv file
catch
    disp('could not write results to file.')
end