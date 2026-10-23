#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
edition="${1:-}"
case "$edition" in
  baseline-enhanced) product=ResearchBaselineEnhanced ;;
  pip) product=PipResearch ;;
  pip-enhanced) product=PipResearchEnhanced ;;
  *) echo 'Usage: scripts/build.sh [baseline-enhanced|pip|pip-enhanced]' >&2; exit 2 ;;
esac
swift build -c release --product "$product" --jobs 2
./scripts/package.sh "$edition" ".build/release/$product"
