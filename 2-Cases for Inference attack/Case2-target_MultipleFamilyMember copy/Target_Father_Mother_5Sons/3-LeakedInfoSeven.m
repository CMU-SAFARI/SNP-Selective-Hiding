clear
clc
%%

% load the data from txt file to Matlab
FM5SLeakedInfo = xlsread('FM5SLeakedInfo.xlsx');%the leaked SNPs according to the probabilities of genotypes sum.
save('FM5SLeakedInfo.mat','FM5SLeakedInfo');%convert the file
familySum = xlsread('FM5S Sum.xlsx');
save('familySum.mat','familySum');%convert the file to .mat
data = xlsread('Data.xlsx');%Family Genomic Data for 100SNPs, where each row contains the genomic record of a family member.
save('data.mat','data');%convert the file to .mat
unknown = xlsread('Unknown.xlsx');
save('unknown.mat','unknown');%convert the file to .mat
z = zeros(1,13);
%%
for k = 1:13
    LeakedInfoSum = 0;
    for i = 1: 100
        if familySum(i,k) == 0
            Comparesnp = FM5SLeakedInfo(1, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        elseif familySum(i,k) == 1
            Comparesnp = FM5SLeakedInfo(2, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 2
            Comparesnp = FM5SLeakedInfo(3, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 3
            Comparesnp = FM5SLeakedInfo(4, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 4
            Comparesnp = FM5SLeakedInfo(5, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 5
            Comparesnp = FM5SLeakedInfo(6, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 6
            Comparesnp = FM5SLeakedInfo(7, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 7
            Comparesnp = FM5SLeakedInfo(8, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 8
            Comparesnp = FM5SLeakedInfo(9, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 9
            Comparesnp = FM5SLeakedInfo(10, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 10
            Comparesnp = FM5SLeakedInfo(11, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 11
            Comparesnp = FM5SLeakedInfo(12, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 12
            Comparesnp = FM5SLeakedInfo(13, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 13
            Comparesnp = FM5SLeakedInfo(14, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 14
            Comparesnp = FM5SLeakedInfo(15, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 15
            Comparesnp = FM5SLeakedInfo(16, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 16
            Comparesnp = FM5SLeakedInfo(17, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        else
            Comparesnp = FM5SLeakedInfo(18, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        end
    end
    z(1, k) = LeakedInfoSum;
    
end

%% Independent

for k = 1:13
    LeakedInfoSum = 0;
    for i = 1: 100
        if familySum(i,k) == 0
            Comparesnp = FM5SLeakedInfo(1, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        elseif familySum(i,k) == 1
            Comparesnp = FM5SLeakedInfo(2, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 2
            Comparesnp = FM5SLeakedInfo(3, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 3
            Comparesnp = FM5SLeakedInfo(4, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 4
            Comparesnp = FM5SLeakedInfo(5, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 5
            Comparesnp = FM5SLeakedInfo(6, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 6
            Comparesnp = FM5SLeakedInfo(7, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 7
            Comparesnp = FM5SLeakedInfo(8, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 8
            Comparesnp = FM5SLeakedInfo(9, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 9
            Comparesnp = FM5SLeakedInfo(10, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 10
            Comparesnp = FM5SLeakedInfo(11, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 11
            Comparesnp = FM5SLeakedInfo(12, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 12
            Comparesnp = FM5SLeakedInfo(13, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 13
            Comparesnp = FM5SLeakedInfo(14, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 14
            Comparesnp = FM5SLeakedInfo(15, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 15
            Comparesnp = FM5SLeakedInfo(16, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 16
            Comparesnp = FM5SLeakedInfo(17, 2)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        else
            Comparesnp = FM5SLeakedInfo(18, 3)- data(unknown(i,1),unknown(i,2)) ;
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        end
    end
    z(1, k) = LeakedInfoSum;
    
end

