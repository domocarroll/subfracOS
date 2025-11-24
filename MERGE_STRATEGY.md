# subfracOS Merge Strategy

## Philosophy: Minimal Rebrand Fork

subfracOS maintains a minimal fork of Zed, consisting of only:
1. **Branding changes** (3 files in `crates/zed/`)
2. **Configuration defaults** (`assets/settings/initial_user_settings.json`)
3. **Documentation** (README.subfracos.md, ROADMAP.md, DANNI_INTEGRATION.md)

**Zero code changes.** We get all upstream improvements for free.

## Merge Process

### Regular Updates (Every 1-2 weeks recommended)

```bash
# 1. Fetch latest upstream
git fetch upstream

# 2. Reset to upstream/main
git reset --hard upstream/main

# 3. Cherry-pick our commits (in order)
git cherry-pick e131b5e2e3  # Complete subfracOS branding
git cherry-pick 6460163c67  # Level 1 Complete: subfracOS Configuration Layer
git cherry-pick 39fb3bf959  # Level 1.5 Complete: Danni ACP Integration
git cherry-pick 2f6c850ba3  # Fix: Danni uses Claude CLI, not direct API

# 4. Resolve any conflicts (usually just README.md - take theirs)
# If README.md conflicts:
git checkout --theirs README.md
git add README.md
git cherry-pick --continue

# 5. Build and test
cargo build --release
./target/release/subfracos

# 6. Force push (safe because we're resetting to upstream)
git push origin main --force
```

### When Our Commits Change

If we make new branding changes or config updates:

```bash
# 1. Make changes on a branch
git checkout -b my-feature

# 2. Commit with clear message
git commit -m "feat: add new feature X"

# 3. Get the new commit hash
git log --oneline -1

# 4. Update this document with the new hash in the cherry-pick list

# 5. Merge to main using the process above
```

### Critical Rules

1. **Never modify Rust code** - All customization via configuration
2. **Keep commits minimal** - Easier to reapply after upstream merges
3. **Document every cherry-pick hash** - In this file
4. **Test after every merge** - Ensure Danni ACP integration works
5. **README.md conflicts** - Always take upstream's version (we have README.subfracos.md)

## Current Cherry-Pick Hashes

```
e131b5e2e3 - Complete subfracOS branding
6460163c67 - Level 1 Complete: subfracOS Configuration Layer
39fb3bf959 - Level 1.5 Complete: Danni ACP Integration
2f6c850ba3 - Fix: Danni uses Claude CLI, not direct API
```

## Benefits of This Approach

1. **ACP version compatibility** - Always use upstream's latest ACP implementation
2. **Bug fixes** - Get all Zed bug fixes immediately
3. **New features** - Benefit from all Zed improvements
4. **Low maintenance** - Just 4 commits to reapply
5. **Stay mergeable** - Can always sync with upstream

## What We Get From Upstream

- Latest ACP protocol (currently 0.7.0)
- All agent infrastructure improvements
- Bug fixes and performance improvements
- New editor features
- Security patches
- LSP and language support updates

## What We Maintain

- Menu labels ("subfracOS" instead of "Zed")
- Default settings (Docker MCP, Danni agent, themes)
- Documentation (our README, ROADMAP, integration guides)

That's it. Simple. Maintainable. Effective.

## Last Merge

- **Date**: 2025-11-24
- **Upstream Commit**: 06f8e35597 (agent_ui: Make thread markdown editable)
- **ACP Version**: 0.7.0
- **Status**: ✅ Clean merge, all commits cherry-picked successfully
