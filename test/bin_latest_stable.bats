#!/usr/bin/env bats

load test_setup

setup() {
	setup_asdf_dir
	install_plugin
}

teardown() {
	clean_asdf_dir
}

@test "asdf latest ${TOOL_NAME}: prints correct version from remote" {
	expected=$(curl -sI "$GH_REPO/releases/latest" |
		sed -n -e "s|^location: $GH_REPO/releases/tag/||p" |
		sed -n -e "s|\r||p" |
		sed 's|^v||')

	run asdf latest ${TOOL_NAME}

	[ "$?" -eq 0 ]
	[[ "$output" = "$expected" ]]
}
