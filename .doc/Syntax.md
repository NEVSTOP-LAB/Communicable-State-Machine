# CSM Syntax Reference / CSM 语法参考

> **中文说明** 见各节中文部分。全文双语（English / 中文）。
>
> **English description** is provided alongside each Chinese section. Fully bilingual.

---

## Quick Reference — 速查表

```c++
// =========================================================
// CSM State / Message Syntax — CSM 状态/消息语法
// =========================================================

// --- Local State (no target) / 本地状态（无目标）---
StateName >> Arguments
StateName                   // arguments omitted / 省略参数

// --- Synchronous Call / 同步调用 ---
// Sending module BLOCKS until reply or timeout
// 发送方阻塞直到收到回复或超时
API: xxxx >> Arguments -@ TargetModule

// --- Asynchronous Call (with reply) / 异步调用（有返回）---
// Sending module continues; reply handled in "Async Response"
// 发送方继续执行；回复在 "Async Response" 状态处理
API: xxxx >> Arguments -> TargetModule

// --- Asynchronous Call (no reply) / 异步调用（无返回）---
// Sending module continues; NO reply is ever sent back
// 发送方继续执行；目标模块处理完毕后不回复
API: xxxx >> Arguments ->| TargetModule

// =========================================================
// Broadcast Syntax — 广播语法
// =========================================================

// --- Normal-priority broadcast / 普通优先级广播（三种等价写法）---
Status >> StatusArguments -><status>
Status >> StatusArguments -><broadcast>
Status >> StatusArguments -><all>

// --- High-priority interrupt broadcast / 高优先级中断广播 ---
Interrupt >> StatusArguments -><interrupt>

// =========================================================
// Subscription Syntax — 订阅语法
// =========================================================

// --- Register / 注册订阅 ---
// When SourceModule broadcasts Status, send API to TargetModule
// 当 SourceModule 广播 Status 时，向 TargetModule 发送 API
Status@SourceModule >> API@TargetModule -><register>

// Internal rule (auto-removed on module exit, TargetModule omitted)
// 内部规则（模块退出时自动删除，省略 TargetModule）
Status@SourceModule >> API -><register>

// Wildcard: subscribe to Status from ALL modules
// 通配符：订阅所有模块的 Status
Status@* >> API@TargetModule -><register>

// --- Register with priority override / 注册时覆盖优先级 ---
// Always receive as normal priority (status)
// 始终以普通优先级接收
Status@SourceModule >> API@TargetModule -><register as status>

// Always receive as high priority (interrupt)
// 始终以高优先级（中断）接收
Status@SourceModule >> API@TargetModule -><register as interrupt>

// --- Unregister / 取消订阅 ---
Status@SourceModule >> API@TargetModule -><unregister>

// =========================================================
// Comments — 注释
// =========================================================

// Use "//" to add a comment — everything to the right is ignored
// 使用 "//" 添加注释，右侧内容全部被忽略
UI: Initialize  // This initializes the UI / 初始化 UI
// Another comment line / 另一行注释
```

---

## 1. State / Message Syntax — 状态与消息语法

### 1.1 Local State (No Target) — 本地状态（无目标模块）

```
StateName >> Arguments
```

**English:** Adds a state to the local module's state queue. `>>` separates the state name from its arguments. If there are no arguments the `>>` can be omitted.

**中文：** 将状态加入本地模块的状态队列。`>>` 分隔状态名与参数。若无参数可省略 `>>`。

```
// Examples / 示例
Macro: Initialize
DoSth: DoA >> SomeArguments
UI: Update >> <HEXSTR>0A1B2C3D
```

---

### 1.2 Synchronous Call — 同步调用

```
StateName >> Arguments -@ TargetModule
```

**English:** Sends a synchronous message to `TargetModule`. The sending module blocks until a reply is received or a timeout occurs. The reply is handled in the `Response` reserved state.

- Possible errors: `Target Error` (module does not exist), `Target Timeout Error` (no reply within timeout).
- Timeout is configured globally via `CSM - Set TMO of Sync-Reply.vi`. Values: `-2` = use global setting, `-1` = wait forever, `> 0` = milliseconds.

**中文：** 向 `TargetModule` 发送同步消息。发送方阻塞等待回复或超时。回复在 `Response` 预置状态中处理。

- 可能的错误：`Target Error`（模块不存在）、`Target Timeout Error`（超时未回复）。
- 超时通过 `CSM - Set TMO of Sync-Reply.vi` 全局配置。值：`-2` = 使用全局设置，`-1` = 永久等待，`> 0` = 毫秒数。

```
// Examples / 示例
API: GetData >> request -@ DatabaseModule
API: Initialize -@ SubModule
```

---

### 1.3 Asynchronous Call (with Reply) — 异步调用（有返回）

```
StateName >> Arguments -> TargetModule
```

**English:** Sends an asynchronous message to `TargetModule`. The sending module immediately enters the `Async Message Posted` state and continues execution. When the target finishes, the reply arrives and is handled in the `Async Response` state.

- Possible error: `Target Error` (target module does not exist).

**中文：** 向 `TargetModule` 发送异步消息。发送方立即进入 `Async Message Posted` 状态并继续执行。目标模块处理完后回复，发送方在 `Async Response` 状态处理回复。

- 可能的错误：`Target Error`（目标模块不存在）。

```
// Examples / 示例
API: StartTask >> config -> WorkerModule
API: EchoArguments >> xyz -> SubModule
```

---

### 1.4 Asynchronous Call (No Reply) — 异步调用（无返回）

```
StateName >> Arguments ->| TargetModule
```

**English:** Sends a fire-and-forget asynchronous message. The sending module immediately enters the `Async Message Posted` state. No reply is ever sent back; `Async Response` is **not** triggered.

**中文：** 发送"发完即忘"的异步消息。发送方立即进入 `Async Message Posted` 状态。目标模块处理完毕后**不回复**，`Async Response` 状态**不**被触发。

```
// Examples / 示例
API: Stop ->| SubModule
UI: Front Panel State >> Open ->| UIModule
```

---

## 2. Broadcast Syntax — 广播语法

### 2.1 Status Broadcast (Normal Priority) — 信号广播（普通优先级）

```
StatusName >> Arguments -><status>
StatusName >> Arguments -><broadcast>
StatusName >> Arguments -><all>
```

**English:** Broadcasts a normal-priority status change to all registered subscribers. The message is delivered via the **low-priority queue** (same as async messages). All three keywords are equivalent.

**中文：** 向所有已注册的订阅者广播普通优先级的状态变化。消息通过**低优先级队列**传递（与异步消息相同）。三种写法等价。

```
// Examples / 示例
Download Finished >> filePath -><status>
Data Ready >> <HEXSTR>0A1B2C -><broadcast>
```

---

### 2.2 Interrupt Broadcast (High Priority) — 中断广播（高优先级）

```
StatusName >> Arguments -><interrupt>
```

**English:** Broadcasts a high-priority interrupt to all registered subscribers. The message is delivered via the **high-priority queue** (same as sync messages) and is processed before any pending low-priority messages.

**中文：** 向所有已注册的订阅者广播高优先级中断。消息通过**高优先级队列**传递（与同步消息相同），在所有低优先级消息前被处理。

```
// Examples / 示例
Emergency Stop >> reason -><interrupt>
Critical Alert >> errorCode -><interrupt>
```

---

## 3. Subscription (Register / Unregister) Syntax — 订阅语法

### 3.1 Register — 注册订阅

```
SourceStatus@SourceModule >> HandlerAPI@TargetModule -><register>
```

**English:** Registers a subscription rule: when `SourceModule` broadcasts (or finishes executing) `SourceStatus`, the `HandlerAPI` message is automatically sent to `TargetModule`.

- Use `*` as `SourceModule` to match any module broadcasting that status.
- Omitting `@TargetModule` creates an **internal rule** that is automatically removed when the target module exits.
- Including `@TargetModule` creates an **external/global rule** that persists even after the target module exits.
- The priority of the received message follows the broadcast type (status or interrupt) by default.

**中文：** 注册订阅规则：当 `SourceModule` 广播（或执行完）`SourceStatus` 时，自动向 `TargetModule` 发送 `HandlerAPI` 消息。

- `SourceModule` 使用 `*` 可匹配所有模块。
- 省略 `@TargetModule` 为**内部规则**，目标模块退出时自动删除。
- 指定 `@TargetModule` 为**外部/全局规则**，目标模块退出后仍然保留。
- 接收到的消息优先级默认跟随广播类型（信号或中断）。

```
// Examples / 示例

// Full form: source and target module both specified
// 完整写法：同时指定来源模块和目标模块
Download Finished@Downloader >> Start Play@Player -><register>

// Omit target module name when registering within the same module
// 在相同模块内注册时可省略目标模块名
Download Finished@Downloader >> Start Play -><register>

// Subscribe to a status from any source module using wildcard *
// 使用通配符 * 订阅任意来源模块的同名状态
Error Occurred@* >> Error Handler@MainApp -><register>
```

---

### 3.2 Register with Priority Override — 注册时覆盖优先级

```
// Receive the broadcast as normal priority regardless of its original priority
// 无论发送方原来优先级如何，均以普通优先级接收
SourceStatus@SourceModule >> HandlerAPI@TargetModule -><register as status>

// Receive the broadcast as high priority regardless of its original priority
// 无论发送方原来优先级如何，均以高优先级（中断）接收
SourceStatus@SourceModule >> HandlerAPI@TargetModule -><register as interrupt>
```

**English:** Overrides the broadcast priority when the message is delivered to the subscriber.
`<register as status>` always delivers as normal priority.
`<register as interrupt>` always delivers as high priority.

**中文：** 订阅时覆盖广播优先级。
`<register as status>` 始终以普通优先级接收。
`<register as interrupt>` 始终以高优先级（中断）接收。

```
// Examples / 示例
// Treat an interrupt broadcast as normal priority in this module
// 在本模块中将中断广播降级为普通优先级处理
UrgentEvent@SensorModule >> Handle Event@UI -><register as status>

// Treat a status broadcast as interrupt in this module
// 在本模块中将信号广播升级为中断优先级处理
Data Ready@DAQModule >> Process Data -><register as interrupt>
```

---

### 3.3 Unregister — 取消订阅

```
SourceStatus@SourceModule >> HandlerAPI@TargetModule -><unregister>
```

**English:** Removes a previously registered subscription rule.

**中文：** 删除之前注册的订阅规则。

```
// Examples / 示例
Download Finished@Downloader >> Start Play@Player -><unregister>
Error Occurred@* >> Error Handler@MainApp -><unregister>
```

---

## 4. Comments — 注释

```
// This is a comment
StateName >> Arguments  // inline comment
```

**English:** Use `//` to add comments. All text to the right of `//` on the same line is ignored by the parser.

**中文：** 使用 `//` 添加注释。`//` 右侧的所有文本将被解析器忽略。

```
// Examples / 示例
UI: Initialize   // This initializes the UI / 初始化 UI
// Another comment line / 另一行注释
Macro: Initialize
```

---

## 5. Module Naming Rules — 模块命名规则

**English:** A valid CSM module name must **not** contain any of the following reserved characters:
`~ ! @ % ^ & * ( ) [ ] { } + = | \ / ? ' " < > ,`
and must not contain whitespace characters (tab `\t`, carriage return `\r`, newline `\n`).

**中文：** 合法的 CSM 模块名称**不得**包含以下保留字符：
`~ ! @ % ^ & * ( ) [ ] { } + = | \ / ? ' " < > ,`
以及不得包含空白字符（制表符 `\t`、回车符 `\r`、换行符 `\n`）。

| Pattern / 模式 | Meaning / 含义 |
| --- | --- |
| `ModuleName` | Regular module / 普通模块 |
| `.ModuleName` | System-level module (not listed by default) / 系统级模块（默认不被列出） |
| `ModuleName.SubName` | Logical sub-module grouping / 逻辑子模块分组 |
| `ModuleName#` | Worker Mode node request name / 工作者模式节点申请名 |
| `ModuleName$Order` | Chain of Responsibility Mode node (e.g. `Handler$1`) / 责任链模式节点（如 `Handler$1`） |
| `""` (empty string) | Auto-assigned UUID; independent, not listed / 自动分配 UUID，独立运行，不出现在模块列表 |

```
// Examples / 示例
MainApp               // Regular module / 普通模块
.BackgroundLogger     // System-level module / 系统级模块
System.Config         // Logical submodule of "System" / "System" 的逻辑子模块
Downloader#           // Worker Mode request name / 工作者模式申请名
Approver$1            // Chain node with order 1 / 责任链节点，顺序为 1
```

---

## 6. Reserved Built-in States — 预置保留状态

**English:** Every CSM module should handle the following built-in states. They are triggered automatically by the framework.

**中文：** 每个 CSM 模块都应处理以下内置状态，它们由框架自动触发。

| State / 状态 | Trigger / 触发时机 |
| --- | --- |
| `Macro: Initialize` | Module startup / 模块启动时 |
| `Macro: Exit` | Exit request received / 收到退出请求时 |
| `Error Handler` | LabVIEW error passed to `Parse State Queue++.vi` / LabVIEW 错误传入 `Parse State Queue++.vi` 时 |
| `Response` | Reply received from a synchronous call / 收到同步调用的回复时 |
| `Async Response` | Reply received from an async call with reply (<code>-></code>) / 收到有返回异步调用的回复时 |
| `Async Message Posted` | After sending any async message (<code>-></code> or <code>->&#124;</code>) / 发送任意异步消息（<code>-></code> 或 <code>->&#124;</code>）后 |
| `Target Timeout Error` | Sync call timed out / 同步调用超时未响应 |
| `Target Error` | Target module does not exist / 目标模块不存在 |
| `Critical Error` | Framework-level fatal error (e.g. duplicate module name) / 框架级严重错误（如模块名重复） |

---

## 7. CSM Keywords (Reserved Characters in Arguments) — CSM 关键字（参数中的保留字符）

**English:** The following strings are CSM keywords and **must not** appear unescaped inside an argument string. Use `CSM - Make String Arguments Safe.vi` (encodes as `<SAFESTR>`) or one of the other encoding schemes to pass arguments containing these characters safely.

**中文：** 以下字符串是 CSM 关键字，**不得**在参数字符串中直接使用。若参数中包含这些字符，请使用 `CSM - Make String Arguments Safe.vi`（编码为 `<SAFESTR>`）或其他编码方案安全传递。

`->` `->|` `-@` `-&` `<-` `\r` `\n` `//` `>>` `>>>` `>>>>` `;` `,`

---

## 8. Argument Encoding Schemes — 参数编码方案

**English:** All CSM arguments are plain strings. For complex data types, use one of the built-in encoding schemes below.

**中文：** 所有 CSM 参数均为普通字符串。对于复杂数据类型，请使用以下内置编码方案。

| Scheme / 方案 | Format / 格式 | Use Case / 使用场景 |
| --- | --- | --- |
| **Plain string** | `argument text` | Safe plain text with no CSM keywords / 不含 CSM 关键字的安全文本 |
| **SAFESTR** | `<SAFESTR>escaped%2Dstring` | Any string, keywords escaped as `%Hex` / 任意字符串，关键字转义为 `%Hex` |
| **HEXSTR** | `<HEXSTR>0A1B2C3D...` | Any LabVIEW data type serialized to hex / 任意 LabVIEW 数据类型序列化为十六进制 |
| **ERRSTR** | `<ERRSTR>[Error: 1234] description` | LabVIEW Error Cluster / LabVIEW 错误簇 |

---

## 9. CSM Script Syntax (Run Script VI only) — CSM 脚本语法（仅用于 Run Script VI）

> **Note / 注意：** The following syntax extensions are **only** parsed by `CSM - Run Script.vi` and cannot be used in the regular state queue.
>
> 以下语法扩展**仅**由 `CSM - Run Script.vi` 解析，不能用于普通状态队列。

### 9.1 Save Return Value to Variable — 将返回值保存到变量

```
StateName >> Arguments -@ TargetModule => variableName
```

**English:** After the synchronous call completes, the response is stored in `variableName`. Variable names are case-insensitive.

**中文：** 同步调用完成后，将响应存储到 `variableName`。变量名大小写不敏感。

### 9.2 Reference a Variable — 引用变量

```
StateName >> ${variableName} -@ TargetModule
```

**English:** Substitutes the stored value of `variableName` into the argument.

**中文：** 将 `variableName` 的值替换到参数中。

### 9.3 Wait Command — 等待命令

```
Wait: milliseconds
```

**English:** Pauses script execution for the specified number of milliseconds before proceeding to the next instruction.

**中文：** 在执行下一条指令前等待指定的毫秒数。

```
// Script Example / 脚本示例
API: Random -@ csm => var1
API: Random -@ csm => var2
API: echo >> ${var1} -@ csm
API: echo >> ${var2} -@ csm
API: echo >> ${var1},${var2} -@ csm
Wait: 1000    // Wait 1000 ms / 等待 1000 毫秒
API: Do Something Else -@ csm
```
