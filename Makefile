# A ChatGPT generated Makefile.
# Prompt: 
#   Write a makefile that performs the following operations:
#   1. checks if curl is installed, if yes, uses curl to download the tar at this url: https://www.haskell.org/hugs/downloads/2006-09/hugs98-plus-Sep2006.tar.gz . 
#   2. If curl is not installed, check if wget is installed, if yes use wget to download the tar at the url from step 1.
#   3. The makefile should check if the tar was successfully downloaded, if yes it should untar the file
#   4. The makefile should include a command to change directory into the folder from the untar command and run `make`

.PHONY: all

all: download untar

download:
	@if command -v curl >/dev/null; then \
		curl -o hugs.tar.gz https://www.haskell.org/hugs/downloads/2006-09/hugs98-plus-Sep2006.tar.gz; \
	elif command -v wget >/dev/null; then \
		wget -O hugs.tar.gz https://www.haskell.org/hugs/downloads/2006-09/hugs98-plus-Sep2006.tar.gz; \
	else \
		echo "Error: Neither curl nor wget found. Please install either of them."; \
		exit 1; \
	fi

untar: download
	@if [ -f hugs.tar.gz ]; then \
		tar -xzf hugs.tar.gz; \
	else \
		echo "Error: Tar file not found."; \
		exit 1; \
	fi

clean:
	@rm -rf hugs98-plus-Sep2006 hugs.tar.gz
