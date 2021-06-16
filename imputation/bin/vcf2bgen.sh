#!/bin/bash
for f in *vcf.gz
do
 echo "Processing $f"
 base="$(basename $f .vcf.gz)"
 plink2 --vcf $f --export bgen-1.3 --out $base &
done
