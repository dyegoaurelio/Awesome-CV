.PHONY: build

CC = xelatex
EN_DIR = en-us
EN_OUTPUT_DIR = '$(EN_DIR)/out'

PT_DIR = pt-br
PT_OUTPUT_DIR = '$(PT_DIR)/out'

build: en-us pt-br

en-us: en-us_build en-us_clean_logs

pt-br: pt-br_build pt-br_clean_logs

clean: en-us_clean pt-br_clean

en-us_clean_logs:
	find $(EN_OUTPUT_DIR) -type f ! -name '*.pdf' -exec rm -vf {} \;

en-us_build:
	find $(EN_DIR) -maxdepth 1 -type f -name '*.tex' -exec $(CC) -output-directory=$(EN_OUTPUT_DIR) {} \;

en-us_clean:
	rm -vrf $(EN_OUTPUT_DIR)/*.pdf

pt-br_clean_logs:
	find $(PT_OUTPUT_DIR) -type f ! -name '*.pdf' -exec rm -vf {} \;

pt-br_build:
	find $(PT_DIR) -maxdepth 1 -type f -name '*.tex' -exec $(CC) -output-directory=$(PT_OUTPUT_DIR) {} \;

pt-br_clean:
	rm -vrf $(PT_OUTPUT_DIR)/*.pdf
