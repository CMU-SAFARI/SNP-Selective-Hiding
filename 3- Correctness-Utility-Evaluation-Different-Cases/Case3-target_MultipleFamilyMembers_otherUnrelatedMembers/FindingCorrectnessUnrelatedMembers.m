clear
clc
%%

% load the data from xlsx file to Matlab
foundprob = xlsread('FM5unrelatedProbabilities.xlsx');%% %%probabilities for each SNP value for dependent and independent assumptions (computed from Evaluations Algorithm using Mendel's Law in "Almadhoun, Nour, Erman Ayday, and Özgür Ulusoy. "Differential privacy under dependent tuples—the case of genomic privacy." Bioinformatics 36.6 (2020): 1696-1703.")
%%In this example, 5 unrelated members are included with the target i and his family members(father and mother).
save('foundprob.mat','foundprob');%convert the file 
familySum = xlsread('FM5unrelated Sum.xlsx')%% the query noisy results file for including father, mother, and 5 unrelated members with target i in the query results.
save('familySum.mat','familySum');%convert the file to .mat

data = xlsread('Data.xlsx');%genomic data for m SNPs of the targeted family member i.
save('data.mat','data');%convert the file to .mat

unknown = xlsread('Unknown.xlsx'); %Unknown file can be found in the same folder of this code.
save('unknown.mat','unknown');%convert the file to .mat
allerror = 0;
unrelated = 5;
target = 1;
related = 2; %father and mother in this example
Participants = unrelated + target + related;
L = Participants* 2;
z = zeros(1,17); %%17= number of epsilon values used in LPM.
for k = 1:17
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
	correctness= 1- error;
    end
    z(1, k) = correctness;
end
  