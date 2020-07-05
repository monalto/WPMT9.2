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
Zuerst wurde die Datei 2020-05-23-Article_list_dirty angeschaut und die Spalten identifiziert, die gezogen werden müssen. Die waren die Nummer 5 und Nummer 12. Diese Spalten wurden in eine Datei gespeichert.

Danach wurden die Zeilen, die keine issn Nummer hatten enfernt mit dem Befehl grep-v 'eng'

Anschließend werden die Leerstellen, die Wörter ISSN, issn und Issn entfernt um die Daten gleichmäßig und ohne Unterbrechungen zu haben. Dafür kommt der Befehl sed im Einsatz mit unterschiedlichen 
