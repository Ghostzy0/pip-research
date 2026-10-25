# Pip Research

A native macOS notebook for asking questions about local documents and checking answers against source passages. This is an independent, original implementation inspired by NotebookLM/Gemini Notebook workflows; it is not affiliated with Google or NotebookLM.

**Experimental.** The evidence workflow retrieves source passages and citations locally. Answers and citation syntax do not establish that a claim is true or complete; compare the original context and conflicting sources.

The source implements notebook-scoped manual notes and interrupted-edit recovery. Each scene retains its captured notebook target, with one editor owner per notebook. The retained Q8 sheet policy lets termination ingress through the Notes sheet reach the Save/Discard/Cancel coordinator, using SwiftUI's [`presentationPreventsAppTermination(false)`](https://developer.apple.com/documentation/swiftui/view/presentationpreventsapptermination(_:)) on macOS 15.4+ with Swift 6.1+, and a scoped, restoring [AppKit modal-window setting](https://developer.apple.com/documentation/appkit/nswindow/preventsapplicationterminationwhenmodal) on macOS 14–15.3 and earlier compiler versions. Current Q9 source gates termination before `super.terminate` can tear down Notes sheets; an early principal-class subclass provides a typed bridge, and a guarded one-shot approval covers the native delegate query; direct system queries use `terminateLater` and one reply. Unavailable active Notes sessions and dirty `.close` requests fail closed; pre-model startup can terminate before any Notes session exists. Thirteen source regression tests cover these paths, but do not establish packaged behavior.

## Editions in this repository

| Build alias | Swift product | Edition | Intended source version |
|---|---|---|---:|
| baseline-enhanced | ResearchBaselineEnhanced | Research Baseline Enhanced | 0.2.1 |
| pip | PipResearch | Pip Research | 0.1.2 |
| pip-enhanced | PipResearchEnhanced | Pip Research Enhanced | 0.2.1 |

This repository contains Neutral Plus, Pip Core, and Pip Plus. Neutral Core is published separately in [`pip-research-replica`](https://github.com/Ghostzy0/pip-research-replica). The next intended versions are not yet published; see [publication history](docs/PUBLICATION.md) for the existing 23 October alpha releases.

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

Qualification 9 completed 91 cases: 88 passed, 3 opt-in live-writer cases skipped, 0 failed. All four products passed local build/package checks; these are not native UI acceptance. On the exact Q7/v4 Pip package, dirty Cmd-Q and menu Quit showed no alert while the same PID remained alive. A later Q8 native slice found both routes exited without a prompt; reopening recovered the edited synthetic draft while the saved library stayed unchanged. No Save/Discard/Cancel choice appeared, so the Q8 dirty-quit gate failed. Q9 has passed source/local checks only; its packaged runtime class and quit/recovery behavior remain unverified. No Q9 hosted CI result is claimed, and publication remains on hold. See [public testing status](TESTING.md).

Full NotebookLM/Gemini Notebook parity, web/video/cloud imports, OCR, audio/Studio generation, and broader accessibility/device acceptance remain open. See [roadmap](FUTURE-IDEAS.md), [foundation and notices](docs/FOUNDATION.md), and [publication history](docs/PUBLICATION.md).
