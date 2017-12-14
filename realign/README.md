#  Realignment

I used information from [this article](https://software.broadinstitute.org/gatk/documentation/article.php?id=7156). 


### Install Dependencies

Picard:
 ```bash
git clone https://github.com/broadinstitute/picard.git
cd picard
./gradlew shadowJar
```
GATK 3.7:

 ```bash
wget https://software.broadinstitute.org/gatk/download/auth?package=GATK-archive&version=3.7-0-gcfedb67
```

### Realignment Workflow

Execute first two steps only in case your BAM is malformed:

* Create Sequence Dictionary

 ```java
java -jar picard/build/libs/picard.jar  CreateSequenceDictionary R=<name.fasta> O=<name.dict>
```
* Add or Replace Read Groups
 ```java
java -jar picard/build/libs/picard.jar AddOrReplaceReadGroups I=<bam01.bam> O=<bam01_RG.bam> RGPL=illumina RGLB=lib1  RGPU=unit1  RGSM=2
```

* Create target intervals

 ```java
java -jar GenomeAnalysisTK.jar  -T RealignerTargetCreator -R <file.fasta> -I <file.bam> -o <name.list>
```

*  Realign reads
 ```java
java -jar GenomeAnalysisTK.jar -T IndelRealigner -R <file.fasta> -I <file.bam> -targetIntervals <name.list> -o <file_realigned.bam>
```
