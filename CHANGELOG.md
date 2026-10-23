# Changelog

## 0.2.0-alpha.1 — experimental, under qualification

This repository profile contains Neutral Plus, Pip Core and Pip Plus. They share the in-process ResearchCore and ResearchDesktop implementation, keep separate Application Support folders, and use distinct executable products and bundle identifiers. Neutral Core is distributed only by the separate planned replica repository.

Current source implements manual research notes and interrupted-session draft recovery in all four editions. One controlled native SIGTERM recovery flow passed for a synthetic Unicode note; a dirty-modal Cmd-Q attempt showed no visible quit or alert and remains unresolved.

The shared default suite completed 68 cases (67 passed, one opt-in live test skipped, zero failures). After the package audit found local debug metadata in the first artifacts, all four bundles were refreshed from the qualified release binaries with local debug metadata stripped before signing. Refreshed bundles passed signature and private-path checks with the original LICENSE and NOTICES bundled.

Both v3 profile exports subsequently passed independent fresh local-clone test/build/signature checks: three custom products and one replica product. Native manual-notes interaction review, broader interface accessibility review and public remote publication remain pending.

Enhanced editions add notebook-scoped search over saved questions and exact citation excerpts with optional labels/notes, source navigation, copy and Markdown export. These additions remain under qualification; see TESTING for the exact source/build evidence and remaining native review.

Optional local drafting is off by default and remains unaccepted. After correcting the request grammar and schema, the tested writer returned valid JSON without citations and asserted an unsupported agreement between sources; the app rejected it, saved no draft and unloaded the model. No full NotebookLM/Gemini Notebook parity or stable-production claim is made.
