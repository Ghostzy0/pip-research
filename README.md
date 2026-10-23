# Pip Research

A native macOS notebook for asking questions about local documents and checking each answer against its source. This is an independent original implementation inspired by NotebookLM and Gemini Notebook workflows; it is not affiliated with Google or NotebookLM.

**Experimental and under qualification.** Evidence retrieval and citation navigation work locally. Optional Qwen drafting is off by default and unaccepted: after correcting the request grammar and schema, the tested model returned valid JSON but omitted required citations and made an unsupported agreement claim. The app rejected it, saved no draft, and unloaded the service. Do not expect generated drafts to work in this build.

The current source also implements editable manual research notes and recovery of unsaved note edits after an interrupted session. The shared test suite and both v3 profile clean-clone checks passed; native manual-notes interaction review remains pending. One controlled SIGTERM recovery test restored and saved a synthetic Unicode note after relaunch; Cmd-Q while the dirty editor modal was open showed no visible quit or alert, which remains unresolved.

The shared default suite completed 68 cases: 67 passed, one opt-in live test was skipped, and none failed. Both v3 profile exports passed independent fresh local-clone tests (67 passed, one opt-in live skip, 68 total cases); the custom profile built and signature-verified three products and the replica profile built and signature-verified one. Bundle metadata/resources matched and executable private-path scans were clean. The source is published in this repository. Independent final export review and hosted macOS 15 / Swift 6.1 tests and release-product builds passed; see [publication and package verification](docs/PUBLICATION.md). Package scripts remove local debug metadata from the copied executable before signing. This does not establish reference parity, native manual-notes acceptance or accepted local generation.

## What it does

- Create and manage notebooks with copied PDF, UTF-8 TXT and Markdown sources.
- Write and edit manual research notes; recover unsaved note edits after an interrupted session.
- Choose which sources a question may use and keep question history after restart.
- Retrieve exact supporting passages, compare conflicting statements and inspect cited page or heading locations.
- Export notebook evidence as Markdown with source hashes and passage offsets.
- In enhanced editions, search saved questions and excerpts and keep labelled or annotated exact quotations.

Answers are evidence to inspect, not guaranteed facts. Matching text and citation syntax do not establish that a claim is true or complete.

## This repository profile

This repository contains exactly the following runnable editions:

| Build alias | Swift product | App | Version |
| --- | --- | --- | --- |
| baseline-enhanced | ResearchBaselineEnhanced | Research Baseline Enhanced | 0.2.0 |
| pip | PipResearch | Pip Research | 0.1.1 |
| pip-enhanced | PipResearchEnhanced | Pip Research Enhanced | 0.2.0 |

Neutral Core is maintained in the separate [pip-research-replica repository](https://github.com/Ghostzy0/pip-research-replica). See [the edition matrix](docs/EDITION-MATRIX.md) for the requested split.

## Build

Requires macOS 14+ and Swift 6+. No third-party Swift packages, accounts, model weights or service are needed for evidence workflows.

~~~sh
swift test --jobs 2
./scripts/build.sh baseline-enhanced
./scripts/build.sh pip
./scripts/build.sh pip-enhanced
~~~

The scripts produce local ad-hoc signed apps. They are not Developer ID signed or notarised. Do not disable macOS security globally.

For a synthetic walkthrough, see [How to try Pip Research](docs/HOW-TO.md). [AI setup](docs/AI-SETUP.md), [FAQ](docs/FAQ.md), [testing](TESTING.md) and [parity](PARITY.md) describe current boundaries and evidence.

## Local data

Each app keeps its own data under Application Support. Storage is readable JSON and is not encrypted. Back up the full folder with the app closed. Removing a source disables its citation navigation while retaining earlier quoted history; removing a notebook removes its chats and saved excerpts too.

The optional writer contacts only the fixed loopback Ollama endpoint after explicit opt-in. It does not use cloud services, credentials or automatic model downloads. See [security](SECURITY.md) and [local drafting](docs/LOCAL-DRAFTING.md).

## Known gaps

This is not a claim of full NotebookLM equivalence. Web, video and cloud-source imports, OCR, audio overviews, generated studio artifacts, complete reference comparison and broader accessibility/device acceptance remain incomplete. See [current parity](PARITY.md) and [testing](TESTING.md).

See [the roadmap](FUTURE-IDEAS.md), [contributing](CONTRIBUTING.md) and [foundation and notices](docs/FOUNDATION.md). No affiliation with Google, Gemini Notebook, NotebookLM, Apple, Ollama or Qwen.
