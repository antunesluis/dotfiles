#!/usr/bin/env bash
# Claude Code status line: context window usage in the pane footer.
#
# Wired up through the "statusLine" key in settings.json. Claude Code runs this
# on each session event and pipes session JSON on stdin; whatever it prints
# becomes the bar at the bottom of the pane.
#
# Output: Context: 122k / 1M (12%)
#
# Field reference: https://code.claude.com/docs/en/statusline
set -uo pipefail

input=$(cat)

# total_input_tokens already includes cache reads and writes. Output tokens sit
# in the window too, so both are summed.
#
# context_window.used_percentage would give a ready-made percentage, but it is
# derived from Claude Code's own accounting and can drift from the two numbers
# printed here. The percentage is recomputed from the same values instead, so
# the line always adds up for anyone checking the arithmetic.
if command -v jq >/dev/null 2>&1; then
    read -r used size < <(
        printf '%s' "$input" | jq -r '
            [ ((.context_window.total_input_tokens // 0)
               + (.context_window.total_output_tokens // 0)),
              (.context_window.context_window_size // 200000)
            ] | @tsv' 2>/dev/null
    )
fi

# Any parse failure degrades to a quiet, still-valid line rather than noise.
[[ ${used-} =~ ^[0-9]+$ ]] || used=0
[[ ${size-} =~ ^[0-9]+$ ]] || size=0

# 121528 -> 122k, 1000000 -> 1M. Rounds to nearest rather than truncating.
human() {
    local n=$1
    if ((n >= 1000000)); then
        printf '%dM' $(((n + 500000) / 1000000))
    elif ((n >= 1000)); then
        printf '%dk' $(((n + 500) / 1000))
    else
        printf '%d' "$n"
    fi
}

if ((size > 0)); then
    printf 'Context: %s / %s (%d%%)\n' \
        "$(human "$used")" "$(human "$size")" $((used * 100 / size))
else
    printf 'Context: unavailable\n'
fi
