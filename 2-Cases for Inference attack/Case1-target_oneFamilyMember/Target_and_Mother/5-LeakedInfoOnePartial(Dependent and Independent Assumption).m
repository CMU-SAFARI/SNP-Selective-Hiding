clear
clc
%%

% load the data from txt file to Matlab
MLeakedInfo = xlsread('MLeakedInfo.xlsx');
save('MLeakedInfo.mat','MLeakedInfo');%convert the file
familySum = xlsread('Mother Only Sum.xlsx'); %% the query noisy results file which contains the partial info the adversary could know.
save('familySum.mat','familySum');%convert the file to .mat
data = xlsread('Data.xlsx'); %Family Genomic Data for 100SNPs, where each row contains the genomic record of a family member.
save('data.mat','data');%convert the file to .mat
unknown = xlsread('Unknown.xlsx');
save('unknown.mat','unknown');%convert the file to .mat
z = zeros(1,13);
y = zeros(100,13);
n = zeros(100,13);
%%
for k = 1:2:26
    LeakedInfoSum = 0;
    for i = 1: 100
        if familySum(i,k) == 0
            if isnan(familySum(i,k+1))
                Comparesnp = MLeakedInfo(1, 2)- data(unknown(i,1),unknown(i,2)) ;
                
            else
                x= familySum(i,k) - familySum(i,k+1) ;
                y(i,k) = x;
                Comparesnp = x - data(unknown(i,1),unknown(i,2)) ;
                n(i,k) = Comparesnp;
            end
           
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        elseif familySum(i,k) == 1
            if isnan(familySum(i,k+1))
                Comparesnp = MLeakedInfo(2, 2)- data(unknown(i,1),unknown(i,2)) ;
            else
                x= familySum(i,k) - familySum(i,k+1) ;
                y(i,k) = x;
                Comparesnp = x - data(unknown(i,1),unknown(i,2))  ;
                n(i,k) = Comparesnp;
            end
            
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 2
            if isnan(familySum(i,k+1))
                Comparesnp = MLeakedInfo(3, 2)- data(unknown(i,1),unknown(i,2)) ;
            else
                x= familySum(i,k) - familySum(i,k+1) ;
                y(i,k) = x;
                Comparesnp = x - data(unknown(i,1),unknown(i,2))  ;
                n(i,k) = Comparesnp;
            end
            
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 3
            
            if isnan(familySum(i,k+1))
                Comparesnp = MLeakedInfo(4, 2)- data(unknown(i,1),unknown(i,2)) ;
            else
                x= familySum(i,k) - familySum(i,k+1) ;
                y(i,k) = x;
                Comparesnp = x - data(unknown(i,1),unknown(i,2))  ;
                n(i,k) = Comparesnp;
            end
            
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 4
            if isnan(familySum(i,k+1))
                
                Comparesnp = MLeakedInfo(5, 2)- data(unknown(i,1),unknown(i,2)) ;
            else
                x= familySum(i,k) - familySum(i,k+1) ;
                y(i,k) = x;
                Comparesnp = x - data(unknown(i,1),unknown(i,2))  ;
                n(i,k) = Comparesnp;
            end
            
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        else
            if isnan(familySum(i,k+1))
                Comparesnp = MLeakedInfo(6, 2)- data(unknown(i,1),unknown(i,2)) ;
            else
                x= familySum(i,k) - familySum(i,k+1) ;
                y(i,k) = x;
                Comparesnp = x - data(unknown(i,1),unknown(i,2))  ;
                n(i,k) = Comparesnp;
            end
            
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        end
    end
    z(1, k) = LeakedInfoSum;
    
    
end
%%
z(z==0) = [];   %% remove zeros from z

%% Independent Assumption
z = zeros(1,13);
y = zeros(100,13);
n = zeros(100,13);

for k = 1:2:26
    LeakedInfoSum = 0;
    for i = 1: 100
        if familySum(i,k) == 0
            if isnan(familySum(i,k+1))
                Comparesnp = MLeakedInfo(1, 3)- data(unknown(i,1),unknown(i,2)) ;
                
            else
                x= familySum(i,k) - familySum(i,k+1) ;
                y(i,k) = x;
                Comparesnp = x - data(unknown(i,1),unknown(i,2)) ;
                n(i,k) = Comparesnp;
            end
           
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        elseif familySum(i,k) == 1
            if isnan(familySum(i,k+1))
                Comparesnp = MLeakedInfo(2, 3)- data(unknown(i,1),unknown(i,2)) ;
            else
                x= familySum(i,k) - familySum(i,k+1) ;
                y(i,k) = x;
                Comparesnp = x - data(unknown(i,1),unknown(i,2))  ;
                n(i,k) = Comparesnp;
            end
            
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 2
            if isnan(familySum(i,k+1))
                Comparesnp = MLeakedInfo(3, 3)- data(unknown(i,1),unknown(i,2)) ;
            else
                x= familySum(i,k) - familySum(i,k+1) ;
                y(i,k) = x;
                Comparesnp = x - data(unknown(i,1),unknown(i,2))  ;
                n(i,k) = Comparesnp;
            end
            
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 3
            
            if isnan(familySum(i,k+1))
                Comparesnp = MLeakedInfo(4, 3)- data(unknown(i,1),unknown(i,2)) ;
            else
                x= familySum(i,k) - familySum(i,k+1) ;
                y(i,k) = x;
                Comparesnp = x - data(unknown(i,1),unknown(i,2))  ;
                n(i,k) = Comparesnp;
            end
            
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
        elseif familySum(i,k) == 4
            if isnan(familySum(i,k+1))
                
                Comparesnp = MLeakedInfo(5, 3)- data(unknown(i,1),unknown(i,2)) ;
            else
                x= familySum(i,k) - familySum(i,k+1) ;
                y(i,k) = x;
                Comparesnp = x - data(unknown(i,1),unknown(i,2))  ;
                n(i,k) = Comparesnp;
            end
            
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        else
            if isnan(familySum(i,k+1))
                Comparesnp = MLeakedInfo(6, 3)- data(unknown(i,1),unknown(i,2)) ;
            else
                x= familySum(i,k) - familySum(i,k+1) ;
                y(i,k) = x;
                Comparesnp = x - data(unknown(i,1),unknown(i,2))  ;
                n(i,k) = Comparesnp;
            end
            
            if Comparesnp == 0
                LeakedInfoSum =  LeakedInfoSum + 1;
            end
            
        end
    end
    z(1, k) = LeakedInfoSum;
    
    
end
%%
z(z==0) = [];   %% remove zeros from z

