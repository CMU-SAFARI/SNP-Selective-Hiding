clc
clear  %% To remove unnessasry combinations
ProbabilitiesFMtest = xlsread('ProbabilitiesFMtest.xlsx');%%the results from applying partitions and permutations code
save('ProbabilitiesFMtest.mat','ProbabilitiesFMtest');%convert the file to .mat
mendeltableFM  = xlsread('mendeltableFM.xlsx');
save('mendeltableFM.mat','mendeltableFM');%convert the file to .mat

%%
W= zeros(size(ProbabilitiesFMtest,1), 4);

for j = 1: size(ProbabilitiesFMtest,1) %table for potential genotypes of a sum value(Father Mother Target)
    
    for k= 1: size(mendeltableFM, 1) %table for father and mother Mendel law (Father Mother Target Probability)
        if ProbabilitiesFMtest(j, 1) == mendeltableFM (k , 1) && ProbabilitiesFMtest(j, 2) == mendeltableFM (k , 2) && ProbabilitiesFMtest(j, 3) == mendeltableFM (k , 3)
            W(j, 1:4) = ProbabilitiesFMtest(j, :);
        end
    end
end
W = W(any(W ~= 0,2),:);

%%
y= zeros(size(W,1), 7);
for j = 1: size(W,1) 
    P = 0;
    
    for k= 1: size(mendeltableFM, 1) %table for father and mother mendel law (Father Mother Target Prob)
        if W(j, 1) == mendeltableFM (k , 1) && W(j, 2) == mendeltableFM (k , 2) && W(j, 3) == mendeltableFM (k , 3)
            P = P + mendeltableFM (k , 4);
            y(j, 1:4) = W(j, :);
            y(j, 7)= P;
        end
    end
    
    
end

%%
Ptotal = 0;
Parent = 0;
R= zeros(size(W,1), 2);
for j = 1: size(W,1)
    Ptotal = y(j,7)+ y1(j,7);
    Parent = y(j,3);
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

for o= 1: size(W,1)
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