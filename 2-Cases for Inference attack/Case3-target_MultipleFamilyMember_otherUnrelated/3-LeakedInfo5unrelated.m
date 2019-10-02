clear
clc
%%
% load the data from txt file to Matlab
FM5unrelated LeakedInfo = xlsread('FM5unrelated LeakedInfo.xlsx');%the leaked SNPs according to the probabilities of genotypes sum.
save('FM5unrelated LeakedInfo.mat','FM5unrelated LeakedInfo');%convert the file
familySum = xlsread('FM5unrelated Sum.xlsx');
save('familySum.mat','familySum');%convert the file to .mat
data = xlsread('Data.xlsx');%Family Genomic Data for 100SNPs, where each row contains the genomic record of a family member.
save('data.mat','data');%convert the file to .mat
unknown = xlsread('Unknown.xlsx');
save('unknown.mat','unknown');%convert the file to .mat
z = zeros(1,13);
%%
unrelated = 5;
target = 1;
related = 2; %father and mother in this example
Participants = unrelated + target + related;
l= 2* Participants;
for k = 1:13
    LeakedInfoSum = 0;
    for i = 1: 100
        p = familySum(i,k);
        if  p >= 0 && p <= l
            Comparesnp = FMSLeakedInfo(p+1, 2)- data(unknown(i,1),unknown(i,2)) ;
            
        else
            Comparesnp = FMSLeakedInfo(l+2, 2)- data(unknown(i,1),unknown(i,2)) ;
        end
        if Comparesnp == 0
            LeakedInfoSum =  LeakedInfoSum + 1;
        end
        
    end
        z(1, k) = LeakedInfoSum;
        
end

%% Independent

l= 2* unrelated;
for k = 1:13
    LeakedInfoSum = 0;
    for i = 1: 100
        p = familySum(i,k);
        if  p >= 0 && p <= l
            Comparesnp = FMSLeakedInfo(p+1, 3)- data(unknown(i,1),unknown(i,2)) ;
            
        else
            Comparesnp = FMSLeakedInfo(l+2, 3)- data(unknown(i,1),unknown(i,2)) ;
        end
        if Comparesnp == 0
            LeakedInfoSum =  LeakedInfoSum + 1;
        end
        
    end
        z(1, k) = LeakedInfoSum;
        
end


