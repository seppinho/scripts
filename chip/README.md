
# Working with genotyping data
Genotyping data can be exported from e.g. Illumina Genome Studio as ped and map files (pedigree + genotype). If you cant export your data form Genome Studio, please install the [plugin](https://support.illumina.com/content/dam/illumina-support/documents/downloads/software/genomestudio/plink-input-report-plugin-v2-1-4.zip) first. This files can be converted to PLINK binary files and further converted to VCF. 

## Convert files to binary PLINK files

      plink --file <input> --make-bed --out <input-converted>
      plink --bfile <input-converted> --chr 1-23 --out <input-converted-chromosomes> --make-bed
      wget ftp://ftp.ncbi.nlm.nih.gov/1000genomes/ftp/technical/reference/human_g1k_v37.fasta.gz
      wget https://github.com/seppinho/scripts/blob/master/imputation/bin/vcfCooker

## Impute or not impute?
If you are interested in imputation, please checkout [this script](https://github.com/seppinho/scripts/tree/master/imputation). This will create ready-to-use VCF files for [Michigan Imputation Server](https://imputationserver.sph.umich.edu).  

If you are not interested in imputation and simple check & update strand orientation do the following:

 ### Update strand information only   
 - Download the tool like this:
 
       wget http://www.well.ox.ac.uk/~wrayner/strand/update_build.sh
     
 - Please check which genotyping array has been used. In out case we download the latest GSA chip information for build 37:
       
       wget http://www.well.ox.ac.uk/~wrayner/strand/GSA-24v2-0_A1-b37-strand.zip
        sh update_build.sh <input-converted-chromosomes> GSAMD-24v2-0_20024620_A1-b37.strand <input-converted-chromosomes-flip>

- Convert to one large VCF
    
        ./vcfCooker --in-bfile <input-converted-chromosomes-flip> --ref human_g1k_v37.fasta --out vcf-final.vcf --write-vcf
        bgzip vcf-final.vcf
        tabix vcf-final.vcf.gz
        
- Filter VCF file with bcftools
       Checkout also [this script](https://github.com/seppinho/scripts/blob/master/bcftools/README.md).

       bcftools view -R snps.txt vcf-final.vcf.gz > filtered.vcf
     
     
