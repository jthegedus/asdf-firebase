#!/usr/bin/env bats

load test_setup

setup() {
	setup_asdf_dir
	install_plugin
}

teardown() {
	clean_asdf_dir
}

@test "asdf install ${TOOL_NAME} ref:asdfasd: expect failure installing specific ref" {
	run asdf install ${TOOL_NAME} ref:asdfasd

	[ "$?" -eq 0 ]
	[[ "$output" =~ "* ERROR: asdf-${TOOL_NAME} supports release installs only. See \"asdf list all ${TOOL_NAME}\" for a list of supported versions." ]]
}

@test "asdf install ${TOOL_NAME} 7.2.0: expect failure installing version below minimum supported" {
	version_to_install="7.2.0"
	expected="* ERROR: asdf-${TOOL_NAME} version \"${version_to_install}\" not supported. \"asdf list all ${TOOL_NAME}\" will list available versions."
	run asdf install ${TOOL_NAME} ${version_to_install}

	[ "$?" -eq 0 ]
	[[ "$output" = "$expected" ]]
}

@test "asdf install ${TOOL_NAME} 1000.0.0: errors as version is not in \"asdf list all ${TOOL_NAME}\"" {
	version_to_install="1000.0.0"
	expected="* ERROR: asdf-${TOOL_NAME} version \"${version_to_install}\" not supported. \"asdf list all ${TOOL_NAME}\" will list available versions."
	run asdf install ${TOOL_NAME} ${version_to_install}

	[ "$?" -eq 0 ]
	[[ "$output" = "$expected" ]]
}

@test "asdf install ${TOOL_NAME} ${MIN_SUPPORTED_VERSION}: installs point release" {
	run asdf install ${TOOL_NAME} ${MIN_SUPPORTED_VERSION}

	[ "$?" -eq 0 ]
	[[ "$output" =~ "Downloading ${TOOL_NAME}@${MIN_SUPPORTED_VERSION}" ]]
	[[ "$output" =~ "Downloaded to" ]]
	[[ "$output" =~ "Moved to" ]]
	[[ "$output" =~ "Testing if ${TOOL_NAME}@${MIN_SUPPORTED_VERSION} is executable" ]]
	[[ "$output" =~ "Success! ${TOOL_NAME}@${MIN_SUPPORTED_VERSION} is ready for use." ]]
}

@test "asdf install ${TOOL_NAME} latest: installs latest release" {
	run asdf latest firebase
	latest_version="$output"

	run asdf install ${TOOL_NAME} latest

	[ "$?" -eq 0 ]
	[[ "$output" =~ "Downloading ${TOOL_NAME}@${latest_version}" ]]
	[[ "$output" =~ "Downloaded to" ]]
	[[ "$output" =~ "Moved to" ]]
	[[ "$output" =~ "Testing if ${TOOL_NAME}@${latest_version} is executable" ]]
	[[ "$output" =~ "Success! ${TOOL_NAME}@${latest_version} is ready for use." ]]
}
