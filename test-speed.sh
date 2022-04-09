#!/bin/bash

set -e
# Script bricht bei einem Fehler ab

if [ ! -e "output" ]; then
    echo "Erstelle Ordner 'output'."
    mkdir output
fi

if [ ! -e "output/speedtest.csv" ]; then
    echo "Erstelle CSV-Datei mit CSV-Header"
    speedtest-cli --csv-header > output/speedtest.csv
fi

if [ ! -e "output/speedtest-secure.csv" ]; then
    echo "Erstelle CSV-Datei mit CSV-Header"
    speedtest-cli --csv-header --secure > output/speedtest-secure.csv
fi

while true; do
    # später ohne logging
    # speedtest-cli --csv >> speedtest.csv

    # tee speichert in einer Datei und gibt den Inhalt
    # in der Konsole aus.
    # damit der Header nicht verloren geht, nutze ich den
    # Optionsschalter -a, steht für append (anhängen)
    speedtest-cli --csv | tee -a output/speedtest.csv
    # speedtest-cli --csv --secure | tee -a output/speedtest-secure.csv

    # Gleich die Grafik mit gnuplot erzeuten lassen.
    gnuplot < speedtest.gpi > output/speedtest.png

    # Test jede Stunde.
    # sleep 3600
    sleep 900
done
