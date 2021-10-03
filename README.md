# scripts for genetics
Bash scripts and other stuff I always google

|Category|Description|Author|
|:--:|:----:|:----------|
|[simple genetics bash scripts](https://github.com/seppinho/scripts/blob/master/bash/README.md)|vcf.gz commands|Seb|
|[bcftools](https://github.com/seppinho/scripts/blob/master/bcftools/README.md)|vcf.gz commands|Seb|
|[docker](https://github.com/seppinho/scripts/blob/master/docker/README.md)|basic docker commands|Seb|
|[realign](https://github.com/seppinho/scripts/blob/master/realign/README.md)|realign BAM file|Seb|
|[imputation](https://github.com/seppinho/scripts/blob/master/imputation/README.md)|prepare data for Michigan Imputation Server|Seb|
|[chip-data](https://github.com/seppinho/scripts/blob/master/chip/README.md)|create vcf files from Illumina data|Seb|
|[1GP3](https://github.com/seppinho/scripts/blob/master/1KP3/README.md)|download 1000 Genomes lpa data|Hansi|


# Extract zips with passwords (e.g. from MIS)
Save script in same folder as zips and run with ./script.sh <PWD>

```bash
#!/bin/bash
for FILE in *.zip;
do 7z x -p"$1" $FILE;
done
```
# Delete all Docker containers

```bash  
 docker rm -vf $(docker ps -a -q)
```
  
# Delete all Docker images

```bash  
docker rmi -f $(docker images -a -q)
```
