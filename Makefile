.PHONY: repo final

repo:
	@if [ -z "$(url)" ] || [ -z "$(dir)" ]; then \
		echo "Usage: make repo url=<url> dir=<directory>"; \
		exit 1; \
	fi
	@echo "Cloning $(url) into $(dir)..."
	@git clone $(url) $(dir)
	@echo "	@git clone $(url) $(dir)" >> Makefile
	@echo "Appended git command to Makefile final target"

backup: 
	@echo "Backing up repositories..."
	@git add .gitignore Makefile
	@git commit -m "Backup: $$(date '+%Y-%m-%d %H:%M:%S')"
	@git push


hydrate:
	@echo "Hydrating repositories..."	@git clone https://github.com/jordanbecketmoore/planning-repo.git jm/pr
