# Case 06 Clinical Case Lab

This folder contains a first-pass teaching workflow, a clickable front-end mockup, and a standard-library Python command-line prototype for the fictional case supplied as `Case06_Llama3.2_20251102_165637.json`.

## Files

- `workflow_and_case06.md` — proposed critique, answer-key, and student-feedback flow, plus a provisional issue map for this case.
- `mockup.html` — standalone UI mockup. Its feedback is illustrative and is not a model evaluation.
- `prototype.py` — prepares stable case anchors and prompts, or calls an OpenAI-compatible local model endpoint.
- `prompts.md` — copy-ready prompt stages and the human review requirements.
- `reference_pack.md` — brief ASHA/CAPCSD/Pearson source summaries for grounded prompting.
- `case06_answer_key_draft.json` — provisional instructor-only findings; adjudicate before grading.
- `prepared_case06/` — prepared student view, line index, and generated prompt files for the attached case.

## No-UI prototype

Requires Python 3.10 or newer. It uses only the Python standard library. Point `--case` at the attached JSON file. The hidden `_metadata` block is excluded from the student-facing case and critique prompt by default.

```powershell
python .\prototype.py prepare `
  --case 'C:\Users\Hiro\Downloads\Case06_Llama3.2_20251102_165637.json' `
  --sources '.\reference_pack.md' `
  --outdir '.\work\case06'
```

The `prepare` command writes a line-numbered student view, a JSON line index, and prompts for generation, independent critique, and feedback. `prepared_case06/` is the prepared output for the supplied case.

To ask a local OpenAI-compatible server such as Ollama's OpenAI-compatible endpoint for a **draft critique**:

```powershell
python .\prototype.py run `
  --task critique `
  --case 'C:\Users\Hiro\Downloads\Case06_Llama3.2_20251102_165637.json' `
  --model 'qwen3:8b' `
  --endpoint 'http://localhost:11434/v1/chat/completions' `
  --out '.\work\case06\qwen-critique.json'
```

For a second, independent draft, run the same command with the second model name and a different output path. Do not give one model the other model's critique before its first pass.

The feedback stage needs an instructor-adjudicated key and a student submission in JSON. See the schemas and examples in `prompts.md`.

## Limits

This is a research/teaching prototype. Model critiques and feedback are unverified drafts; they are not clinical advice, a diagnostic report, or a substitute for faculty review. The supplied case's name is treated as fictional as described by the user. Replace names with synthetic IDs before using any real case material. The mockup runs entirely in the browser and has no model connection.
