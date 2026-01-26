# CSM Basic Example Description

## Basic Concepts

### 1. JKISM vs CSM.vi

#### Overview

CSM是仿照JKISM逻辑设计的LabVIEW程序开发框架，两个框架都使用基于字符串的消息队列来实现核心逻辑。本示例用于演示CSM基于JKISM的拓展。

#### Introduction

本示例比较JKISM框架和CSM框架之间的代码。两个框架都使用基于字符串的消息队列来实现核心状态机。

#### Steps

基于JKISM，CSM具有以下主要扩展功能: 

- Step1: CSM是一个程序框架因此它需要模块的名称。
- Step2: 重新设计了核心字符串解析引擎。
    - Step2.1: JKISM使用Parse State Queue.vi，它只输出下一个状态队列及其对应的参数(位于 >> 之后)，主要用作“出队元素”。
    - Step2.2: CSM 使用Parse State Queue++.vi额外添加了以下主要功能: 
        \- 基于状态队列输入自动创建/处理/销毁队列/用户事件机制，因此用户只需给出相应的高级字符串消息。
        \- 模块间/VI 间的消息可以被传输。
        \- 额外的输入，如Dequeue Timeout、Response Timeout 和 Allowed Messages，用于实现更高级的功能。

- Step3: CSM添加了一个内部状态调试日志`history.vi`用于更好的调试和记录，状态历史可以直接显示在前面板上。
- Step4: CSM定义了一系列字符串语法来实现本地/模块间消息传输，例如同步消息、异步消息、状态创建/注册/注销等。
    - Step4.1: JKISM只定义了本地状态的轮转。它可以携带一个参数以及注释。
    - Step4.2: CSM是一个软件框架，因此它定义了模块。以及模块之间的消息通讯。

- Step5: CSM定义了一些基础的状态，用于处理模块之间通讯的逻辑行为。
    - Step5.1: "Critical Error"用于处理一些无法恢复的错误。
    - Step5.2: "Target Timeout Error"用于处理模块消息通讯超时的错误。
    - Step5.3: "Target Error"用于处理模块不存在的错误。
    - STEP5.4: "Async Response"用于处理异步消息的回复。
    - Step5.5: ”Response"用于处理同步消息的回复。
    - Step5.6: "Async Message Posted"用于处理异步消息发送后的操作。
    - Step5.7: (Optional)"Events: Register"和"Events: Unregister"中使用的消息事件，用于触发带有Event Structure的CSM模块跳出。
    - Step5.8: (Optional)"<New State Notifier Event>"配合Step5.7实现在外部消息到来后，跳出事件结构等待
    - Step5.9: (Optional)CSM推荐使用API分组提供对外的接口，但是实际上所有的分支都可以使用消息调用。

- Step6: CSM额外定义了"Msg/Rsp's CSM"用于定位外部消息、状态的来源模块
- Step7: 额外的消息信息，如Response的源消息名称、源参数等，可以由此获得。
- Step8: CSM预置了消息返回.
- Step9: CSM扩展了调试工具，详情请参阅选板 CSM->CSM Debug Tools。

### 2. Module Naming Rules.vi

#### Overview

演示CSM模块名称的基本字符串命名规则。一个有效的CSM模块名称是一个字符串，不应包含以下任何特殊字符: `~!@%^&*()\[\]{}+=|\\/?'"<>,.\t\r\n`。这些字符是CSM框架内保留用于其他目的的关键字。

#### Introduction

通过不同情况的分析，展示一个有效的CSM模块名称是怎样的.

#### Steps

- Step1: 展示普通模块名称的情况。
- Step2: 展示有空格模块的情况。
- Step3: 这是有: 的情况。
- Step4: 展示有#的情况。这个时候是模块名称是正确的，这个时候对应模块工作在worker模式。
- Step5: 展示有_的情况。
- Step6: 展示有-的情况。
- Step7: 展示几种包含特殊字符的错误情况。
- Step8: 展示以.开头的情况，这个时候是模块名称是正确的，这个时候对应的模块工作在系统级别模式
- Step9: 展示.在内部起分隔符的情况，这个时候是模块名称是正确的，从逻辑上可以看作是一个子模块。
- Step10: 展示包含$且之后是数字的情况，这个时候是模块名称是正确的，这个时候对应的模块工作在Chain模式。

### 3. Message Helper VI and Equivalent String.vi

#### Overview

演示CSM框架内消息通信的字符串语法格式。

#### Introduction

本示例解释了CSM模块间消息通信的语法格式，您可以使用LabVIEW API来构建这些字符串，或者如果您熟悉消息规则，也可以手动创建这些字符串。CSM定义的语法如下: 

```
    //--- CSM 状态语法 ---
    // 本地消息示例
    DoSth: DoA >> 参数

    // 同步调用示例
    API: xxxx >> 参数 -@ TargetModule

    // 异步调用示例
    API: xxxx >> 参数 -> TargetModule

    // 无应答异步调用示例
    API: xxxx >> 参数 ->| TargetModule

    // 广播正常状态: 
    Status >> StatusArguments -><status>

    // 广播中断状态: 
    Interrupt >> StatusArguments -><interrupt>

    // 将源模块的状态注册到处理程序模块
    Status@Source Module >> API@Handler Module -><register>

    // 取消注册源模块的状态
    Status@Source Module >> API@Handler Module -><unregister>

    //--- CSM 注释 ---
    // 要添加注释，请使用 "//"，右边的所有文本将被忽略。
    UI: Initialize // 初始化 UI
    // Another comment line
```

#### Steps

- Step1: 同步消息。发送方会原地等待回复，直到超时或收到回复。
- Step2: 带回复的异步消息。发送方会继续执行后续操作，而不会等待回复；接收方处理完消息后，会回复发送方。
- Step3: 不带回复的异步消息。发送方会继续执行后续操作，而不会等待回复；接收方处理完消息后，不会回复发送方。
- Step4: 广播一个正常的状态字符串。
- Step5: 广播一个中断或高优先级的状态字符串
- Step6: 注册一个状态, 当状态发生变化时, 会自动触发所注册的处理程序模块的消息。
- Step7: 注销一个状态，取消注册状态变化触发的消息。



### 4.1 Arguments - Complex Data As Arguments.vi

#### Overview

本范例用于展示其他的数据类型如何转换为HEXSTR作为参数传递。

#### Introduction

CSM的参数表现形式只能为String类型。HEXSTR (0-9, A-F)格式是CSM框架内用于传递复杂数据类型的字符串表示形式。 它可以将任意数据类型作为参数使用，而不会干扰CSM消息字符串的解析。此外，CSM-Argument Type.vi获取参数标记，在本例中为`HEXSTR`。

内部的转换逻辑为: 将任意数据类型转换为变体(variant)，然后将变体的内存内容转换为HEXSTR格式。

应用场景: 任意数据类型的无损传递，例如: 簇、数组、结构体等。但是数据量较大时，会导致消息字符串过长，影响性能，因此不适用于传递大数组或波形数据等场景。

#### Steps

- Step1: 展示将簇转换为HEXSTR并还原。
- Step2: 展示将少量数据的数组，转换为HEXSTR并还原。



### 4.2 Arguments - Error As Arguments.vi

#### Overview

本范例用于展示LabVIEW错误如何作为CSM参数传递。

#### Introduction

本示例将LabVIEW错误簇转换为CSM兼容的错误字符串，这允许CSM核心解析引擎处理来自消息队列的LabVIEW错误，也便于在日志中记录内部发生的错误。转换后的错误字符串使用以下格式: `<ErrStr>[Error: error-code] error-description-As-safe-argument-string`。此外，`CSM-Argument Type.vi`获取参数标记，在本例中为 `ErrStr`。

应用场景: 传递LabVIEW 错误。

#### Steps

- Step1: 展示将错误转换为 ErrStr 并还原。
- Step2: (向前兼容)展示将之前的 ErrStr 转换为错误簇。
- Step3: 展示将将之前的ErrStr转换为错误簇，并获取CSM-Argument Type。



### 4.3 Arguments - Safe Arguments if it contains key words of CSM.vi

#### Overview

演示如何将包含特殊字符的字符串作为参数传递。

#### Introduction

由于CSM使用文本描述作为参数，因此如果参数中包含CSM的保留关键字，就会导致解析错误。为了解决这个问题，CSM会提供API将不安全的字符串中的特殊字符转换为安全的字符串，用于参数中的传递。

应用场景: 传递包含特殊字符的字符串。

#### Steps

- Step1: 展示将不安全的字符串转换为安全的字符串，并获取CSM-Argument Type。
- Step2: 展示Windows文件路径作为参数的情况。
- Step3: 展示网址作为参数的情况。




### 5. CSM Data Type.vi

#### Overview

展示CSM推荐的数据类型描述。

#### Introduction

CSM框架中，参数的只能以String类型的表现形式进行传递。为了支持各种不同的数据类型，通常数据都需要经过打包、传递、解包的过程。例如CSM内部就提供了 HEXSTR格式的参数类型支持，用户也可以通过addon 的形式，提供符合应用场景的自定义数据类型转换。

为了支持不同的数据类型，有的时候需要传递数据类型描述，用于在解码处处理不同数据类型的的逻辑分支。本示例展示了CSM推荐的数据类型描述方式即对应的API.



### 6. Module Attributes.vi

#### Overview

演示CSM Attribute的使用方法。CSM Attribute是CSM框架内用于存储模块配置的一种机制。它被用于: 

- 提供一种无需消息访问的配置方法，外部通过模块名称、属性名称、数据类型即可直接读写模块的属性值。
- 提供一种Worker模式、Chain模式模块内部节点数据共享的机制。不同的节点共享同一个Attribute空间，节点可以通过读写Attribute来实现数据共享。

#### Introduction

本示例演示如何使用CSM框架之外的VI动态地与CSM模块属性交互。本示例的核心功能是从CSM模块外部动态设置另一个随机数值到CSM模块，然后从CSM模块获取该值并在UI上显示。

#### Steps

- Step1: 这是一个从模板建立的CSM模块，名称为“CSM”。
- Step2: 在Macro:Initialize之后添加一行新的状态字符串，即API: Define ABC Attribute。
- Step3: API: Define ABC Attribute中设置模块属性: abc 作为属性，一个随机数作为值。
- Step4: 从CSM模块外部可以设置模块属性: abc作为属性，一个随机数作为值。
- Step5: 从CSM模块外部可以读取模块属性: abc作为属性。
- Step6: 从CSM模块外部发送同步消息以停止CSM模块。



### 7. System-Level Module.vi

#### Overview

演示如何创建系统级模块，并说明在列出所有活动模块时，系统级模块与常规CSM模块之间的区别。

#### Introduction

系统级(SystemLevel)模块系统级模块的名称前会添加一个“.”作为前缀，标记为系统级模块。功能上与普通模块无异，可以进行消息通讯和状态订阅。他们之间的区别在于系统级的模块，不会自动被列出在活动模块列表中。这样在普通的逻辑调度中，系统级模块不会被直接调用，只能通过显式的消息发送，才能被触发。

因此系统级模块通常用于实现一些全局的后台功能，例如 TCP程序中的调度模块等。

本范例就用于展示这个区别。

#### Steps

- Step1: 使用高级API VI创建一个系统级模块名称(在CSM名称前添加“.”作为前缀，标记为系统级模块)。如果您熟悉规则，也可以直接输入相应的名称字符串和规则符号，而无需调用此API。
- Step2: 同步调用几个“普通”/非系统级的CSM模块。
- Step3: (Optional) 检查CSM模块名称是否有效，更多详情请参阅另一个名为Module Naming Rules.vi的示例代码。
- Step4: 等待1s, 确保所有模块完成启动。
- Step5: 列出所有活动的CSM模块，默认情况下不会列出系统级模块。通过使用这种高级 VI，我们可以将系统级模块与其他常规模块分开，以便更好地进行代码开发、调试等。
- Step6: 使用统一的逻辑，发送“Macro:Exit”消息给所有活动的普通CSM模块，以停止所有这些模块。
- Step7: 依然可以使用发送消息给系统级模块，例如发送Macro:Exit消息，以停止系统级模块。



## Create a reuse Module

### CSM Reuse Module.vi

#### Overview

CSM框架中，创建一个可重用模块通常不需要与其他模块进行消息交互，只需提供外部接口并发布模块的状态变化。因此，只要这两个方面描述清晰，即使不了解内部实现细节，也能调用该可重用模块。本范例用于展示如何创建一个可重用模块，该模块用于检查随机数据是否超过用户定义的阈值。

在CSM模块中，所有case分支都可被视为可调用的消息，但建议使用API分组作为外部接口。当需要发送状态更新时，可以通过发送Status或Interrupt Status来通知外部模块内部的状态变化。

#### Introduction

本示例描述编写的一个CSM模块，它的功能是每秒生成一个随机数，并将该数字与用户定义的阈值进行比较。当生成的随机数超过阈值时，广播一个更新。

#### Steps

- Step1: 从选板拖放CSM模板。
- Step2: 将<b>Level</b>添加到Internal Data中。默认值为0.5。
- Step3: 创建"DoSth: Check If Greater than 0.5"。在此实现核心功能。
    - Step3.1: 比较随机数据并更新UI。
    - Step3.2: 当随机数据超过level时，发布 "Status Changed" 状态。
- Step4: 将<b>Timeout</b>更改为移位寄存器。它将用于启动/停止超时事件。在每种情况下连接<b>Timeout</b>的连线。
- Step5: 在Timeout Event中，将"DoSth: Check If Greater than 0.5"添加到 State Queue。
- Step6: 为此模块创建API。
    - Step6.1: 创建"API: Start"将<b>Timeout</b>更改为0.5 s，这将每秒触发一次"DoSth: Check If Greater than 0.5"。在这种情况下，将广播"Check Started"状态。
    - Step6.2: 创建"API: Stop"将<b>Timeout</b>更改为-1，这将停止检查。"Check Stopped"状态将被广播。
    - Step6.3: 创建"API: Set Level"以更改<b>Level</b>设置。
    - Step6.4: 创建"API: Get Level"以从外部获取当前<b>Level</b>。
- Step7: 创建本地测试按钮/控件
    - Step7.1: 创建<b>Level</b>控件，调用"API: Set Level"以在本地更改level设置。
    - Step7.2: 创建<b>Start</b>按钮，调用"API: Start"以在本地开始检查。
    - Step7.3: 创建<b>Stop</b>按钮，调用"API: Stop"以在本地开始检查。
- Step8: 在适当的情况下正确更新UI。
    - Step8.1: 启动时初始化UI。
    - Step8.2: 注释掉"Macro: Initialize"中的`UI: Front Panel State >> Open`。当它作为子模块工作时，UI将自动隐藏而不是弹出。
    
    

## Caller is CSM Scenario

### CSM Example - Caller is a CSM.vi

#### Overview

演示如何在CSM框架内调用CSM模块。本示例同步调用CSM Reuse Module VI的两个实例，通过API实现动态状态订阅和模块控制。

#### Introduction

演示如何在CSM框架内调用CSM模块。在本示例中，模块间通信通过消息字符串队列操作执行。您可以使用Build Message with Arguments++ VI 生成消息字符串，或者如果您熟悉格式，也可以直接使用消息描述字符串。

本示例同步调用CSM Reuse Module VI的两个实例，通过API实现动态状态订阅和模块控制。

#### Steps

- Step1: 从LabVIEW选板拖放一个CSM User Interface (UI) Module Template，将CSM名称更改为"CSMScenarioExample"。
- Step2: 同步调用CSM Reuse Module VI两次，并分别命名为SubModule0和SubModule1。有关如何创建此类可重用CSM模块的更多详细信息，请参阅另一个名为`1. Create a reuse Module`的CSM示例。
- Step3: 在"Macro:Initialize"case下的现有标准字符串队列中添加一行新的自定义消息字符串，即"Macro: Switch Active Module"，作为最后一行，以便在不同的子模块之间切换。
- Step4: 为内部数据初始化添加一个字符串常量SubModule0。对于更多自定义的内部数据初始化，您可以在此处添加更多代码。
- Step5: 在UI中添加一个字符串控件(Combo Box)，用于切换和显示活动/目标模块。
    - Step5.1: 在" 'Target Module': Value Change" UI事件下，将字符串控件设置为活动模块内部数据。
    - Step5.2: 同样使用“Macro: Switch Active Module”，更新活动模块。
- Step6: 在"Macro: Switch Active Module" case下，使用高级VI向活动子模块发送模块间同步消息"API: Get Level -@ modulename"。或者，如果您熟悉CSM字符串语法规则，也可以手动键入字符串常量。
- Step7: 现在状态队列为空，CSM 状态机正在' "", "Event Structure", "Idle" '下的超时UI事件中等待。下一步取决于用户提供的UI交互。
- Step8: 在UI中创建本地测试按钮/控件如下: 
    - Step8.1: 创建<b>API:Start</b>按钮，当用户单击此按钮时，将发送一条异步无回复消息"API: Start -> modulename"以启动活动的子模块。
    - Step8.2: 创建<b>Register All Status Change</b>按钮，当用户单击此按钮时，此CSM模块将从活动子模块注册以下广播/中断消息"Status Changed@* >> Action: Status Change Handler ->\<register>"。
    - Step8.3: 创建<b>Unregister All Status Change</b>按钮，当用户单击此按钮时，此CSM模块将从活动子模块注销以下广播/中断消息"Status Changed@* >> Action: Status Change Handler ->\<unregister>"。
    - Step8.4: 此处用于收到消息时跳出事件结构，以处理状态更改。
    - Step8.5: 创建<b>API:Stop</b>按钮，当用户单击此按钮时，将发送一条异步无回复消息"API: Stop -> modulename"以停止活动的子模块。
    - Step8.6: 创建<b>Level</b> DBL控件，当用户更改值时，将向活动子模块发送一条异步消息"API: Set Level >> 0.3 ->| modulename"。
    - Step8.7: 创建<b>API: Get Level(Async)</b>按钮，当用户单击此按钮时，将向活动子模块发送一条异步消息"API: Get Level -> modulename"。相应地处理"Async Message Posted"和"Async Response" case，在本示例中<b>Level</b>显示将被更新。
    - Step8.8: 创建<b>UI: create Front Panel State >> Open</b>按钮，当用户单击该按钮时，将向活动子模块发送一条带无回复的异步消息"UI: Front Panel State >> Open ->| modulename"。
    - Step8.9: 创建<b>UI: create Front Panel State >> Close</b>按钮，当用户单击该按钮时，将向活动子模块发送一条带无回复的异步消息"UI: Front Panel State >> Close ->| modulename"。
- Step9: 在"Panel Close?" UI事件下，在"Macro:Exit"之前添加两个新的字符串消息: "Macro: Exit -@ SubModule0"和"Macro: Exit -@ SubModule1"，以便在最终关闭CSM 调用者/主模块之前安全地关闭所有CSM子模块。



## Caller is Other Framework Scenario

### CSM Example - Caller is NOT a CSM.vi

#### Overview

演示如何从另一个框架应用程序调用CSM模块。本示例异步调用CSM Reuse Module VI的两个实例，通过API实现动态消息订阅和模块控制。

#### Introduction

演示如何从另一个框架应用程序调用CSM模块。在本示例中，模块间通信是使用Post/Send Message API和模块状态更改用户事件来实现的。

本示例异步调用CSM Reuse Module VI的两个实例，通过API实现动态消息订阅和模块控制。

#### Steps

- Step1: 在100ms-UI事件超时中，检查是否有任何CSM模块正在运行/存在。
- Step2: 启动和停止CSM子模块。
    - Step2.1: 异步调用选定的CSM子模块。
    - Step2.2: 向选定的CSM 子模块发送异步消息(无回复)以停止/退出CSM子模块。该高级API可在LabVIEW选板 -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support下找到。
- Step3: 注册和注销状态更改。
    - Step3.1: 从所选子模块获取状态更改事件句柄并注册它。该高级API可在LabVIEW选板 -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support下找到。
    - Step3.2: 注销用户事件，销毁并释放状态更改事件句柄。该高级API可在LabVIEW选板 -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support下找到。
- Step4. API 调用。
    - Step4.1: 向所选子模块发送异步消息(无回复): "API:start"。该高级API可在LabVIEW 选板 -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support下找到。
    - Step4.2: 向所选子模块发送异步消息(无回复): "API:stop"。
    - Step4.3: 向所选子模块发送异步消息(无回复): "UI: Front Panel State >> Open"。该高级API可在LabVIEW选板 -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support下找到。
    - Step4.4: 向所选子模块发送异步消息(无回复): "UI: Front Panel State >> Close"。
    - Step4.5: 发送同步消息并等待返回消息，在本例中为level值: "API: Get Level"。该高级API可在LabVIEW选板 -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support下找到。
    - Step4.6: 发送同步消息并等待返回消息: "API: Set Level >> value"。该高级API可在LabVIEW选板 -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support下找到。
- Step5: 处理子模块的状态更改事件。
    - Step5.1: 注册状态更改事件后，您可以在此处处理此事件。例如，将用户事件数据打印到状态历史记录中，该历史记录也直接显示在UI上。
- Step6: 程序退出。在"Panel close?" UI事件中，给所有的子模块发送同步消息Macro: Exit, 等待所有子模块退出。
