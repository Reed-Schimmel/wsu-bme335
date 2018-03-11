%(a) Calculate the Applied Stress: ? = F/A and enter the results into the table. F is the applied
%force (lbf) and A is the cross-sectional area of the material (in2). Assume the material is a
%cylindrical rod with a diameter of 0.4 in.
%(b) Calculate the resulting Strain: ? = (Length – OriginalLength)/OriginalLength. The original
%length of the rod is 2 inches (i.e., the length with no applied force). Enter the results in the
%table.
%(c) In MATLAB, plot strain on the x-axis and stress on the y-axis. Connect the data points with
%a solid black line and mark the data points as circles. Label the x and y axis appropriately
%making sure to include units. Leave your plot open for the next part of the problem.
%(d) The point at which the curve begins to flatten is called the yield point or yield stress. If the
%applied stress is below the yield point, the material will return to its original length when
%the force is removed. If the applied stress exceeds the yield point, the material has been
%deformed and will not return to the original shape. Add a text arrow to mark the yield
%point. To do this, choose Insert in your figure window and select Text Arrow. Place the
%arrow then type the text (yield point).

diameter = 0.4; %inches
area = ((diameter/2)^2)*pi; %inches^2
length = 2; %inches

appliedForce = [0 1650 3400 5200 6850 7750 8150 8500 8750 9000];
postLength = [2 2.003 2.006 2.009 2.012 2.015 2.03 2.06 2.09 2.12];

appliedStress = appliedForce / area; %F/A
strain = (postLength - length)/length;%? = (Length – OriginalLength)/OriginalLength

%plot strain on the x-axis and stress on the y-axis
x = strain;
y = appliedStress;

plot(x,y);xlabel('Strain');ylabel('Stress');



