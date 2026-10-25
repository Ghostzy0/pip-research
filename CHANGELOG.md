# Changelog

## Unreleased — intended next versions: Neutral Plus 0.2.1, Pip Core 0.1.2, Pip Plus 0.2.1

These version numbers identify the next source/package batch; this entry does not announce a published release. The existing 23 October experimental alphas remain available and unchanged. See [publication history](docs/PUBLICATION.md).

- Hardened manual Notes ownership and interrupted-edit recovery across scenes. Q8 lets termination ingress through the Notes sheet reach the existing Save/Discard/Cancel coordinator, using SwiftUI's `presentationPreventsAppTermination(false)` on macOS 15.4+ with Swift 6.1+ and a scoped, restoring AppKit fallback on macOS 14–15.3 and earlier compiler versions. This source change is not native acceptance.
- Qualification 8 completed 87 cases: 84 passed, 3 opt-in live-writer cases skipped, 0 failed. All four products built and passed ad-hoc signature, resource, and private-path checks. Hosted 82-pass/3-skip checks qualify Q7 only; fresh Q8 public-payload CI and Q8 native review remain pending. Exact Q7/v4 native evidence confirmed that dirty Cmd-Q and menu Quit showed no alert while the same PID remained alive; note save/reopen, restart persistence, and clean main-window Quit passed.
- Enhanced editions retain notebook-scoped search over saved questions and excerpts, plus exact saved citation excerpts with optional labels and annotations. Neutral Plus and Pip Plus share this enhancement set; Core variants do not expose Plus controls.
- Optional local Qwen3 1.7B drafting remains experimental and off by default. A bounded synthetic response included the required citation IDs and identified the source disagreement, but misleadingly interpreted source dates. Separately, an opt-in live run passed conflict-plus-persistence and hostile-source cases; absent-fact failed two expectations: asked for public-holiday hours, it returned `The station garden closes at 18:00 on weekdays [1].` without acknowledging that the source only gives weekday hours. It did not explicitly invent holiday hours. One persistence scenario passed, but general grounding remains unverified.
- The historical experimental alpha releases and their assets are not replaced by this unreleased source entry.

## 23 October 2026 — historical experimental alpha

The previous public alpha published Neutral Plus, Pip Core, and Pip Plus in `pip-research`, and Neutral Core in `pip-research-replica`. It used Core `0.1.1` and Plus `0.2.0`. See the historical release links and evidence boundaries in [publication history](docs/PUBLICATION.md).
