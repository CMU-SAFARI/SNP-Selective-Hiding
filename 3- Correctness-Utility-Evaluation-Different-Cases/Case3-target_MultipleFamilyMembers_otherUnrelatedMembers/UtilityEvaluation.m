clear
clc
%%

% load the data from xlsx file to Matlab
Correct = xlsread('MAF-Correct-Values.xlsx');
save('Correct.mat','Correct');%convert the file
Noisy = xlsread('MAF-Noisy-Values.xlsx');
save('Noisy.mat','Noisy');

%%
for i = 1:17   %17 column in each file for the MAF results using 18 epsilon values in LPM
for k = 1:size(Correct,1)

            B(k,i) = Correct(k,i)-Noisy(k,i);
            a = B(k,i);
            S(k,i) = abs(a);
       
end
end
 %% Then average the values for all SNPs
