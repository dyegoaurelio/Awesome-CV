.PHONY: build

CC = xelatex
EXAMPLES_DIR = examples
EXAMPLES_OUTPUT_DIR = '$(EXAMPLES_DIR)/out'

PT_DIR = pt-br
PT_OUTPUT_DIR = '$(PT_DIR)/out'

build: examples pt-br

examples: example_build example_clean_logs

pt-br: pt-br_build pt-br_clean_logs

clean: example_clean pt-br_clean

example_clean_logs:
	find $(EXAMPLES_OUTPUT_DIR) -type f ! -name '*.pdf' -exec rm -vf {} \;

example_build:
	find $(EXAMPLES_DIR) -maxdepth 1 -type f -name '*.tex' -exec $(CC) -output-directory=$(EXAMPLES_OUTPUT_DIR) {} \;

example_clean:
	rm -vrf $(EXAMPLES_OUTPUT_DIR)/*.pdf

pt-br_clean_logs:
	find $(PT_OUTPUT_DIR) -type f ! -name '*.pdf' -exec rm -vf {} \;

pt-br_build:
	find $(PT_DIR) -maxdepth 1 -type f -name '*.tex' -exec $(CC) -output-directory=$(PT_OUTPUT_DIR) {} \;

pt-br_clean:
	rm -vrf $(PT_OUTPUT_DIR)/*.pdf
