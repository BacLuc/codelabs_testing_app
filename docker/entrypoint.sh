#!/bin/bash
set -e

flutter pub get

Xvfb :99 &
export DISPLAY=:99
exec flutter $@
