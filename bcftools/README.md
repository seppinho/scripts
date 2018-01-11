# bcftools

## Extract region and write a vcf.gz

 ```bash
/home/seb/tools/bcftools-1.3.1/bcftools view -r 19:1-20500000 <file.vcf.gz> -o <out.vcf.gz> -Oz
```