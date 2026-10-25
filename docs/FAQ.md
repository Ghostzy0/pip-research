# Pip Research FAQ

## What is Pip Research?

Pip Research is an experimental native macOS notebook for asking questions about local PDF, UTF-8 text, and Markdown sources. It retrieves passages, shows citations, and can open the cited location. It is an independent original implementation and is not affiliated with NotebookLM, Gemini, Google, Apple, Ollama, or Qwen.

## What do I need?

Build from source with macOS 14+ and Swift 6. The core build requires no third-party Swift packages, account, model, or server. The tested development host is Apple silicon; macOS 14 and Intel runtime acceptance remain unverified. Public source/profile and package status is summarized in [publication history](PUBLICATION.md).

## Does it send documents to a cloud service?

Evidence mode makes no network request. Sources are copied to the chosen edition's local Application Support folder. Optional local drafting is disabled by default; when explicitly requested, the question and selected passages go to a fixed loopback Ollama service. There is no cloud fallback and the app does not download weights. A bounded synthetic Qwen3 1.7B probe returned valid JSON with the required citation IDs and identified a conflict, but also misleadingly interpreted source/revision dates. Separately, an opt-in live run passed one conflict-plus-persistence case and one hostile-source case; the absent-fact case failed two expectations: asked for public-holiday hours, it returned `The station garden closes at 18:00 on weekdays [1].` It did not explicitly invent holiday hours, but failed to acknowledge that the source gives weekday hours only and no public-holiday information. This is not general grounding evidence; drafting remains experimental. See [Security](../SECURITY.md) and [Local drafting](LOCAL-DRAFTING.md).

## Are answers guaranteed to be correct?

No. Evidence responses locate source passages; matching text and citation syntax do not prove that a claim is true or complete. Compare original context and conflicting sources. An empty result can also reflect a retrieval limitation.

## Can I write manual notes?

All four variants implement notebook-scoped manual notes, independent of imported sources and generated drafts. A scene keeps its captured notebook target, and only one Notes editor can own a given notebook across scenes. The retained Q8 sheet policy uses SwiftUI's [`presentationPreventsAppTermination(false)`](https://developer.apple.com/documentation/swiftui/view/presentationpreventsapptermination(_:)) on macOS 15.4+ with Swift 6.1+, and a scoped, restoring [AppKit modal-window setting](https://developer.apple.com/documentation/appkit/nswindow/preventsapplicationterminationwhenmodal) on macOS 14–15.3 and earlier compiler versions; Q9 retains that presentation setting.

Q9 source gates termination before `super.terminate` can tear down Notes sheets. An early principal-class subclass provides a typed bridge; guarded one-shot approval covers the native delegate query; direct system queries use `terminateLater` and one reply. Unavailable active Notes sessions and dirty `.close` requests fail closed; pre-model startup can terminate before any Notes session exists. Thirteen Q9 source regressions cover delegate and ingress paths. Historically, Q7/v4 dirty Cmd-Q showed no alert while the same PID remained alive; Q8 dirty Cmd-Q and menu Quit exited without a prompt, and recovery restored the edit without a Save/Discard/Cancel choice. Separate Q9 prior-package evidence passed startup and dirty Cmd-Q Cancel/alert-Save/restart on all four variants; Pip Core also passed menu Discard/restart. The earlier Q9 Neutral Plus retrieval failed because its answer/excerpt cited headings without 18:00/19:00; see [public issue #6](https://github.com/ghostzy0/pip-research/issues/6).

Q10 completed 96 local cases (93 passed, 3 opt-in skips, 0 failed); both exact Q10 public heads passed hosted CI at 96/93/3/0 on Swift 6.1.2/macOS 15.7.9 arm64. On the final v7 Neutral Plus package, native macOS 27.0.1 testing returned fact-bearing 18:00 and 19:00 citations with `possibleConflict=true`; excerpt save, export and restart passed. Dirty Cmd-Q Cancel kept the same PID/edit; clicking Save in the Notes editor followed by clean Cmd-Q and same-store relaunch preserved the edit. Q10 did not test Save in the quit-choice alert; Q9 alert-Save evidence is from the separate prior package. Baseline, Pip Core, and Pip Plus passed final v7 startup/saved-note/clean-quit smoke. The scoped experimental patch is accepted for publication. Check availability and checksums at the [custom release page](https://github.com/Ghostzy0/pip-research/releases/tag/research-alpha-2026.10.25) and [Neutral Core release page](https://github.com/Ghostzy0/pip-research-replica/releases/tag/research-alpha-2026.10.25) after publication. Dock Quit, VoiceOver, macOS 14, Intel, full reference parity and general model grounding remain unverified.

## What differs between the editions?

Neutral Core and Pip Core provide the common notebook/evidence workflow. Neutral Plus and Pip Plus add notebook-scoped search over saved questions and excerpts plus saved exact citations with optional labels and annotations. Neutral Core is published separately from the three custom editions. The source versions are `0.1.2` Core and `0.2.1` Plus; current package availability and checksums are shown on the [Neutral Core release page](https://github.com/Ghostzy0/pip-research-replica/releases/tag/research-alpha-2026.10.25) and [custom editions release page](https://github.com/Ghostzy0/pip-research/releases/tag/research-alpha-2026.10.25). See [the edition matrix](EDITION-MATRIX.md).

## Does it read scanned PDFs?

No OCR is built in. PDFs need selectable text. Scan-only pages may import without useful text; use a separate OCR tool and inspect its output before importing.

## Where is data stored and how do I back it up?

Each edition has a separate Application Support folder. `Originals/` holds copied sources; `library.json` stores notebook content, extracted text, chats, notes, and saved excerpts. Pending note edits may also be in `.note-drafts/`. Storage is readable and not encrypted by this app. Close the app and back up the entire edition folder. Markdown export is useful for portable notes but is not a full library backup.

## Can I switch editions or downgrade?

Editions do not automatically migrate or merge libraries. Back up the full folder while the app is closed before changing editions or versions. Compatibility with the exact published `0.1.1`/`0.2.0` packages and note-recovery sidecars must be checked before relying on downgrade or cross-edition behavior. Never open a newer library with an older writer unless an explicit tested procedure covers it.

## Is it fully equivalent to NotebookLM?

No. Neutral Core is an experimental partial workflow recreation. Generated Studio/audio workflows, OCR, web/video/cloud imports, full reference comparison, and broad accessibility/device acceptance remain incomplete. See [parity](../PARITY.md) and [testing](../TESTING.md).
