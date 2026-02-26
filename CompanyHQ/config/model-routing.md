# Model Routing and Fallbacks

Primary path:
1. Use OpenAI Codex (`openai-codex`) for planning and execution.
2. If unavailable, fallback to OpenRouter for cloud LLM execution.
3. If cloud keys are unavailable, fallback to local Ollama models.

Routing guidance:
- Architecture and cross-project planning: OpenAI Codex first.
- React/frontend tasks: OpenRouter acceptable for cost and speed.
- Unity/gameplay prototyping: Ollama acceptable for local iteration.

Failure policy:
- If a provider fails, log the failure with timestamp and route to next provider.
- Never expose keys in logs; only print whether key is set/unset.
