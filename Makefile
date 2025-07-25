# Makefile for modern-deedy resume

# --- Variables ---
SRC_DIR = src
BUILD_DIR = build
RESUME_NAME = resume

# --- Commands ---
LATEX_COMPILER = xelatex

# --- Files ---
TEX_SOURCES = $(wildcard $(SRC_DIR)/*.tex) $(wildcard $(SRC_DIR)/*.cls) $(wildcard $(SRC_DIR)/*.sty)
FONT_SOURCES = $(wildcard $(SRC_DIR)/fonts/**/*)
SOURCES = $(TEX_SOURCES) $(FONT_SOURCES)

PDF_FILE = $(BUILD_DIR)/$(RESUME_NAME).pdf

# --- Targets ---
.PHONY: all clean help

all: $(PDF_FILE)

$(PDF_FILE): $(SOURCES)
	@mkdir -p $(BUILD_DIR)
	cd $(SRC_DIR) && $(LATEX_COMPILER) -output-directory=../$(BUILD_DIR) -interaction=nonstopmode $(RESUME_NAME).tex

clean:
	@rm -rf $(BUILD_DIR)
	@rm -f *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz missfont.log
	@rm -rf Tmp .texpadtmp

help:
	@echo "Usage: make [target]"
	@echo "Targets:"
	@echo "  all       - Compile the resume to PDF (default)"
	@echo "  clean     - Remove all generated files"
	@echo "  help      - Show this help message"
