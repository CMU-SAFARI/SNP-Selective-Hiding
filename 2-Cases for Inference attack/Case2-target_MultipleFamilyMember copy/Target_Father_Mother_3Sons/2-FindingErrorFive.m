clear
clc
%%

% load the data from txt file to Matlab
foundprob = xlsread('Father Mother Three Son Probabilities.xlsx');%% the results from applying FindProbFM.m
%%For independent assumption, we use "Father Mother Three Son Probabilities(Independent Assumption).xlsx"
save('foundprob.mat','foundprob');%convert the file 
familySum = xlsread('Father and Mother and Three Sons Sum.xlsx Sum.xlsx');%% the query noisy results file.
%%If the adversary knows partial information about the sum, use the file containing the noisy results and the partial information.
save('familySum.mat','familySum');%convert the file to .mat

data = xlsread('Data.xlsx');%Family Genomic Data for 100SNPs, where each row contains the genomic record of a family member.
save('data.mat','data');%convert the file to .mat

unknown = xlsread('Unknown.xlsx');
save('unknown.mat','unknown');%convert the file to .mat
allerror = 0;
z = zeros(1,13);
for k = 1:13
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
		elseif familySum(i,k) == 9
			errorsum = errorsum + foundprob(10,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
		elseif familySum(i,k) == 10
			errorsum = errorsum + foundprob(11,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
        elseif familySum(i,k) == 11
			errorsum = errorsum + foundprob(12,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
		elseif familySum(i,k) == 12
			errorsum = errorsum + foundprob(13,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
        else
			errorsum = errorsum + foundprob(14,j+1) .* double(abs(int32(j)-data(unknown(i,1),unknown(i,2))));
        end
        end
        allerror = allerror + errorsum;
        error = allerror / size(unknown,1); 
    end
    z(1, k) = error;
end
  