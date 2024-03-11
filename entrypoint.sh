#!/bin/bash

# プロセス内に不備があれば、即中止。
set -e

# 前回起動時のpidデータをリセット。
rm -f /myapp/tmp/pids/server.pid

exec "$@"
