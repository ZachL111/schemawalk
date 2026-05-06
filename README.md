# schemawalk

`schemawalk` is a Ruby project for Databases. It turns plan reversible migrations and flag destructive schema operations into a small local model with readable fixtures and a direct verification command.

## Reading Schemawalk

Start with the README, then open `metadata/project.json` to check the constants behind the examples. After that, `fixtures/cases.csv` shows the compact path and `examples/extended_cases.csv` gives a wider look at the same rule.

## What It Does

- Includes extended examples for fixture rows, including `recovery` and `degraded`.
- Documents constraint behavior tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.
- Stores project constants and verification metadata in `metadata/project.json`.
- Adds a repository audit script that checks structure before running the language verifier.

## Purpose

This is not a wrapper around a service. It is a self-contained project that shows how the model behaves when demand, capacity, latency, risk, and weight move in different directions.

## Files Worth Reading

- `lib`: library code
- `tests`: verification harness
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Design Sketch

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps schema shape, query checks, and fixture rows in one explicit decision path. The threshold is 150, with risk penalty 7, latency penalty 4, and weight bonus 4. The Ruby code keeps the module small and leans on Minitest for direct fixture checks.

## Usage

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Fixture Notes

`surge` is the first example I would inspect because it lands on the `accept` path with a score of 156. The broader file also keeps `degraded` at -81 and `recovery` at 181, which gives the model a useful low-to-high spread.

## Verification

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Limits

The examples cover useful edges, not every edge. A larger version would add malformed-input tests, richer reports, and deeper domain parsers.

## Next Directions

- Add a comparison mode that shows how decisions change when one signal is adjusted.
- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add a short report command that prints the score breakdown for a single scenario.
- Add one more databases fixture that focuses on a malformed or borderline input.

## Setup

Use a normal shell with Ruby available on `PATH`. The verifier is written as a PowerShell script because the portfolio was assembled on Windows.
