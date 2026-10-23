# AI-assisted setup

Use this prompt with an assistant that has local filesystem and terminal access:

> Set up this checked-out Pip Research repository on my Mac. Read README and SECURITY first. Check macOS and Swift, run the default tests, build only the products listed by this repository profile, and show their app paths. Preserve existing notebooks and OS security settings. Do not install accounts, paid services, providers or model weights.

## Commands

Requires macOS 14+ and Swift 6+ from Xcode or Apple's Command Line Tools.

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

This repository profile contains only Neutral Plus, Pip Core and Pip Plus. The separate planned replica repository contains Neutral Core. No separate public repository has yet been verified as created.

The optional local Qwen draft path is disabled by default and unaccepted. After the request grammar and schema were corrected, the tested model returned valid JSON but omitted citations and made an unsupported agreement claim; the app rejected it and saved no draft. Evidence retrieval and citation navigation are separate. Do not promise working generated drafts.

The shared default suite completed 68 cases: 67 passed, one opt-in live test was skipped, and none failed. The v3 profile clean-clone test/build/signature checks passed: three custom products and one replica product across both profiles. The live test remains skipped because the tested local writer returned valid JSON without citations and with an unsupported claim that conflicting sources agreed; validation rejected it and saved no draft. Generation remains off by default. Packaging strips local debug metadata from the copied app executable before ad-hoc signing.

Use the synthetic sample or import your own PDF, UTF-8 TXT or Markdown sources. The app copies selected files into its own Application Support folder. Removing an imported source does not alter the external original. Back up the whole app data folder with the app closed.

Confirm the listed apps launch, use the sample, open citations and export a notebook. In enhanced editions, save and edit an exact excerpt, search within the notebook, reopen its citation and verify persistence after restart. A passing source test or build is not native, VoiceOver or full parity acceptance.
