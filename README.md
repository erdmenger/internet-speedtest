## Testing Internet Connection speed with speedtest-cli

This project provides guidance and minimal scripts to measure and document the internet upload and download speed.
Starting point of the project was a series of issues I had to open with my internet provider as the reliability of my internet connections dropped during times of COVID-19 and home office.

For this project simplicity, ease of setup, maintenance and use are key goals. For that reason only standard components are selected which should be installable on most Linux systems from x86 to RaspberryPI.

### Installing 'speedtest-cli'

Using the python packet manager for the latest version:
`pip install speedtest-cli`

or using your distributions packet manager. e.g. apt-get

`sudo apt install speedtest-cli`

see also: https://github.com/sivel/speedtest-cli

### Using the speedtest-cli

### Automating speedtest

Using a simple shell script 'test-speed.sh'

### Visualizing the results

Using gnuplot with
'gnuplot < speedtest.gpi > speedtest.png'

