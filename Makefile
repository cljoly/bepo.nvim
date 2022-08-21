fnl_files = $(wildcard fnl/*.fnl)
help_file = doc/bepo-nvim.txt
help_file_mapping = bepo-nvim-mapping
out_files = $(fnl_files:fnl/%.fnl=lua/%.lua) $(help_file) $(help_file_mapping)

all: $(out_files)

fmt: $(fnl_files) gen_doc.fnl
	fnlfmt --fix $<

lua/%.lua: fnl/%.fnl lua/
	fennel --raw-errors --compile $< > $@

lua/:
	mkdir -p lua

clean:
	rm -rf lua

doc: $(help_file)

$(help_file): $(help_file_mapping) doc/
	rm $(help_file)
	cat $(help_file_mapping) >>$(help_file)
	rm $(help_file_mapping)

$(help_file_mapping): gen_doc.fnl $(fnl_files)
	fennel --raw-errors --no-compiler-sandbox --metadata --globals '*' gen_doc.fnl > $(help_file_mapping)

doc/:
	mkdir -p doc

.PHONY: clean doc $(help_file_mapping)
