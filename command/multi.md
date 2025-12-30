---
description: Run multiple agents in parallel to find the best solution
agent: build
---

## WORKFLOW PROCESS

• Based on this info(user said prompt): $ARGUMENTS
• If the info is about fixing something in codebase or adding a new feature:
  - Count how many times each @agentname appears in the user's prompt (e.g., @glm @glm @glm means 3 GLM agents)
  - Make separate Task tool calls in ONE message with subagent_type="@agentname" for each mention
  - Example: If user says "/multi @glm @glm @deepseek", make 3 Task calls - 2 with subagent_type="@glm" and 1 with subagent_type="@deepseek"
  - Give them this STRICT instruction: "You are capable agents but for THIS SPECIFIC TASK you must NOT make any file changes, edits, or modifications. Your job is to analyze the codebase and create ONLY a detailed plan with code blocks showing where edits need to be made with line numbers. DO NOT execute any file operations - just provide the plan."
  - Give them task to analyze codebase and come up with a plan (detailed plan with code blocks and places where edits need to be made with line numbers) to fix the issue or add the feature

## ANALYSIS AND VERIFICATION

When you get the response from those agents back:
1. Verify those plans yourself via light grepping
2. If any plan item cross-matches (2 agents come up with same thing), you don't have to verify it
3. After analyzing those plans, present them as summary (not as whole) and judge them with ratings
    - Judge harshly if you think some agents came up with fluff
    - Present a combined (best) plan to the user
    - Explain in pure English in the final part rather than giving code
    - Don't use analogies on your explanation  - tell the actual story of the plan or fix in English such as "first the user submits the form data, which goes through the validateInput function, but this function fails to check for empty email fields, so the database query fails with a null constraint error..." or "the application loads the configuration from config.json, but the parseConfig function doesn't handle missing values properly, causing the entire app to crash when trying to access undefined settings..."

## CAUTION

• DO NOT make any changes at all - this is for pure planning only
• STRICTLY instruct sub-agents to NOT make any file changes, edits, or modifications - they should only create plans
• If user's info is not about fixing or planning but rather editing or something else, tell user they used wrong command and explain what this command is for
• You must tell the agents to read the README first of the project if it exists
• You must also read the README
• Sub-agents must STRICTLY follow instructions and NEVER perform any file operations 


