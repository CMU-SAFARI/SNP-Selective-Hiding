clear
clc
%%

% load the data from txt file to Matlab
FMLeakedInfo = xlsread('FMLeakedInfo.xlsx'); %the leaked SNPs according to the probabilities of genotypes sum.
save('FMLeakedInfo.mat','FMLeakedInfo');%convert the file
familySum = xlsread('Father and Mother Sum.xlsx'); %% the query noisy results file.
save('familySum.mat','familySum');%convert the file to .mat
data = xlsread('Data.xlsx');
save('data.mat','data');%convert the file to .mat
unknown = xlsread('Unknown.xlsx');
save('unknown.mat','unknown');%convert the file to .mat
z = zeros(1,13);
%%
for k = 1:13
    LeakedInfoSum = 0;
    for i = 1: 100
        if familySum(i,k) == 0
            Comparesnp = FMLeakedInfo(1, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        elseif familySum(i,k) == 1
            Comparesnp = FMLeakedInfo(2, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 2
            Comparesnp = FMLeakedInfo(3, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 3
            Comparesnp = FMLeakedInfo(4, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 4
            Comparesnp = FMLeakedInfo(5, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 5
            Comparesnp = FMLeakedInfo(6, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 6
            Comparesnp = FMLeakedInfo(7, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        else
            Comparesnp = FMLeakedInfo(8, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        end
    end
    z(1, k) = LeakedInfoSum;
    
end

%% Independent Assumption

for k = 1:13
    LeakedInfoSum = 0;
    for i = 1: 100
        if familySum(i,k) == 0
            Comparesnp = FMLeakedInfo(1, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        elseif familySum(i,k) == 1
            Comparesnp = FMLeakedInfo(2, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 2
            Comparesnp = FMLeakedInfo(3, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 3
            Comparesnp = FMLeakedInfo(4, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 4
            Comparesnp = FMLeakedInfo(5, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 5
            Comparesnp = FMLeakedInfo(6, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 6
            Comparesnp = FMLeakedInfo(7, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        else
            Comparesnp = FMLeakedInfo(8, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        end
    end
    z(1, k) = LeakedInfoSum;
    
end

