# subfracOS Development Roadmap

## Strategic Approach: Phased Investment

### Phase 1: Configuration Layer ✅ COMPLETE

**Status:** Shipped
**Time Investment:** ~4 hours
**Maintenance:** Minimal

**Deliverables:**
- [x] Complete subfracOS branding
- [x] Docker MCP Gateway preconfigured
- [x] Subfracture-optimized defaults
- [x] Custom theme foundation
- [x] Documentation and setup guide

**Result:** A branded, preconfigured Zed that feels like *our* tool from first launch.

---

## Phase 2: Extension-First Development 📋 NEXT

**Philosophy:** Build only what extensions can't solve. Every feature must prove its value in real work.

**Trigger:** Start when we hit friction in actual projects using Level 1

### Priority 1: Context & Intelligence

#### 1. Danni Context Panel
**Problem:** Danni's context and memory are invisible while coding
**Solution:** Sidebar panel showing:
- Current conversation context
- Active memory/knowledge
- Suggested next actions
- Quick context switching

**Complexity:** Medium
**Estimated Time:** 1-2 weeks
**Value:** High - makes AI collaboration visible

#### 2. Vault Navigator
**Problem:** Obsidian knowledge lives in separate app, requires context switching
**Solution:** Quick access panel for:
- Search across vaults
- Recent notes
- Tagged content relevant to current project
- Inline note creation

**Complexity:** Medium
**Estimated Time:** 1-2 weeks
**Value:** High - brings knowledge to code

### Priority 2: Workflow Optimization

#### 3. MCP Orchestrator
**Problem:** Running MCP server chains manually is tedious
**Solution:** Visual interface for:
- Chaining MCP operations
- Saving common workflows
- One-click execution
- Result visualization

**Complexity:** High
**Estimated Time:** 2-3 weeks
**Value:** Medium-High - depends on MCP usage frequency

#### 4. Project Intelligence
**Problem:** Every project requires manual setup and context loading
**Solution:** Auto-detection and configuration:
- Detect project type (brand work, AI agent, client project)
- Load relevant context automatically
- Suggest workflows based on project patterns
- Preset configurations for common project types

**Complexity:** Medium
**Estimated Time:** 1-2 weeks
**Value:** Medium - nice to have, not critical

### Priority 3: Brand & Design

#### 5. Brand Token Inspector
**Problem:** Design tokens are disconnected from implementation
**Solution:** Inline visualization of:
- Color palettes
- Typography scales
- Spacing systems
- Component tokens
- Live preview in code

**Complexity:** Medium-High
**Estimated Time:** 2-3 weeks
**Value:** Medium - valuable for brand work specifically

---

## Phase 3: Fork with Purpose 🔮 IF FUNDED

**Trigger:** Extensions hit limits AND we can raise funding for dedicated development

**Criteria for Moving to Phase 3:**
1. Clear features that CANNOT be done via extensions
2. Strong internal adoption of Level 1 & 2
3. Interest from other teams/companies
4. Funding secured ($200k-500k for 6-12 months development)

### Potential Core Changes

**Only pursue if extensions prove insufficient:**

- Deep MCP integration into editor core
- Custom rendering paradigms for knowledge visualization
- Native multi-agent development environment
- Real-time collaborative AI context
- Custom AST-aware intelligence layer

**Note:** Do NOT start Phase 3 without funding and proven need.

---

## Decision Framework

Before building ANY feature, ask:

### 1. Can this be an extension?
→ If YES: Build as extension
→ If NO: Question whether we need it

### 2. Have we used Level 1 enough to know this is needed?
→ If NO: Use Level 1 more first
→ If YES: Proceed to next question

### 3. Would we use this tomorrow?
→ If NO: Deprioritize
→ If YES: Add to roadmap

### 4. Can we prototype in < 1 week?
→ If NO: Break down further or defer
→ If YES: Build quick prototype, test with team

---

## Success Metrics

### Level 1 Success:
- Team actually uses subfracOS daily
- Fewer tool switches during work
- Positive feedback after 2 weeks of use

### Level 2 Success:
- Extensions get used regularly (not just installed)
- Measurable time savings or quality improvements
- External interest from similar teams

### Level 3 Consideration:
- Strong demand we can't meet with extensions
- Funding secured
- Clear differentiation from Zed that justifies fork maintenance

---

## Current Priority: **USE LEVEL 1**

Next action items:
1. ✅ Complete Level 1 implementation
2. Ship to team for daily use
3. Document friction points over 2-4 weeks
4. Review this roadmap with real data
5. Decide which Level 2 extensions to build

**Remember:** Best code is no code. Build only what we actually need.
