
# Download 1000G Region

This script currently downloads the lpa region (6:161033785-161066618) of all final 1000 Genomes Phase 3 BAM files (n=2504) and converts it back to fastq to run it with Mutation Server (Link soon). 

## Prerequisites
* Install samtools https://github.com/samtools/samtools/releases/download/1.7/samtools-1.7.tar.bz2
* Install bedtools2 https://github.com/arq5x/bedtools2

## Run

* Download samples list

 ```bash
 wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/integrated_call_samples_v3.20130502.ALL.panel -O samples.txt
```

* Start download process (script by @haansi)

 ```bash
   chmod +x download1GP3.sh
  ./download1GP3.sh
```
