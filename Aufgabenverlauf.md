# Aufgabe 2 WPMT9
Hier wird der Verlauf der zwei Aufgabenteile kommentiert. Für den Python Teil sind die Kommentare in dem Jupyter Notebook zu finden.

-----

## Inhalt
1. Python Aufgabe
2. Shell Aufgabe Datenbereinigung
    
    2.1 Script
3. Shell Aufgabe Wortnutzungsstatistik
    
    2.2 Script
3. Quellen
------

1. Python Aufgabe


   Der Verlauf und die Ergebnisse der Bearbeitung der Datei Inventory der Seattle Public Library befindet sich [in diesem Jupyter Notebook](https://github.com/monalto/WPMT9.2/blob/master/Inventur%20der%20Seattle%20Public%20Library.ipynb).

2. Shell Aufgabe Datenbereinigung
 
    Zuerst wurde die Datei 2020-05-23-Article_list_dirty angeschaut und die Spalten identifiziert, welche herausgezogen werden müssen. Diese waren die Nummer 5 und Nummer 12. Der Befehl ist ```cut -f 5,12``` . Diese Spalten wurden in eine Datei gespeichert.

    Danach wurden die Zeilen, die keine issn Nummer hatten mit dem Befehl ```grep-v 'eng'``` enfernt.

    Anschließend werden die Leerstellen, die Wörter ISSN, issn und Issn ```sed 's/ISSN://g;s/issn://g;s/Issn://g'``` entfernt um die Daten gleichmäßig und ohne Unterbrechungen darzustellen. ```sed 's/^[[:space:]]*//g```

    Es fehlt nur noch die Dopplungen zu löschen und die Daten zu sortieren. Dafür wird der Befehl ```sort -u``` (Dopplungen entfernen) ```sort -n``` (numerische Sortierung) benutzt.

    Das Ergebnis wurde in eine neue Datei mit dem heutigen Datum im Format ISO 8601 (YYYY-MM-DD) gespeichert also als 2020-07-05-issns-years-clean.tsv

    Um dieses Ergebnis zu Überprüfen wurde die Date mit der Lösung verglichen ```diff``` und es gab keinen numerischen Unterschied. In meiner Datei sind nur die Namen der Spalten ISSN und Date geblieben.

```$ diff 2020-05-23-Dates_and_ISSNs_v1.tsv 2020-07-05-issns_years_clean.tsv```
```0a1,2```
```>```
```> ISSN  Date```

2.1 Script

```#!/bin/bash```

```# Mit diesem Script werden die Spalten issn und Jahr bereinigt```
```cut -f 5,12 2020-05-23-Article_list_dirty.tsv > issns_years.tsv```
```grep -v 'eng' issns_years.tsv > issns_years2.tsv```
```sed 's/ISSN://g;s/issn://g;s/Issn://g' issns_years3.tsv```
```sed 's/^[[:space:]]*// issns_years3.tsv > issns_years4.tsv'```
```sort -u issns_years4.tsv > issns_years5.tsv```
```sort -n issns_years5.tsv > 2020-07-05-issns_years_clean.tsv```
```cat 2020-07-05-issns_years_clean.tsv```

3. Shell Aufgabe Wortnutzungsstatistik

In diesem Fall werden mehrere Wörter in einem Dokument gezählt. Deswegen wird ein Loop erstellt.

Zuerst werden die Wörter definiert, welche in dem Dokument gesucht werden sollen. Diese werden in der Variable ```word``` zusammengefasst. ```"history" "historical" "praehistorische" "historische"``` In der selben Zeile fängt der Loop mit dem Befehl ```for``` an:

```for word in "history" "historical" "praehistorische" "historische"```

Danach kommt der Befehl ```do``` um zu zeigen, welche Aktion begonnen wird, die Wörterzählung ```grep -woi``` (für Groß- und Kleinschreibung). Hier wurde auch die Variabel ```COUNT``` definiert weil sie aus mehreren Schritten (Zählung von Wörtern und Linien sowie Bereinigung der Leerezeilen) besteht: 

```COUNT=$(grep -woi "$word" 2020-05-23-Article_list_dirty.tsv | wc -l | sed 's/^[[:space:]]*//')```

Der letzte Schritt ist die Ergebnisse mit ```echo``` abzurufen und mit dem Befehl ```done``` den Script zu beenden:

```echo "$word:$COUNT"```
```done```

Abschließend wird das Script geprüpft. Das Wort history taucht beispielsweis 142 Mal im Dokument auf.

```$ bash script_wortnutzung.sh```                                                    ```history:142```                                                                     ```historical:28```                                                                   ```praehistorische:2```                                                               ```historische:9```

3.1 Script

```#!bin/bash```
```# In diesem Script wird ein Wortnutzungsstatistik erstellt```

```for word in "history" "historical" "praehistorische" "historische"```
```do```
```COUNT=$(grep -woi "$word" 2020-05-23-Article_list_dirty.tsv | wc -l | sed 's/^[[:space:]]*//')```
```echo "$word:$COUNT"```
```done```


4. Quellen

* Galli, Keith (2018): Complete Python Pandas Data Science Tutorial! (Reading CSV/Excel files, Sorting, Filtering, Groupby) - YouTube. Online verfügbar unter https://www.youtube.com/watch?v=vmEHCJofslg&t=2183s, zuletzt aktualisiert am 05.07.2020.000Z, zuletzt geprüft am 07.05.2020.

* Galli, Keith (2019): Intro to Data Visualization in Python with Matplotlib! (line graph, bar chart, title, labels, size) - YouTube. Online verfügbar unter https://www.youtube.com/watch?v=DAQNHzOcO5A&t=1740s, zuletzt aktualisiert am 05.07.2020.000Z, zuletzt geprüft am 07.05.2020.

* Galli, Keith (2019): Python Plotting Tutorial w/ Matplotlib & Pandas (Line Graph, Histogram, Pie Chart, Box & Whiskers) - YouTube. Online verfügbar unter https://www.youtube.com/watch?v=0P7QnIQDBJY&t=1739s, zuletzt aktualisiert am 05.07.2020.000Z, zuletzt geprüft am 07.05.2020.

* Library Carpentry (2016-2020): Counting and mining with the shell – Library Carpentry: The UNIX Shell. Online verfügbar unter https://librarycarpentry.org/lc-shell/05-counting-mining/index.html, zuletzt aktualisiert am 29.06.2020.000Z, zuletzt geprüft am 07.05.2020.
