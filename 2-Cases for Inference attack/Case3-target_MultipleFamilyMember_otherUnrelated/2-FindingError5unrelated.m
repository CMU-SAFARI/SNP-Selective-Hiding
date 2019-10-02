clear
clc
%%

% load the data from txt file to Matlab
foundprob = xlsread('FM5unrelatedProbabilities.xlsx');%% the results from applying FindProbFM.m
%%For independent assumption, we use "FM5unrelatedProbabilities(Independent Assumption).xlsx"
save('foundprob.mat','foundprob');%convert the file 
familySum = xlsread('FM5unrelated Sum.xlsx Sum.xlsx');%% the query noisy results file.
%%If the adversary knows partial information about the sum, use the file containing the noisy results and the partial information.
save('familySum.mat','familySum');%convert the file to .mat

data = xlsread('Data.xlsx');%Family Genomic Data for 100SNPs, where each row contains the genomic record of a family member.
save('data.mat','data');%convert the file to .mat

unknown = xlsread('Unknown.xlsx');
save('unknown.mat','unknown');%convert the file to .mat
allerror = 0;
unrelated = 5;
target = 1;
related = 2; %father and mother in this example
Participants = unrelated + target + related;
L = Participants* 2;
z = zeros(1,13);
for k = 1:13
    allerror = 0;
    for i = 1: size(unknown,1)
    
           errorsum = 0;
        for j = 0:2
            p = familySum(i,k);
            if  p >= 0 && p <= L
                errorsum = errorsum + foundprob(p+1,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
            else
                errorsum = errorsum + foundprob(L+2,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
            end
        end
        allerror = allerror + errorsum;
        error = allerror / size(unknown,1); 
    end
    z(1, k) = error;
end
  