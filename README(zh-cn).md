# 可通信状态机（Communicable State Machine, CSM）

[English](./README.md) | [中文](./README(zh-cn).md)

[![Image](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/badge.svg?metric=installs)](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/)
[![Image](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/badge.svg?metric=stars)](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/)
[![GitHub all releases](https://img.shields.io/github/downloads/NEVSTOP-LAB/Communicable-State-Machine/total)](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/releases)

CSM 是建立在 JKI State Machine 之上的 LabVIEW 框架，目标是构建**可通信、可复用**的模块体系。  
它将模块协作抽象为消息与广播契约，在中大型系统中更易维护与扩展。

- CSM Wiki：<https://nevstop-lab.github.io/CSM-Wiki/>
- JKI State Machine：<http://jki.net/state-machine/>

![image](.doc/_img/csm-intro.png)

## CSM 的优势

相较于项目内自行约定字符串通信，CSM 提供：

- **统一协作语法**：同步（`-@`）、异步（`->`）、异步无返回（`->|`）、注册/取消注册（`-><register>`、`-><unregister>`）。
- **稳定模块契约**：API、广播、属性接口可独立定义与评审。
- **更强复用能力**：模块既可在 CSM 内协作，也可被非 CSM 调用方集成。
- **可组合架构模式**：协作者模式、责任链模式、全局日志与状态路由等。

## 本仓库的设计内容

本仓库聚焦三层能力：

1. **核心运行时与 API**：消息解析、分发、路由、生命周期控制。
2. **模板与辅助资源**：快速创建 CSM 兼容模块所需模板与工具。
3. **示例与测试资源**：用于落地验证的示例工程与 testcase 资产。

## 模块间关系与接入路径

CSM 采用“基于契约”的模块协作关系：

- **CSM 调用方 → CSM 模块**：通过 CSM 消息与广播直接协作。
- **非 CSM 调用方 → CSM 模块**：通过 Post/Send Message API 与状态事件集成。

这让旧项目可以渐进式引入 CSM。

## UI 模板差异

常见两类 UI 相关模板：

- **带 Event Structure**：适合 UI 事件驱动明显的模块。
- **不带 Event Structure**：适合服务型/无界面模块，或严格消息循环驱动的模块。

应按模块职责选择模板，而不是按个人习惯选择。

## 接口文档

README 不再展开接口细节，统一引用模块文档：

- 模块接口文档（中文）：[docs/CSM-Module-Interface(zh-cn).md](./docs/CSM-Module-Interface(zh-cn).md)
- Module interface doc (EN): [docs/CSM-Module-Interface.md](./docs/CSM-Module-Interface.md)

完整 API 索引：

- 中文 API 索引：[VI Description(zh-cn)](./src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description/VI%20Description(zh-cn)/VI%20Description(zh-cn).md)
- English API index: [VI Description(en-us)](./src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description/VI%20Description(en-us)/VI%20Description(en-us).md)
