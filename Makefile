# Makefile for modern-deedy resume

# --- Variables ---
SRC_DIR = src
BUILD_DIR = build
RESUME_NAME = resume

# --- Commands ---
LATEX_COMPILER = xelatex
BIBTEX_COMPILER = bibtex

# --- Files ---
TEX_FILE = $(SRC_DIR)/$(RESUME_NAME).tex
PDF_FILE = $(BUILD_DIR)/$(RESUME_NAME).pdf
AUX_FILE = $(BUILD_DIR)/$(RESUME_NAME).aux

# --- Targets ---
.PHONY: all clean

all: $(PDF_FILE)

$(PDF_FILE): $(TEX_FILE)
	@mkdir -p $(BUILD_DIR)
	@cp -r $(SRC_DIR)/* $(BUILD_DIR)/
	cd $(BUILD_DIR) && $(LATEX_COMPILER) -interaction=nonstopmode $(RESUME_NAME).tex

clean:
	@rm -rf $(BUILD_DIR)
	@rm -f *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz missfont.log
	@rm -rf Tmp .texpadtmp

# --- Help ---
help:
	@echo "Usage: make [target]"
	@echo "Targets:"
	@echo "  all       - Compile the resume to PDF (default)"
	@echo "  clean     - Remove all generated files"
	@echo "  help      - Show this help message"