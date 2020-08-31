#!/bin/bash

set -euo pipefail

pacman -S --needed $(diff <(cat badpkglist|sort) <(diff <(cat badpkglist|sort) <(pacman -Slq|sort)|grep \<|cut -f2 -d' ')|grep \<|cut -f2 -d' ')