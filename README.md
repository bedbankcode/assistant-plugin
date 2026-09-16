# Bedbank Assistant

The personal assistant for Bedbank Global executives, packaged as a plugin for
the ChatGPT and Claude apps. The plugin only points the app at the company
gateway, `https://agent.bedbankglobal.com`; everything the assistant knows and
can do lives there, behind sign-in.

This repository is generated. Do not edit it by hand: changes are overwritten
on the next publish.

## Install

You need an access key. It is handed to you in person; the app asks for it
once, at sign-in.

### ChatGPT (desktop)

1. In Terminal, run:

   ```sh
   curl -fsSL https://raw.githubusercontent.com/bedbankcode/assistant-plugin/main/install.sh | sh
   ```

   It writes one file, `~/.agents/plugins/marketplace.json`, that tells
   ChatGPT where the plugin is.
2. Restart ChatGPT, open **Plugins**, find **Bedbank Assistant** under
   Bedbank Global and install it.
3. When asked to sign in, paste your access key.
4. Start a new chat.

### Claude Desktop

Settings → Connectors → Add custom connector → URL
`https://agent.bedbankglobal.com/mcp`. Sign in with your access key when
prompted.

### Claude Code

```
/plugin marketplace add bedbankcode/assistant-plugin
/plugin install bedbank-assistant@bedbank
```

## Updates

There is nothing to update on your side. Tools and skills come from the
gateway on every connection.
