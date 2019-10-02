clc
clear  %% To remove unnessasry combinations
ProbabilitiesFM5unrelatedtest = xlsread('ProbabilitiesFM5unrelatedtest.xlsx');%%the results from applying partitions and permutations code
save('ProbabilitiesFM5unrelatedtest.mat','ProbabilitiesFM5unrelatedtest');%convert the file to .mat
mendeltableFM  = xlsread('mendeltableFM.xlsx');
save('mendeltableFM.mat','mendeltableFM');%convert the file to .mat

%%
W= zeros(size(ProbabilitiesFM5unrelatedtest,1), 8);

for j = 1: size(ProbabilitiesFM5unrelatedtest,1) %table for potential genotypes of a sum value(Father Mother Target Son Son Son Son Son Son Son)
    
    for k= 1: size(mendeltableFM, 1) %table for father and mother Mendel law (Father Mother Target Probability)
        if ProbabilitiesFM5unrelatedtest(j, 1) == mendeltableFM (k , 1) && ProbabilitiesFM5unrelatedtest(j, 2) == mendeltableFM (k , 2) && ProbabilitiesFM5unrelatedtest(j, 3) == mendeltableFM (k , 3)
            W(j, 1:8) = ProbabilitiesFM5unrelatedtest(j, :);
        end
    end
end
W = W(any(W ~= 0,2),:);


%%
y= zeros(size(W,1), 8);
for j = 1: size(W,1) %table for potential genotypes of a sum value(Father Mother Target Son Son Son Son Son Son Son)
    P = 0;
    
    for k= 1: size(mendeltableFM, 1) %table for father and mother Mendel law (Father Mother Target Probability)
        if W(j, 1) == mendeltableFM (k , 1) && W(j, 2) == mendeltableFM (k , 2) && W(j, 3) == mendeltableFM (k , 3)
            P = P + mendeltableFM (k , 4);
            y(j, 1:8) = W(j, :);
            y(j, 9)= P;
        end
    end
    
    
end


%%
Ptotal = 0;
Parent = 0;
unrelated= 5;
R= zeros(size(W,1), 2);
for j = 1: size(W,1)
    Ptotal = y(j,9)+ unrelated *(1/3);
    Parent = y(j,3);
    R(j,1) = Parent;
    R(j,2) = Ptotal;
end
Pvalue0 = 0;
Pvalue1 = 0;
Pvalue2 = 0;
Pvalues = 0;s
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