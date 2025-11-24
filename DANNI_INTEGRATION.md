# Danni Integration with subfracOS

## Overview

subfracOS integrates **Danni** - Subfracture's sophisticated AI strategist - as a native ACP (Anthropic Computer Protocol) agent. This brings Danni's strategic intelligence, cultural insight, and Whole of World Design methodology directly into your code editor.

## What is Danni?

Danni is your on-machine AI strategist, designed specifically for creatives, marketers, and designers who work at the intersection of brand, culture, and technology. Unlike generic coding assistants, Danni understands:

- **Strategic Context** - Pattern recognition across industries and disciplines
- **Cultural Intelligence** - Deep understanding of brand, culture, and human behavior
- **Whole of World Design** - Subfracture's proprietary methodology
- **Creative Workflows** - Adapts to how designers and strategists actually work

## Architecture: Why ACP?

**ACP (Anthropic Computer Protocol)** is the standardized protocol for AI agent communication. By integrating Danni via ACP, we get:

✅ **Native Integration** - Danni appears alongside built-in agents (Claude, Gemini)
✅ **Standard Interface** - Uses the same UI/UX as other agents
✅ **Session Management** - Multiple concurrent Danni sessions
✅ **Tool Access** - Danni can use all ACP tools (file operations, terminal, etc.)
✅ **Context Awareness** - Danni sees your project structure and files

## Configuration

Danni is **preconfigured** in subfracOS. When you first launch subfracOS, Danni will be available as an agent option.

### Default Configuration

```json
{
  "agent_servers": {
    "danni": {
      "command": "danni",
      "args": ["acp"],
      "env": {
        "ANTHROPIC_API_KEY": "${ANTHROPIC_API_KEY}"
      }
    }
  }
}
```

### Prerequisites

1. **Danni installed** - The `danni` binary must be in your `$PATH`
2. **Anthropic API key** - Set `ANTHROPIC_API_KEY` environment variable
3. **subfracOS** - Running the latest build

### Installation

**From danni-goose-fork:**
```bash
cd /home/dom/danni-goose-fork
cargo build --release --bin danni
sudo cp target/release/danni /usr/local/bin/
```

**Verify:**
```bash
which danni
danni --version
```

**Set API key:**
```bash
# Add to your shell rc file (.zshrc, .bashrc, etc.)
export ANTHROPIC_API_KEY="your_api_key_here"
```

## Using Danni in subfracOS

### 1. Start an Agent Session

- Open the Agent panel (usually bottom or side panel)
- Click "New Thread" or use keyboard shortcut
- Select **"danni"** from the agent dropdown

### 2. Interact with Danni

Danni understands natural language and context:

**Strategic Queries:**
```
"Help me develop a brand strategy for this project based on the codebase"
"Analyze the cultural patterns in our user research"
"What's the Whole of World Design perspective on this feature?"
```

**Technical + Strategic:**
```
"Review this component architecture from a brand systems perspective"
"How should we structure this API to reflect our brand values?"
"Design token strategy for this React component library"
```

**File Operations:**
```
"Create a brand strategy doc based on these design files"
"Analyze patterns across our marketing content"
"Generate a style guide from existing components"
```

### 3. Multiple Sessions

You can have multiple Danni sessions open simultaneously:
- Brand strategy session
- Content review session
- Technical architecture session

Each maintains its own context and memory.

## What Makes Danni Different

| Generic Assistant | Danni |
|-------------------|-------|
| Code completion | Strategic thinking |
| Generic responses | Cultural intelligence |
| Function-focused | Whole-system design |
| Transactional | Collaborative partner |

## Advanced Usage

### Custom Modes (Coming Soon)

Danni supports session modes for different types of work:
- **Strategy Mode** - Deep strategic analysis
- **Creative Mode** - Cultural and brand work
- **Technical Mode** - Architecture and implementation
- **Research Mode** - Pattern recognition and insights

### Integration with Workflows

Danni can be part of your automated workflows:

```bash
# Use Danni for automated brand review
danni acp < brand-review-prompt.json > review-output.json
```

## Troubleshooting

### Danni doesn't appear in agent list

**Check:**
1. Is `danni` in your PATH? `which danni`
2. Can you run `danni acp` manually?
3. Is `ANTHROPIC_API_KEY` set? `echo $ANTHROPIC_API_KEY`
4. Check subfracOS logs for connection errors

**Fix:**
```bash
# Verify Danni works standalone
danni --version
danni acp  # Should start ACP server (Ctrl+C to exit)

# Check environment
env | grep ANTHROPIC

# Restart subfracOS
pkill subfracos
./target/release/subfracos
```

### Connection errors

Danni uses stdio for ACP communication. If you see connection errors:

```bash
# Check Danni ACP mode works
echo '{"jsonrpc":"2.0","method":"initialize","id":1,"params":{"protocolVersion":"v1"}}' | danni acp
```

Should return initialization response. If not, rebuild Danni.

### Performance issues

Danni runs locally but makes API calls to Anthropic. For faster responses:
- Use faster Claude models (Haiku instead of Sonnet)
- Enable prompt caching in Danni config
- Limit context size for quicker iterations

## Roadmap

### Level 1.5 ✅ COMPLETE
- Native ACP integration
- Preconfigured in subfracOS
- Full agent panel access

### Level 2 (Planned)
- **Danni Context Panel** - Sidebar showing Danni's memory/knowledge
- **Session Templates** - Presets for common workflows
- **Brand Vault Integration** - Access to Obsidian knowledge graphs
- **Multi-Model Support** - Switch between Claude models mid-session

### Level 3 (Future)
- **Deep Integration** - Danni as core subfracOS intelligence
- **Visual Context** - Screenshot analysis and design review
- **Collaborative Sessions** - Multiple users + Danni
- **Learning System** - Danni learns your brand patterns

## Philosophy

Danni isn't just a feature - it's a **thinking partner**. The goal isn't to automate everything, but to elevate the quality of strategic and creative work.

Good work requires:
- Deep understanding of context
- Pattern recognition across domains
- Cultural and human insight
- Strategic thinking beyond tactics

Danni brings these capabilities to your editor, creating a space where intelligence and implementation meet.

---

**Questions?** See [ROADMAP.md](ROADMAP.md) for overall subfracOS development plan.

**Danni Source:** https://github.com/domocarroll/danni-goose-fork
**subfracOS:** https://github.com/domocarroll/subfracOS
**Subfracture:** https://subfracture.studio
