# Testing Internet Connection speed with speedtest-cli

This project provides guidance and minimal scripts to measure and document the internet upload and download speed.
Starting point of the project was a series of issues I had to open with my internet provider as the reliability of my internet connections dropped during times of COVID-19 and home office.

For this project simplicity, ease of setup, maintenance and use are key goals. For that reason only standard components are selected which should be installable on most Linux systems from x86 to RaspberryPI.

## TLTR: Testing and documenting your internet speed
- Clone this repository to some Linux maschine
- Install 'speedtest-cli', see below for details
- Start the script `test-speed.sh` and let it run for a few minutes
   or if you run it on a server you might want to run it background `nohp test-speed.sh &`
- Look at `output/speedtest.png` for a nice chart


## Setting up the environment and understanding how it works

### Installing 'speedtest-cli'

Using the python packet manager for the latest version:
`pip install speedtest-cli`

or using your distributions packet manager. e.g. apt-get

`sudo apt install speedtest-cli`

see also: https://github.com/sivel/speedtest-cli

### Using the speedtest-cli
If you like to use speedtest-cli yourself have a look at the invokations in 'test-speed.sh' or visit the speedtest-cli pages.

### Automating speedtest

Using a simple shell script. see `test-speed.sh`
- Start the script `test-speed.sh` and let it run for a few minutes
   or if you run it on a server you might want to run it background `nohp test-speed.sh &`
- The script will produce two CSV files in the 'output' folder: 'speedtest.csv' and 'speedtest-secure.csv'.

### Visualizing the results

Using gnuplot it is very simple to create nice looking chart from different data sources such as CSV files.
`gnuplot < speedtest.gpi > output/speedtest.png`

- The chart 'output/speedtest.png' is also produced by the same shell script using the data from 'speedtest.csv'. It is updated after every run.

