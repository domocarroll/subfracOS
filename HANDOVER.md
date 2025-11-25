# subfracOS + Danni Integration - Session Handover

## Current Status: 95% Complete - Final ACP Compatibility Fix Needed

**Date:** 2025-11-24
**Project:** subfracOS (Zed fork) + Danni (AI strategist) integration
**Goal:** Enable Danni as native ACP agent in subfracOS

---

## ✅ Completed This Session

### 1. Upstream Merge (Option C: Minimal Rebrand Fork)
- **Reset to upstream Zed** (commit: 06f8e35597)
- **Cherry-picked 4 commits** cleanly:
  - `e131b5e2e3` - Complete subfracOS branding
  - `6460163c67` - Level 1 Complete: subfracOS Configuration Layer
  - `39fb3bf959` - Level 1.5 Complete: Danni ACP Integration
  - `2f6c850ba3` - Fix: Danni uses Claude CLI, not direct API
- **Result:** subfracOS now has **ACP 0.7.0** (was 0.2.1)

### 2. Build Success
- subfracOS built successfully (25m 51s)
- Binary: `target/release/subfracos` (1.4GB)
- All branding intact (menus, notifications, etc.)

### 3. Documentation
- Created `MERGE_STRATEGY.md` - documents how to stay synced with upstream
- Strategy validated: Only 4 commits to reapply on future merges
- Zero maintenance burden

### 4. GitHub Push
- Force-pushed to: https://github.com/domocarroll/subfracOS
- Clean git history maintained

---

## 🔄 In Progress - Danni ACP 0.7.0 Upgrade

### The Problem
- **subfracOS:** ACP 0.7.0 ✅
- **Danni:** ACP 0.2.3 ❌ (upgraded to 0.7.0 but build failing)
- **Version mismatch** = "Unsupported version" error

### Current Build Errors (5 total)

```
error[E0050]: method `ext_method` has 3 parameters but trait has 2
   → crates/danni-cli/src/commands/acp.rs:758

error[E0050]: method `ext_notification` has 3 parameters but trait has 2
   → crates/danni-cli/src/commands/acp.rs:767

error[E0559]: variant `SessionUpdate::AgentMessageChunk` has no field named `content`
   → crates/danni-cli/src/commands/acp.rs:342

error[E0559]: variant `SessionUpdate::AgentThoughtChunk` has no field named `content`
   → crates/danni-cli/src/commands/acp.rs:367

error[E0063]: missing field `agent_info` in initializer of `InitializeResponse`
   → crates/danni-cli/src/commands/acp.rs:586
```

### What Changed in ACP 0.7.0

Based on upstream Zed's implementation (`/home/dom/subfracOS/crates/agent_servers/src/acp.rs:963`):

1. **ext_method signature:**
   ```rust
   // OLD (0.2.3):
   async fn ext_method(&self, _method: Arc<str>, _params: Arc<RawValue>)
       -> Result<Arc<RawValue>, acp::Error>

   // NEW (0.7.0):
   async fn ext_method(&self, _args: acp::ExtRequest)
       -> Result<acp::ExtResponse, acp::Error>
   ```

2. **ext_notification signature:**
   ```rust
   // OLD (0.2.3):
   async fn ext_notification(&self, _method: Arc<str>, _params: Arc<RawValue>)
       -> Result<(), acp::Error>

   // NEW (0.7.0):
   async fn ext_notification(&self, _args: acp::ExtNotification)
       -> Result<(), acp::Error>
   ```

3. **SessionUpdate variants:**
   - Field names changed (likely `content` → something else)
   - Need to check `AgentMessageChunk` and `AgentThoughtChunk` struct definitions

4. **InitializeResponse:**
   - New required field: `agent_info`

---

## 📋 Next Steps (15 minutes work)

### Fix 1: Update ext_method/ext_notification signatures

**File:** `/home/dom/danni-goose-fork/crates/danni-cli/src/commands/acp.rs:757-773`

```rust
// REPLACE LINES 757-764:
async fn ext_method(&self, _args: acp::ExtRequest) -> Result<acp::ExtResponse, acp::Error> {
    Err(acp::Error::method_not_found())
}

// REPLACE LINES 766-773:
async fn ext_notification(&self, _args: acp::ExtNotification) -> Result<(), acp::Error> {
    Ok(())
}
```

### Fix 2: Update SessionUpdate field names

**File:** `/home/dom/danni-goose-fork/crates/danni-cli/src/commands/acp.rs:342,367`

Need to check ACP 0.7.0 source for correct field names. Check:
```bash
find ~/.cargo/registry/src -name "*.rs" -path "*/agent-client-protocol-0.7.0/*" \
  -exec grep -l "SessionUpdate" {} \; | head -1 | xargs cat
```

Look for `AgentMessageChunk` and `AgentThoughtChunk` struct definitions.

### Fix 3: Add agent_info field

**File:** `/home/dom/danni-goose-fork/crates/danni-cli/src/commands/acp.rs:586`

Need to see what `agent_info` expects. Check InitializeResponse definition in ACP 0.7.0.

### Fix 4: Rebuild and Test

```bash
cd /home/dom/danni-goose-fork
cargo build --release --bin danni
cp target/release/danni ~/.local/bin/danni
```

### Fix 5: Integration Test

```bash
cd /home/dom/subfracOS
./target/release/subfracos
# Open Agent panel → Should see Danni (no "Unsupported version" error)
```

---

## 🗂️ Key Files & Locations

### subfracOS
- **Repo:** `/home/dom/subfracOS`
- **Binary:** `target/release/subfracos`
- **Config:** `assets/settings/initial_user_settings.json` (Danni preconfigured)
- **ACP Version:** 0.7.0 (`Cargo.toml:22`)
- **GitHub:** https://github.com/domocarroll/subfracOS

### Danni
- **Repo:** `/home/dom/danni-goose-fork`
- **Binary:** `~/.local/bin/danni` (needs rebuild)
- **ACP Implementation:** `crates/danni-cli/src/commands/acp.rs`
- **ACP Version:** 0.7.0 (updated, not compiling) (`crates/danni-cli/Cargo.toml:22`)

### Build Logs
- **subfracOS:** `/tmp/subfracos_build.log` (SUCCESS)
- **Danni:** `/tmp/danni_build.log` (FAILED - 5 errors)

---

## 🎯 Success Criteria

When complete, user should be able to:
1. Launch subfracOS: `./target/release/subfracos`
2. Open Agent panel (or similar)
3. See Danni as available agent
4. Start conversation with Danni
5. No "Unsupported version" errors

---

## 📊 Architecture Overview

```
┌─────────────────┐
│   subfracOS     │  ACP 0.7.0 ✅
│   (Zed fork)    │
└────────┬────────┘
         │
         │ ACP Protocol
         │
┌────────┴────────┐
│     Danni       │  ACP 0.7.0 ⚠️ (not compiling)
│  (AI Strategist)│
└────────┬────────┘
         │
         │ Claude CLI
         │
┌────────┴────────┐
│  Anthropic API  │
└─────────────────┘
```

---

## 💡 Strategic Notes

### Why Minimal Rebrand Fork Works
- **Zero Rust code changes** to subfracOS
- **Just configuration + branding** (4 commits)
- **Always get latest ACP** from upstream Zed
- **Can merge every 1-2 weeks** trivially
- **No maintenance burden**

### Why This Matters
- Original problem: subfracOS stuck on ACP 0.2.1 (Sept 2024)
- Danni needed newer ACP to work
- Options were: upgrade subfracOS OR downgrade Danni
- Chose: Merge upstream Zed to get their mature ACP implementation
- Result: subfracOS now gets all future Zed improvements for free

---

## 🚨 Gotchas

1. **Danni build cache:** May need `cargo clean` if changes don't apply
2. **Binary location:** Danni installs to `~/.local/bin/danni` (aliased)
3. **README conflict:** Always take upstream's README.md (we have README.subfracos.md)
4. **Force push safe:** Because we reset to upstream, force push won't lose work

---

## 📞 Contact Points

- **subfracOS config:** `assets/settings/initial_user_settings.json`
- **Danni config in subfracOS:** Lines 28-36 (agent_servers.danni)
- **ACP trait impl:** `/home/dom/danni-goose-fork/crates/danni-cli/src/commands/acp.rs`
- **Merge strategy:** `/home/dom/subfracOS/MERGE_STRATEGY.md`

---

## 🎬 Quick Resume Commands

```bash
# Check current state
cd /home/dom/danni-goose-fork
tail /tmp/danni_build.log

# Fix the 5 errors in acp.rs
# See "Next Steps" section above

# Rebuild Danni
cargo build --release --bin danni

# Install
cp target/release/danni ~/.local/bin/danni

# Test integration
cd /home/dom/subfracOS
./target/release/subfracos
```

---

**Last Updated:** 2025-11-24 16:30 AEST
**Ready For:** ACP 0.7.0 API compatibility fixes in Danni
**ETA to Complete:** 15-20 minutes
