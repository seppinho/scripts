
# Imputation Scripts

This script creates a chr23 GWAS VCF file from PLINK binary files. Overall goal is to impute it with Michigan Imputation Server. Please install [Plink2](https://www.cog-genomics.org/plink2) before you start.

## Get all required data and tools
     wget http://www.well.ox.ac.uk/~wrayner/tools/HRC-1000G-check-bim-v4.2.9.zip
     unzip HRC-1000G-check-bim-v4.2.9.zip
     wget ftp://ngs.sanger.ac.uk/production/hrc/HRC.r1-1/HRC.r1-1.GRCh37.wgs.mac5.sites.tab.gz
     gunzip HRC.r1-1.GRCh37.wgs.mac5.sites.tab.gz
     wget ftp://ftp.ncbi.nlm.nih.gov/1000genomes/ftp/technical/reference/human_g1k_v37.fasta.gz
     wget https://github.com/seppinho/scripts/blob/master/imputation/bin/vcfCooker
     
 ## Pipeline 
 
 ### Extract chr23 from overall binary file set (bed, bim, fam)
 Info: Always specify GWAS-File without ending bed/bim/fam when using PLINK. 
 
     plink --bfile <GWAS-file> --chr 23 --out <GWAS-file-out> --make-bed
 ### Optional filter step    
     plink --bfile <input-out> --maf 0.01 --hwe 1E-5 --geno 0.04  --out  <input-out-filtered> --make-bed
     
 ### Run [Wrayner Tool](http://www.well.ox.ac.uk/~wrayner/tools/)       
     plink --freq --bfile <input-out-filtered>  --out <frequency-file> 
     perl HRC-1000G-check-bim.pl -b <input-out-filtered.bim> -f <frequency-file> -r HRC.r1-1.GRCh37.wgs.mac5.sites.tab -h
     sh Run-plink.sh
     ./vcfCooker --in-bile <updated-file> --ref human_g1k_v37.fasta --out chr23 --write-vcf
     bgzip chr23.vcf

 ## Result
 The result can be uploaded to https://imputationserver.sph.umich.edu
