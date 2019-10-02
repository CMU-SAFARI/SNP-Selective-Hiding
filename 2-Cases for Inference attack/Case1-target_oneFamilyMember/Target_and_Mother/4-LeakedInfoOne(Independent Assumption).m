clear
clc
%%

% load the data from txt file to Matlab
MLeakedInfo = xlsread('MLeakedInfo.xlsx');
save('MLeakedInfo.mat','MLeakedInfo');%convert the file
familySum = xlsread('Mother Only Sum.xlsx');
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
            Comparesnp = MLeakedInfo(1, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        elseif familySum(i,k) == 1
            Comparesnp = MLeakedInfo(2, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 2
            Comparesnp = MLeakedInfo(3, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 3
            Comparesnp = MLeakedInfo(4, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 4
            Comparesnp = MLeakedInfo(5, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        else
            Comparesnp = MLeakedInfo(6, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        end
    end
    z(1, k) = LeakedInfoSum;
    
end

