# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

GBFiscAllReader (unit prefix `GBFR`) is a Delphi framework that parses Brazilian fiscal XML documents (NFe/NFCe, CTe, SAT/CFe, NFSe, NFe Avulsa) into strongly-typed Delphi object models. It has no UI of its own; consumers call a reader interface with XML content/file/stream and get back a populated model object.

## Solution layout

- `Source/<Module>/` — framework code per document type: `CTe`, `NFe`, `NFeAvulsa`, `NFSe`, `SAT`. No project group ties these together; each module is just a folder of units pulled in by whichever `.dpr` references it.
- `Source/XML/GBFR.XML.Base.pas` — shared base class `TGBFRXmlBase`, used by every module's `*.XML.Default.pas`. Provides XML-loading (`LoadXmlContent`/`LoadXmlFile`) and typed node getters (`GetNodeStr`, `GetNodeInt`, `GetNodeFloat`, `GetNodeCurrency`, `GetNodeDate`, `GetNodeBoolInt`) built on `Xml.XMLIntf`/`Xml.XMLDoc`. Also owns a hand-rolled ISO8601 date parser — do not swap in a generic date-parsing routine without checking `Iso8601ToDateTime`'s length-based branches.
- `Tests/<Module>/` — one DUnitX test project per module, each with its own `.dproj`/`.dpr` (`GBFRNFeTest`, `GBFRCTeTest`, `GBFRSATTest`, `GBFRNFSeTest`, `GBFRNFeAvulsaTest`).
- `Tests/GBFRTests.groupproj` — only wires up `NFe` and `CTe` test projects currently; `SAT`, `NFSe`, and `NFeAvulsa` tests must be built/run via their own `.dproj` (see Build/test commands below).
- `Samples/` — two standalone VCL demo apps (`GBNFeReader`, `GBCTeReader`) under `Samples/GBFRSamples.groupproj`, showing how to wire the reader interfaces into a form.
- `Docs/` — SEFAZ manual/layout PDFs (NFe and CTe) used as the spec reference when extending parsing.

## Per-module architecture (repeats for every document type)

Each module follows the same three-layer shape — when adding a field or a new document variant, touch all three:

1. **`GBFR.<Module>.Model.*.pas`** — plain Delphi classes (no interfaces) representing the document tree, e.g. `GBFR.NFe.Model.pas` (root `TGBFRNFeModel`), `GBFR.NFe.Model.Ide.pas`, `GBFR.NFe.Model.Item.pas`, `GBFR.NFe.Model.Imposto.*.pas` (one file per tax type: ICMS, PIS, COFINS, IPI, II, ISSQN), etc. `GBFR.<Module>.Model.Types.pas` holds enums/type aliases for the module. `GBFR.<Module>.Model.Classes.pas` (NFe/CTe) is a re-export/aggregation unit.
2. **`GBFR.<Module>.XML.Interfaces.pas`** — defines the public reader interface (e.g. `IGBFRNFeXML` with `loadFromContent`/`loadFromFile`/`loadFromStream`) and a module-level factory function (e.g. `XMLNFeReader: IGBFRNFeXML`) that consumers actually call. This is the only unit external code should depend on.
3. **`GBFR.<Module>.XML.Default.pas`** — the concrete parser, `TGBFR<Module>XMLDefault = class(TGBFRXmlBase, IGBFR<Module>XML)`. Parsing is broken into one `LoadTag<Section>` private method per XML section (e.g. `LoadTagIde`, `LoadTagEmit`, `LoadTagDetItem`, `LoadTagImpostoICMS`), each walking `IXMLNode`s via `GetNode*`/`LoadTag` from the base class and populating the corresponding Model object. Has a `class function New: IGBFR<Module>XML` factory.

**Note:** `Source/NFeAvulsa` (currently untracked/new) diverges slightly from this convention — its interface uses `LoadFromContent`/`LoadFromFile` (capitalized) and factory function `GetNFeAvulsaXML` instead of the `loadFromContent`/`XML<Module>Reader` pattern used by NFe/CTe/SAT. Match whichever convention the module you're editing already uses; don't silently "fix" the inconsistency across modules in an unrelated change.

NFSe is the outlier: it supports multiple provider layouts (`GBFR.NFSe.XML.Abrasf204.pas`, `GBFR.NFSe.XML.IssNetOnline.pas`) behind a shared `GBFR.NFSe.XML.Interfaces.pas`, each provider with its own Model/Interfaces/Default trio.

## Build

Requires Delphi/RAD Studio (project files target `ProjectVersion 19.4`, Win32 platform). Build from the Delphi IDE or via `msbuild` per `.dproj`:

```bash
msbuild Tests/NFe/GBFRNFeTest.dproj /t:Build /p:Config=Debug /p:Platform=Win32
```

Or build a whole group (NFe + CTe tests only):

```bash
msbuild Tests/GBFRTests.groupproj /t:Build /p:Config=Debug /p:Platform=Win32
```

SAT, NFSe, and NFeAvulsa tests are not in that group — build their `.dproj` files individually:

```bash
msbuild Tests/SAT/GBFRSATTest.dproj /t:Build /p:Config=Debug /p:Platform=Win32
msbuild Tests/NFSe/GBFRNFSeTest.dproj /t:Build /p:Config=Debug /p:Platform=Win32
msbuild Tests/NFeAvulsa/GBFRNFeAvulsaTest.dproj /t:Build /p:Config=Debug /p:Platform=Win32
```

## Tests

All test projects use **DUnitX**. Each `.dpr` supports two run modes:
- **TestInsight** (`{$IFDEF TESTINSIGHT}`) — run tests from inside the IDE via the TestInsight plugin, which gives per-test results without a full rebuild-and-launch cycle. Preferred during interactive development.
- **Standalone console** (default) — the compiled `.exe` runs all `[TestFixture]`/`[Test]` classes via RTTI and prints results to console plus an NUnit-format XML file; used for CI.

To run a module's full suite standalone after building:

```bash
Tests/NFe/Win32/Debug/GBFRNFeTest.exe
```

There is no test-name filtering flag wired up beyond DUnitX's built-in command-line options (`TDUnitX.CheckCommandLine`) — to run a single test, use TestInsight from the IDE, or temporarily restrict the test project's compiled units.

Test XML fixtures are embedded as resources (`.dres`/`Resources/` folders per test project) rather than read from disk at runtime; test base classes (e.g. `GBFR.NFe.Test.Base.pas`) load them via `TResourceStream` with `LoadXMLResource`/`LoadXMLResourceStream`. The NFeAvulsa test instead inlines the fixture XML directly as a Delphi multi-line string constant — check the existing test file for a module before assuming which pattern to follow.

Each test fixture class typically pairs a `[Setup]` (instantiate the reader interface, e.g. `FXml := GetNFeAvulsaXML`/`XMLNFeReader`) with one `[Test]` method per document section being asserted (`TestIde`, `TestEmit`, `TestItem`, `TestImpostoICMS`, ...) — follow that granularity (one test per section, not one giant end-to-end test) when adding coverage for a new document variant.
