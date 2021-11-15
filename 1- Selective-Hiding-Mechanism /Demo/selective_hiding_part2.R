library(methods)
source("functions.r")
library(Rcplex)

data = read.csv("data/newgenotype_MCF.csv")
data = data[,-1]
indices = data[,1]

# aunt is the latest arrival member
genotype = data[c("Aunt", "Dad", "Mom", "Son")]
# relationship binary matrix indicating if two individuals are relative or not
relations<- matrix(c(1,3,0,
                     1,4,0,
                     2,4,0,
                     3,4,0), ncol = 3 ,byrow = TRUE)

relations = relations[,-3]
number_of_people = 4
phi = 0.15

# find number of snps to remove to make aunt-mother kinship to 0.15
remove_snps = findOptimalSNPSet(genotype, number_of_people, relations, phi)

new_genotype = data[-remove_snps,]
print(paste(c("After removal of ", length(remove_snps)," snps") ))
print("Kinship between mom and aunt")
calculateKING(new_genotype["Aunt"],new_genotype["Mom"])
print("Kinship between aunt and son")
calculateKING(new_genotype["Aunt"],new_genotype["Son"])
print("Kinship between mom and son")
calculateKING(new_genotype["Mom"],new_genotype["Son"])
print("Kinship between mom and son")
calculateKING(new_genotype["Dad"],new_genotype["Son"])

write.csv(new_genotype, "data/newgenotype_MCF.csv")

