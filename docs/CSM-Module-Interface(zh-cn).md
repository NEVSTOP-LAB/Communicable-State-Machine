# `Communicable State Machine (CSM)` — 模块接口文档

## 功能简述

`Communicable State Machine (CSM)` 在 JKI State Machine 基础上建立统一的模块协作契约。

核心目标：

- 用统一消息语法表达模块间调用；
- 通过接口契约降低模块耦合；
- 支持模块在 CSM 内外框架中复用。

---

## 模块信息

| 属性 | 值 |
| --- | --- |
| LabVIEW 版本 | 2017（仓库当前 CI 环境） |
| 支持的操作系统 | Windows（CI 运行平台） |
| 支持 RT | ❌ 未声明 |
| 支持 64-bit | ✅ 支持 |
| 所属模块组 | `Communicable State Machine(CSM)` |

---

## 依赖项

| 依赖 | 类型 |
| --- | --- |
| [JKI State Machine](http://jki.net/state-machine/) | 必须 |
| [Communicable-State-Machine](https://github.com/NEVSTOP-LAB/Communicable-State-Machine) | 必须 |
| [CSM-API-String-Arguments-Support](https://github.com/NEVSTOP-LAB/CSM-API-String-Arguments-Support) | 可选 |
| [CSM-MassData-Parameter-Support](https://github.com/NEVSTOP-LAB/CSM-MassData-Parameter-Support) | 可选 |
| [CSM-INI-Static-Variable-Support](https://github.com/NEVSTOP-LAB/CSM-INI-Static-Variable-Support) | 可选 |

---

## API 接口（消息接口）

详细 API 接口以官方 API 文档为准：

- [API 索引（中文）](../src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description/VI%20Description(zh-cn)/VI%20Description(zh-cn).md)
- [API Index (EN)](../src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description/VI%20Description(en-us)/VI%20Description(en-us).md)

> README 不再重复接口细节，请以本模块文档和 API 索引为准。

### 参数类型说明（摘要）

| 类型 | 说明 |
| --- | --- |
| `APIString` | 推荐的字符串外部参数类型 |
| `HexStr` | Variant 序列化后的十六进制字符串 |
| `SafeStr` | 特殊字符编码字符串 |
| `MassData` | 大块数据缓冲区传输（需插件） |
| 用户自定义 | 模块自定义字符串协议 |

---

## 状态广播接口

CSM 使用三类广播行为：

- `Status`：普通优先级广播；
- `Interrupt`：高优先级广播；
- `State`：状态完成后触发的隐式广播（需先注册）。

具体广播与注册接口请查看 API 索引。

---

## 属性接口

CSM 模块可通过以下接口读写属性：

- `CSM - Get Module Attribute.vi`
- `CSM - Set Module Attribute.vi`

建议使用 LabVIEW 原生简单类型（String / Boolean / DBL / I32）维持稳定外部契约。

---

## 调用限制与注意事项

> [!IMPORTANT]
>
> - 同步调用（`-@`）要求目标模块存在且可在超时内返回；
> - 异步调用（`->` / `->|`）不会阻塞调用方；
> - 订阅规则分内部规则（模块退出自动清理）和外部规则（需手工取消）；
> - 可复用模块应优先稳定 API/广播契约，而不是暴露内部状态机实现细节。

---

## 使用示例

### 基本消息调用

```csm
API: Initialize >> config.ini -@ TargetModule
API: Start -@ TargetModule
API: Stop ->| TargetModule
```

### 注册 / 取消注册

```csm
StatusName@SourceModule >> API: OnStatus@TargetModule -><register>
StatusName@SourceModule >> API: OnStatus@TargetModule -><unregister>
```

---

- _完整语法参考：<https://github.com/NEVSTOP-LAB/Communicable-State-Machine/blob/main/.doc/Syntax.md>_
- _CSM Wiki：<https://nevstop-lab.github.io/CSM-Wiki/>_
