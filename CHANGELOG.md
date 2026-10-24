# Changelog

## Unreleased — intended next versions: Neutral Plus 0.2.1, Pip Core 0.1.2, Pip Plus 0.2.1

These version numbers identify the next source/package batch; this entry does not announce a published release. The existing 23 October experimental alphas remain available and unchanged. See [publication history](docs/PUBLICATION.md).

- Hardened manual notebook notes and interrupted-edit recovery across all four variants. The resumed editor keeps its scene's captured notebook target, enforces one Notes owner per notebook across scenes, and coordinates explicit Save, Discard, or Cancel choices at app quit. A shared AppKit termination delegate routes normal termination through the deferred coordinator; four bridge tests cover its exactly-once reply. Packaged Dock/menu/Cmd-Q/window-close acceptance remains pending.
- Qualification-4 default Swift suite: 80 cases: 77 passed, 3 opt-in live-writer cases skipped, 0 failures. All four products were built, ad-hoc signature-verified, and checked for private-path strings. In a separate opt-in run, conflict-plus-persistence and hostile-source cases passed; absent-fact failed two expectations: asked for public-holiday hours, it returned `The station garden closes at 18:00 on weekdays [1].` without acknowledging that the source only gives weekday hours. It did not explicitly invent holiday hours.
- Enhanced editions retain notebook-scoped search over saved questions and excerpts, plus exact saved citation excerpts with optional labels and annotations. Neutral Plus and Pip Plus share this enhancement set; Core variants do not expose Plus controls.
- Optional local Qwen3 1.7B drafting remains experimental and off by default. A bounded synthetic response included the required citation IDs and identified the source disagreement, but misleadingly interpreted source dates. Separately, an opt-in live run passed conflict-plus-persistence and hostile-source cases; absent-fact failed two expectations: asked for public-holiday hours, it returned `The station garden closes at 18:00 on weekdays [1].` without acknowledging that the source only gives weekday hours. It did not explicitly invent holiday hours. One persistence scenario passed, but general grounding remains unverified.
- The historical experimental alpha releases and their assets are not replaced by this unreleased source entry.

## 23 October 2026 — historical experimental alpha

The previous public alpha published Neutral Plus, Pip Core, and Pip Plus in `pip-research`, and Neutral Core in `pip-research-replica`. It used Core `0.1.1` and Plus `0.2.0`. See the historical release links and evidence boundaries in [publication history](docs/PUBLICATION.md).
