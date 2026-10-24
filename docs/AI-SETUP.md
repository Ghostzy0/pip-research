# AI-assisted setup

Use this prompt with an assistant that has local filesystem and terminal access:

> Set up this checked-out Pip Research repository on my Mac. Read README and SECURITY first. Check macOS and Swift, run the default tests, build only the products listed for this profile, and show their app paths. Preserve existing notebooks and OS security settings. Do not install accounts, paid services, providers, or model weights.

## Commands

Requires macOS 14+ and Swift 6 from Xcode or Apple's Command Line Tools.

~~~sh
swift --version
swift test --jobs 2
./scripts/build.sh baseline-enhanced
./scripts/build.sh pip
./scripts/build.sh pip-enhanced
open 'dist/Research Baseline Enhanced.app'
open 'dist/Pip Research.app'
open 'dist/Pip Research Enhanced.app'
~~~

This profile contains Neutral Plus, Pip Core, and Pip Plus. Neutral Core is published separately from this repository. Every edition uses its own Application Support folder and bundle identifier. See [the edition matrix](EDITION-MATRIX.md).

The optional local Qwen writer is experimental and off by default. One bounded synthetic Qwen3 1.7B probe returned valid JSON with citation IDs and described the source conflict, but also misleadingly interpreted source dates. Separately, an opt-in live run passed conflict-plus-persistence and hostile-source cases; absent-fact failed two expectations: asked for public-holiday hours, it returned `The station garden closes at 18:00 on weekdays [1].` without acknowledging that the source only gives weekday hours. It did not explicitly invent holiday hours. One synthetic persistence case passed, but general grounding and broader persistence remain unverified. The app does not download weights or use a cloud fallback. See [local drafting](LOCAL-DRAFTING.md).

The 24 October qualification-4 source suite completed 80 cases: 77 passed, 3 opt-in live-writer cases skipped, 0 failures. All four declared products were built, signature-verified, and checked for private-path strings. These checks do not qualify native UI behavior or establish release of the next intended versions. In a separate opt-in run, conflict-plus-persistence and hostile-source passed; absent-fact failed two expectations.

Use the synthetic sample or import local PDF, UTF-8 TXT, and Markdown sources. Sources are copied into the selected edition's Application Support folder. Manual notes are local and included in Markdown exports; unsaved edits may be restored from an app-owned sidecar. A scene's Notes editor stays bound to its captured notebook. Only one Notes editor may own a notebook across scenes. Source routes normal AppKit termination through a deferred Save/Discard/Cancel coordinator; four bridge tests cover its exactly-once reply. Packaged Dock/menu/Cmd-Q/window-close behavior still needs native acceptance.

See [How to try Pip Research](HOW-TO.md) for sample scenarios, [testing](../TESTING.md) for current evidence, and [publication history](PUBLICATION.md) for published release links. Ad-hoc local signatures are not Developer ID signing or notarisation.
