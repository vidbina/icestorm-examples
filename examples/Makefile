synth:
	yosys -p 'synth_ice40 -top top -blif example.blif' example.v

route:
	arachne-pnr -d 1k -o example.asc -p example.pcf example.blif

pack:
	icepack example.asc example.bin
