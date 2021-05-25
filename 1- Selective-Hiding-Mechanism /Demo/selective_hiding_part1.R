# author Gulce Kale
source("functions.R")
library(methods)
library(Rcplex)

# read  mcf family snp data
data = read.csv("data/New 546 SNP's set for MCF.csv", sep = ";")
snp_indices = data[,1]
genotype = data[,c(6,3,4,2)]

#calculate number of snps to be removed for aim phi = 0.0883
x_dad = round(calculateX(genotype["Son"],genotype["Dad"], phi = 0.0883))
x_mom = round(calculateX(genotype["Son"],genotype["Mom"], phi = 0.0883))

#find the most common snps between son & dad and son & mom. The aim here manually manipulating of minimizing snps to be removed in the next steps.
remove34 = which((genotype["Son"] == 1 & genotype["Dad"]  == 1 & genotype["Mom"]  == 1)) # 34 snps
snp_87 = which((genotype["Son"] == 1 & genotype["Dad"]  == 1))
other_10 = setdiff(snp_87,remove34)
other_10_pos = snp_indices[ other_10] # pick other 10
remove_snp_34_indices  = snp_indices[remove34]
remove_snp_34_indices = c(remove_snp_34_indices, other_10_pos[sample(1:length(other_10_pos), 10,replace = F)])
remove_44 = match(remove_snp_34_indices, snp_indices)
write.csv( remove_snp_34_indices , "data/remove_from_dad.csv" )

data = data[-remove_44,]
genotype = genotype[-remove_44,]
rownames(data) <- NULL
rownames(genotype) <- NULL

print("After removal of 44 snps")
print("Kinship between mom and aunt")
calculateKING(genotype["Mom"],genotype["Aunt"])
print("Kinship between mom and son")
calculateKING(genotype["Mom"],genotype["Son"])
print("Kinship between dad and son")
calculateKING(genotype["Dad"],genotype["Son"])
write.csv(data, "data/newgenotype_MCF.csv")

