
# Phased to Unphased

Change first occurence of | to /. Michigan Imputation Server will recognize unphased and will phase *all* sites.

    sed 's/|/\//1' chr12.OmniExpress.10K.1000G_b38.chr.vcf > chr12.OmniExpress.10K.1000G_b38.chr.unphased.vcf
