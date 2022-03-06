#!/bin/bash

set -e
# Script bricht bei einem Fehler ab

if [ ! -e "speedtest.csv" ]; then
    echo "Erstelle CSV-Datei mit CSV-Header"
    speedtest-cli --csv-header > speedtest.csv
fi

if [ ! -e "speedtest-secure.csv" ]; then
    echo "Erstelle CSV-Datei mit CSV-Header"
    speedtest-cli --csv-header --secure > speedtest-secure.csv
fi

while true; do
    # später ohne logging
    # speedtest-cli --csv >> speedtest.csv

    # tee speichert in einer Datei und gibt den Inhalt
    # in der Konsole aus.
    # damit der Header nicht verloren geht, nutze ich den
    # Optionsschalter -a, steht für append (anhängen)
    speedtest-cli --csv | tee -a speedtest.csv
    speedtest-cli --csv --secure | tee -a speedtest-secure.csv

    # Test jede Stunde.
    sleep 3600
done
