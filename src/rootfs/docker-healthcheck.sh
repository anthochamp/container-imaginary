#!/usr/bin/env sh
set -eu

exec nc -z localhost "$IMAGINARY_PORT"
