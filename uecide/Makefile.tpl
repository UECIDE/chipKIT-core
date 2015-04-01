# The parts of the makefile that change with sketch follow:
PROJ_NAME=${sketch:name}
UECIDE_INSTALLATION="${uecide:jar}"
BOARD_NAME=${board:name}

# The rest of the makefile does not need to change

# Command to recreated both .hex and .elf
COMMAND=java -jar $(UECIDE_INSTALLATION) --force-save-hex --force-local-build --board=$(BOARD_NAME) --compile --headless --programmer=pickit2 .

# target (make production)
production: build/$(PROJ_NAME).hex

# target (make debug)
debug: build/$(PROJ_NAME).elf

# target (make clean)
clean:
	@rm -r build


build/$(PROJ_NAME).hex: $(PROJ_NAME).ino
	$(COMMAND)

build/$(PROJ_NAME).elf: $(PROJ_NAME).ino
	$(COMMAND)
