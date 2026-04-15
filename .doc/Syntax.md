# CSM Syntax Reference / CSM 语法参考

**Navigation / 导航**
- [English — CSM Syntax Reference](#english-section)
- [中文 — CSM 语法参考](#chinese-section)

---

<a id="english-section"></a>

## English — CSM Syntax Reference

### Quick Reference

```c
// =========================================================
// CSM State / Message Syntax
// =========================================================

// --- Local State (no target) ---

StateName >> Arguments
StateName                   // arguments omitted

// --- Synchronous Call ---
//
// Sending module BLOCKS until reply or timeout

API: xxxx >> Arguments -@ TargetModule

// --- Asynchronous Call (with reply) ---
//
// Sending module continues; reply handled in "Async Response"

API: xxxx >> Arguments -> TargetModule

// --- Asynchronous Call (no reply) ---
//
// Sending module continues; NO reply is ever sent back

API: xxxx >> Arguments ->| TargetModule

// =========================================================
// Broadcast Syntax
// =========================================================

// --- Normal-priority broadcast (three equivalent forms) ---

Status >> StatusArguments -><status>
Status >> StatusArguments -><broadcast>
Status >> StatusArguments -><all>

// --- High-priority interrupt broadcast ---

Interrupt >> StatusArguments -><interrupt>

// =========================================================
// Subscription Syntax
// =========================================================

// --- Register ---
//
// When SourceModule broadcasts Status, send API to TargetModule

Status@SourceModule >> API@TargetModule -><register>

// Internal rule (auto-removed on module exit, TargetModule omitted)

Status@SourceModule >> API -><register>

// Wildcard: subscribe to Status from ALL modules

Status@* >> API@TargetModule -><register>

// --- Register with priority override ---
// Always receive as normal priority (status)

Status@SourceModule >> API@TargetModule -><register as status>

// Always receive as high priority (interrupt)

Status@SourceModule >> API@TargetModule -><register as interrupt>

// --- Unregister ---

Status@SourceModule >> API@TargetModule -><unregister>

// =========================================================
// Comments
// =========================================================

// Use "//" to add a comment — everything to the right is ignored

UI: Initialize  // This initializes the UI
// Another comment line
```

---

### 1. State / Message Syntax

#### 1.1 Local State (No Target)

```
StateName >> Arguments
```

Adds a state to the local module's state queue. `>>` separates the state name from its arguments. If there are no arguments the `>>` can be omitted.

> [!NOTE]
> **Reserved Built-in States**
>
> Every CSM module should handle the following built-in states. They are triggered automatically by the framework.
>
> | State | Trigger |
> | --- | --- |
> | `Macro: Initialize` | Module startup |
> | `Macro: Exit` | Exit request received |
> | `Error Handler` | LabVIEW error passed to `Parse State Queue++.vi` |
> | `Response` | Reply received from a synchronous call |
> | `Async Response` | Reply received from an async call with reply (<code>-></code>) |
> | `Async Message Posted` | After sending any async message (<code>-></code> or <code>->&#124;</code>) |
> | `Target Timeout Error` | Sync call timed out |
> | `Target Error` | Target module does not exist |
> | `Critical Error` | Framework-level fatal error (e.g. duplicate module name) |

---

#### 1.2 Synchronous Call

```
StateName >> Arguments -@ TargetModule
```

Sends a synchronous message to `TargetModule`. The sending module blocks until a reply is received or a timeout occurs. The reply is handled in the `Response` reserved state.

- Possible errors: `Target Error` (module does not exist), `Target Timeout Error` (no reply within timeout).
- Timeout is configured globally via `CSM - Set TMO of Sync-Reply.vi`. Values: `-2` = use global setting, `-1` = wait forever, `> 0` = milliseconds.

> [!NOTE]
> **Module Naming Rules**
>
> A valid CSM module name must **not** contain any of the following reserved characters:
> `~ ! @ % ^ & * ( ) [ ] { } + = | \ / ? ' " < > ,`
> and must not contain whitespace characters (tab `\t`, carriage return `\r`, newline `\n`).
>
> | Pattern | Meaning |
> | --- | --- |
> | `ModuleName` | Regular module |
> | `.ModuleName` | System-level module (not listed by default) |
> | `ModuleName.SubName` | Logical sub-module grouping |
> | `ModuleName#` | Worker Mode node request name |
> | `ModuleName$Order` | Chain of Responsibility Mode node (e.g. `Handler$1`) |
> | `""` (empty string) | Auto-assigned UUID; independent, not listed |

---

#### 1.3 Asynchronous Call (with Reply)

```
StateName >> Arguments -> TargetModule
```

Sends an asynchronous message to `TargetModule`. The sending module immediately enters the `Async Message Posted` state and continues execution. When the target finishes, the reply arrives and is handled in the `Async Response` state.

- Possible error: `Target Error` (target module does not exist).

---

#### 1.4 Asynchronous Call (No Reply)

```
StateName >> Arguments ->| TargetModule
```

Sends a fire-and-forget asynchronous message. The sending module immediately enters the `Async Message Posted` state. No reply is ever sent back; `Async Response` is **not** triggered.

---

### 2. Broadcast Syntax

#### 2.1 Status Broadcast (Normal Priority)

```
StatusName >> Arguments -><status>
StatusName >> Arguments -><broadcast>
StatusName >> Arguments -><all>
```

Broadcasts a normal-priority status change to all registered subscribers. The message is delivered via the **low-priority queue** (same as async messages). All three keywords are equivalent.

---

#### 2.2 Interrupt Broadcast (High Priority)

```
StatusName >> Arguments -><interrupt>
```

Broadcasts a high-priority interrupt to all registered subscribers. The message is delivered via the **high-priority queue** (same as sync messages) and is processed before any pending low-priority messages.

---

### 3. Subscription (Register / Unregister) Syntax

#### 3.1 Register

```
SourceStatus@SourceModule >> HandlerAPI@TargetModule -><register>
```

Registers a subscription rule: when `SourceModule` broadcasts (or finishes executing) `SourceStatus`, the `HandlerAPI` message is automatically sent to `TargetModule`.

- Use `*` as `SourceModule` to match any module broadcasting that status.
- Omitting `@TargetModule` creates an **internal rule** that is automatically removed when the target module exits.
- Including `@TargetModule` creates an **external/global rule** that persists even after the target module exits.
- The priority of the received message follows the broadcast type (status or interrupt) by default.

---

#### 3.2 Register with Priority Override

```
// Receive the broadcast as normal priority regardless of its original priority
SourceStatus@SourceModule >> HandlerAPI@TargetModule -><register as status>

// Receive the broadcast as high priority regardless of its original priority
SourceStatus@SourceModule >> HandlerAPI@TargetModule -><register as interrupt>
```

Overrides the broadcast priority when the message is delivered to the subscriber.
`<register as status>` always delivers as normal priority.
`<register as interrupt>` always delivers as high priority.

---

#### 3.3 Unregister

```
SourceStatus@SourceModule >> HandlerAPI@TargetModule -><unregister>
```

Removes a previously registered subscription rule.

---

### 4. Comments

```
// This is a comment
StateName >> Arguments  // inline comment
```

Use `//` to add comments. All text to the right of `//` on the same line is ignored by the parser.

---

### 5. CSM Script Syntax (Run Script VI only)

> [!IMPORTANT]
> The following syntax extensions are **only** parsed by `CSM - Run Script.vi` and cannot be used in the regular state queue.

#### 5.1 Save Return Value to Variable

```
StateName >> Arguments -@ TargetModule => variableName
```

After the synchronous call completes, the response is stored in `variableName`. Variable names are case-insensitive.

#### 5.2 Reference a Variable

```
StateName >> ${variableName} -@ TargetModule
```

Substitutes the stored value of `variableName` into the argument.

#### 5.3 Wait Command

```
Wait: milliseconds
```

Pauses script execution for the specified number of milliseconds before proceeding to the next instruction.

---

<a id="chinese-section"></a>

## 中文 — CSM 语法参考

### 速查表

```c
// =========================================================
// CSM 状态/消息语法
// =========================================================

// --- 本地状态（无目标）---

StateName >> Arguments
StateName                   // 省略参数

// --- 同步调用 ---
//
// 发送方阻塞直到收到回复或超时

API: xxxx >> Arguments -@ TargetModule

// --- 异步调用（有返回）---
//
// 发送方继续执行；回复在 "Async Response" 状态处理

API: xxxx >> Arguments -> TargetModule

// --- 异步调用（无返回）---
//
// 发送方继续执行；目标模块处理完毕后不回复

API: xxxx >> Arguments ->| TargetModule

// =========================================================
// 广播语法
// =========================================================

// --- 普通优先级广播（三种等价写法）---

Status >> StatusArguments -><status>
Status >> StatusArguments -><broadcast>
Status >> StatusArguments -><all>

// --- 高优先级中断广播 ---

Interrupt >> StatusArguments -><interrupt>

// =========================================================
// 订阅语法
// =========================================================

// --- 注册订阅 ---
//
// 当 SourceModule 广播 Status 时，向 TargetModule 发送 API

Status@SourceModule >> API@TargetModule -><register>

// 内部规则（模块退出时自动删除，省略 TargetModule）

Status@SourceModule >> API -><register>

// 通配符：订阅所有模块的 Status

Status@* >> API@TargetModule -><register>

// --- 注册时覆盖优先级 ---
// 始终以普通优先级接收

Status@SourceModule >> API@TargetModule -><register as status>

// 始终以高优先级（中断）接收

Status@SourceModule >> API@TargetModule -><register as interrupt>

// --- 取消订阅 ---

Status@SourceModule >> API@TargetModule -><unregister>

// =========================================================
// 注释
// =========================================================

// 使用 "//" 添加注释，右侧内容全部被忽略

UI: Initialize  // 初始化 UI
// 另一行注释
```

---

### 1. 状态与消息语法

#### 1.1 本地状态（无目标模块）

```
StateName >> Arguments
```

将状态加入本地模块的状态队列。`>>` 分隔状态名与参数。若无参数可省略 `>>`。

> [!NOTE]
> **预置保留状态**
>
> 每个 CSM 模块都应处理以下内置状态，它们由框架自动触发。
>
> | 状态 | 触发时机 |
> | --- | --- |
> | `Macro: Initialize` | 模块启动时 |
> | `Macro: Exit` | 收到退出请求时 |
> | `Error Handler` | LabVIEW 错误传入 `Parse State Queue++.vi` 时 |
> | `Response` | 收到同步调用的回复时 |
> | `Async Response` | 收到有返回异步调用的回复时（<code>-></code>） |
> | `Async Message Posted` | 发送任意异步消息（<code>-></code> 或 <code>->&#124;</code>）后 |
> | `Target Timeout Error` | 同步调用超时未响应 |
> | `Target Error` | 目标模块不存在 |
> | `Critical Error` | 框架级严重错误（如模块名重复） |

---

#### 1.2 同步调用

```
StateName >> Arguments -@ TargetModule
```

向 `TargetModule` 发送同步消息。发送方阻塞等待回复或超时。回复在 `Response` 预置状态中处理。

- 可能的错误：`Target Error`（模块不存在）、`Target Timeout Error`（超时未回复）。
- 超时通过 `CSM - Set TMO of Sync-Reply.vi` 全局配置。值：`-2` = 使用全局设置，`-1` = 永久等待，`> 0` = 毫秒数。

> [!NOTE]
> **模块命名规则**
>
> 合法的 CSM 模块名称**不得**包含以下保留字符：
> `~ ! @ % ^ & * ( ) [ ] { } + = | \ / ? ' " < > ,`
> 以及不得包含空白字符（制表符 `\t`、回车符 `\r`、换行符 `\n`）。
>
> | 模式 | 含义 |
> | --- | --- |
> | `ModuleName` | 普通模块 |
> | `.ModuleName` | 系统级模块（默认不被列出） |
> | `ModuleName.SubName` | 逻辑子模块分组 |
> | `ModuleName#` | 工作者模式节点申请名 |
> | `ModuleName$Order` | 责任链模式节点（如 `Handler$1`） |
> | `""` （空字符串） | 自动分配 UUID，独立运行，不出现在模块列表 |

---

#### 1.3 异步调用（有返回）

```
StateName >> Arguments -> TargetModule
```

向 `TargetModule` 发送异步消息。发送方立即进入 `Async Message Posted` 状态并继续执行。目标模块处理完后回复，发送方在 `Async Response` 状态处理回复。

- 可能的错误：`Target Error`（目标模块不存在）。

---

#### 1.4 异步调用（无返回）

```
StateName >> Arguments ->| TargetModule
```

发送"发完即忘"的异步消息。发送方立即进入 `Async Message Posted` 状态。目标模块处理完毕后**不回复**，`Async Response` 状态**不**被触发。

---

### 2. 广播语法

#### 2.1 信号广播（普通优先级）

```
StatusName >> Arguments -><status>
StatusName >> Arguments -><broadcast>
StatusName >> Arguments -><all>
```

向所有已注册的订阅者广播普通优先级的状态变化。消息通过**低优先级队列**传递（与异步消息相同）。三种写法等价。

---

#### 2.2 中断广播（高优先级）

```
StatusName >> Arguments -><interrupt>
```

向所有已注册的订阅者广播高优先级中断。消息通过**高优先级队列**传递（与同步消息相同），在所有低优先级消息前被处理。

---

### 3. 订阅语法

#### 3.1 注册订阅

```
SourceStatus@SourceModule >> HandlerAPI@TargetModule -><register>
```

注册订阅规则：当 `SourceModule` 广播（或执行完）`SourceStatus` 时，自动向 `TargetModule` 发送 `HandlerAPI` 消息。

- `SourceModule` 使用 `*` 可匹配所有模块。
- 省略 `@TargetModule` 为**内部规则**，目标模块退出时自动删除。
- 指定 `@TargetModule` 为**外部/全局规则**，目标模块退出后仍然保留。
- 接收到的消息优先级默认跟随广播类型（信号或中断）。

---

#### 3.2 注册时覆盖优先级

```
// 无论发送方原来优先级如何，均以普通优先级接收
SourceStatus@SourceModule >> HandlerAPI@TargetModule -><register as status>

// 无论发送方原来优先级如何，均以高优先级（中断）接收
SourceStatus@SourceModule >> HandlerAPI@TargetModule -><register as interrupt>
```

订阅时覆盖广播优先级。
`<register as status>` 始终以普通优先级接收。
`<register as interrupt>` 始终以高优先级（中断）接收。

---

#### 3.3 取消订阅

```
SourceStatus@SourceModule >> HandlerAPI@TargetModule -><unregister>
```

删除之前注册的订阅规则。

---

### 4. 注释

```
// 这是一条注释
StateName >> Arguments  // 行内注释
```

使用 `//` 添加注释。`//` 右侧的所有文本将被解析器忽略。

---

### 5. CSM 脚本语法（仅用于 Run Script VI）

> [!IMPORTANT]
> **注意：** 以下语法扩展**仅**由 `CSM - Run Script.vi` 解析，不能用于普通状态队列。

#### 5.1 将返回值保存到变量

```
StateName >> Arguments -@ TargetModule => variableName
```

同步调用完成后，将响应存储到 `variableName`。变量名大小写不敏感。

#### 5.2 引用变量

```
StateName >> ${variableName} -@ TargetModule
```

将 `variableName` 的值替换到参数中。

#### 5.3 等待命令

```
Wait: milliseconds
```

在执行下一条指令前等待指定的毫秒数。
