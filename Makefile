fnl_files = $(wildcard fnl/*.fnl)
out_files = $(fnl_files:fnl/%.fnl=lua/%.lua)

all: $(out_files)

fmt: $(fnl_files)
	fnlfmt --fix $<

lua/%.lua: fnl/%.fnl lua/
	fennel --raw-errors --compile $< > $@

lua/:
	mkdir -p lua

clean:
	rm -rf lua

.PHONY: clean compile
