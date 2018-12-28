# Creates the blif file
synth:
	yosys -p 'synth_ice40 -top top -blif example.blif' example.v

# Creates the asc file
route:
	arachne-pnr -d 1k -o example.asc -p example.pcf example.blif

# Creates the bin file
pack:
	icepack example.asc example.bin

clean:
	rm *.blif *.asc *.bin
