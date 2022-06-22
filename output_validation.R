
#to check whether the output files are present in the results directory
names <- list("counts.tsv", "normcounts.tsv", "logcounts.tsv", "DESeqDataSet.rds", "DESeqTransform.rds",
              "DESeqResults_Treated_vs_Untreated_.rds", "DESeqResults_Treated_vs_Untreated_.tsv")
for (name in names){
  if(file.exists(paste("./results/",name))==TRUE)
  {
    print(paste(name,"is present in the results directory"))
  }
  else
  {
    print(paste(name, "is not present in the results dir"))
  }
  
}

#to check if the output files are correct - normcounts.tsv
norms<-read.delim("./results/deseq2/normcounts.tsv")
stopifnot("file format of normcounts.tsv is not correct " = colnames(norms)==colnames(Counts))

#to check if the output files are correct - logcounts.tsv
logs<-read.delim("./results/deseq2/logcounts.tsv")
stopifnot("file format of logcounts.tsv is not correct " = colnames(logs)==colnames(Counts))

dds_rds<- read_rds("./results/deseq2/DESeqDataSet.rds")
stopifnot("file format of DESeqDataSet.rds is not correct" = colnames(colData(dds_rds)) == colnames(samples))

#to check if the output files are correct - DESeqResults_Treated_vs_Untreated_.rds
deseq_cond_rds<-read_rds("./results/deseq2/DESeqResults_Treated_vs_Untreated_.rds")
stopifnot("file format of DESeqResults_Treated_vs_Untreated_.rds is not correct" = colnames(deseq_cond_rds) ==
            list("baseMean","log2FoldChange","lfcSE", "stat", "pvalue", "padj", "symbol"))



deseq_transform<-read_rds("./results/deseq2/DESeqTransform.rds")
stopifnot("file format of DESeqTransform.rds is not correct" = colnames(deseq_transform) == samples$sample)



stopifnot("file format of DESeqTransform.rds is not  correct" = colnames(res_table) == list("baseMean","log2FoldChange","lfcSE", "stat", "pvalue", "padj", "symbol"))




