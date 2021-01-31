clear
clc
%%

% load the data from xlsx file to Matlab
FLeakedInfo = xlsread('FLeakedInfo.xlsx'); %the leaked SNPs according to the probabilities of genotypes sum (case: father and target).
save('FLeakedInfo.mat','FLeakedInfo');
familySum = xlsread('Sum.xlsx'); %%the results for sum query.
save('familySum.mat','familySum');
unknown = xlsread('Unknown.xlsx'); 
save('unknown.mat','unknown');

a = zeros(size(unknown,1),2);
for i = 1: size(unknown,1)
    if familySum(i,1) == 0
        a(i, 1)= FLeakedInfo(1, 2); %individual i SNP value
        a(i, 2)= familySum(i,1)-a(i, 1); %individual k SNP value
        
    elseif familySum(i,1) == 1
        a(i, 1)= FLeakedInfo(2, 2);
        a(i, 2)= familySum(i,1)-a(i, 1);
        
    elseif familySum(i,1) == 2
        a(i, 1)= FLeakedInfo(3, 2);
        a(i, 2)= familySum(i,1)-a(i, 1);
        
    elseif familySum(i,1) == 3
        a(i, 1)= FLeakedInfo(4, 2);
        a(i, 2)= familySum(i,1)-a(i, 1);
        
    elseif familySum(i,1) == 4
        a(i, 1)= FLeakedInfo(5, 2);
        a(i, 2)= familySum(i,1)-a(i, 1);
        
        
    else
        a(i, 1)= FLeakedInfo(6, 2);
        a(i, 2)= familySum(i,1)-a(i, 1);     
        
    end
end
%%

n02=0; %n02 is the number of SNPs where the first individual (i) is homozygous dominant and the second individual(k) is homozygous recessive.
n20= 0; %n20 denotes the positions where k is homozygous dominant and i is homozygous recessive
n11=0; %n11 is the number of genomic positions that are heterozygous in both individuals
n81 = 0; %n81 are the number of SNPs that are heterozygous for individual k 
n18= 0; %n18 are the number of SNPs that are heterozygous for individual i 
%%
for i= 1: size(a,1)
    if a(i,1) == 0 && a(i,2) == 2
        n20 = n20 +1;
        
   elseif a(i,1) == 2 && a(i,2) == 1
        n02 = n02 +1;
        
   elseif a(i,1) == 1 && a(i,2) == 1
        n11 = n11 +1;   
    end 
end
%%
for i= 1: size(a,1)
    if a(i,1) == 1
        n81 = n81+1;
    end    
    if a(i,2) == 1
        n18 = n18+1;  
    end 
end
%%
t= (2*n11)- 4*(n02+n20)- n81 + n18;
u= 4*n18;
z= t/u;    %z: kinship coefficient value (Manichaikul et al.(2010))