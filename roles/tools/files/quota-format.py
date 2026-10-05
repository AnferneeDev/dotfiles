import json
import sys

data = json.load(sys.stdin)


def used_percent(value):
    return float(str(value).rstrip("%"))


def short_reset(resets_in):
    return "".join(resets_in.split())


def detail(tag, used, resets_in):
    remaining = max(0.0, min(100.0, 100 - used_percent(used)))
    return f"  {tag:<6}{remaining:4.0f}%  ↻ {short_reset(resets_in)}"


def row(label, five_hour, weekly):
    return "\n".join([label, detail("5h", *five_hour), detail("Week", *weekly)])


def unavailable(label):
    return f"{label}\n  unavailable"


rows = []

claude = data.get("claude", {})
if claude.get("status") == "ok":
    rows.append(row(
        "CLAUDE",
        (claude["five_hour"]["used"], claude["five_hour"]["resets_in"]),
        (claude["seven_day"]["used"], claude["seven_day"]["resets_in"]),
    ))
else:
    rows.append(unavailable("CLAUDE"))

codex = data.get("codex", {})
if codex.get("status") == "ok":
    rows.append(row(
        "CODEX",
        (codex["primary_window"]["used"], codex["primary_window"]["resets_in"]),
        (codex["secondary_window"]["used"], codex["secondary_window"]["resets_in"]),
    ))
else:
    rows.append(unavailable("CODEX"))

agy = data.get("antigravity", {})
if agy.get("status") == "ok":
    for group in agy.get("quota_groups", []):
        buckets = group["buckets"]
        label = "GEMINI" if group["short_name"] == "Gemini" else "GEMINI C/GPT"
        rows.append(row(
            label,
            (buckets["5h"]["used_pct"], buckets["5h"]["resets_in"]),
            (buckets["weekly"]["used_pct"], buckets["weekly"]["resets_in"]),
        ))
else:
    rows.append(unavailable("GEMINI"))

print("\n\n".join(rows))
