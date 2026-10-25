# How to try Pip Research

This guide uses the built-in synthetic sample, so you can explore without importing personal documents.

## Build and open an edition

Requires macOS 14+ and Swift 6 from Xcode or Apple's Command Line Tools. From the repository root:

```sh
./scripts/build.sh pip
open 'dist/Pip Research.app'
```

This custom repository builds Pip Core, Neutral Plus, and Pip Plus. Neutral Core is in the separate [`pip-research-replica`](https://github.com/Ghostzy0/pip-research-replica) repository. See the [edition matrix](EDITION-MATRIX.md) for versions, identifiers, and separate storage folders. Local builds are ad-hoc signed, not Developer ID signed or notarised; never disable macOS security globally.

## Ask a question and check the evidence

1. Choose **Try sample research** in Pip, or **Open sample research** in Neutral Core.
2. Select the sources to use and ask the suggested question.
3. Compare the cited passages, especially where the sources disagree.
4. Open a citation to inspect its exact passage, page, or heading. For a PDF, confirm the highlighted location in the copied source.
5. Try the sample budget question to open a PDF citation. An empty result does not prove the sources contain no answer.
6. Export the notebook as Markdown when you want a readable copy outside the app.

## Save and find an excerpt

In either Plus edition, save an exact cited passage to the research collection. Add an optional label or note, then use Research tools to search saved questions and excerpts within the notebook. Reopen the citation, export the notebook, and restart to inspect persistence. Core editions do not expose these Plus controls.

## Write a manual research note

All four editions provide notebook-scoped manual notes. Open **Notes**, create a note, edit its title/body, and save; notes appear in notebook Markdown export. Pending edits may be recovered from a local app-owned sidecar. Only one Notes editor may own a given notebook across scenes; each scene retains the notebook it opened, even if another scene changes selection.

The retained Q8 sheet policy allowed termination ingress through the Notes sheet to reach the Save/Discard/Cancel coordinator. It used SwiftUI's [`presentationPreventsAppTermination(false)`](https://developer.apple.com/documentation/swiftui/view/presentationpreventsapptermination(_:)) on macOS 15.4+ with Swift 6.1+, and a scoped `NSWindow.preventsApplicationTerminationWhenModal` fallback on macOS 14–15.3 and earlier compiler versions ([Apple AppKit documentation](https://developer.apple.com/documentation/appkit/nswindow/preventsapplicationterminationwhenmodal)). That describes historical Q8 source behavior; the later Q8 native dirty-quit gate failed. Q9 gates termination before `super.terminate` can tear down Notes sheets, installs a typed bridge through an early principal-class subclass, and uses guarded one-shot approval for native reentry; direct system queries use `terminateLater` and one reply. Unavailable active Notes sessions and dirty `.close` requests fail closed; pre-model startup can terminate before any Notes session exists. Thirteen Q9 source regressions cover delegate and ingress paths.

## Qualification status

Q10 completed 96 local cases: 93 passed, 3 opt-in live-writer cases skipped, 0 failed; all four products passed local build/package checks. Both exact Q10 public heads passed CI at 96/93/3/0 on Swift 6.1.2/macOS 15.7.9 arm64. On the final v7 Neutral Plus package, native macOS 27.0.1 testing produced fact-bearing 18:00 and 19:00 citations with `possibleConflict=true`; saving the 19:00 excerpt, exporting, and restarting the same store passed. Dirty Cmd-Q Cancel retained the same PID and edit, followed by explicit Notes editor Save, clean Cmd-Q and same-store relaunch. This did not test Save in the quit-choice alert; separate Q9 prior-package evidence covers alert Save on all four variants, and Pip Core also passed app-menu Discard. Baseline, Pip Core, and Pip Plus each passed final v7 startup/saved-note/clean-quit smoke. The historical Q9 Neutral Plus retrieval failure remains documented in [public issue #6](https://github.com/ghostzy0/pip-research/issues/6). The scoped experimental patch is accepted for publication; verify package availability/checksums at the [custom release page](https://github.com/Ghostzy0/pip-research/releases/tag/research-alpha-2026.10.25) and [Neutral Core release page](https://github.com/Ghostzy0/pip-research-replica/releases/tag/research-alpha-2026.10.25) after publication. See [publication history](PUBLICATION.md) and [testing](../TESTING.md).

## Optional local drafting

Local Qwen drafting is off by default, experimental, and requires a separately installed local service and verified model. One bounded synthetic Qwen3 1.7B response contained the requested citation IDs and named the source conflict, but added a misleading interpretation of the source dates. The separate opt-in conflict-plus-persistence and hostile-source cases passed; absent-fact failed two expectations: asked for public-holiday hours, it returned `The station garden closes at 18:00 on weekdays [1].` without acknowledging that the source only gives weekday hours. It did not explicitly invent holiday hours. Do not treat generated text as verified evidence; see [local drafting details](LOCAL-DRAFTING.md).
