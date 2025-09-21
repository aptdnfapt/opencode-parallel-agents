#!/bin/bash

# Install multi.md command for Open Code parallel agents

set -e

mkdir -p ~/.config/opencode/command
cp command/multi.md ~/.config/opencode/command/
echo "Multi-agent command installed to ~/.config/opencode/command/"