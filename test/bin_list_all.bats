#!/usr/bin/env bats

load test_setup

setup() {
	setup_asdf_dir
	install_plugin
}

teardown() {
	clean_asdf_dir
}

@test "asdf list all ${TOOL_NAME}: prints versions from remotes" {
	run asdf list all ${TOOL_NAME}

	[ "$?" -eq 0 ]
	# check min supported versions are present
	[[ "$output" =~ "${MIN_SUPPORTED_VERSION}" ]]
	# ensure no versions prefixed with "v" as it should be stripped from GitHub URLs
	[[ ! "$output" =~ "v${MIN_SUPPORTED_VERSION}" ]]
}
