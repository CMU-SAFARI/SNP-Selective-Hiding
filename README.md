
# **Near-Optimal Privacy-Utility Tradeoff in Genomic Studies Using Selective SNP Hiding**
Researchers need a rich trove of genomic datasets that they can leverage to gain a better understanding of the genetic basis of the human genome and identify associations between phenotypes and specific parts of DNA. However, sharing genomic datasets that include sensitive genetic or medical information of individuals can lead to serious privacy-related consequences if data lands in the wrong hands. Restricting access to genomic datasets is one solution, but this greatly reduces their usefulnessfor research purposes. To allow sharing of genomic datasets while addressing these privacy concerns,several studies propose privacy-preserving mechanisms for data sharing. Differential privacy (DP) is one of such mechanisms that formalize rigorous mathematical foundations to provide privacy guarantees whilesharing aggregated statistical information about a dataset. However, it has been shown that the original privacy guarantees of DP-based solutions degrade when there are dependent tuples in the dataset, which is a common scenario for genomic datasets (due to the existence of family members).

Described by Almadhoun Alserr et al. This work is submitted to the Bioinformatics journal.


## Table of Contents
- [Key Idea](#idea)
- [Results](#results)
- [Using Our Mechanism](#started)
  - [Selective Hiding for MC Family](#demo)
  - [Differentially-private data release](#demo2)
- [Required Packages](#Packages)
- [Supplementary Materials](#supp)
- [Getting Help](#contact)
- [Citing Our Paper](#cite)

##  <a name="idea"></a>The Key Idea 
Recent works show how dependency between dataset tuples (or records) may reduce the privacy guarantees of DP-based techniques, and they propose general mechanisms to tackle this problem by increasing the added noise to the shared summary statistics which, in turn, degrades the data utility. The key idea in our mechanism is, rather than adding more noise to the DP-released statistics, we reduce the level of familial dependency. 

##  <a name="results"></a> Results 
In this work, we introduce a near-optimal optimization-based mechanism to mitigate the vulnerabilities of the inference attacks  on  differentially  private  query  results  from  genomic  datasets  including  dependent  tuples.  We propose a utility-maximizing and privacy-preserving approach for sharing statistics by hiding selective SNPs of the family members as they participate in a genomic dataset. By evaluating our mechanism on a real-world genomic dataset (1000 Genomes Phase 3 and MC family dataset), we empirically demonstrate that our proposed mechanism can achieve upto 40% better privacy than state-of-the-art DP-based solutions, while near-optimally minimizing the utilityloss.

## <a name="started"></a> Using Our Mechanism:
Following a sequential way in our mechanism, we have two steps: 
**Step 1:** Selective Hiding: genomes first collected and dataset owner process/obfuscate them sequentially.
**Step 2:** Differentially-private data release: all queries are differentially-private answered by the dataset owner over the dataset with the hidden SNPs.

## <a name="demo"></a> Selective Hiding for MC Family:
In this demo we run the selective hiding mechanism for four members of MC family in the following order: MC (son), his father, mother and maternal aunt. The first part of the demo chooses overlapping parts between the son, the father and the mother trio to minimize kinship values. In the second part, we add aunt to the family and run integer optimization model to find minimal snps to be hidden.
The demo could be run in the following order from the terminal:
```shell
Rscript selective_hiding_part1.R 
Rscript selective_hiding_part2.R 
```
## <a name="demo2"></a> Differentially-private Data Release:


## <a name="package"></a> Required Packages:
You must have [Rcplex package](https://cran.r-project.org/web/packages/Rcplex/index.html) installed.


##  <a name="contact"></a>Getting Help
If you have any question or any suggestion for improvement, please contact nourmn.alserr at ethz dot ch

## <a name="cite"></a>Citing Our Paper:

If you use our mechanism in your work, please cite:
**TBA**


Below is bibtex format for citation.
**TBA**


