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
	echo "$output"
	[[ "$output" =~ "* ERROR: asdf-${TOOL_NAME} supports release installs only. See \"asdf list all ${TOOL_NAME}\" for a list of supported versions." ]]
}

@test "asdf install ${TOOL_NAME} 7.2.0: expect failure installing version below minimum supported" {
	version_to_install="7.2.0"
	run asdf install ${TOOL_NAME} ${version_to_install}

	[ "$?" -eq 0 ]
	echo "$output"
	[[ "$output" =~ "* ERROR: asdf-${TOOL_NAME} only supports versions \"${MIN_SUPPORTED_VERSION}\" and later." ]]
}

@test "asdf install ${TOOL_NAME} 1000.0.0: errors as version is not in \"asdf list all ${TOOL_NAME}\"" {
	expected="* ERROR: asdf-${TOOL_NAME} version \"1000.0.0\" not supported. \"asdf list all ${TOOL_NAME}\" will list available versions."
	run asdf install ${TOOL_NAME} 1000.0.0

	[ "$?" -eq 0 ]
	echo "$output"
	[[ "$output" = "$expected" ]]
}

@test "asdf install ${TOOL_NAME} ${MIN_SUPPORTED_VERSION}: installs point release" {
	run asdf install ${TOOL_NAME} ${MIN_SUPPORTED_VERSION}

	[ "$?" -eq 0 ]
	echo "$output"
	[[ "$output" =~ "Downloading ${TOOL_NAME}@${MIN_SUPPORTED_VERSION}" ]]
	[[ "$output" =~ "Downloaded to" ]]
	[[ "$output" =~ "Moved to" ]]
	[[ "$output" =~ "Testing if ${TOOL_NAME}@${MIN_SUPPORTED_VERSION} is executable" ]]
	[[ "$output" =~ "Success! ${TOOL_NAME}@${MIN_SUPPORTED_VERSION} is ready for use." ]]
}
