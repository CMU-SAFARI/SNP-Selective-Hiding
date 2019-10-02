clear
clc
%%

% load the data from txt file to Matlab
FLeakedInfo = xlsread('FLeakedInfo.xlsx'); %the leaked SNPs according to the probabilities of genotypes sum.
save('FLeakedInfo.mat','FLeakedInfo');%convert the file
familySum = xlsread('Father Only Sum.xlsx'); %% the query noisy results file.
save('familySum.mat','familySum');%convert the file to .mat
data = xlsread('Data.xlsx'); %Family Genomic Data for 100SNPs, where each row contains the genomic record of a family member.
save('data.mat','data');%convert the file to .mat
unknown = xlsread('Unknown.xlsx');
save('unknown.mat','unknown');%convert the file to .mat
z = zeros(1,13);
%%
for k = 1:13
    LeakedInfoSum = 0;
    for i = 1: 100
        if familySum(i,k) == 0
            Comparesnp = FLeakedInfo(1, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        elseif familySum(i,k) == 1
            Comparesnp = FLeakedInfo(2, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 2
            Comparesnp = FLeakedInfo(3, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 3
            Comparesnp = FLeakedInfo(4, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 4
            Comparesnp = FLeakedInfo(5, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        else
            Comparesnp = FLeakedInfo(6, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        end
    end
    z(1, k) = LeakedInfoSum;
    
end

