# Pip Research

A native macOS notebook for asking questions about local documents and checking answers against source passages. This is an independent, original implementation inspired by NotebookLM/Gemini Notebook workflows; it is not affiliated with Google or NotebookLM.

**Experimental.** The evidence workflow retrieves source passages and citations locally. Answers and citation syntax do not establish that a claim is true or complete; compare the original context and conflicting sources.

Q9 source gates termination before `super.terminate` can tear down Notes sheets; an early principal-class subclass provides a typed bridge, and guarded one-shot approval covers the native delegate query; direct system queries use `terminateLater` and one reply. Unavailable active Notes sessions and dirty `.close` requests fail closed; pre-model startup can terminate before any Notes session exists. Thirteen Q9 source regressions cover these paths. Q10 passed 96 local cases (93 passed, 3 skipped, 0 failed), and both exact public heads passed hosted CI with the same result. The final v7 Neutral Plus native slice passed fact-bearing retrieval, excerpt/export/restart, dirty Cmd-Q Cancel, and explicit editor Save followed by clean Quit/relaunch on macOS 27.0.1. Baseline, Pip Core, and Pip Plus passed final v7 startup/saved-note/clean-quit smoke. Current source versions are Neutral Plus/Pip Plus `0.2.1` and Pip Core `0.1.2`; check [the custom release page](https://github.com/Ghostzy0/pip-research/releases/tag/research-alpha-2026.10.25) for current asset availability and checksums.

## Editions in this repository

| Build alias | Swift product | Edition | Intended source version |
|---|---|---|---:|
| baseline-enhanced | ResearchBaselineEnhanced | Research Baseline Enhanced | 0.2.1 |
| pip | PipResearch | Pip Research | 0.1.2 |
| pip-enhanced | PipResearchEnhanced | Pip Research Enhanced | 0.2.1 |

This repository contains Neutral Plus, Pip Core, and Pip Plus. Neutral Core is published separately in [`pip-research-replica`](https://github.com/Ghostzy0/pip-research-replica). Current source versions are `0.2.1` Plus and `0.1.2` Core; check [the custom release page](https://github.com/Ghostzy0/pip-research/releases/tag/research-alpha-2026.10.25) for current publication status and assets. See [publication history](docs/PUBLICATION.md) for the 23 October historical alpha.

## Build

Requires macOS 14+ and Swift 6+. Evidence workflows need no third-party Swift packages, accounts, model weights, or service.

~~~sh
swift test --jobs 2
./scripts/build.sh baseline-enhanced
./scripts/build.sh pip
./scripts/build.sh pip-enhanced
~~~

Builds are locally ad-hoc signed, not Developer ID signed or notarised. Never disable macOS security globally. See [How to try Pip Research](docs/HOW-TO.md), [AI setup](docs/AI-SETUP.md), [FAQ](docs/FAQ.md), [testing](TESTING.md), and [parity](PARITY.md).

## Local data and optional drafting

Each edition stores its data separately under Application Support. Storage is readable JSON, not encrypted by this app; back up the complete folder with the app closed. The optional Qwen writer contacts only a fixed loopback Ollama endpoint after explicit opt-in. It is off by default and experimental. One bounded synthetic 1.7B probe returned valid JSON and citation IDs but added a misleading interpretation of source dates. Separate live conflict/persistence and hostile-source cases passed; the absent-fact case failed two expectations: asked for public-holiday hours, it returned `The station garden closes at 18:00 on weekdays [1].` It did not explicitly invent holiday hours, but failed to acknowledge that the source gives weekday hours only and no public-holiday information. This does not establish general grounding. See [Security](SECURITY.md) and [local drafting](docs/LOCAL-DRAFTING.md).

## Qualification status

Qualification 10 completed 96 cases: 93 passed, 3 opt-in live-writer cases skipped, 0 failed; all four products passed local build/package checks. Both exact Q10 public heads passed hosted CI with the same result on Swift 6.1.2/macOS 15.7.9 arm64. All four Q9 prior-package variants passed startup and dirty Cmd-Q Cancel/alert-Save/restart; Pip Core also passed menu Discard/restart. Q9 Neutral Plus fact-bearing retrieval failed and remains in [public issue #6](https://github.com/ghostzy0/pip-research/issues/6). On v7 Neutral Plus, the requested citations included 18:00 and 19:00, conflict detection passed, and the saved 19:00 excerpt/export survived restart. Dirty Cmd-Q Cancel retained the same PID/edit; the save was through the editor Save button, followed by clean Quit and relaunch. Baseline, Pip Core, and Pip Plus passed final v7 startup/saved-note/clean-quit smoke. The scoped experimental patch is accepted for publication. Check [the custom release page](https://github.com/Ghostzy0/pip-research/releases/tag/research-alpha-2026.10.25) for current assets and checksums. See [public testing status](TESTING.md).

Full NotebookLM/Gemini Notebook parity, web/video/cloud imports, OCR, audio/Studio generation, and broader accessibility/device acceptance remain open. See [roadmap](FUTURE-IDEAS.md), [foundation and notices](docs/FOUNDATION.md), and [publication history](docs/PUBLICATION.md).
