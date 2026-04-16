# Communicable State Machine (CSM)

[English](./README.md) | [中文](./README(zh-cn).md)

[![Image](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/badge.svg?metric=installs)](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/)
[![Image](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/badge.svg?metric=stars)](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/)
[![GitHub all releases](https://img.shields.io/github/downloads/NEVSTOP-LAB/Communicable-State-Machine/total)](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/releases)

CSM is a LabVIEW framework built on JKI State Machine for **communicable, reusable modules**.  
It formalizes module collaboration into message and broadcast contracts, which improves maintainability and scalability in medium/large systems.

- CSM Wiki: <https://nevstop-lab.github.io/CSM-Wiki/>
- JKI State Machine: <http://jki.net/state-machine/>

![image](.doc/_img/csm-intro.png)

## Why CSM

Compared with ad-hoc message conventions, CSM provides:

- **Unified collaboration syntax**: sync (`-@`), async (`->`), fire-and-forget (`->|`), register/unregister (`-><register>`, `-><unregister>`).
- **Stable module contracts**: API, broadcast, and attribute interfaces can be documented and reviewed independently.
- **Higher module reusability**: modules can run in CSM orchestration and still be consumed by non-CSM callers.
- **Composability**: worker mode, chain mode, global log handling, and status routing patterns.

## Repository Design

This repository focuses on three layers:

1. **Core runtime and APIs** for message parsing, dispatching, routing, and lifecycle control.
2. **Templates and helper assets** for rapidly building CSM-compatible modules.
3. **Examples and testcase assets** for practical integration patterns.

## Module Relationship and Integration Paths

CSM emphasizes contract-based collaboration between modules:

- **CSM caller → CSM module**: direct collaboration via CSM messages and broadcasts.
- **Non-CSM caller → CSM module**: integration via Post/Send Message APIs and status events.

This allows incremental adoption in existing projects.

## UI Template Differences

Two common UI-related template styles:

- **With Event Structure**: suitable for UI-centric modules with front-panel event handling.
- **Without Event Structure**: suitable for service/headless modules or strict message-loop-driven logic.

Choose based on module responsibilities, not personal coding preference.

## Interface Documentation

Detailed interface descriptions are moved out of README:

- Module interface doc (EN): [docs/CSM-Module-Interface.md](./docs/CSM-Module-Interface.md)
- 模块接口文档 (ZH): [docs/CSM-Module-Interface(zh-cn).md](./docs/CSM-Module-Interface(zh-cn).md)

Full API indexes:

- English API index: [VI Description(en-us)](./src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description/VI%20Description(en-us)/VI%20Description(en-us).md)
- 中文 API 索引: [VI Description(zh-cn)](./src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description/VI%20Description(zh-cn)/VI%20Description(zh-cn).md)
