# Aufgabe 1.2 WPMT9
Hier werden der Verlauf der zwei Aufgabenteile kommentiert. Für den Python Teil sind die Kommentare in dem Jupyter Notebook zu finden.

-----

## Inhalt
1. Python Aufgabe
2. Shell Aufgabe
2.1 Script zur Datenbereinigung
2.2 Script zur Wortnutzungsstatistiken
3. Quellen
------

1. Python Aufgabe
Der Verlauf und Ergebnisse der Bearbeitung der Datei Inventory der Seattle Public Library befindet sich [in diesem Jupyter Notebook](https://github.com/monalto/WPMT9.2/blob/master/Inventur%20der%20Seattle%20Public%20Library.ipynb).

2. Shell Aufgabe
 
    Zuerst wurde die Datei 2020-05-23-Article_list_dirty angeschaut und die Spalten identifiziert, die gezogen werden müssen. Die waren die Nummer 5 und Nummer 12. Der Befehl ist dann ```cut -f 5,12``` . Diese Spalten wurden in eine Datei gespeichert.

    Danach wurden die Zeilen, die keine issn Nummer hatten enfernt mit dem Befehl ```grep-v 'eng'```

    Anschließend werden die Leerstellen, die Wörter ISSN, issn und Issn s```ed 's/ISSN://g;s/issn://g;s/Issn://g'``` entfernt um die Daten gleichmäßig und ohne Unterbrechungen zu haben. ```sed 's/^[[:space:]]*//g```

    Es fehlt nur die Dopplungen zu löschen und die Daten zu sortieren. Dafür wird der Befehl ```sort -u``` (Dopplungen zu entfernen) > Es fehlt nur die Dopplungen zu löschen und die Daten zu sortieren. Dafür wird der Befehl ```sort -u``` (Dopplungen zu entfernen) sort -n (numerische Sortierung) benutzt.

    Das Ergebnis wurde in eine neue Datei mit den heutigen Datum in Format ISO 8601 (YYYY-MM-DD) gespeichert und zwar 2020-07-05-issns-years-clean.tsv

    Um dieses Ergebnis zu Überprüfen wurde die Date mit der Lösung verglichen ```diff``` und es gab keinen numerischen Unterschied. Nur in meine Datei sind die namen der Spalten geblieben ISSN und Date.

2.1 Script zur Datenbereinigung
```#!/bin/bash

# Mit diesem Script werden die Spalten issn und Jahr bereinigt
cut -f 5,12 2020-05-23-Article_list_dirty.tsv > issns_years.tsv
grep -v 'eng' issns_years.tsv > issns_years2.tsv
sed 's/ISSN://g;s/issn://g;s/Issn://g' issns_years3.tsv
sed 's/^[[:space:]]*// issns_years3.tsv > issns_years4.tsv'
sort -u issns_years4.tsv > issns_years5.tsv
sort -n issns_years5.tsv > 2020-07-05-issns_years_clean.tsv
cat 2020-07-05-issns_years_clean.tsv```
