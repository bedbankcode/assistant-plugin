#!/bin/sh
# Registers the Bedbank Global plugin marketplace with the ChatGPT desktop app
# on this Mac. Run once, then restart ChatGPT and install "Bedbank Assistant"
# from the Plugins tab. Sign in with your Bedbank Slack account.
set -eu

file="$HOME/.agents/plugins/marketplace.json"
repo="https://github.com/bedbankcode/assistant-plugin.git"

if [ -f "$file" ]; then
  if grep -q "$repo" "$file"; then
    echo "Already registered: $file"
    exit 0
  fi
  # Another marketplace is registered: add our plugin to its list.
  if command -v python3 >/dev/null 2>&1; then
    cp "$file" "$file.bak"
    REPO="$repo" python3 - "$file" <<'PY'
import json, os, sys
path = sys.argv[1]
with open(path, encoding="utf-8") as f:
    data = json.load(f)
plugins = data.setdefault("plugins", [])
plugins.append({
    "name": "bedbank-assistant",
    "source": {"source": "git-subdir", "url": os.environ["REPO"], "path": "./plugins/bedbank-assistant", "ref": "main"},
    "policy": {"installation": "AVAILABLE", "authentication": "ON_INSTALL"},
    "category": "Productivity",
})
with open(path, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=2, ensure_ascii=False)
    f.write("\n")
PY
    echo "Added Bedbank Assistant to the existing marketplace at $file (backup in $file.bak)."
    echo "Restart ChatGPT, open Plugins, install Bedbank Assistant, and sign in with your Slack account."
    exit 0
  fi
  echo "A personal marketplace already exists at $file and python3 is not available to merge into it." >&2
  echo "Add this entry to its \"plugins\" list, then restart ChatGPT:" >&2
  cat >&2 <<EOF
{
  "name": "bedbank-assistant",
  "source": { "source": "git-subdir", "url": "$repo", "path": "./plugins/bedbank-assistant", "ref": "main" },
  "policy": { "installation": "AVAILABLE", "authentication": "ON_INSTALL" },
  "category": "Productivity"
}
EOF
  exit 1
fi

mkdir -p "$(dirname "$file")"
cat >"$file" <<EOF
{
  "name": "bedbank",
  "interface": { "displayName": "Bedbank Global" },
  "plugins": [
    {
      "name": "bedbank-assistant",
      "source": {
        "source": "git-subdir",
        "url": "$repo",
        "path": "./plugins/bedbank-assistant",
        "ref": "main"
      },
      "policy": { "installation": "AVAILABLE", "authentication": "ON_INSTALL" },
      "category": "Productivity"
    }
  ]
}
EOF
echo "Registered the Bedbank Global marketplace in $file."
echo "Restart ChatGPT, open Plugins, install Bedbank Assistant, and sign in with your Slack account."
echo "Then connect the companions the assistant uses: your email and calendar (Outlook or Google, Settings > Connectors),"
echo "web search (Tools > Search the web), and Google Maps (Settings > Apps). The assistant will remind you if one is missing."
