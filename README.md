# Open Code Parallel Agents

Open Code is an open-source coding tool that supports almost any model in the market. Unlike other coding tools such as Claude Code that support multiple sub-agents in parallel but are limited to their own model (Claude), Open Code allows you to run multiple sub-agents in parallel using different models. This approach can be much more effective than single-model solutions because different models have different understandings and perspectives on problems. They can share their insights with the main agent, which then synthesizes a better solution. The point of this project is to get better responses by leveraging multiple models simultaneously, saving time and improving code quality.

This repository contains agent templates and command configurations for running parallel agents in the Open Code system.

## Setup Instructions

### Option 1: Clone the Repository
```bash
git clone <repository-url>
cd opencode-prallel-agents
```

### Option 2: Copy Files Manually
1. Copy the `template.md` from the `agent/` folder
2. Copy the `multi.md` from the `command/` folder
3. Place them in your home config folder at `~/.config/opencode/agent/` and `~/.config/opencode/command/`

## Configuration

### Agent Setup
1. Copy `agent/template.md` and rename it (e.g., `myagent.md`)
2. Edit the model name in the frontmatter with the full endpoint model name:

**For Open Router:**
```yaml
model: openrouter/provider/model_name
```

**For OpenAI:**
```yaml
model: openai/model_name
```

**For DeepSeek:**
```yaml
model: deepseek/model_name
```

**For ZAI:**
```yaml
model: zai/model_name
```

### Multi-Agent Setup
1. Rename your agent files in the `agent/` folder
2. The agents are now specified directly in your prompt using `@` signs (no need to edit `command/multi.md`)
3. When using `/multi`, mention the agents you want to run in parallel in your initial prompt


## Important Links

### Open Code
- [Open Code GitHub](https://github.com/sst/opencode/)
- [Agents Documentation](https://opencode.ai/docs/agents/)
- [Commands Documentation](https://opencode.ai/docs/commands/)

### Free Qwen Proxy
- [Qwen Code OAI Proxy (2000 req free)](https://github.com/aptdnfapt/qwen-code-oai-proxy)
  - Setup as `qwen.md` in agents folder

## Usage
To use this, you need to restart opencode if you haven't already and then run the slash command with a prompt such as:
```
/multi @glm @deepseek @qwen we are facing x issue can you check whats wrong?
```

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
