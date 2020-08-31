#!/bin/bash

set -euo pipefail

comm -23 <(pacman -Qeq|sort) <(pacman -Qmq|sort) > pkglist