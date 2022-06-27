# Data import
counts <- read.delim("./data/counts.tsv", row.names = 1)
samples <- read.delim("./data/samples.tsv", row.names = 1)
genes <- read.delim("./data/genes.tsv", row.names = 1)


#validations

#data integration test for counts table to check whether no.of rows in counts is equal to gene annotation file
stopifnot("number of rows in the gene annotation table is not the same in the counts,kindly check the data files! " = nrow(counts) != nrow(genes))

#data integrity tests for counts table to check the sample order in sample metadata and counts table is same 
stopifnot("Sample order is not the same in the sample table and the counts matrix,Kindly check the data files!" = colnames(counts) == rownames(samples))

#data integrity tests for counts table to check rownmaes of counts is same as rownames of gene annotation file
stopifnot("Rownames of counts is not same annotation file, kindly check the data files!" = rownames(counts) == rownames(genes))

#data integrity tests for counts table to check the number of cols of counts is same as no of cols of rows
stopifnot("Number of columns in count table is not equal to the number of rows in sample metadata, kindly check the data files!" = rownames(counts) == rownames(genes))
