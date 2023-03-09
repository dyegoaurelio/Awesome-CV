.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = /doc/examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
OUTPUT_DIR = '$(EXAMPLES_DIR)/out'

examples: $(foreach x, coverletter cv resume, $x.pdf) clean_logs

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(OUTPUT_DIR) $<

clean_logs:
	find $(OUTPUT_DIR) -type f ! -name '*.pdf' -delete

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
