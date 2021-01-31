clear
clc
%%

% load the data from xlsx file to Matlab
unrelated = xlsread('1000GenomesCh22Dataset.xlsx');  
save('unrelated.mat','unrelated');%convert the file
family = xlsread('MCF-Aunt-Dad-Mom-daughter-and-son-Chromosome22.xlsx');  
save('family.mat','family');

%%
for k = 1:size(family,1)
    
    for i = 1:size(unrelated,1)
        if family(k,1) == unrelated(i,1)
            B(k,:) = unrelated(i,:);
        end
    end
end
   