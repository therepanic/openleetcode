<p align="center">
  <picture>
    <source media="(prefers-color-scheme: light)" srcset="assets/logo_light.svg">
    <img alt="openleetcode" src="assets/logo_dark.svg" width="760">
  </picture>
  <br>
  <em>"There are no magic machines and no magic operators." - DHH</em>
  <br>
  <br>
  <a href="https://www.haskell.org/"><img alt="Made in Haskell" src="https://img.shields.io/badge/made%20in-Haskell-5e5086?style=flat"></a>
  <a href="https://www.haskell.org/cabal/"><img alt="Build with Cabal" src="https://img.shields.io/badge/build-Cabal-1f6feb?style=flat"></a>
  <a href="tests"><img alt="Supported problems" src="https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/therepanic/openleetcode/main/.badges/problems.json"></a>
  <a href="https://github.com/therepanic/openleetcode/actions/workflows/ci.yml"><img alt="ci" src="https://img.shields.io/github/actions/workflow/status/therepanic/openleetcode/ci.yml?branch=main&label=ci&style=flat&logo=github&logoColor=white"></a>
  <a href="https://unlicense.org/"><img alt="License Unlicense" src="https://img.shields.io/badge/license-Unlicense-lightgrey?style=flat"></a>
</p>

openleetcode is a local LeetCode runner built around open test suites, made in Haskell.

It takes a normal solution file, finds the matching problem manifest, builds a tiny language-specific harness, sends it to a pluggable execution backend, and judges the result locally. The tests live in the repo. The runtime templates live in the repo. The CLI is just the glue.

```console
$ openleetcode submit ./solution.py --id 1
$ openleetcode submit ./solution.rs --title two-sum
```

## Demo

<p align="center">
  <img src="assets/demo.gif" alt="openleetcode demo" width="860">
</p>

## Install

You need Docker for the execution backend. On Linux and macOS the installer will try to start the default Piston backend for you through Docker Compose.

Linux and macOS:

```sh
curl -fsSL https://raw.githubusercontent.com/therepanic/openleetcode/main/install.sh | sh
```

Windows PowerShell:

```powershell
irm https://raw.githubusercontent.com/therepanic/openleetcode/main/install.ps1 | iex
```

On Windows, the installer only installs the CLI. Bring Docker yourself and start the backend manually.

Docker:

```sh
curl -fsSL https://raw.githubusercontent.com/therepanic/openleetcode/main/openleetcode.yml -o openleetcode.yml
curl -fsSL https://raw.githubusercontent.com/therepanic/openleetcode/main/backends/piston/docker-compose.yml -o piston.yml
docker compose -f openleetcode.yml -f piston.yml run --rm openleetcode submit ./solution.py --id 1
```

## Backend

openleetcode currently uses [Piston](/backends/piston/docker-compose.yml) as its execution backend. The default config points to:

```text
http://localhost:2000
```

From a checkout, start the bundled backend with:

```sh
docker compose -f backends/piston/docker-compose.yml up -d
```

Then check the CLI config:

```console
$ openleetcode config list
$ openleetcode config set backend.url http://localhost:2000
```

## Usage

Download the latest public data assets:

```console
$ openleetcode download all
```

Run a solution by problem id:

```console
$ openleetcode submit ./two_sum.py --id 1
```

Run a solution by title:

```console
$ openleetcode submit ./solution.cpp --title "two-sum"
```

Override language detection when the file extension is ambiguous:

```console
$ openleetcode submit ./main.abc --id 1 --lang python3
```

Update openleetcode:

```console
$ openleetcode update
```

## Languages

The runner has templates for:

```text
cpp, rust, python3, python2, ruby, java, csharp, kotlin, go, dart, swift, typescript
```

Each runtime provides the small compatibility layer LeetCode problems tend to need: JSON output, arrays, matrices, linked lists, binary trees, etc. Imports and common libraries are kept close to the [official LeetCode environments](https://support.leetcode.com/hc/en-us/articles/360011833974-What-are-the-environments-for-the-programming-languages), so a solution should look like a normal LeetCode submission, not a custom openleetcode program.

## Contributing

For code changes, you need a Haskell toolchain with Cabal.

Build the CLI:

```console
$ cabal build exe:openleetcode
```

Run the test suites:

```console
$ cabal test core-tests
$ cabal test cli-tests
```

Run the built executable directly:

```console
$ cabal run openleetcode
```

## Contributing Without Code

Start with [TEST_FORMAT.md](TEST_FORMAT.md). Seriously. It is the contract between the YAML, the runtime templates, and the judge.

Every problem is a directory with a `manifest.yaml`:

```text
tests/1-500/1. two-sum/manifest.yaml
tests/1-500/1. two-sum/sol.py
tests/1-500/1. two-sum/sol.cpp
```

There are helper scripts too, because we are all human and writing the 39th edge case by hand is how people start bargaining with spreadsheets.

```console
$ python generate_prompt.py two-sum
$ python spartan.py --skip 0 --limit 10 --no-generate --concurrency 5
$ python molotov.py --skip 0 --limit 10 --concurrency 5
```

`generate_prompt.py` builds a prompt for one LeetCode problem from its statement, code snippets, and a reference Python solution. `spartan.py` does the same in batches and can ask an LLM through [OpenRouter](https://openrouter.ai/) to draft manifests into `generated_problems/` when `OPENROUTER_API_KEY` is set. `molotov.py` fills in `sol.{lang}` files from those generated folders, reusing `prompt.txt` and `sol.py`. Treat the output like a junior contributor with infinite patience: useful, fast, and still very much in need of review.

## Status

openleetcode is young and some manifests will be better than others. That is fine. The whole point is that the judge and tests are not sealed away somewhere.
