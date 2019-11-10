
# **Differential Privacy under Dependent Tuples -  The Case of Genomic Privacy**
Described in the Bioinformatics journal paper (2019) by Almadhoun et al. at: https://academic.oup.com/bioinformatics/advance-article/doi/10.1093/bioinformatics/btz837/5614817
## Abstract:
The rapid progress in genome sequencing has led to high availability of genomic data.Studying these data can greatly help answer the key questions about disease associations and ourevolution. However, due to growing privacy concerns about the sensitive information of participants,accessing key results and data of genomic studies (such as genome-wide association studies - GWAS) isrestricted to only trusted individuals. On the other hand, paving the way to biomedical breakthroughs anddiscoveries requires granting open access to genomic datasets. Privacy-preserving mechanisms can be asolution for granting wider access to such data while protecting their owners. In particular, there has beengrowing interest in applying the concept of differential privacy (DP) while sharing summary statistics aboutgenomic data. DP provides a mathematically rigorous approach to prevent the risk of membership inferencewhile sharing statistical information about a dataset. However, DP does not consider the dependencebetween tuples in the dataset, which may degrade the privacy guarantees offered by the DP.

## Result:
In this work, focusing on genomic datasets, we show this drawback of the DP and we proposetechniques to mitigate it. First, using a real-world genomic dataset, we demonstrate the feasibility of aninference attack on differentially private query results by utilizing the correlations between the entries inthe dataset. The results show the scale of vulnerability when we have dependent tuples in the dataset.We show that the adversary can infer sensitive genomic data about a user from the differentially privateresults of a query by exploiting the correlations between the genomes of family members. Second, wepropose a mechanism for privacy-preserving sharing of statistics from genomic datasets to attain privacyguarantees while taking into consideration the dependence between tuples. By evaluating our mechanismon different genomic datasets, we empirically demonstrate that our proposed mechanism can achieve upto 50% better privacy than traditional DP-based solutions.




