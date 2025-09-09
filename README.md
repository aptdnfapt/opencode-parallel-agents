# Open Code Parallel Agents

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
2. Mention them in `command/multi.md` with `@` sign (e.g., `@myagent @anotheragent`)


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
/multi we are facing x issue can you check whats wrong?
```
