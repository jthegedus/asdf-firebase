#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/firebase/firebase-tools"
DOCS_SITE="https://firebase.google.com/docs/cli"
TOOL_NAME="firebase"
TOOL_TEST="firebase --help"
MIN_SUPPORTED_VERSION="1.0.0"
VERSIONS_TO_OMIT="" # pipe-separated list. Eg: "mytest|0.2". grep is used, so partial matches supported.
