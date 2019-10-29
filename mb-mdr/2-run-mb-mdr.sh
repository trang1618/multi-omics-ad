#!/bin/bash

fname="reformatted-data/ADNI_GWAS_MAF5_LD_ADrelated_cglformat.txt"
# run mbmdr on real data file
echo "Processing $fname file..."
for dimension in 1D 2D; do
  ./mbmdr-4.4.1-mac-64bits.out \
    --binary \
    -d $dimension \
    -o "${fname%.*}_output_$dimension.txt" \
    -o2 "${fname%.*}_model_$dimension.txt" \
    "$fname" > /dev/null 2>&1
done

mv -f reformatted-data/*_1D.txt results/
mv -f reformatted-data/*_2D.txt results/
