clc
clear  %% To remove unnessasry combinations
ProbabilitiesStest = xlsread('ProbabilitiesStest.xlsx'); %%the results from applying partitions and permutations code
save('ProbabilitiesStest.mat','ProbabilitiesStest');%convert the file to .mat
mendeltableS = xlsread('mendeltableS.xlsx');
save('mendeltableS.mat','mendeltableS');%convert the file to .mat
%%
M= zeros(size(ProbabilitiesStest,1), 2);
for j = 1: size(ProbabilitiesStest,1)
    
    for L= 1: 7 %table for Son mendel law (Son Parent Prob)
        if ProbabilitiesStest(j, 1) == mendeltableS (L , 1) && ProbabilitiesStest(j, 2) == mendeltableS (L , 2)
             M(j, 1:2) = ProbabilitiesStest(j, :);
        end
    end
end

M = M(any(M ~= 0,2),:);

%%
y1= zeros(size(M,1), 3);
for j = 1: size(M,1)
    p1= 0;
    for L= 1: 7 %table for Son mendel law (Son Parent Prob)
        if M(j, 1) == mendeltableS (L , 1) && M(j, 2) == mendeltableS (L , 2)
            p1 = p1 + mendeltableS (L , 3);
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