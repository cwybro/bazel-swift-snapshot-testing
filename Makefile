.PHONY setup:
setup:
	./infra/scripts/setup.sh

.PHONY project:
project: setup
	bazelisk run //src/Example:Example_Project && open src/Example/Example_Project.xcodeproj

.PHONY app_tests:
app_tests: setup
	bazelisk test //src/Example:Example_AppTests \
		-t- \
		--test_output=all

.PHONY library_tests:
library_tests: setup
	bazelisk test //src/Example:Example_LibraryTests -t- --test_output=all
