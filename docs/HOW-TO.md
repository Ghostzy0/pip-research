# How to try Pip Research

Pip Research is an experimental local macOS notebook. This guide uses synthetic sample sources so you can check the workflow without importing personal documents.

## Build and open an edition

Install Swift 6 from Xcode or Apple's Command Line Tools on macOS 14 or newer. From the repository root, run:

```sh
swift test --jobs 2
./scripts/build.sh pip
open 'dist/Pip Research.app'
```

This repository profile builds Pip Core, Neutral Plus and Pip Plus (`baseline-enhanced`, `pip`, `pip-enhanced`). Neutral Core (`baseline`) is excluded here and belongs to the separately planned `pip-research-replica` repository. Enhanced builds use `baseline-enhanced` or `pip-enhanced`; see the [edition matrix](EDITION-MATRIX.md) for versions, identifiers and separate storage folders. Local builds are ad-hoc signed, not Developer ID signed or notarised. Never disable macOS security globally.

## Ask a question and check the evidence

1. Choose **Try sample research** in Pip, or **Open sample research** in the neutral baseline. The sample contains synthetic Markdown, text and a two-page PDF with dates and a conflicting closing time.
2. Select the sources that should support your question.
3. Ask the suggested question. Check the answer against each source, especially where the sources disagree.
4. Open a citation to inspect the exact passage, page or heading. For a PDF, verify the highlighted page and sentence in the original copy.
5. Ask about the sample budget to exercise a PDF citation. If no evidence appears, try wording that matches the source and inspect the source list; an empty result does not prove the information is absent.
6. Export the notebook as Markdown if you want a readable copy outside the app.

## Save and find an excerpt

In an enhanced edition, save an exact cited passage to the research collection. Add an optional label or note, then use Research tools to find saved questions or excerpts within the current notebook. Reopen the excerpt's citation to return to its source and include the saved collection in the notebook's Markdown export. Restart the app to check that the notebook, history and excerpt persist. Plain editions do not show these controls.

## Write a manual research note

All four editions include notebook-scoped manual notes, separate from imported sources and generated drafts. Open **Notes**, create a note, enter a title and body, and save; notes are included in notebook Markdown export. If the app detects an unsaved editor recovery copy, choose to restore or discard it. The feature is implemented and covered by core tests. A bounded native SIGTERM recovery check restored and saved an exact synthetic Unicode note after relaunch. Cmd-Q while the dirty editor modal was open produced no visible quit or alert; this remains unresolved, and full notes interaction acceptance is pending.

## Import your own material

Create a notebook and import a PDF, UTF-8 TXT or Markdown file. The app copies the selected source into its edition-specific Application Support directory. Limits are 30 MB per source, 2,000,000 extracted UTF-16 units and 500 PDF pages. Scanned PDFs need selectable text; there is no built-in OCR or upload service. Confirm the right sources are selected before asking.

## Back up and remove data

Close the app before copying the entire edition's Application Support folder. The app stores readable JSON and does not encrypt it; note-recovery sidecars are also readable. Removing a source keeps historical quoted text but disables its citation navigation; removing a notebook removes its chats, manual notes and saved excerpts. Deletion is not secure forensic erasure. Exported Markdown and original external files are separate and must be managed separately.

Each edition uses a different folder, with no automatic cross-edition migration. Back up before changing editions or versions. Avoid opening an enhanced library with an older-than-`0.1.1` writer because it may discard fields it does not understand. See [FAQ](FAQ.md), [Security](../SECURITY.md) and [Testing](../TESTING.md).

## Optional local drafting

Optional Qwen drafting is disabled by default and currently unaccepted. The first tested request returned non-JSON inner content. After the request schema was corrected, the pinned model returned valid JSON but omitted citations and falsely claimed that conflicting sources agreed. Strict validation rejected it; no draft was saved. The evidence workflow and manual notes work separately. Do not expect accepted generated drafts from this build. See [Local drafting details](LOCAL-DRAFTING.md).
