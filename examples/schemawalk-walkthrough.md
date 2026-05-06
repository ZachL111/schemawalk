# Schemawalk Walkthrough

This note is the quickest way to read the extra review model in `schemawalk`.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | index fit | 119 | watch |
| stress | join width | 157 | ship |
| edge | constraint risk | 201 | ship |
| recovery | plan drift | 226 | ship |
| stale | index fit | 173 | ship |

Start with `recovery` and `baseline`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

`recovery` is the optimistic case; use it to make sure the scoring path still rewards strong signal.
