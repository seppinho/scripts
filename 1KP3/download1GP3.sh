while read i; do
  echo $i
SAMPLE=$i
SERVER=ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase3/data/${SAMPLE}/alignment/
FILE=$(curl ${SERVER} | grep -E '\.mapped.ILLUMINA.*bam$' | awk '{print $9}')
echo path is ${SERVER}${FILE}
samtools view -b ${SERVER}${FILE} 6:161033785-161066618  -o ${FILE}.lpa.bam
bamToFastq -i ${FILE}.lpa.bam -fq ${FILE}.lpa.fq
rm ${FILE}.lpa.bam*
done <samples.txt

