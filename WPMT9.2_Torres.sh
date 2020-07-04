#!/bin/bash

# Mit diesem Script werden die Spalten issn und Jahr bereinigt
cut -f 5,12 2020-05-23-Article_list_dirty.tsv > issns_years.tsv
grep -v 'eng' issns_years.tsv > issns_years2.tsv
sed 's/^[t\]*//' issns_years2.tsv > issns_years3.tsv
sed 's/ISSN://g;s/issn://g;s/Issn://g' issns_years3.tsv > issns_years4.tsv
sort -u issns_years4.tsv > issns_years5.tsv
sort -n issns_years5.tsv > issns_years_6.tsv
sed 's/^[[:space:]]*//' issns_years_6.tsv > 2020-07-04-issns_years_clean.tsv
cat 2020-07-04-issns_years_clean.tsv
