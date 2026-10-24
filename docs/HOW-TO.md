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

The source routes normal AppKit termination through a deferred Save/Discard/Cancel coordinator and has four bridge tests for its exactly-once reply. This is not packaged UI acceptance: exercise Dock, app menu, Cmd-Q, window close, multiple windows, pending writes, and cancellation before claiming the quit flow is accepted.

## Qualification status

On 24 October 2026, the default source suite completed 80 cases: 77 passed, 3 opt-in live-writer cases skipped, 0 failures. All four source-declared release products built and passed ad-hoc signature verification and private-path string scans. These checks do not demonstrate the native workflow described above, accessibility, full reference parity, or public release of the intended `0.1.2`/`0.2.1` packages. The previous alpha links and current evidence boundaries are in [publication history](PUBLICATION.md) and [testing](../TESTING.md).

## Optional local drafting

Local Qwen drafting is off by default, experimental, and requires a separately installed local service and verified model. One bounded synthetic Qwen3 1.7B response contained the requested citation IDs and named the source conflict, but added a misleading interpretation of the source dates. The separate opt-in conflict-plus-persistence and hostile-source cases passed; absent-fact failed two expectations: asked for public-holiday hours, it returned `The station garden closes at 18:00 on weekdays [1].` without acknowledging that the source only gives weekday hours. It did not explicitly invent holiday hours. Do not treat generated text as verified evidence; see [local drafting details](LOCAL-DRAFTING.md).
