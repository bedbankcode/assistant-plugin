# Bedbank Assistant

The personal assistant for Bedbank Global executives, packaged as a plugin for
the ChatGPT and Claude apps. The plugin only points the app at the company
gateway, `https://agent.bedbankglobal.com`; everything the assistant knows and
can do lives there, behind sign-in.

This repository is generated. Do not edit it by hand: changes are overwritten
on the next publish.

## What else you need in your app

The assistant uses tools that live in your own ChatGPT or Claude, not on
the gateway. Install these once; the assistant checks for them and tells
you what is missing:

| Companion | Unlocks | ChatGPT | Claude Desktop |
| --- | --- | --- | --- |
| **Email** — Outlook or Gmail, your choice | inbox triage, drafting and sending email | Settings → Connectors → Outlook Email or Gmail, then enable in the chat (+ → Connectors) | Customize → Connectors → Microsoft 365 (Outlook) or Gmail, then switch on in the chat |
| **Calendar** — Outlook or Google, your choice | today's meetings, meeting prep, booking meetings | Settings → Connectors → Outlook Calendar or Google Calendar | Customize → Connectors → Microsoft 365 or Google Calendar |
| **Web search** | news, competitor rates, weather, registries | built in — enable "Search the web" for the chat | built in — Settings → Features → Web search |
| **Google Maps** | travel times, addresses, where the cars are | Settings → Apps → Google Maps (or web search) | Customize → Connectors → Google Maps |

The assistant remembers you between conversations — your preferences, what
you asked for, what is still open — so you never have to repeat yourself.
Say "forget that" and it does.

## Make it your default in ChatGPT

Five settings turn the assistant from something you @-mention into the first
thing ChatGPT reaches for.

1. **Custom instructions** (Settings → Personalization → Custom instructions).
   They apply to every chat. Under *What would you like ChatGPT to know
   about you*, paste and adjust:

   > Ben [ad soyad], Bedbank Global [unvan]. Şirketle ilgili her konuda
   > (rezervasyonlar, nakit, alacaklar, ödemeler, Slack, görevler, tedarikçiler,
   > müşteriler, raporlar) önce Bedbank Assistant eklentisini kullan: sohbetin
   > başında get_my_context çağır, döndürdüğü persona ve talimatlara uy; şirket
   > verisi için kendi bilgin yerine eklentinin araçlarını kullan ve sayıları
   > oradan al. Rutin bir istek için önce list_skills ile uygun beceriyi bul ve
   > onu izle. Bana "[Ad] Bey/Hanım" diye, "siz" ile hitap et. Kısa cevap ver;
   > ayrıntıyı istediğimde ver. Bir şeyi değiştirmeden (mesaj, görev, dosya)
   > önce tek satırla onay al.

   In English:

   > I am [name], [title] at Bedbank Global. For anything about the company
   > (bookings, cash, receivables, payables, Slack, tasks, suppliers, customers,
   > reports) use the Bedbank Assistant plugin first: call get_my_context at
   > the start of the conversation and follow the persona and instructions it
   > returns; take company numbers from its tools, never from your own
   > knowledge. For a routine request, find the matching skill with
   > list_skills and follow it. Address me formally. Answer briefly; give
   > detail when I ask. Confirm in one line before changing anything.

   Under *How would you like ChatGPT to respond*: "Follow the Bedbank
   Assistant persona: warm, professional, direct; bold labels and short
   bullets; no emoji."

2. **Plugin permissions** (Settings → Plugins → Bedbank Assistant): choose
   *Allow low-risk actions*. Reports then run without a confirmation each
   time; anything that changes something still asks.

3. **A "Bedbank" project**, pinned. Put the same instructions in the
   project's instructions (there is room for the full persona there),
   enable the plugin for the project, and work inside it. Project memory
   carries context across every chat in it.

4. **Scheduled tasks** in that project: "Every weekday at 07:30, run the
   morning-briefing skill from Bedbank Assistant" and "Every Monday at
   08:00, the weekly-business-review". The briefing then arrives by
   notification before you ask.

5. **Say it once**: in any chat, "Always use Bedbank Assistant for company
   questions." ChatGPT keeps it as a memory and reinforces the instruction.

Workspace admins on Business or Enterprise can enable the plugin for
everyone under Workspace settings → Apps, with role access and action
confirmation set centrally.

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
