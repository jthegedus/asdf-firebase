#!/usr/bin/env bash

set +u

# Sourced script runs:
# * set -euo pipefail
# * sets: TOOL_NAME
#
# shellcheck source=lib/envs.bash
. "$(dirname "$BATS_TEST_DIRNAME")"/lib/envs.bash

# Unset ASDF_DIR because it may already be set by the users shell, and some
# tests fail when it is set to something other than the temp dir.
unset ASDF_DIR

setup_asdf_dir() {
	if [ -n "${ASDF_BATS_SPACE_IN_PATH:-}" ]; then
		BASE_DIR="$(mktemp -dt "asdf with spaces.XXXX")"
	else
		BASE_DIR="$(mktemp -dt asdf.XXXX)"
	fi
	HOME="$BASE_DIR/home"
	ASDF_DIR="$HOME/.asdf"
	mkdir -p "$ASDF_DIR/plugins"
	mkdir -p "$ASDF_DIR/installs"
	mkdir -p "$ASDF_DIR/shims"
	mkdir -p "$ASDF_DIR/tmp"
	ASDF_BIN="$(dirname "$BATS_TEST_DIRNAME")/bin"

	# shellcheck disable=SC2031
	PATH="$ASDF_BIN:$ASDF_DIR/shims:$PATH"
}

install_plugin() {
	asdf plugin add "$TOOL_NAME" "$BATS_TEST_DIRNAME/.."
}

clean_asdf_dir() {
	asdf plugin remove "$TOOL_NAME"

	rm -rf "$BASE_DIR"
	unset ASDF_DIR
	unset ASDF_DATA_DIR
}
