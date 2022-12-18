.PHONY setup:
setup:
	./infra/scripts/setup.sh && \
	./infra/scripts/generate-bazelrc.sh

.PHONY project:
project: setup
	bazelisk run //src:Example_Project && open src/Example_Project.xcodeproj
