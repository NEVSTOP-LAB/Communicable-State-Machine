# Example Description

## Basic Concepts

### 1. JKISM vs CSM.vi

#### Overview

CSM 是仿照 JKISM 逻辑设计的 LabVIEW 程序开发框架，两个框架都使用基于字符串的消息队列来实现核心逻辑。本示例用于演示CSM基于JKISM的拓展。

#### Introduction

本示例比较 JKISM 框架和 CSM 框架之间的代码。两个框架都使用基于字符串的消息队列来实现核心状态机。

#### Steps

基于 JKISM，CSM 具有以下主要扩展功能，让我们逐步解释：

- Step1: CSM是一个程序框架因此它需要模块的名称
- Step2：重新设计了核心字符串解析引擎。
- Step2.1 JKISM 使用 Parse State Queue.vi，它只输出下一个状态队列及其对应的参数（位于 >> 之后），主要用作“出队元素”。
- Step2.2 CSM 使用 Parse State Queue++.vi 额外添加了以下主要功能：
    \- 基于状态队列输入自动创建/处理/销毁队列/用户事件机制，因此用户只需给出相应的高级字符串消息。
    \- 模块间/VI 间的消息可以被传输。
    \- 额外的输入，如 Dequeue Timeout、Response Timeout 和 Allowed Messages，用于实现更高级的功能。
- Step3：CSM 添加了一个内部状态调试日志 history.vi 用于更好的调试和记录，状态历史可以直接显示在前面板上。
- Step4：CSM 定义了一系列字符串语法来实现本地/模块间消息传输，例如同步消息、异步消息、状态创建/注册/注销等。
- Step4.1: JKISM 只定义了本地状态的轮转。它可以携带一个参数以及注释。
- Step4.2: CSM是一个软件框架，因此它定义了模块。以及模块之间的消息通讯。
- Step5: CSM 定义了一些基础的状态，用于处理模块之间通讯的逻辑行为。
- Step5.1: "Critical Error" 用于处理一些无法恢复的错误。
- Step5.2: "Target Timeout Error" 用于处理模块消息通讯超时的错误。
- Step5.3: "Target Error" 用于处理模块不存在的错误。
- STEP5.4: "Async Response" 用于处理异步消息的回复。
- Step5.5：”Response" 用于处理同步消息的回复。
- Step5.6: "Async Message Posted" 用于处理异步消息发送后的操作。
- Step5.7:(optional) "Events: Register" 和 "Events: Unregister" 中使用的消息事件，用于触发带有Event Structure的CSM模块跳出。
- Step5.7:(optional) "<New State Notifier Event>" 配合Step5.7实现在外部消息到来后，跳出事件结构等待
- Step5.8:(optional) CSM推荐使用 API 分组提供对外的接口，但是实际上所有的分支都可以使用消息调用。
- Step6. CSM额外定义了"Msg/Rsp's CSM" 用于定位外部消息、状态的来源模块
- Step7. 额外的消息信息，如Response的源消息名称、源参数等，可以由此获得。
- Step8. CSM 预置了消息返回.
- Step9：CSM 扩展了调试工具，详情请参阅选板 CSM->CSM Debug Tools。

### 2. Module Naming Rules.vi

#### Overview

演示 CSM 模块名称的基本字符串命名规则。一个有效的 CSM 模块名称是一个字符串，不应包含以下任何特殊字符：`~!@%^&*()\[\]{}+=|\\/?'"<>,.\t\r\n`。这些字符是 CSM 框架内保留用于其他目的的关键字。

#### Introduction

通过不同情况的分析，展示一个有效的CSM模块名称是怎样的.

- Step1. 展示普通模块名称的情况。
- Step2. 展示有空格模块的情况。
- Step3. 这是有：的情况。
- Step4. 展示有#的情况。这个时候是模块名称是正确的，这个时候对应模块工作在worker模式。
- Step5. 展示有_的情况。
- Step6. 展示有-的情况。
- Step7. 展示几种包含特殊字符的错误情况。
- Step8. 展示以.开头的情况，这个时候是模块名称是正确的，这个时候对应的模块工作在系统级别模式
- Step9. 展示.在内部起分隔符的情况，这个时候是模块名称是正确的，从逻辑上可以看作是一个子模块。
- Step10. 展示包含$且之后是数字的情况，这个时候是模块名称是正确的，这个时候对应的模块工作在Chain模式。

### 3. Message Helper VI and Equivalent String.vi

#### Overview

演示 CSM 框架内消息通信的字符串语法格式。

#### Introduction

本示例解释了 CSM 模块间消息通信的语法格式，您可以使用 LabVIEW API 来构建这些字符串，或者如果您熟悉消息规则，也可以手动创建这些字符串。 CSM定义的语法如下：

```
#CSM 状态语法
    // 本地消息示例
    DoSth: DoA >> 参数

    // 同步调用示例
    API: xxxx >> 参数 -@ TargetModule

    // 异步调用示例
    API: xxxx >> 参数 -> TargetModule

    // 无应答异步调用示例
    API: xxxx >> 参数 ->| TargetModule

    // 广播正常状态：
    Status >> StatusArguments -><status>

    // 广播中断状态：
    Interrupt >> StatusArguments -><interrupt>

    // 将源模块的状态注册到处理程序模块
    Status@Source Module >> API@Handler Module -><register>

    // 取消注册源模块的状态
    Status@Source Module >> API@Handler Module -><unregister>

#CSM 注释
    // 要添加注释，请使用 "//"，右边的所有文本将被忽略。
    UI: Initialize // 初始化 UI
    // Another comment line
```

#### Steps

- Step1. 同步消息。发送方会原地等待回复，直到超时或收到回复。
- Step2. 带回复的异步消息。发送方会继续执行后续操作，而不会等待回复；接收方处理完消息后，会回复发送方。
- Step3. 不带回复的异步消息。发送方会继续执行后续操作，而不会等待回复；接收方处理完消息后，不会回复发送方。
- Step4. 广播一个正常的状态字符串。
- Step5. 广播一个中断或高优先级的状态字符串
- Step6. 注册一个状态, 当状态发生变化时, 会自动触发所注册的处理程序模块的消息。
- Step7. 注销一个状态，取消注册状态变化触发的消息。

### 4.1 Arguments - Complex Data As Arguments.vi

#### Overview

本范例用于展示其他的数据类型如何转换为 HEXStr 作为参数传递。

#### Introduction

CSM的参数表现形式只能为 String 类型。HEXSTR (0-9, A-F) 格式 是 CSM 框架内用于传递复杂数据类型的字符串表示形式。 它可以将任意数据类型作为参数使用，而不会干扰 CSM 消息字符串的解析。此外，CSM-Argument Type.vi 获取参数标记，在本例中为 `HEXSTR`。

内部的转换逻辑为：将任意数据类型转换为变体(variant)，然后将变体的内存内容转换为 HEXSTR 格式。

应用场景：任意数据类型的无损传递，例如：簇、数组、结构体等。但是数据量较大时，会导致消息字符串过长，影响性能，因此不适用于传递大数组或波形数据等场景。

#### Steps

- Step1: 展示将簇转换为 HEXSTR 并还原
- Step2: 展示将少量数据的数组，转换为 HEXSTR 并还原

### 4.2 Arguments - Error As Arguments.vi

#### Overview

本范例用于展示 LabVIEW错误如何作为CSM参数传递。

#### Introduction

本示例将 LabVIEW 错误簇转换为 CSM 兼容的错误字符串，这允许 CSM 核心解析引擎处理来自消息队列的 LabVIEW 错误，也便于在日志中记录内部发生的错误。转换后的错误字符串使用以下格式：`<ErrStr>[Error: error-code] error-description-As-safe-argument-string`。此外，CSM-Argument Type.vi 获取参数标记，在本例中为 `ErrStr`。

应用场景：传递LabVIEW 错误。

#### Steps

- Step1. 展示将错误转换为 ErrStr 并还原
- Step2. (向前兼容) 展示将之前的 ErrStr 转换为错误簇
- Step3. 展示将将之前的 ErrStr 转换为错误簇，并获取CSM-Argument Type

### 4.3 Arguments - Safe Arguments if it contains key words of CSM.vi

#### Overview

演示如何将包含特殊字符的字符串作为参数传递。

#### Introduction

由于CSM使用文本描述作为参数，因此如果参数中包含CSM的保留关键字，就会导致解析错误。为了解决这个问题，CSM会提供API将不安全的字符串中的特殊字符转换为安全的字符串，用于参数中的传递。

应用场景：传递包含特殊字符的字符串。

#### Steps

- Step1. 展示将不安全的字符串转换为安全的字符串，并获取CSM-Argument Type
- Step2. 展示windows 文件路径作为参数的情况
- Step3. 展示网址作为参数的情况


### 5. CSM Data Type.vi

#### Overview

展示CSM推荐的数据类型描述。

#### Introduction

CSM框架中，参数的只能以String类型的表现形式进行传递。为了支持各种不同的数据类型，通常数据都需要经过“打包”、传递、解包的过程。例如CSM内部就提供了 HEXSTR 格式的参数类型支持，用户也可以通过addon 的形式，提供符合应用场景的自定义数据类型转换。

为了支持不同的数据类型，有的时候我们就需要传递数据类型描述，用于在解码处处理不同数据类型的的逻辑分支。本示例展示了CSM推荐的数据类型描述方式即对应的API.

### 6. Module Attributes.vi

#### Overview

演示如何使用 CSM 框架之外的 VI 动态地与 CSM 模块属性交互。

#### Introduction

本示例演示如何使用 CSM 框架之外的 VI 动态地与 CSM 模块属性交互。

以下是 CSM 框架内的三种交互方式：

- 使用字符串消息队列在 CSM 框架本地/外部传输消息，例如 State >> Argument -@ DestModuleName。
- 从 CSM 模块广播/中断状态更改事件，从另一个 CSM/非 CSM 模块注册/注销该事件。
- 使用与模块属性相关的 VI 来获取/设置/移除/列出 CSM 模块属性。

本示例的核心功能是从 CSM 模块外部动态设置另一个随机数值到 CSM 模块，然后从 CSM 模块获取该值并在 UI 上显示。

#### Steps

Step 1：从 LabVIEW CSM 选板拖放 VI 模板。

Step 2：在 Macro:Initialize 之后添加一行新的状态字符串，即 API: Define ABC Attribute。

Step 3：在 CSM 模块内部设置模块属性：abc 作为属性，一个随机数作为值。

Step 4：从 CSM 模块外部设置模块属性：abc 作为属性，一个随机数作为值。

Step 5：从 CSM 模块外部设置模块属性：abc 作为属性，检索设置的随机数作为值。

Step 6：从 CSM 模块外部发送同步消息以停止 CSM 模块。

### 7. System-Level Module.vi

#### Overview

演示如何创建系统级模块，并说明在列出所有活动模块时，系统级模块与常规 CSM 模块之间的区别。系统级模块通常用于大型项目，以方便代码开发和调试。

#### Introduction

本示例演示如何创建系统级模块，并说明在列出所有活动模块时，系统级模块与常规 CSM 模块之间的区别。系统级模块通常用于大型项目，以方便代码开发和调试。

#### Steps

Step 1：使用高级 API VI 创建一个系统级模块名称（在 CSM 名称前添加“.”作为前缀，标记为系统级模块）。如果您熟悉规则，也可以直接输入相应的名称字符串和规则符号，而无需调用此 API。

Step 2：同步调用几个“普通”/非系统级的 CSM 模块。

Step 3：检查 CSM 模块名称是否有效，否则将生成错误。一个有效的 CSM 模块名称是一个字符串，不应包含以下任何特殊字符 ~!@%^&*()

{}+=|\/?'"<>,\t\r\n，因为这些是 CSM 框架内部用于其他明确定义用途的保留关键字。更多详情请参阅另一个名为 Module Naming Rules.vi 的示例代码。

Step 4：列出所有活动的 CSM 模块，默认情况下不会列出系统级模块。通过使用这种高级 VI，我们可以将系统级模块与其他常规模块分开，以便更好地进行代码开发、调试等。

Step 5：使用 CSM->API->Non-CSM Caller Support 下的高级 API VI，向所有活动的 CSM 模块发送同步的 Macro:Exit 消息，以停止所有这些模块/VI。

如果我们要从非 CSM 模块向 CSM 模块发送模块间消息，建议使用这些 Non-CSM Caller Support VI。

## Create a reuse Module

### CSM Reuse Module.vi

#### Overview

每秒生成一个随机数，并将该数字与用户定义的阈值进行比较。当生成的随机数超过阈值时，广播一个更新。

#### Introduction

本示例每秒生成一个随机数，并将该数字与用户定义的阈值进行比较。当生成的随机数超过阈值时，广播一个更新。

#### Steps

Step1. 从选板拖放 CSM 模板。

Step2. 将 "Level" 添加到 Internal Data 中。默认值为 0.5。

Step3. 创建 "DoSth: Check If Greater than 0.5"。在此实现核心功能。

Step3.1 比较随机数据并更新 UI

Step3.2 当随机数据超过 level 时，发布 "Status Changed" 状态。

Step4. 将 timeout 更改为移位寄存器。它将用于启动/停止超时事件。在每种情况下连接 timeout 的连线。

Step5. 在 Timeout Event 中，将 "DoSth: Check If Greater than 0.5" 添加到 State Queue。

Step6. 为此模块创建 API。

Step6.1 创建 "API: Start" 将 timeout 更改为 0.5s，这将每秒触发一次 "DoSth: Check If Greater than 0.5"。在这种情况下，将广播 "Check Started" 状态。

Step6.2 创建 "API: Stop" 将 timeout 更改为 -1，这将停止检查。"Check Stopped" 状态将被广播。

Step6.3 创建 "API: Set Level" 以更改 Level 设置。

Step6.4 创建 "API: Get Level" 以从外部获取当前 Level。

Step7. 创建本地测试按钮/控件

Step7.1 创建 Level 控件，调用 "API: Set Level" 以在本地更改 level 设置。

Step7.2 创建 Start 按钮，调用 "API: Start" 以在本地开始检查。

Step7.3 创建 Stop 按钮，调用 "API: Stop" 以在本地开始检查。

Step8. 在适当的情况下正确更新 UI。

Step8.1 启动时初始化 UI。

Step8.2 注释掉 "Macro: Initialize" 中的 "UI: Front Panel State >> Open"。当它作为子模块工作时，UI 将自动隐藏而不是弹出。

## Caller is CSM Scenario

### CSM Example - Caller is a CSM.vi

#### Overview

演示如何在 CSM 框架内调用 CSM 模块。在本示例中，模块间通信通过消息字符串队列操作执行。您可以使用 Build Message with Arguments++ VI 生成消息字符串，或者如果您熟悉格式，也可以直接使用消息描述字符串。

本示例同步调用 CSM Reuse Module.vi 的两个实例，通过 API 实现动态状态订阅和模块控制。

#### Introduction

演示如何在 CSM 框架内调用 CSM 模块。在本示例中，模块间通信通过消息字符串队列操作执行。您可以使用 Build Message with Arguments++ VI 生成消息字符串，或者如果您熟悉格式，也可以直接使用消息描述字符串。

本示例同步调用 CSM Reuse Module.vi 的两个实例，通过 API 实现动态状态订阅和模块控制。

#### Steps

Step 1：从 LabVIEW 选板拖放一个 VI CSM UI Module Template，将 CSM 名称更改为 "CSMScenarioExample"。

Step 2：同步调用 CSM Reuse Module.vi 两次，并分别命名为 SubModule0 和 SubModule1。有关如何创建此类可重用 CSM 模块的更多详细信息，请参阅另一个名为 1. Create a reuse Module 的 CSM 示例。

Step 3：在 "Macro:Initialize" case 下的现有标准字符串队列中添加一行新的自定义消息字符串，即 "Macro: Switch Active Module"，作为最后一行，以便我们可以在不同的子模块之间切换。

Step 4：为内部数据初始化添加一个字符串常量 SubModule0。对于更多自定义的内部数据初始化，我们可以在此处添加更多代码。

Step 5：在 UI 中添加一个字符串控件，用于切换和显示活动/目标模块（Combox box）。

Step 5.1：在 " 'Target Module': Value Change" UI 事件下，将字符串控件设置为活动模块内部数据，并发送一个模块内消息 Macro: Switch Active. Module。

Step 5.2：在 "UI: Initialize" case 下，更新活动/目标模块。

Step 6：在 "Macro: Switch Active Module" case 下，使用高级 VI 向活动子模块发送模块间同步消息 "API: Get Level -@ modulename"。

或者，如果您熟悉 CSM 字符串语法规则，也可以手动键入字符串常量。

Step 7：现在状态队列为空，CSM 状态机正在 ' "", "Event Structure", "Idle" ' 下的超时 UI 事件中等待。下一步取决于用户提供的 UI 交互。

Step 8：在 UI 中创建本地测试按钮/控件如下：

Step 8.1：创建 API:Start 按钮，当用户单击此按钮时，将发送一条异步无回复消息 "API: Start -> modulename" 以启动活动的子模块。

Step 8.2：创建 Register All Status Change 按钮，当用户单击此按钮时，此 CSM 模块将从活动子模块注册以下广播/中断消息 "Status Changed@* >> Action: Status Change Handler -><register>"。

Step 8.3：创建 Unregister All Status Change 按钮，当用户单击此按钮时，此 CSM 模块将从活动子模块注销以下广播/中断消息 "Status Changed@* >> Action: Status Change Handler -><unregister>"。

Step 8.4：此处没有代码，但是由于注册的状态更改，您可以在调用时看到日志。收到此广播/中断消息后，可以在此处添加任何进一步的自定义代码。

Step 8.5：创建 API:Stop 按钮，当用户单击此按钮时，将发送一条异步无回复消息 "API: Stop -> modulename" 以停止活动的子模块。

Step 8.6：创建 Level DBL 控件，当用户更改值时，将向活动子模块发送一条异步消息 "API: Set Level >> 0.3 ->| modulename"。

Step 8.7：创建 API: Get Level(Async) 按钮，当用户单击此按钮时，将向活动子模块发送一条异步消息 "API: Get Level -> modulename"。相应地处理 "Async Message Posted" 和 "Async Response" case，在本示例中，Level 显示将被更新。

Step 8.8：创建 UI: create Front Panel State >> Open 按钮，当用户单击该按钮时，将向活动子模块发送一条带无回复的异步消息 "UI: Front Panel State >> Open ->| modulename"。

Step 8.9：创建 UI: create Front Panel State >> Close 按钮，当用户单击该按钮时，将向活动子模块发送一条带无回复的异步消息 "UI: Front Panel State >> Close ->| modulename"。

Step 9：在 "Panel Close?" UI 事件下，在 "Macro:Exit" 之前添加两个新的字符串消息："Macro: Exit -@ SubModule0" 和 "Macro: Exit -@ SubModule1"，以便我们可以在最终关闭 CSM 调用者/主模块之前安全地关闭所有 CSM 子模块。

## Caller is Other Framework Scenario

### CSM Example - Caller is NOT a CSM.vi

#### Overview

演示如何从另一个框架应用程序调用 CSM 模块。在本示例中，模块间通信是使用 Post/Send Message API 和模块状态更改用户事件来实现的。

本示例异步调用 CSM Reuse Module.vi 的两个实例，通过 API 实现动态消息订阅和模块控制。

#### Introduction

演示如何从另一个框架应用程序调用 CSM 模块。在本示例中，模块间通信是使用 Post/Send Message API 和模块状态更改用户事件来实现的。

本示例异步调用 CSM Reuse Module.vi 的两个实例，通过 API 实现动态消息订阅和模块控制。

#### Steps

Step 1：在 100ms-UI 事件超时中，检查是否有任何 CSM 模块正在运行/存在。

启动和停止 CSM 子模块：

Step 2：异步调用选定的 CSM 子模块。

Step 3：向选定的 CSM 子模块发送异步消息（无回复）以停止/退出 CSM 子模块。该高级 API 可在 LabVIEW 选板 -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support 下找到。

注册和注销状态更改：

Step 4：使用高级 API 从所选子模块获取状态更改事件句柄并注册它。该高级 API 可在 LabVIEW 选板 -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support 下找到。

Step 5：注销用户事件。使用高级 API 销毁并释放状态更改事件句柄。该高级 API 可在 LabVIEW 选板 -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support 下找到。

API 调用：

Step 6：使用高级 API 向所选子模块发送异步消息（无回复）："API:start"。该高级 API 可在 LabVIEW 选板 -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support 下找到。

Step 7：使用相同的高级 API 向所选子模块发送异步消息（无回复）："API:stop"。

所选 CSM 子模块的 UI 前面板：

Step 8：使用高级 API 向所选子模块发送异步消息（无回复）："UI: Front Panel State >> Open"。该高级 API 可在 LabVIEW 选板 -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support 下找到。

Step 9：使用相同的高级 API 向所选子模块发送异步消息（无回复）："UI: Front Panel State >> Close"。

选择一个模块：

Step 10：使用高级 API 发送同步消息并等待返回消息，在本例中为 level 值："API: Get Level"。该高级 API 可在 LabVIEW 选板 -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support 下找到。

获取和设置 Level：

Step 11：使用高级 API 发送同步消息并等待返回消息："API: Set Level >> value"。该高级 API 可在 LabVIEW 选板 -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support 下找到。

Step 12：使用相同的高级 API 发送同步消息并等待返回消息："API: Get Level"。

处理子模块的状态更改事件：

Step 13：注册状态更改事件后，我们可以在此处处理此事件。例如，我们将用户事件数据打印到状态历史记录中，该历史记录也直接显示在 UI 上。

Panel close? UI 事件：

Step 14：首先使用高级 API 发送同步消息以退出所选子模块："Macro:Exit"，然后退出调用者/主模块。

## Advance Examples

### Action Workers Example(Action Worker Mode Example.vi)

#### Overview

演示 CSM 框架中的工作者模式 (Worker Mode)。在工作者模式中，多个可克隆的 CSM 实例作为子模块运行。为避免命名冲突，CSM 会自动向工作者模块名称附加“#”后缀。当消息发送给工作者时，第一个空闲实例将使用公平队列机制处理它。从外部看，系统表现得好像只有一个模块在运行，而所有 CSM 概念（例如同步、异步和状态消息）都保持不变。

在本示例中，四个工作者实例在后台运行。检查历史日志以查看是哪个实例处理了每条消息。

#### Introduction

本示例演示 CSM 框架中的工作者模式 (Worker Mode)。在工作者模式中，多个可克隆的 CSM 实例作为子模块运行。为避免命名冲突，CSM 会自动向工作者模块名称附加“#”后缀。当消息发送给工作者时，第一个空闲实例将使用公平队列机制处理它。从外部看，系统表现得好像只有一个模块在运行，而所有 CSM 概念（例如同步、异步和状态消息）都保持不变。

在本示例中，四个工作者实例在后台运行。检查历史日志以查看是哪个实例处理了每条消息。

#### Steps

Step 1：使用高级 VI 将 CSM 模块标记为工作者模式（添加#作为后缀），如果您熟悉 CSM 规则，也可以只键入正确的名称后缀，而不使用此高级 VI。

然后异步调用 4 个工作者 CSM 模块，无需等待回复。或者，您也可以同步调用 4 个工作者 CSM 模块，甚至异步调用并带回复，请参阅禁用 case 中的代码。

Step 2：拖放一个带 UI 的模板 CSM VI，并将其命名为 WorkerModeExample。

Step 3：使用 while 循环来获取所有正在运行的 CSM 模块的状态信息，包括名称、模式、实例数和要处理的消息队列数。使用高级 VI 停止 while 循环，即一旦调用者/主 CSM 模块退出，while 循环将停止。

Step 4：转到 "Macro:Initialize" case，并添加一个消息字符串作为最后一行，''UI: Update Worker Info''。目前，''UI: Update Worker Info" case 中没有放置任何代码，但您可以在此处编写任何自定义代码。

Step 5：

Step 5.1：UI 事件处理，在用户单击六个用户按钮 "DoSth: DoA -> Worker", "DoSth: DoA -@ Worker", "DoSth: Error -> Worker", "DoSth: Error -@ Worker" , "Macro: Exit -@ Worker", "Macro: Exit -> Worker" 中的任何一个后，将向第一个空闲的工作者 CSM 模块发送一条模块间消息。

Step 5.2 然后在 UI 中添加一个 Response Source Manager 指示器，以处理 "Async Response" 和 "Response" case，并发送一个本地消息 ''UI: Update Worker Info"。

Step 6：在 Panel Close? UI 事件下，使用高级 API 向所有正在运行的 CSM 工作者模块发送 "Macro:Exit" 同步消息（您也可以手动键入模块间消息，注意有多少个正在运行的工作者模块。每个正在运行的工作者模式都需要一条消息），并向调用者/主 CSM 模块发送本地消息 "Macro:Exit"。然后所有 CSM 模块将按顺序退出。

### Chain of Responsibility Example(Chain of Responsibility Example.vi)

#### Overview

演示 CSM 框架中实现的责任链 (responsibility chain) 设计模式。通过单击前面板上的按钮，您可以观察责任链如何按定义的顺序处理允许的消息。

每条消息都从最低顺序的模块传递到最高顺序的模块。当一个模块成功处理该消息时，处理停止，并且该消息不会转发到后续模块。如果链中没有模块可以处理该消息，本示例将返回一个错误。

#### Introduction

本示例演示 CSM 框架中的责任链模式。责任链 CSM 模块应始终以后缀“$”和整数标记，例如 "CSMName$1"、"CSMName$2" 等。

一组责任链 CSM 模块以允许的方式并按顺序处理消息：

- 每个单独的链模块只能处理特别允许的消息。
- 如果一条消息被多个链模块允许，则顺序最低的链模块将处理该消息，并且该消息不会再被更高顺序的链模块处理。

#### Instructions

1. 运行此 VI。
2. 单击前面板上的任何按钮，例如 "Action: action 1 -> Chain"，然后您可以看到哪个链模块处理了哪条消息。
3. 单击 "Macro: Exit -> Chain" 或 "Macro: Exit -@ Chain" 按钮，然后您可以看到链模块将按顺序启动。

#### Steps

Step 1：为每个将标记为链模式的 CSM 子模块添加特殊允许的消息，例如本示例中 "Chain$1" CSM 子模块的 "Action: action 1" 和 "Action: action 2"。

Step 2：拖放一个带 UI 的模板 CSM VI，并将其命名为 ChainModeExample。

Step 3：在 UI 中创建布尔按钮，例如 "Action: action 1 -> Chain" 等，以模拟模块间消息传输。

Step 4：使用高级 API 监控所有正在运行的 CSM 模块的状态。

Step 5：使用全局日志 API 计算和监控实时日志记录能力，更多详情请参阅 4. Advance Examples\6. Global Log Handling Capability。

### Build-in Error Handling Framework(Topmost VI who Registers all Errors.vi)

#### Overview

演示如何使用内置的错误处理框架来订阅所有活动的 CSM 子模块的错误。

每个 CSM 模块在检测到错误时会自动广播 Error Occurred 状态更新。要捕获这些事件，请在顶级 CSM 模块中添加一个模块间消息字符串以注册该广播。

如果调用者 VI 不是 CSM 模块，您可以使用 Non-CSM Caller Support VI 实现相同的功能。

#### Introduction

本示例演示如何使用内置的错误处理框架来订阅所有活动的 CSM 子模块的错误。

每个 CSM 模块在检测到错误时会自动广播 Error Occurred 状态更新。要捕获这些事件，请在顶级 CSM 模块中添加一个模块间消息字符串以注册该广播。

如果调用者 VI 不是 CSM 模块，您可以使用 Non-CSM Caller Support VI 实现相同的功能。

#### Steps

Step 1：使用 CSM VI 模板创建 GlobalErrorHandlingExample CSM 模块，并同步调用另外两个 CSM 模块。

Step 2：添加一行模块间字符串消息以注册 "Error Occurred" 广播事件，该事件在任何 CSM 子模块出错时生成："Error Occurred@* >> Error Handler -><register>"，然后在 "Error Handler" case 中相应地处理捕获的事件。

### Global Log Filter Example(Filter From Source(Event).vi)

#### Overview

演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于源视图 (source-view)、基于用户事件 (user-event-based) 的机制。

#### Introduction

本示例演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于源视图 (source-view)、基于用户事件 (user-event-based) 的机制。

#### Steps

Step 1：获取 CSM 全局状态用户事件句柄，并注册它。

Step 2：设置全局过滤规则。规则下有两个簇，第一个用于全局过滤，第二个用于特定的 CSM 模块。

例如，我们过滤掉来自 Module2 的所有日志（全局）以及 Module1 的 "State Change" LogType（特定模块日志）。

Step 3：使用 CSM_Run Scripts VI 向所有四个同步调用的 CSM 模块发送 "API:start" 消息。

Step 4：在 UI 事件中动态更改全局过滤规则。

Step 5：捕获用户事件并处理它，在本示例中，我们将其打印到 LabVIEW UI。

Step 6：使用 CSM_Run Scripts VI 发送 "Macro:Exit" 消息，以同步退出所有正在运行的 CSM 模块，并销毁 CSM 全局状态用户事件句柄。

### Global Log Filter Example(Filter From Source(Queue).vi)

#### Overview

演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于源视图 (source-view)、基于队列 (queue-based) 的机制。

#### Introduction

本示例演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于源视图 (source-view)、基于队列 (queue-based) 的机制。

#### Steps

Step 1：获取 CSM 全局状态用户事件队列。

Step 2：设置全局过滤规则。规则下有两个簇，第一个用于全局过滤，第二个用于特定的 CSM 模块。

例如，我们过滤掉来自 Module2 的所有日志（全局）以及 Module1 的 "State Change" LogType（特定模块日志）。

Step 3：使用 CSM_Run Scripts VI 向所有四个同步调用的 CSM 模块发送 "API:start" 消息。

Step 4：首先使用 LabVIEW 队列 VI 获取队列状态并出队一个元素以进行一些日志记录计算，例如速度和 LogInQ 等。我们还将日志打印到 LabVIEW UI。

然后，如果用户直接从 UI 更改，则动态更改全局过滤规则。

Step 5：使用 CSM_Run Scripts VI 发送 "Macro:Exit" 消息，以同步退出所有正在运行的 CSM 模块，并销毁 CSM 全局状态用户事件队列。

### Global Log Filter Example(Filter From Subscriber(Event).vi)

#### Overview

演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于订阅者视图 (subscriber-view)、基于用户事件 (user-event-based) 的机制。

#### Introduction

本示例演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于订阅者视图 (subscriber-view)、基于用户事件 (user-event-based) 的机制。

#### Steps

Step 1：获取 CSM 全局状态用户事件句柄，并注册它。

Step 2：使用 CSM_Run Scripts VI 向所有四个同步调用的 CSM 模块发送 "API:start" 消息。

Step 3：在 UI 事件中动态设置全局过滤规则。规则下有两个簇，第一个用于全局过滤，第二个用于特定的 CSM 模块。

例如，我们过滤掉来自 Module2 的所有日志（全局）以及 Module1 的 "State Change" LogType（特定模块日志）。

Step 4：捕获用户事件并处理它，在本示例中，我们将其打印到 LabVIEW UI。

Step 5：使用 CSM_Run Scripts VI 发送 "Macro:Exit" 消息，以同步退出所有正在运行的 CSM 模块，并销毁 CSM 全局状态用户事件句柄。

### Global Log Filter Example(Filter From Subscriber(Queue).vi)

#### Overview

演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于订阅者视图 (subscriber-view)、基于队列 (queue-based) 的机制。

#### Introduction

本示例演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于订阅者视图 (subscriber-view)、基于队列 (queue-based) 的机制。

#### Steps

Step 1：获取 CSM 全局状态用户事件队列。

Step 2：使用 CSM_Run Scripts VI 向所有四个同步调用的 CSM 模块发送 "API:start" 消息。

Step 3 首先使用 LabVIEW 队列 VI 获取队列状态并出队一个元素以进行一些日志记录计算，例如速度和 LogInQ 等。

然后，如果用户直接从 UI 更改，则动态更改全局过滤规则。

最后，我们还将日志打印到 LabVIEW UI。

Step 4：使用 CSM_Run Scripts VI 发送 "Macro:Exit" 消息，以同步退出所有正在运行的 CSM 模块，并销毁 CSM 全局状态用户事件队列。

### Multi-Loop Module Example(Main - Call and Monitor TCP Traffic.vi)

#### Overview

演示在旁路循环中调用 CSM 子模块。在外部，该模块的交互类似于标准 CSM 子模块，但请注意其特定的 API 和状态更改行为。

#### Introduction

本示例演示在旁路循环中调用 CSM 子模块。在外部，该模块的交互类似于标准 CSM 子模块，但请注意其特定的 API 和状态更改行为。

#### Instructions

1. 运行此 VI。
2. 运行 Simple TCP - Client.vi。
3. 修改此 VI 和客户端上的字符串控件以观察通信日志。
4. 根据需要重新启动 Simple TCP - Client.vi 以观察重新连接日志。

### Global Log Handling Capability(Global Log Handling Capability Example.vi)

#### Overview

演示 CSM 的全局日志处理能力。本示例调用 30 个持续生成事件的子模块。主 VI 捕获这些事件，并使用全局日志 API 来计算和显示关键处理指标，例如 LogInQ、更改速度和处理速度。

使用此示例来基准测试 CSM 的全局日志性能，并作为自定义实现的参考。

#### Introduction

本示例演示 CSM 的全局日志处理能力。本示例调用 30 个持续生成事件的子模块。主 VI 捕h获这些事件，并使用全局日志 API 来计算和显示关键处理指标，例如 LogInQ、更改速度和处理速度。

使用此示例来基准测试 CSM 的全局日志性能，并作为自定义实现的参考。

#### Steps

Step 1：异步调用 30 个 CSM 子模块，每个子模块随后将持续生成事件。

Step 2：启动 CSM 看门狗 (Watchdog) 线程，以确保所有异步启动的 CSM 模块在主程序退出后都能正常退出。

Step 3：使用 CSM 的内置全局日志 API 捕获和计算一些典型的日志记录能力数据。

Step 4：退出调用者和所有其他正在运行的 CSM 模块。

### Register State as Status Example(Register State as Status Example.vi)

#### Overview

演示使用 CSM <register> 消息字符串进行动态状态注册。该消息可以使用 Build Message With Arguments ++.vi 构建，也可以手动创建。单击示例 UI 中的按钮，查看相应的响应。您还可以在示例 UI 中更改注册字符串，以查看进一步的自定义响应。

本示例的一个关键特性是能够级联或流水线化 (pipeline) 事件注册。例如，当 A 注册 B 且 B 注册 C 时，来自 A 的事件首先被 B 捕获，然后传递给 C 进行进一步处理。单击 API: API2 -@submodule1 查看此演示。

CSM 核心引擎会自动管理注册过程，因此不需要手动注销。

#### Introduction

本示例演示使用 CSM <register> 消息字符串进行动态状态注册。该消息可以使用 Build Message With Arguments ++.vi 构建，也可以手动创建。单击示例 UI 中的按钮，查看相应的响应。您还可以在示例 UI 中更改注册字符串，以查看进一步的自定义响应。

本示例的一个关键特性是能够级联或流水线化 (pipeline) 事件注册。例如，当 A 注册 B 且 B 注册 C 时，来自 A 的事件首先被 B 捕获，然后传递给 C 进行进一步处理。单击 API: API2 -@submodule1 查看此演示。

CSM 核心引擎会自动管理注册过程，因此不需要手动注销。

#### Steps

Step 1：基于模板 VI 创建一个带 UI 的 CSM 模块，并同步调用两个 CSM 子模块（在调用子模块前等待 1 秒，以获得更好的 UI 显示顺序）。

Step 2：手动添加一系列 "<register>" 字符串，以动态注册不同 CSM 模块之间的模块间事件。如果您不熟悉此字符串语法，也可以使用高级 API Build Message With Arguments ++.vi。

Step 3：添加 "Echo:Echo1" case：我们使用实用 VI 来进一步获取注册的来源，无论是本地调用、远程调用还是状态回调。如果您想知道注册的事件源，此实用 VI 非常有用。同时添加 "Echo:Echo2" case，目前没有放置任何代码。但您可以实现任何自定义代码。您不需要手动注销这些事件，因为 CSM 核心引擎会自动处理它。

## Addons - Logger

### CSM Application Running Log Example.vi

#### Overview

演示如何使用 CSM Logger VI 来实现全局 CSM 事件文件记录功能。

#### Introduction

本示例演示如何使用 CSM Logger VI 来实现全局 CSM 事件文件记录功能。

#### Steps

Step 1：使用 CSM VI 模板获取一个带 UI 的 CSM 模块。

Step 1.1：给 CSM 模块一个名称，例如 "RunningLogExample"。

Step 1.2：在 UI 事件中广播消息。

Step 2：使用高级 CSM-Start File Logger.vi（此 VI 可以在 LabVIEW 选板 -> CSM -> Addons -> Logger 下找到）来快速实现全局 CSM 事件文件记录功能。

例如，我们按顺序放置两个这样的 VI，手动设置日志记录的文件路径和名称，并分别启用全局规则过滤器。运行此示例后，您还可以找到并查看相应的日志文件，以加深理解。如果以后要添加/调用更多 CSM 模块，您无需更改此处的任何代码以实现日志记录功能。总之，您只需要这样一个高级 CSM 附加组件日志记录器 VI 即可快速实现全局日志记录功能。

## Addons - Loop Support

### CSMLS - Continuous Loop in CSM Example.vi

#### Overview

演示如何使用 CSM Loop-Support VI 来创建类似于 while 循环的连续循环机制。您无需手动嵌入 while 循环，而是可以使用高级 API 来定义、附加和终止循环。CSM 框架会自动处理所有底层操作。

本示例展示了 CSM 框架内的连续 DAQ 采集。单击 Start 开始连续采集，单击 Stop（或触发高优先级错误）结束循环。作为比较，单击 DAQ:once 运行单次采集。低优先级错误不会停止循环。

#### Introduction

本示例演示如何使用 CSM Loop-Support VI 来创建类似于 while 循环的连续循环机制。您无需手动嵌入 while 循环，而是可以使用高级 API 来定义、附加和终止循环。CSM 框架会自动处理所有底层操作。

本示例展示了 CSM 框架内的连续 DAQ 采集。单击 Start 开始连续采集，单击 Stop（或触发高优先级错误）结束循环。作为比较，单击 DAQ:once 运行单次采集。低优先级错误不会停止循环。

#### Instructions

1. 运行 VI 并单击 **DAQ:once** 以执行单次 DAQ 采集。
2. 单击 **Start** 开始连续采集。波形图和日志历史记录会实时更新。
3. 单击 **Stop** 或 **High-Priority Error** 终止循环。
4. 循环运行时，单击 **Low-Priority Error**。错误被忽略，循环仍会运行。

#### Steps

Step 1：

 Step 1.1 如果 UI 事件变得非常复杂，建议使用 CSM DQMH-Style Template，以便我们可以将 UI 逻辑与其他 CSM 相关逻辑分开处理。您可以在 LabVIEW 选板 -> CSM -> More Templates 下找到此模板。

 Step 1.2：此外，已使用多循环支持 API 将状态从 DQMH 循环转发到 CSM 主循环。例如，在用户单击 Start 按钮后，"Macro:DAQ continuous" 消息可以被转发到 CSM 主循环中进行进一步的逻辑处理。

Step 2：使用 CSM-Addon Logger Start File Logger.vi 来快速实现 CSM 全局事件文件记录功能。

Step3：使用 CSM Loop-support API VI 来实现 while 循环。

 Step 3.1：Define Loop States(s).vi：定义多个消息字符串，用 "-><loop>" 标记该字符串，以便该消息字符串被连续处理。将所有这些字符串发送到 Define Loop States(s).VI 中。

 Step 3.2：Append Continuous States.vi：添加任何必要的连续参数，并将其附加到其他状态和参数中，以便所有这些都可以在一个循环中运行。

 Step 3.3 Remove Loop Tag to Break.vi：使用此 VI 停止 while 循环并处理循环后状态。

 Step 3.4：Remove Loop Tag and Previous States to Break.vi：使用此 VI 停止 while 循环，同时移除先前的状态，然后处理循环后状态。

## Addons - API String Arguments Support

### Using within CSM - Get Module Configuration.vi

#### Overview





#### Introduction





#### Steps





### CSM API String to Typical data types.vi

#### Overview





#### Introduction





#### Steps





### Typical data types to CSM API String.vi

#### Overview





#### Introduction





#### Steps





### Incorrect usage collections.vi

#### Overview





#### Introduction





#### Steps





### CSM API String to Float.vi

#### Overview





#### Introduction





#### Steps





### CSM API String (Float with Unit) to Float.vi

#### Overview





#### Introduction





#### Steps





### CSM API String to Complex Numeric.vi

#### Overview





#### Introduction





#### Steps





### CSM API String to TimeStamp.vi

#### Overview





#### Introduction





#### Steps





### CSM API String to Enum(special format).vi

#### Overview





#### Introduction





#### Steps





### CSM API String to Array.vi

#### Overview





#### Introduction





#### Steps





### 1D-Cluster to CSM API String.vi

#### Overview





#### Introduction





#### Steps





### 2D-Cluster to CSM API String.vi

#### Overview





#### Introduction





#### Steps





### Cluster to CSM API String.vi

#### Overview





#### Introduction





#### Steps





### CSM API String to Cluster.vi

#### Overview





#### Introduction





#### Steps





### CSM API String to Cluster with 2D Array elements.vi

#### Overview





#### Introduction





#### Steps





## Addons - MassData Parameter Support

### MassData Argument Format.vi

#### Overview





#### Introduction





#### Steps





### Show MassData Cache Status in FP.vi

#### Overview





#### Introduction





#### Steps





### MassData in Non-CSM Framework.vi

#### Overview





#### Introduction





#### Steps





### MassData in CSM.vi

#### Overview





#### Introduction





#### Steps





## Addons - INI Static Variable Support

### Used as parameters parsed by CSM.vi

#### Overview





#### Introduction





#### Steps





### Load the corresponding configuration by providing the prototype.vi

#### Overview





#### Introduction





#### Steps





### In CSM API parameters.vi

#### Overview





#### Introduction





#### Steps





### Multi-file configuration systemvi.vi

#### Overview





#### Introduction





#### Steps





### Write and Read Configuration.vi

#### Overview





#### Introduction





#### Steps





### import Config.ini with __include section.vi

#### Overview





#### Introduction





#### Steps





### Read Nested Variables.vi

#### Overview





#### Introduction





#### Steps