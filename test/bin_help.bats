#!/usr/bin/env bats

load test_setup

setup() {
	setup_asdf_dir
	install_plugin
}

teardown() {
	clean_asdf_dir
}

@test "asdf help firebase" {
	run asdf help firebase

	[ "$?" -eq 0 ]
	echo "$output"
	[[ "$output" =~ "Manage $TOOL_NAME versions per project. The minimum supported $TOOL_NAME version is $MIN_SUPPORTED_VERSION" ]]
	[[ "$output" =~ "Git Repository:" ]]
	[[ "$output" =~ "$GH_REPO" ]]
	[[ "$output" =~ "Documentation:" ]]
	[[ "$output" =~ "$DOCS_SITE" ]]
}
