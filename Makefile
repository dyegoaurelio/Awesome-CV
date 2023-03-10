.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
EXAMPLES_OUTPUT_DIR = '$(EXAMPLES_DIR)/out'

examples: example_build example_clean_logs

example_clean_logs:
	find $(EXAMPLES_OUTPUT_DIR) -type f ! -name '*.pdf' -exec rm -vf {} \;

example_build:
	find $(EXAMPLES_DIR) -maxdepth 1 -type f -name '*.tex' -exec $(CC) -output-directory=$(EXAMPLES_OUTPUT_DIR) {} \;

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
