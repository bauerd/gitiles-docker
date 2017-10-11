#!/usr/bin/env bash
set -e
set -o errexit
set -o pipefail
set -o nounset

export CANONICAL_HOST_NAME=${CANONICAL_HOST_NAME:-$'gitiles'}
export BASE_GIT_URL=${BASE_GIT_URL:-$'ssh://gitiles:29418/'}
export SITE_TITLE=${SITE_TITLE:-$'gitiles'}

test $CANONICAL_HOST_NAME
test $BASE_GIT_URL
test $SITE_TITLE

/usr/local/bin/confd -onetime -backend env

cd /var/repos
exec /usr/src/app/bazel-bin/java/com/google/gitiles/dev/dev \
  --jvm_flag=-Dcom.google.gitiles.sourcePath=/usr/src/app \
  --jvm_flag=-Dcom.google.gitiles.configPath=/usr/src/app/gitiles.config
