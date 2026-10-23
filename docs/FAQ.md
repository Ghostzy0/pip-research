# Pip Research FAQ

## What is Pip Research?

Pip Research is an experimental native macOS notebook for asking questions about local PDF, UTF-8 text and Markdown sources. It retrieves passages from the sources, shows citations and can open the cited location. It is an independent project with original MIT-licensed code; it is not affiliated with NotebookLM, Gemini, Google, Apple, Ollama or Qwen.

## What do I need to build it?

Use macOS 14 or newer with Swift 6 from Xcode or Apple's Command Line Tools. Clone or download the source, then run `swift test --jobs 2` and one of this profile’s three `./scripts/build.sh` commands shown in the README. No third-party Swift packages, account, server or model weights are needed for notebook and evidence workflows. The tested host is Apple silicon on macOS 27; macOS 14 and Intel runtime acceptance have not been established.

## Does it send documents to a cloud service?

The evidence workflow is local and makes no network request. Imported documents are copied into the selected edition's Application Support folder. Optional drafting is a separate feature, disabled by default; when requested it contacts only a fixed loopback Ollama endpoint and sends the question and selected passages to that local service. It has no cloud fallback. A targeted request to the tested local Qwen model returned valid JSON but omitted every required citation marker and incorrectly said conflicting sources agreed. Strict validation rejected it; no draft was saved, and generation remains unaccepted. See [Security](../SECURITY.md) and [Local drafting](LOCAL-DRAFTING.md).

## Are answers guaranteed to be correct?

No. The core returns source passages and citations; matching text and citation syntax do not prove a claim is true or complete. Compare the original context and all conflicting sources. An empty answer can mean missing information, wording mismatch or a retrieval limitation.

## What is the difference between evidence and a draft?

An evidence answer is assembled from retrieved source passages and exact anchors. An optional generated draft is a separate synthesis request to the local writer. An earlier request returned malformed inner JSON. After the request schema was corrected, the tested model returned valid JSON but omitted required citations and falsely claimed conflicting sources agreed. The strict validator rejected it and no draft was saved. Successful drafting has not been demonstrated. Do not treat draft citations as proof of grounding.

## Can I write manual notes?

Yes. All four editions have notebook-scoped manual notes, separate from imported sources and generated content. Notes are stored as readable text in the local library and included in notebook Markdown exports. Unsaved editor text may be recovered atomically from a `.note-drafts/` sidecar in the same app-support folder; the editor offers an explicit restore or discard choice. The implementation and core tests are in place. One controlled native SIGTERM recovery restored and saved a synthetic Unicode note after relaunch. Cmd-Q while the dirty editor modal was open showed no visible quit or alert; full native interaction review remains pending.

## Can I search my saved research?

The enhanced editions add notebook-scoped search over saved question history and saved evidence excerpts. They do not provide web search or a full-text search engine across every original document. The plain editions do not expose Research tools. See the [edition matrix](EDITION-MATRIX.md).

## Does it read scanned PDFs?

No OCR is built in. PDFs need selectable text. Scan-only pages may import without useful text; run an OCR tool separately if you need searchable text, and review the resulting document before importing it.

## Where is data stored and how do I back it up?

Each edition has a separate Application Support folder. `Originals/` holds copied sources; `library.json` stores notebook content, extracted text, chats, manual notes and saved excerpts. Unsaved manual-note drafts may be stored in `.note-drafts/` inside that same folder. Storage is readable and is not encrypted by this app. Close the app and copy the entire relevant folder to back it up. Markdown export is useful for portable notes, but does not replace a full library backup.

## What happens when I delete a source or notebook?

Removing a source invalidates citation navigation but retains earlier quoted evidence in chat history and saved excerpts. Removing an excerpt removes that saved item. Removing the notebook removes its chats and saved excerpts too. Cleanup is not secure forensic erasure, and exported files or external originals remain under your control.

## Can I switch editions or downgrade?

The editions use separate default folders and do not automatically migrate or merge libraries. Back up the entire folder while the app is closed before changing versions or editions. Do not open an enhanced library with a writer older than `0.1.1`: it may ignore or discard fields it does not recognize. Current `0.1.1` baseline code can preserve saved excerpts while hiding enhanced controls; that is not a cross-edition migration interface.

## Is it fully equivalent to NotebookLM?

No. Full generative and studio workflows, OCR, web/video/cloud imports, signed-in reference comparison and broader accessibility/device acceptance remain incomplete. Manual notes are implemented in all editions. One controlled SIGTERM recovery flow passed, but Cmd-Q while the dirty editor modal was open showed no visible quit or alert; full native notes workflow and reference review remain pending. See [parity](../PARITY.md) for the current scope.
