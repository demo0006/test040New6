#!/usr/bin/env sh
set -eu

if [ -z "${JAVA_HOME:-}" ] && [ -d "/c/tools/java/jdk-26.0.1" ]; then
	JAVA_HOME="/c/tools/java/jdk-26.0.1"
	export JAVA_HOME
fi

if [ -n "${JAVA_HOME:-}" ]; then
	PATH="$JAVA_HOME/bin:$PATH"
	export PATH
fi

if command -v mvn >/dev/null 2>&1; then
	MAVEN_BIN="$(command -v mvn)"
elif [ -x "/c/tools/apache-maven-3.9.9/bin/mvn" ]; then
	MAVEN_BIN="/c/tools/apache-maven-3.9.9/bin/mvn"
else
	echo "Unable to find Maven. Install it or add mvn to PATH." >&2
	exit 127
fi

"$MAVEN_BIN" package