# Open Code Parallel Agents

Open Code is an open-source coding tool that supports almost any model in the market. Unlike other coding tools such as Claude Code that support multiple sub-agents in parallel but are limited to their own model (Claude), Open Code allows you to run multiple sub-agents in parallel using different models. This approach can be much more effective than single-model solutions because different models have different understandings and perspectives on problems. They can share their insights with the main agent, which then synthesizes a better solution. The point of this project is to get better responses by leveraging multiple models simultaneously, saving time and improving code quality.

This repository contains agent templates and command configurations for running parallel agents in the Open Code system.

## Quick Setup

```bash
# 1. Clone the repository
git clone https://github.com/aptdnfapt/opencode-parallel-agents
cd opencode-parallel-agents

# 2. Install opencode globally (if you haven't already)
# Follow instructions at https://github.com/sst/opencode/

# 3. List available models from cache
jq -r 'to_entries[] | .key as $provider | .value.models | keys[] | select(contains("claude") or contains("deepseek") or contains("qwen") or contains("grok") or contains("glm") or contains("gpt") or contains("gemini")) | $provider + "/" + .' ~/.cache/opencode/models.json

# Quick model search (enter model name when prompted) make sure to use bash
read -p "Search model: " term; jq -r 'to_entries[] | .key as $provider | .value.models | keys[] | select(contains("'"$term"'")) | $provider + "/" + .' ~/.cache/opencode/models.json | head -20

# 4. Pick the models you want and edit the template files and copy agent templates
# Edit each agent file - change model in frontmatter
# For OpenRouter: model: openrouter/provider/model_name
# For OpenAI: model: openai/model_name
# For DeepSeek: model: deepseek/model_name
# For Qwen: model: qwen/model_name
# btw you dont have to make 2 same agent.md if you want to run same agent.md in paralell such as maybe you want to run 3 glm agent in parallel thats fine and will work with one glm.md . no need to create 3 glm.md files . 
nvim agent/template.md 
mv agent/template.md agent/moodelname.md


# copy the file to global config or ... on project .opencode/agent dir 
# Example: 
cp agent/template.md ~/.config/opencode/agent/deepseek.md


# 6. Install the multi command
cp command/multi.md ~/.config/opencode/command/

# 7. Restart opencode
# Now try: /multi @deepseek @claude @qwen analyze this codebase
```

### Alternative: Project-Specific Setup

```bash
# Instead of global config, use project-specific
mkdir -p .opencode/agent .opencode/command
cp agent/template.md .opencode/agent/deepseek.md
cp command/multi.md .opencode/command/

# Edit the model fields in each agent file, then restart opencode
```

## Configuration Examples

### Agent Template (agent/template.md)
```yaml
---
name: your_agent_name
model: openrouter/anthropic/claude-3.5-sonnet
---

## Agent Instructions
You are a helpful coding assistant...
```

### DeepSeek Example
```yaml
---
name: deepseek
model: deepseek/deepseek-chat
---

## DeepSeek Analysis
Analyze the codebase thoroughly...
```

### Claude Example
```yaml
---
name: claude
model: openrouter/anthropic/claude-3.5-sonnet
---

## Claude Analysis
Focus on architecture and best practices...
```

## Using the Multi Command

The `/multi` command runs multiple agents in parallel based on what you specify in your prompt:

```
/multi @deepseek @deepseek @deepseek analyze this function
# Runs 3 DeepSeek agents in parallel

/multi @claude @deepseek @qwen fix this bug
# Runs Claude, DeepSeek, and Qwen agents in parallel

/multi @glm @grok @qwen @deepseek optimize this code
# Runs all four agents in parallel
```

**How it works:**
- Mention ANY agent name with `@agentname`
- Each mention creates one instance of that agent
- Mention the same agent multiple times for multiple parallel instances
- The multi-agent orchestrator collects all responses and synthesizes a combined plan

**Important:** You must mention the agent names in your initial prompt using `@` signs. The multi-agent command will run only the agents you specify in parallel, allowing you to leverage multiple model perspectives simultaneously for more comprehensive analysis and better solutions.

### Delegating Tasks to Sub-Agents
You can also give tasks directly to sub-agents when:
- The context of your main agent is filled up
- The main agent model is making errors frequently

**How to delegate in the prompt box:**
```
hey give this task to @agentname and tell him to fix this. give him detail info on what you have already tried
```

Replace `@agentname` with the actual agent name (e.g., `@deepseek`, `@glm`, `@qwen`).

## Important Links

- [Open Code GitHub](https://github.com/sst/opencode/)
- [Agents Documentation](https://opencode.ai/docs/agents/)
- [Commands Documentation](https://opencode.ai/docs/commands/)

## Free Model Options

- **Qwen**: [Qwen Code OAI Proxy](https://github.com/aptdnfapt/qwen-code-oai-proxy) (2000 free requests)
- **DeepSeek**: Via OpenRouter or DeepSeek API
- **GLM**: Various providers via OpenRouter
- **Grok**: Via xAI API or OpenRouter
