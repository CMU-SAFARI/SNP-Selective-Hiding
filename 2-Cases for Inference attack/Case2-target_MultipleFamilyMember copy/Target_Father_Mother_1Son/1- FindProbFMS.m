clc
clear  %% To remove unnessasry combinations
ProbabilitiesFMStest = xlsread('ProbabilitiesFMStest.xlsx');%%the results from applying partitions and permutations code
save('ProbabilitiesFMStest.mat','ProbabilitiesFMStest');%convert the file to .mat
mendeltableFM  = xlsread('mendeltableFM.xlsx');
save('mendeltableFM.mat','mendeltableFM');%convert the file to .mat

mendeltableS = xlsread('mendeltableS.xlsx');
save('mendeltableS.mat','mendeltableS');%convert the file to .mat
%%
W= zeros(size(ProbabilitiesFMStest,1), 4);

for j = 1: size(ProbabilitiesFMStest,1) %table for potential genotypes of a sum value(Father Mother Target Son)
    
    for k= 1: size(mendeltableFM, 1) %table for father and mother mendel law (Father Mother Target Probability)
        if ProbabilitiesFMStest(j, 1) == mendeltableFM (k , 1) && ProbabilitiesFMStest(j, 2) == mendeltableFM (k , 2) && ProbabilitiesFMStest(j, 3) == mendeltableFM (k , 3)
            W(j, 1:4) = ProbabilitiesFMStest(j, :);
        end
    end
end
W = W(any(W ~= 0,2),:);
%%
M= zeros(size(W,1), 4);
for j = 1: size(W,1)
    
    for L= 1: 7 %table for Son mendel law (Son Target Probability)
        if W(j, 4) == mendeltableS (L , 1) && W(j, 3) == mendeltableS (L , 2)
             M(j, 1:4) = W(j, :);
        end
    end
end

M = M(any(M ~= 0,2),:);

%%
y= zeros(size(M,1), 7);
for j = 1: size(M,1) %table for potential genotypes of a sum value(Father Mother Target Son)
    P = 0;
    
    for k= 1: size(mendeltableFM, 1) %table for father and mother mendel law (Father Mother Target Probability)
        if M(j, 1) == mendeltableFM (k , 1) && M(j, 2) == mendeltableFM (k , 2) & M(j, 3) == mendeltableFM (k , 3)
            P = P + mendeltableFM (k , 4);
            y(j, 1:4) = M(j, :);
            y(j, 7)= P;
        end
    end
    
    
end
%%
y1= zeros(size(M,1), 7);
for j = 1: size(M,1)
    p1= 0;
    for L= 1: 7 %table for Son mendel law (Son Target Probability)
        if M(j, 4) == mendeltableS (L , 1) && M(j, 3) == mendeltableS (L , 2)
            p1 = p1 + mendeltableS (L , 3);
            y1(j, 1:4) = M(j, :);
            y1(j, 7)= p1;
            
        end
    end
end

%%
Ptotal = 0;
Parent = 0;
R= zeros(size(M,1), 2);
for j = 1: size(M,1)
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