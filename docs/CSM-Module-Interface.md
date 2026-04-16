# `Communicable State Machine (CSM)` — Module Interface Documentation

## Overview

`Communicable State Machine (CSM)` extends JKI State Machine with standard module-collaboration contracts.

Its goals are:

- unify inter-module calls with readable message syntax,
- decouple module internals from module collaboration,
- make modules reusable both inside and outside CSM systems.

---

## Module Information

| Property | Value |
| --- | --- |
| LabVIEW Version | 2017 (current CI environment) |
| Supported OS | Windows (CI runner platform) |
| RT Support | ❌ Not declared |
| 64-bit Support | ✅ Supported |
| Module Group | `Communicable State Machine(CSM)` |

---

## Dependencies

| Dependency | Type |
| --- | --- |
| [JKI State Machine](http://jki.net/state-machine/) | Required |
| [Communicable-State-Machine](https://github.com/NEVSTOP-LAB/Communicable-State-Machine) | Required |
| [CSM-API-String-Arguments-Support](https://github.com/NEVSTOP-LAB/CSM-API-String-Arguments-Support) | Optional |
| [CSM-MassData-Parameter-Support](https://github.com/NEVSTOP-LAB/CSM-MassData-Parameter-Support) | Optional |
| [CSM-INI-Static-Variable-Support](https://github.com/NEVSTOP-LAB/CSM-INI-Static-Variable-Support) | Optional |

---

## API Interfaces (Message Interfaces)

Detailed API interfaces are maintained in official API docs:

- [API Index (EN)](../src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description/VI%20Description(en-us)/VI%20Description(en-us).md)
- [API 索引 (ZH)](../src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description/VI%20Description(zh-cn)/VI%20Description(zh-cn).md)

> README no longer duplicates detailed API lists; use this document and the API index as the source of truth.

### Parameter Types (Summary)

| Type | Description |
| --- | --- |
| `APIString` | Plain text argument type for external string contracts |
| `HexStr` | Variant serialized into hex string |
| `SafeStr` | Special-character-safe encoded string |
| `MassData` | Large payload transfer via buffer mapping (plugin required) |
| Custom | Module-defined string protocol |

---

## Broadcast Interfaces

CSM uses three broadcast behaviors:

- `Status`: normal-priority broadcast,
- `Interrupt`: high-priority broadcast,
- `State`: implicit state-completion broadcast (requires registration).

See the API index for concrete broadcast and registration interfaces.

---

## Attribute Interfaces

CSM modules can expose attributes via:

- `CSM - Get Module Attribute.vi`
- `CSM - Set Module Attribute.vi`

Use native LabVIEW simple types (String / Boolean / DBL / I32) for stable external contracts.

---

## Constraints and Notes

> [!IMPORTANT]
>
> - Synchronous calls (`-@`) require an existing target and timeout-safe replies.
> - Asynchronous calls (`->` / `->|`) do not block the caller.
> - Registrations can be internal (auto-cleanup on module exit) or external (manual unregister required).
> - For reusable modules, keep external API/broadcast contracts stable and independent from internal state implementation.

---

## Usage Examples

### Basic Message Calls

```csm
API: Initialize >> config.ini -@ TargetModule
API: Start -@ TargetModule
API: Stop ->| TargetModule
```

### Register / Unregister Status

```csm
StatusName@SourceModule >> API: OnStatus@TargetModule -><register>
StatusName@SourceModule >> API: OnStatus@TargetModule -><unregister>
```

---

- _Full syntax reference: <https://github.com/NEVSTOP-LAB/Communicable-State-Machine/blob/main/.doc/Syntax.md>_
- _CSM Wiki: <https://nevstop-lab.github.io/CSM-Wiki/>_
