COMPONENTS = $(shell find src/component -maxdepth 1 -type f -name '*.tex')
TEMPLATES  = $(shell find src/template -maxdepth 1 -type f -name '*.tex')

.PHONY: all clean

all: $(TEMPLATES:src/template/%.tex=build/%.tex)

# Rebuid every template once any component file changes.
build/%.tex: src/template/%.tex build $(COMPONENTS)
	scripts/build-tmpl $< $@

build:
	@mkdir -p $@

clean:
	@rm -rf build
