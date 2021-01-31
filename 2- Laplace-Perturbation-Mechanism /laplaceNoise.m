clc
clear
%%
% load the data from xlsx file to Matlab
epsilon = xlsread('epsilon.xlsx'); %an excel file with all epsilon values
save('epsilon.mat','epsilon');
sum = xlsread('sum.xlsx');
save('sum.mat','sum');

z = zeros(size(sum,1),17); 
for k = 1:17    %17= number of epsilon values used in LPM.
    x= epsilon(k,1);
    y= 2/x; %global sensitivity for sum query.
    for w = 1:size(sum,1)
        r= laprnd(1, 1, 0, y);  %laprnd generate i.i.d. laplacian random number drawn from laplacian distribution
        z(w, k) = r;
    end
end

z1 = zeros(size(sum,1),17);
for k1 = 1:17
    for w1 = 1:size(sum,1)
        x1= sum(w1, 1);
        x2= z(w1, k1);
        r1= x1 + x2;
        z1(w1, k1) = r1;
    end
end

% z2= zeros(size(sum,1),17);   %if we use MAF query, we may need to convert the MAF values to sum values.
% sum = 16;
% for k2= 1: 17
%     for w2 = 1:size(sum,1)
%     x3= z1(w2, k2);
%     y1= sum* x3;
%     z2(w2, k2) = y1;
%     end 
% end

z3 = zeros(size(sum,1),17);
for k3= 1: 17
    for w3 = 1:size(z1, 1)
    x4= z1(w3, k3);
    y2= round(x4,0);
    z3(w3, k3) = y2;
    end 
end

filename = 'NoisySumResults.xlsx';
writematrix(z3,filename);  %save the results to 'NoisySumResults.xlsx'.

%%
function y  = laprnd(l, n, m, sd)
%m: mean
%sd: standard deviation
%[l, n]: the dimension of y.
%Default m = 0, sd = 1. 
if nargin < 2
    error('At least two inputs are required');
end
if nargin == 2
    m = 0; sd = 1;
end
if nargin == 3
    sd = 1;
end
%generate Laplacian noise
x = rand(l, n)-0.5;
b = sd / sqrt(2);
y = m - b * sign(x).* log(1- 2* abs(x));
end