clc
clear  %% To remove unnessasry combinations
ProbabilitiesFtest = xlsread('ProbabilitiesFtest.xlsx'); %%the results from applying partitions and permutations code
save('ProbabilitiesFtest.mat','ProbabilitiesFtest');%convert the file to .mat
mendeltableF = xlsread('mendeltableF.xlsx');
save('mendeltableF.mat','mendeltableF');%convert the file to .mat
%%
M= zeros(size(ProbabilitiesFtest,1), 2);
for j = 1: size(ProbabilitiesFtest,1)
    
    for L= 1: 7 %table for father mendel law (Father Son Prob)
        if ProbabilitiesFtest(j, 1) == mendeltableF (L , 1) && ProbabilitiesFtest(j, 2) == mendeltableF (L , 2)
             M(j, 1:2) = ProbabilitiesFtest(j, :);
        end
    end
end

M = M(any(M ~= 0,2),:);

%%
y1= zeros(size(M,1), 3);
for j = 1: size(M,1)
    p1= 0;
    for L= 1: 7 %table for father mendel law (Father Son Prob)
        if M(j, 1) == mendeltableF (L , 1) && M(j, 2) == mendeltableF (L , 2)
            p1 = p1 + mendeltableF (L , 3);
            y1(j, 1:2) = M(j, :);
            y1(j, 3)= p1;
            
        end
    end
end

%%
Ptotal = 0;
Parent = 0;
R= zeros(size(M,1), 2);
for j = 1: size(M,1)
    Ptotal = y1(j,3)
    Parent = y1(j,2);
    R(j,1) = Parent;
    R(j,2) = Ptotal;
end
Pvalue0 = 0;
Pvalue1 = 0;
Pvalue2 = 0;
Pvalues = 0;
P0Per = 0;
P1Per = 0;
P2Per = 0;

for o= 1: size(M,1)
    if R(o,1) == 0
        Pvalue0= Pvalue0+ R(o,2);
    elseif R(o,1) == 1
        Pvalue1= Pvalue1+ R(o,2);
    else
        Pvalue2= Pvalue2+ R(o,2);
    end
end
        
    
Pvalues = Pvalue0 + Pvalue1 + Pvalue2;
P0Per= Pvalue0 / Pvalues ;
P1Per= Pvalue1 / Pvalues ;
P2Per= Pvalue2 / Pvalues ;