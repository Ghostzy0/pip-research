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

All four variants implement notebook-scoped manual notes, independent of imported sources and generated drafts. A scene keeps its captured notebook target, and only one Notes editor can own a given notebook across scenes. The Q8 source lets termination ingress through the Notes sheet reach the existing Save/Discard/Cancel coordinator. On macOS 15.4+ with Swift 6.1+ it uses SwiftUI's [`presentationPreventsAppTermination(false)`](https://developer.apple.com/documentation/swiftui/view/presentationpreventsapptermination(_:)); macOS 14–15.3 and earlier compiler versions use a scoped, restoring [AppKit modal-window setting](https://developer.apple.com/documentation/appkit/nswindow/preventsapplicationterminationwhenmodal). The Q7/v4 native slice confirmed a failure: dirty Cmd-Q and menu Quit showed no alert, and the same PID remained alive. Synthetic note save/reopen, Done/Cancel/Save, persistence after restart, and clean main-window Quit passed on that Q7 package. Q8 has not yet been run natively, so its quit behavior remains unverified.

## What differs between the editions?

Neutral Core and Pip Core provide the common notebook/evidence workflow. Neutral Plus and Pip Plus add notebook-scoped search over saved questions and excerpts plus saved exact citations with optional labels and annotations. Neutral Core is published separately from the three custom editions. Intended next versions are `0.1.2` Core and `0.2.1` Plus; they are not yet published. See [the edition matrix](EDITION-MATRIX.md).

## Does it read scanned PDFs?

No OCR is built in. PDFs need selectable text. Scan-only pages may import without useful text; use a separate OCR tool and inspect its output before importing.

## Where is data stored and how do I back it up?

Each edition has a separate Application Support folder. `Originals/` holds copied sources; `library.json` stores notebook content, extracted text, chats, notes, and saved excerpts. Pending note edits may also be in `.note-drafts/`. Storage is readable and not encrypted by this app. Close the app and back up the entire edition folder. Markdown export is useful for portable notes but is not a full library backup.

## Can I switch editions or downgrade?

Editions do not automatically migrate or merge libraries. Back up the full folder while the app is closed before changing editions or versions. Compatibility with the exact published `0.1.1`/`0.2.0` packages and note-recovery sidecars must be checked before relying on downgrade or cross-edition behavior. Never open a newer library with an older writer unless an explicit tested procedure covers it.

## Is it fully equivalent to NotebookLM?

No. Neutral Core is an experimental partial workflow recreation. Generated Studio/audio workflows, OCR, web/video/cloud imports, full reference comparison, and broad accessibility/device acceptance remain incomplete. See [parity](../PARITY.md) and [testing](../TESTING.md).
