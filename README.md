# Bedbank Assistant

The personal assistant for Bedbank Global executives, packaged as a plugin for
the ChatGPT and Claude apps. The plugin only points the app at the company
gateway, `https://agent.bedbankglobal.com`; everything the assistant knows and
can do lives there, behind sign-in.

This repository is generated. Do not edit it by hand: changes are overwritten
on the next publish.

## Sign-in

You sign in with your Bedbank Slack account; the assistant then acts in Slack
as you. Your account must be enrolled first — if the sign-in page says it is
not, ask the administrator.

## ChatGPT

Plugins run in ChatGPT's **Work** tab. Two ways to install:

**A. From this marketplace** — in Terminal:

```sh
curl -fsSL https://raw.githubusercontent.com/bedbankcode/assistant-plugin/main/install.sh | sh
```

Restart ChatGPT → **Plugins** → Bedbank Global → install **Bedbank
Assistant** → Continue with Slack. Then open the **Work** tab, start a chat and
type `@Bedbank Assistant …`.

**B. Directly from the gateway** — Settings → Security and login → turn on
**Developer mode** → **Plugins** → **+** → MCP server URL
`https://agent.bedbankglobal.com/mcp` → create → install → Continue with Slack.

## Claude (Desktop, claude.ai, Cowork)

**A. As a connector** (simplest): **Customize → Connectors → + → Add custom
connector** → URL `https://agent.bedbankglobal.com/mcp` → Add → Continue with
Slack. In a chat, open **+ → Connectors** and switch Bedbank Assistant on.

**B. As a plugin**: download
[`bedbank-assistant.zip`](https://github.com/bedbankcode/assistant-plugin/raw/main/bedbank-assistant.zip),
then **Customize → Plugins → upload a custom plugin** and choose the file.

### Claude Code

```
/plugin marketplace add bedbankcode/assistant-plugin
/plugin install bedbank-assistant@bedbank
```

## Updates

There is nothing to update on your side. Tools and skills come from the
gateway on every connection.
