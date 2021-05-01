
# **Near-Optimal Privacy-Utility Tradeoff in Genomic Studies Using Selective SNP Hiding**

## Abstract:


## Result:




## Selective Hiding for MC Family:
In this demo we run the selective hiding mechanism for four members of MC family in the following order: MC (son), his father, mother and maternal aunt. The first part of the demo chooses overlapping parts between the son, the father and the mother trio to minimize kinship values. In the second part, we add aunt to the family and run integer optimization model to find minimal snps to be hidden.
The demo could be run in the following order from the terminal:
```shell
Rscript selective_hiding_part1.R 
Rscript selective_hiding_part2.R 
```
Note: You must have Rcplex package installed.
