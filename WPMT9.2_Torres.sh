 #!/bin/bash

# Mit diesem Script werden die Spalten issn und Jahr bereinigt
cut -f 5,12 2020-05-23-Article_list_dirty.tsv > issns_and_years.tsv
grep -v 'eng' issns_and_years.tsv > issns_and_years2.tsv
sed 's/^[t\]*//' issns_and_years2.tsv > issns_and_years3.tsv
sed 's/ISSN://g;s/issn://g;s/Issn://g' issns_and_years3.tsv > issns_and_years4.tsv
sort -u issns_and_years4.tsv > issns_and_years5.tsv
sort -n issns_and_years5.tsv > 2020-07-04-issns_and_years_clean.tsv
