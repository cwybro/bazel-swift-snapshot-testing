.PHONY setup:
setup:
	./infra/scripts/setup.sh && \
	./infra/scripts/generate-bazelrc.sh

.PHONY project:
project: setup
	bazelisk run //src/Example:Example_Project && open src/Example/Example_Project.xcodeproj
