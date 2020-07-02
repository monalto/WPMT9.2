 #!/bin/bash

# Mit diesem Script werden die Spalten issn und Jahr bereinigt

cat 2020-05-23-Article_list_dirty.tsv | awk -F="#" {print $1} | awk -F="IMPORTANT" {print $1} | awk -F="IMPORTANT!" {print $1} | awk -F="MAYBE" {print $1} | grep -P '\d{4}-\d{4}' issns.tsv > issns1.tsv | grep -P '\d{4}' issns.tsv > issns1.tsv | sort uniq issns1.tsv > issns_final.tsv

