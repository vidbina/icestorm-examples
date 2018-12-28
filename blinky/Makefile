# Creates the json file
synth:
	yosys -p 'synth_ice40 -top blinky -json blinky.json' blinky.v

# Creates the asc file
route:
	#arachne-pnr -d 1k -o example.asc -p example.pcf example.blif
	nextpnr-ice40 --hx1k --json blinky.json --pcf blinky.pcf --asc blinky.asc

# Creates the bin file
pack:
	icepack example.asc example.bin

clean:
	rm *.json *.asc *.bin
