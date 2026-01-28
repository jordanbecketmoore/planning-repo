.PHONY: repo final

repo:
	@if [ -z "$(url)" ] || [ -z "$(dir)" ]; then \
		echo "Usage: make repo url=<url> dir=<directory>"; \
		exit 1; \
	fi
	@echo "Cloning $(url) into $(dir)..."
	@git clone $(url) $(dir)
	@echo "$(dir)" >> .gitignore
	@echo "	@git clone $(url) $(dir)" >> Makefile
	@echo "Appended git command to Makefile final target"

hydrate:
