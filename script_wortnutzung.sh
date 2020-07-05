#!/bin/bash
# In diesem Script wird ein Wortnutzungsstatistik erstellt

for word in "history" "historical" "praehistorische" "historische"
do
COUNT=$(grep -woi "$word" 2020-05-23-Article_list_dirty.tsv | wc -l| sed 's/^[[:space:]]*//')
echo "$word:$COUNT"
done
