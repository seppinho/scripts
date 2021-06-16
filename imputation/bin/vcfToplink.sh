#!/bin/bash
for f in vcfs/*vcf.gz
do
 echo "Processing $f"
 base="$(basename $f .vcf.gz)"
 # double-id required to set FAM-ID
plink2 --vcf $f --make-bed --double-id --out $base &
done
