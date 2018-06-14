
# Imputation Scripts

This script creates a chr23 GWAS vcf file from GWAS plink files. Overall goal is to impute it with Michigan Imputation Server. 

## Get all required data and tools
     wget http://www.well.ox.ac.uk/~wrayner/tools/HRC-1000G-check-bim-v4.2.9.zip
     unzip HRC-1000G-check-bim-v4.2.9.zip
     wget ftp://ngs.sanger.ac.uk/production/hrc/HRC.r1-1/HRC.r1-1.GRCh37.wgs.mac5.sites.tab.gz
     unzip HRC.r1-1.GRCh37.wgs.mac5.sites.tab.gz
     wget ftp://ftp.ncbi.nlm.nih.gov/1000genomes/ftp/technical/reference/human_g1k_v37.fasta.gz
     
 ## Pipeline 
 
 ### Extract chr23 from overall file
     plink --bfile <input> --chr 23 --out <input-out> --make-bed
 ### Optional filter step    
     plink --bfile <input-out> --maf 0.01 --hwe 1E-5 --geno 0.04  --out  <input-out-filtered> --make-bed
     
 ### Run Wrayner Tool       
     plink --freq --bfile <input-out-filtered>  --out <frequency-file> 
     perl HRC-1000G-check-bim.pl -b <input-out-filtered.bim> -f <frequency-file> -r HRC.r1-1.GRCh37.wgs.mac5.sites.tab -h
     sh Run-plink.sh
     ./vcfCooker --in-bile <updated-filed> --ref human_g1k_v37.fasta --out chr23 --write-vcf
     bgzip chr23.vcf

 ## REsult
 The result can be uploaded to https://imputationserver.sph.umich.edu
