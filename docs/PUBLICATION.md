# Publication and package verification

Source is published in [pip-research](https://github.com/Ghostzy0/pip-research) (three editions) and [pip-research-replica](https://github.com/Ghostzy0/pip-research-replica) (Neutral Core only). Both are original, partial workflow implementations.

[Passing hosted verification](https://github.com/Ghostzy0/pip-research/actions/runs/39892436060) ran the tests and all owned release builds on macOS 15.7.9 arm64 / Swift 6.1.2. Independent local review checked both export inventories, privacy scans, shared-source equality, signatures, identifiers and bundled resources. A fresh remote clone matched every audited payload hash.

The common ResearchCore manifest SHA-256 is `c0f5d6e969b4d21dfed7f027a39bf90ea4193c4f1783695b374ba6ec7ba536e9`. The initial reviewed public source pins are [custom ad90ca7](https://github.com/Ghostzy0/pip-research/commit/ad90ca71b80f1231e4cf4f95318026dad7f25f33) and [replica 806ba66](https://github.com/Ghostzy0/pip-research-replica/commit/806ba66d12e3fd77a3fa222cd9f51a40743ea920). Later documentation commits do not change this source pin.

## Package identities

These local arm64 packages were rebuilt from the reviewed source on macOS 27.0.1 / Swift 6.4, with profile-specific setup resources. Copied executables were stripped before ad-hoc signing. They are not Developer ID signed or notarized. Release availability and final native smoke results are stated in the repository's release notes; this table does not itself claim a published download or complete native acceptance. Archive SHA-256 values are supplied with each actual release in SHA256SUMS.txt and ARTIFACTS.json.

| App | Executable SHA-256 |
| --- | --- |
| Research Baseline Enhanced 0.2.0 | `660b28ca23ffd6cd245dc2537239e11538408e89e4c547f71ddb1d659574ea8e` |
| Pip Research 0.1.1 | `0603aab64d6339003640cf5b3579872d03a3bae3df4e135cf5d130e5667b8f4b` |
| Pip Research Enhanced 0.2.0 | `77bfe953dbf40c6bd85cf500bedb3ebe43be934f639518a5d401291dd0cf2030` |

## Remaining boundaries

One earlier exact-build synthetic note check restored Unicode text after controlled termination, then saved and cleared the recovery sidecar. Its screenshots show post-restore state, not the restore prompt. Cmd-Q in a dirty Notes modal remains unresolved. Full reference parity, generated Studio workflows, VoiceOver, reduced-motion human acceptance, Intel and macOS 14 runtime coverage remain incomplete. Optional Qwen drafting failed attribution and source-agreement checks and stays off by default and unaccepted.
