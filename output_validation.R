#to check whether the output files are present in the results directory
names <- list("counts.tsv", "normcounts.tsv", "logcounts.tsv", "DESeqDataSet.rds", "DESeqTransform.rds",
              "DESeqResults_Treated_vs_Untreated_.rds", "DESeqResults_Treated_vs_Untreated_.tsv")



for (name in names){
  
  
  if(file.exists(paste("./results/", name, sep= ""))==TRUE)
  {
    print(paste(name,"is present in the results directory"))
  }
  else
  {
    print(paste(name, "is not present in the results dir"))
  }
  
}

#to check if the output files are correct - normcounts.tsv
norms<-read.delim("./results/normcounts.tsv")
stopifnot("file format of normcounts.tsv is not correct " = colnames(norms)==colnames(Counts))

#to check if the output files are correct - logcounts.tsv
logs<-read.delim("./results/logcounts.tsv")
stopifnot("file format of logcounts.tsv is not correct " = colnames(logs)==colnames(Counts))

##to check if the output files are correct - DESeqDataSet.rds
dds_rds<- readRDS("./results/DESeqDataSet.rds")
stopifnot("file format of DESeqDataSet.rds is not correct" = colnames(colData(dds_rds)) == colnames(samples))

#to check if the output files are correct - DESeqResults_Treated_vs_Untreated_.rds
deseq_cond_rds<-readRDS("./results/DESeqResults_Treated_vs_Untreated_.rds")
stopifnot("file format of DESeqResults_Treated_vs_Untreated_.rds is not correct" = colnames(deseq_cond_rds) ==
            list("baseMean","log2FoldChange","lfcSE", "stat", "pvalue", "padj", "symbol"))


#to check if the output files are correct - DESeqTransform.rds
deseq_transform<-readRDS("./results/DESeqTransform.rds")
stopifnot("file format of DESeqTransform.rds is not correct" = colnames(deseq_transform) == samples$sample)


#to check if the output files are correct - DESeqResults_Treated_vs_Untreated_.tsv
stopifnot("file format of DESeqResults_Treated_vs_Untreated_.tsv is not  correct" = colnames(res_table) == list("baseMean","log2FoldChange","lfcSE", "stat", "pvalue", "padj", "symbol"))