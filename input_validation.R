#data integration test for counts table to check whether no.of rows in counts is equal to gene annotation file
stopifnot("number of rows in the gene annotation table is not the same in the counts,kindly check the data files! " = nrow(genes) != nrow(Counts))



#data integrity tests for counts table to check the sample order in sample metadata and counts table is same 
stopifnot("Sample order is not the same in the sample table and the counts matrix,Kindly check the data files!" = all(samples$sample != colnames(countDataMatrix)))