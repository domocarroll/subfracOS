# subfracOS

> **A Zed fork optimized for intelligence-first workflows**

subfracOS is Subfracture's customized fork of the Zed code editor, designed for teams working at the intersection of AI, brand strategy, and implementation.

## Philosophy

While Zed is built for speed and collaboration, subfracOS is built for **context and intelligence**. We've customized the editor to understand that code isn't written in isolation—it's part of brand systems, knowledge graphs, agent orchestrations, and strategic implementations.

## Current Status: Level 1.5 (Configuration + Danni Integration)

**What's Different:**
- Complete branding as subfracOS
- **Danni AI Strategist** integrated via native ACP support
- Docker MCP Gateway preconfigured (single entry point for all MCP servers)
- Subfracture-optimized defaults (formatting, themes, AI settings)
- Custom subfracos dark theme
- Default Claude Sonnet 4 integration

**What's The Same:**
- Full Zed functionality and performance
- Compatible with all Zed extensions
- Regular updates from upstream Zed possible

## Installation

### Prerequisites
- Rust toolchain (latest stable)
- Docker (for MCP Gateway)
- GitHub token (for MCP features)
- Danni binary (for AI strategist integration) - see [DANNI_INTEGRATION.md](DANNI_INTEGRATION.md)
- Claude CLI authenticated (`claude auth` - for Danni)

### Build from Source

```bash
# Clone the repository
cd subfracOS

# Build release version
cargo build --release

# Binary will be at: target/release/subfracos
```

### First Launch Setup

1. Set environment variable:
   ```bash
   export GITHUB_TOKEN=your_token_here
   ```

2. Install and authenticate Danni (optional but recommended):
   ```bash
   # Build from source
   cd /path/to/danni-goose-fork
   cargo build --release --bin danni
   sudo cp target/release/danni /usr/local/bin/

   # Authenticate Claude CLI (Danni uses this)
   claude auth
   ```

3. Launch subfracOS:
   ```bash
   ./target/release/subfracos
   ```

4. Access Danni via the Agent panel - select "danni" from agent dropdown

## Roadmap

### ✅ Level 1: Configuration Layer (COMPLETE)
- Custom branding and themes
- Docker MCP Gateway integration
- Subfracture-optimized defaults
- ~4 hours of work, zero maintenance burden

### ✅ Level 1.5: Danni Integration (COMPLETE)
- **Danni as native ACP agent** - Full integration via Anthropic Computer Protocol
- Strategic AI partner directly in your editor
- Access to Danni's cultural intelligence and Whole of World Design methodology
- See [DANNI_INTEGRATION.md](DANNI_INTEGRATION.md) for details

### 📋 Level 2: Extension-First (PLANNED)
Build Zed extensions for Subfracture-specific workflows:
- **Danni Context Panel** - Sidebar showing Danni's memory/knowledge state
- **Vault Navigator** - Quick access to Obsidian knowledge vaults
- **Brand Token Inspector** - View design tokens inline with code
- **MCP Orchestrator** - Visual tool for chaining MCP operations
- **Project Intelligence** - Auto-detect project type, suggest workflows

**Timeline:** Build extensions as needed, test in real projects
**Complexity:** Medium - uses Zed's extension API, minimal maintenance

### 🔮 Level 3: Fork with Purpose (FUTURE - IF FUNDED)
Core changes that can't be done via extensions:
- Deep MCP integration into core
- Custom UI paradigms
- True editor differentiation

**Requirement:** Raise funding for dedicated development
**Complexity:** High - requires maintaining parallel codebase

## Philosophy: Minimum Viable Differentiation

We only build what we actually need. Every feature must pass the test:

> **"Would I choose this over stock Zed tomorrow morning?"**

Not "what could it be"—what would make us *actually use it*.

## For Internal Use → Future Product

Currently built for Subfracture's internal workflows. If it serves our needs well enough, it could become a product for teams working similarly:
- Agencies blending brand + tech
- AI-native development shops
- Studios doing culture + product work
- Teams managing deep domain knowledge alongside code

## Contributing

This is currently an internal Subfracture project. If you're on the team:

1. Use subfracOS for real projects
2. Document friction points
3. Suggest extensions (not core changes unless truly necessary)
4. Help prioritize Level 2 features based on actual need

## Upstream

subfracOS is forked from [Zed](https://github.com/zed-industries/zed) and respects all upstream licenses.

- Upstream: https://github.com/zed-industries/zed
- subfracOS maintained by: Subfracture Studio
- Questions: https://subfracture.studio

## License

Maintains all original Zed licenses (AGPL-3.0, Apache-2.0, GPL-3.0)

---

**Built by Subfracture for the space between intelligence and implementation.**
