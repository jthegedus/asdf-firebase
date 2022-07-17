#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/firebase/firebase-tools"
DOCS_SITE="https://firebase.google.com/docs/cli"
TOOL_NAME="firebase"
TOOL_TEST="firebase --help"
MIN_SUPPORTED_VERSION="7.3.0"                    # First Firebase CLI version that shipped pre-compiled binaries.
VERSIONS_TO_OMIT="^[1-6]\\..*$|^7\\.[0-2]\\..*$" # Omit versions before MIN_SUPPORTED_VERSION from list-all output.
