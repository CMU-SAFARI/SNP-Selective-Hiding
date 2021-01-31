clear
clc
%%

% load the data from .xlsx file to Matlab
foundprob = xlsread('FatherMotherSonAunt Probabilities.xlsx'); %%probabilities for each SNP value for dependent and independent assumptions (computed from Evaluations Algorithm using Mendel's Law in "Almadhoun, Nour, Erman Ayday, and Özgür Ulusoy. "Differential privacy under dependent tuples—the case of genomic privacy." Bioinformatics 36.6 (2020): 1696-1703.")

save('foundprob.mat','foundprob');%convert the file 
familySum = xlsread('FamilySum.xlsx');%% the query noisy results file for including father, mother, and aunt with target i in the query results.
save('familySum.mat','familySum');%convert the file to .mat

data = xlsread('data hidden.xlsx');%genomic data for m SNPs of the targeted family member i.
save('data.mat','data');%convert the file to .mat

unknown = xlsread('Unknown.xlsx'); %Unknown file can be found in the same folder of this code.
save('unknown.mat','unknown');%convert the file to .mat
allerror = 0;
z = zeros(1,17); %%17= number of epsilon values used in LPM.

for k = 1:17
    allerror = 0;
    for i = 1: size(unknown,1)
    
           errorsum = 0;
        for j = 0:2
		if familySum(i,k) == 0
			errorsum = errorsum + foundprob(1,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
		elseif familySum(i,k) == 1
			errorsum = errorsum + foundprob(2,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
		elseif familySum(i,k) == 2
			errorsum = errorsum + foundprob(3,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
		elseif familySum(i,k) == 3
			errorsum = errorsum + foundprob(4,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
		elseif familySum(i,k) == 4
			errorsum = errorsum + foundprob(5,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
        elseif familySum(i,k) == 5
			errorsum = errorsum + foundprob(6,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
		elseif familySum(i,k) == 6
			errorsum = errorsum + foundprob(7,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
        elseif familySum(i,k) == 7
			errorsum = errorsum + foundprob(8,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
		elseif familySum(i,k) == 8
			errorsum = errorsum + foundprob(9,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
		 else
			errorsum = errorsum + foundprob(10,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
        end
        end
        allerror = allerror + errorsum;
        error = allerror / size(unknown,1); 
        correctness= 1- error;
    end
    z(1, k) = correctness;
end

  
