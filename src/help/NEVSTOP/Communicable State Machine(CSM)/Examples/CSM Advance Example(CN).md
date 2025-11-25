# CSM Advance Example Description

## 工作者模式范例

### 调用程序(Action Worker Mode Example.vi)

#### Overview

本示例演示 CSM 框架中的工作者模式 (Worker Mode)。在本示例中，四个worker 在后台运行,共同组成了一个处于工作者模式的CSM模块。

#### Introduction

本示例演示 CSM 框架中的工作者模式 (Worker Mode)。在工作者模式中，多个可克隆的 CSM 实例作为node 运行。为避免命名冲突，使用附加“#”后缀的模块名称，告知CSM框架这是一个工作者模块。当消息发送给工作者时，将使用公平队列机制处理它，第一个空闲的模块将会处理这个消息。从外部看，系统表现得好像只有一个模块在运行，所有 CSM 概念（例如同步、异步和状态消息）都保持不变。

在本示例中，四个worker 在后台运行。

#### Steps

- Step1：使用高级 VI 将 CSM 模块标标记为worker模式（添加#作为后缀），如果您熟悉 CSM 规则，也可以只键入正确的名称后缀，而不使用此VI。 然后异步调用 4 个工作者 CSM 模块，无需等待回复。或者，您也可以同步调用 4 个工作者 CSM 模块，甚至异步调用并带回复，请参阅禁用 case 中的代码。
- Step2：此循环为主程序模块，模块名称是 WorkerModeExample。
- Step3：使用 while 循环来获取所有正在运行的 CSM 模块的状态信息，包括名称、模式、实例数和要处理的消息队列数。使用高级 VI 停止 while 循环，即一旦调用者/主 CSM 模块退出，while 循环将停止。
- Step4：
    - Step4.1：UI 事件处理，在用户单击六个用户按钮 "DoSth: DoA -> Worker", "DoSth: DoA -@ Worker", "DoSth: Error -> Worker", "DoSth: Error -@ Worker" , "Macro: Exit -@ Worker", "Macro: Exit -> Worker" 中的任何一个后，将向第一个空闲的工作者 CSM 模块发送一条模块间消息。
    - Step4.2 然后在 UI 中添加一个 Response Source Manager 指示器，以处理 "Async Response" 和 "Response" case
- Step5：模块退出。在 Macro: Exit 消息中，使用 "CSM - Build Exit Messages of CSMs.vi" 创建所有正在运行的 CSM 工作者模块发送 "Macro:Exit" 的同步消息（您也可以手动键入模块间消息，注意有多少个正在运行的工作者模块。每个正在运行的工作者模式都需要一条消息），并向调用者/主 CSM 模块发送本地消息 "Macro:Exit"。然后所有 CSM 模块将按顺序退出。

### 工作者模式模块实现(Action Worker.vi)

#### Overview

本示例为工作者模式中CSM模块节点的实现。它被Action Worker Mode Example.vi调用，实例化出多个节点，共同组成了一个处于工作者模式的CSM模块。为了能够同时运行，CSM工作者模块的VI，必须设置为可重入。

#### Introduction

本示例为工作者模式中CSM模块节点的实现。提供以下两个方法：

1. DoSth: DoA: 无实际操作，仅用于演示。
2. DoSth: Error: 无实际操作，会产生一个Code=12345的错误，仅用于演示。

为了工作者模式的node能够同时运行，VI执行属性设置为可重入。

#### Steps

- Step1. 添加 "DoSth: DoA" 方法
- Step2. 添加 "DoSth: Error" 方法
- Step3. 设置 VI 执行属性为可重入

## 责任链模式范例

### 调用程序(Chain of Responsibility Example.vi)

#### Overview

演示 CSM 框架中实现的责任链 (responsibility chain) 设计模式。通过单击前面板上的按钮，您可以观察责任链如何按定义的顺序处理允许的消息。每条消息都从最低顺序的模块传递到最高顺序的模块。当一个模块成功处理该消息时，处理停止，并且该消息不会转发到后续模块。如果链中没有模块可以处理该消息，本示例将返回一个错误。

#### Instructions

1. 运行此 VI。
2. 单击前面板上的任何按钮，例如 "Action: action 1 -> Chain"，然后您可以看到哪个链模块处理了哪条消息。
3. 单击 "Macro: Exit -> Chain" 或 "Macro: Exit -@ Chain" 按钮，然后您可以看到链模块将按顺序启动。

#### Introduction

本示例演示 CSM 框架中的责任链模式。责任链 CSM 模块应始终以后缀“$”和整数标记，例如 "CSMName$1"、"CSMName$2" 等。

一组责任链 CSM 模块以允许的方式并按顺序处理消息：

- 每个单独的链模块只能处理特别允许的消息。
- 如果一条消息被多个链模块允许，则顺序最低的链模块将处理该消息，并且该消息不会再被更高顺序的链模块处理。

#### Steps

- Step1：为每个将标记为链模式的 CSM 子模块添加特殊允许的消息，例如本示例中 "Chain$1" CSM 子模块的 "Action: action 1" 和 "Action: action 2"。
- Step2：此循环为主程序模块，模块名称是 ChainModeExample。
- Step3：在 UI 中创建布尔按钮，例如 "Action: action 1 -> Chain" 等，以模拟模块间消息传输。
- Step4：使用 while 循环来获取所有正在运行的 CSM 模块的状态信息，包括名称、模式、实例数和要处理的消息队列数。使用高级 VI 停止 while 循环，即一旦调用者/主 CSM 模块退出，while 循环将停止。
- Step5：使用全局日志 API 计算和监控实时日志记录能力，更多详情请参阅 4. Advance Examples\6. Global Log Handling Capability。

### 责任链模式模块实现(ChainNode A.vi)

#### Overview

本示例为责任链模式中CSM模块节点的实现。它被Chain of Responsibility Example.vi调用。

#### Introduction

本示例为责任链模式中CSM模块节点的实现。通过"Allowed Messages"参数，定义了该节点可以处理的消息名称。例如，本 CSM 模块的 "Action: action 1" 和 "Action: action 2" 消息。

### 责任链模式模块实现(ChainNode B.vi)

#### Overview

本示例为责任链模式中CSM模块节点的实现。它被Chain of Responsibility Example.vi调用。

#### Introduction

本示例为责任链模式中CSM模块节点的实现。通过"Allowed Messages"参数，定义了该节点可以处理的消息名称。例如，本 CSM 模块的 "Action: action 2", "Action: action 3", "Action: action 4", "Action: action 5" 消息。

### 责任链模式模块实现(ChainNode C.vi)

#### Overview

本示例为责任链模式中CSM模块节点的实现。它被Chain of Responsibility Example.vi调用。

#### Introduction

本示例为责任链模式中CSM模块节点的实现。通过"Allowed Messages"参数，定义了该节点可以处理的消息名称。例如，本 CSM 模块的 "Action: action 4", "Action: action 5", "Action: action 6"消息。

## 全局错误处理机制示例

### 主程序(Topmost VI who Registers all Errors.vi)

#### Overview

演示如何使用状态订阅机制，实现全局的错误处理机制，主程序也兼职错误处理模块，所有CSM子模块的错误都可以在主程序中捕获并处理。

#### Introduction


演示如何使用状态订阅机制，实现全局的错误处理机制，主程序也兼职错误处理模块，所有CSM子模块的错误都可以在主程序中捕获并处理。每个 CSM 模块在发生错误时，会自动广播 Error Occurred 状态更新。通过在主程序中添加一个模块间消息字符串以注册该广播，即可捕获所有CSM子模块的错误。

如果调用者 VI 不是 CSM 模块，您可以使用 Non-CSM Caller Support VI 实现订阅CSM模块错误的功能。

#### Steps

- Step1：主程序核心为一个名为 GlobalErrorHandlingExample 的 CSM 模块
- Step2: 并同步调用另外两个 CSM 模块，这两个子模块可以通过点击按钮产生一些预定的错误。
- Step3：启动时就注册 "Error Occurred" 广播事件，"Error Occurred@* >> Error Handler -><register>". 该事件在任何 CSM 子模块抛出 Error Occurred 状态变化时，会触发 GlobalErrorHandlingExample 的 "Error Handler", 处理捕获的事件。
- Step4: (optional) 退出逻辑中，通过 “CSM - Filter Messages to Non-Existing Modules.vi” 过滤掉所有不存在的 CSM 模块的消息，以避免在退出时触发错误。

### 模拟错误生成模块(Error Module.vi)

#### Overview

一个CSM 示例模块，用于在点击按钮时产生预定的错误。

#### Introduction

本示例为全局错误处理机制的一个子模块，用于在点击按钮时产生预定的错误。这个CSM模块被设置为可重入，可以同时运行多个实例。启动后面板被自动打开。点击界面上上的产生错误按钮，会生成一个模拟的错误。这个错误通过状态机的轮转，会运行至“Error handler” 状态，并将此错误通过 Error Occurred 状态抛出。任何订阅该模块 Error Occurred 状态的模块，可以捕获并处理此错误。

#### Steps

- Step1：产生一个模拟的错误，通过错误线传递到模块中，这也是通常我们会遇到的错误场景。
- Step2：这个错误信息会触发 CSM 模块轮转到 Error Handler 状态, 这个行为和 JKISM 一致。
- Step3：在 Error handler 状态中，会将错误信息通过 Error Occurred 状态抛出。

## Global Log Filter Example(Filter From Source(Event).vi)

### Overview

演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于源视图 (source-view)、基于用户事件 (user-event-based) 的机制。

### Introduction

本示例演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于源视图 (source-view)、基于用户事件 (user-event-based) 的机制。

### Steps

- Step1：获取 CSM 全局状态用户事件句柄，并注册它。
- Step2：设置全局过滤规则。规则下有两个簇，第一个用于全局过滤，第二个用于特定的 CSM 模块。例如，我们过滤掉来自 Module2 的所有日志（全局）以及 Module1 的 "State Change" LogType（特定模块日志）。
- Step3：使用 CSM_Run Scripts VI 向所有四个同步调用的 CSM 模块发送 "API:start" 消息。
- Step4：在 UI 事件中动态更改全局过滤规则。
- Step5：捕获用户事件并处理它，在本示例中，我们将其打印到 LabVIEW UI。
- Step6：使用 CSM_Run Scripts VI 发送 "Macro:Exit" 消息，以同步退出所有正在运行的 CSM 模块，并销毁 CSM 全局状态用户事件句柄。

## Global Log Filter Example(Filter From Source(Queue).vi)

### Overview

演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于源视图 (source-view)、基于队列 (queue-based) 的机制。

### Introduction

本示例演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于源视图 (source-view)、基于队列 (queue-based) 的机制。

### Steps

- Step1：获取 CSM 全局状态用户事件队列。
- Step2：设置全局过滤规则。规则下有两个簇，第一个用于全局过滤，第二个用于特定的 CSM 模块。例如，我们过滤掉来自 Module2 的所有日志（全局）以及 Module1 的 "State Change" LogType（特定模块日志）。
- Step3：使用 CSM_Run Scripts VI 向所有四个同步调用的 CSM 模块发送 "API:start" 消息。
- Step4：首先使用 LabVIEW 队列 VI 获取队列状态并出队一个元素以进行一些日志记录计算，例如速度和 LogInQ 等。我们还将日志打印到 LabVIEW UI。
然后，如果用户直接从 UI 更改，则动态更改全局过滤规则。
- Step5：使用 CSM_Run Scripts VI 发送 "Macro:Exit" 消息，以同步退出所有正在运行的 CSM 模块，并销毁 CSM 全局状态用户事件队列。

## Global Log Filter Example(Filter From Subscriber(Event).vi)

### Overview

演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于订阅者视图 (subscriber-view)、基于用户事件 (user-event-based) 的机制。

### Introduction

本示例演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于订阅者视图 (subscriber-view)、基于用户事件 (user-event-based) 的机制。

### Steps

- Step1：获取 CSM 全局状态用户事件句柄，并注册它。
- Step2：使用 CSM_Run Scripts VI 向所有四个同步调用的 CSM 模块发送 "API:start" 消息。
- Step3：在 UI 事件中动态设置全局过滤规则。规则下有两个簇，第一个用于全局过滤，第二个用于特定的 CSM 模块。例如，我们过滤掉来自 Module2 的所有日志（全局）以及 Module1 的 "State Change" LogType（特定模块日志）。
- Step4：捕获用户事件并处理它，在本示例中，我们将其打印到 LabVIEW UI。
- Step5：使用 CSM_Run Scripts VI 发送 "Macro:Exit" 消息，以同步退出所有正在运行的 CSM 模块，并销毁 CSM 全局状态用户事件句柄。

## Global Log Filter Example(Filter From Subscriber(Queue).vi)

### Overview

演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于订阅者视图 (subscriber-view)、基于队列 (queue-based) 的机制。

### Introduction

本示例演示使用 CSM 全局日志 API 记录状态更改事件以进行调试和监控。本示例使用基于订阅者视图 (subscriber-view)、基于队列 (queue-based) 的机制。

### Steps

- Step1：获取 CSM 全局状态用户事件队列。
- Step2：使用 CSM_Run Scripts VI 向所有四个同步调用的 CSM 模块发送 "API:start" 消息。
- Step3 首先使用 LabVIEW 队列 VI 获取队列状态并出队一个元素以进行一些日志记录计算，例如速度和 LogInQ 等。然后，如果用户直接从 UI 更改，则动态更改全局过滤规则。最后，我们还将日志打印到 LabVIEW UI。
- Step4：使用 CSM_Run Scripts VI 发送 "Macro:Exit" 消息，以同步退出所有正在运行的 CSM 模块，并销毁 CSM 全局状态用户事件队列。

## Multi-Loop Module Example(Main - Call and Monitor TCP Traffic.vi)

### Overview

演示在旁路循环中调用 CSM 子模块。在外部，该模块的交互类似于标准 CSM 子模块，但请注意其特定的 API 和状态更改行为。

### Introduction

本示例演示在旁路循环中调用 CSM 子模块。在外部，该模块的交互类似于标准 CSM 子模块，但请注意其特定的 API 和状态更改行为。

### Instructions

1. 运行此 VI。
2. 运行 Simple TCP - Client.vi。
3. 修改此 VI 和客户端上的字符串控件以观察通信日志。
4. 根据需要重新启动 Simple TCP - Client.vi 以观察重新连接日志。

## Global Log Handling Capability(Global Log Handling Capability Example.vi)

### Overview

演示 CSM 的全局日志处理能力。本示例调用 30 个持续生成事件的子模块。主 VI 捕获这些事件，并使用全局日志 API 来计算和显示关键处理指标，例如 LogInQ、更改速度和处理速度。

使用此示例来基准测试 CSM 的全局日志性能，并作为自定义实现的参考。

### Introduction

本示例演示 CSM 的全局日志处理能力。本示例调用 30 个持续生成事件的子模块。主 VI 捕h获这些事件，并使用全局日志 API 来计算和显示关键处理指标，例如 LogInQ、更改速度和处理速度。

使用此示例来基准测试 CSM 的全局日志性能，并作为自定义实现的参考。

### Steps

- Step1：异步调用 30 个 CSM 子模块，每个子模块随后将持续生成事件。
- Step2：启动 CSM 看门狗 (Watchdog) 线程，以确保所有异步启动的 CSM 模块在主程序退出后都能正常退出。
- Step3：使用 CSM 的内置全局日志 API 捕获和计算一些典型的日志记录能力数据。
- Step4：退出调用者和所有其他正在运行的 CSM 模块。

## Register State as Status Example(Register State as Status Example.vi)

### Overview

演示使用 CSM <register> 消息字符串进行动态状态注册。该消息可以使用 Build Message With Arguments ++.vi 构建，也可以手动创建。单击示例 UI 中的按钮，查看相应的响应。您还可以在示例 UI 中更改注册字符串，以查看进一步的自定义响应。

本示例的一个关键特性是能够级联或流水线化 (pipeline) 事件注册。例如，当 A 注册 B 且 B 注册 C 时，来自 A 的事件首先被 B 捕获，然后传递给 C 进行进一步处理。单击 API: API2 -@submodule1 查看此演示。

CSM 核心引擎会自动管理注册过程，因此不需要手动注销。

### Introduction

本示例演示使用 CSM <register> 消息字符串进行动态状态注册。该消息可以使用 Build Message With Arguments ++.vi 构建，也可以手动创建。单击示例 UI 中的按钮，查看相应的响应。您还可以在示例 UI 中更改注册字符串，以查看进一步的自定义响应。

本示例的一个关键特性是能够级联或流水线化 (pipeline) 事件注册。例如，当 A 注册 B 且 B 注册 C 时，来自 A 的事件首先被 B 捕获，然后传递给 C 进行进一步处理。单击 API: API2 -@submodule1 查看此演示。

CSM 核心引擎会自动管理注册过程，因此不需要手动注销。

### Steps

- Step1：基于模板 VI 创建一个带 UI 的 CSM 模块，并同步调用两个 CSM 子模块（在调用子模块前等待 1 秒，以获得更好的 UI 显示顺序）。
- Step2：手动添加一系列 "<register>" 字符串，以动态注册不同 CSM 模块之间的模块间事件。如果您不熟悉此字符串语法，也可以使用高级 API Build Message With Arguments ++.vi。
- Step3：添加 "Echo:Echo1" case：我们使用实用 VI 来进一步获取注册的来源，无论是本地调用、远程调用还是状态回调。如果您想知道注册的事件源，此实用 VI 非常有用。同时添加 "Echo:Echo2" case，目前没有放置任何代码。但您可以实现任何自定义代码。您不需要手动注销这些事件，因为 CSM 核心引擎会自动处理它。

# Addons - Logger

## CSM Application Running Log Example.vi

### Overview

演示如何使用 CSM Logger VI 来实现全局 CSM 事件文件记录功能。

### Introduction

本示例演示如何使用 CSM Logger VI 来实现全局 CSM 事件文件记录功能。

### Steps

- Step1：使用 CSM VI 模板获取一个带 UI 的 CSM 模块。
    - Step1.1：给 CSM 模块一个名称，例如 "RunningLogExample"。
    - Step1.2：在 UI 事件中广播消息。
- Step2：使用高级 CSM-Start File Logger.vi（此 VI 可以在 LabVIEW 选板 -> CSM -> Addons -> Logger 下找到）来快速实现全局 CSM 事件文件记录功能。
例如，我们按顺序放置两个这样的 VI，手动设置日志记录的文件路径和名称，并分别启用全局规则过滤器。运行此示例后，您还可以找到并查看相应的日志文件，以加深理解。如果以后要添加/调用更多 CSM 模块，您无需更改此处的任何代码以实现日志记录功能。总之，您只需要这样一个高级 CSM 附加组件日志记录器 VI 即可快速实现全局日志记录功能。

# Addons - Loop Support

## CSMLS - Continuous Loop in CSM Example.vi

### Overview

演示如何使用 CSM Loop-Support VI 来创建类似于 while 循环的连续循环机制。您无需手动嵌入 while 循环，而是可以使用高级 API 来定义、附加和终止循环。CSM 框架会自动处理所有底层操作。

本示例展示了 CSM 框架内的连续 DAQ 采集。单击 Start 开始连续采集，单击 Stop（或触发高优先级错误）结束循环。作为比较，单击 DAQ:once 运行单次采集。低优先级错误不会停止循环。

### Introduction

本示例演示如何使用 CSM Loop-Support VI 来创建类似于 while 循环的连续循环机制。您无需手动嵌入 while 循环，而是可以使用高级 API 来定义、附加和终止循环。CSM 框架会自动处理所有底层操作。

本示例展示了 CSM 框架内的连续 DAQ 采集。单击 Start 开始连续采集，单击 Stop（或触发高优先级错误）结束循环。作为比较，单击 DAQ:once 运行单次采集。低优先级错误不会停止循环。

### Instructions

1. 运行 VI 并单击 **DAQ:once** 以执行单次 DAQ 采集。
2. 单击 **Start** 开始连续采集。波形图和日志历史记录会实时更新。
3. 单击 **Stop** 或 **High-Priority Error** 终止循环。
4. 循环运行时，单击 **Low-Priority Error**。错误被忽略，循环仍会运行。

### Steps

- Step1：
    - Step1.1 如果 UI 事件变得非常复杂，建议使用 CSM DQMH-Style Template，以便我们可以将 UI 逻辑与其他 CSM 相关逻辑分开处理。您可以在 LabVIEW 选板 -> CSM -> More Templates 下找到此模板。
    - Step1.2：此外，已使用多循环支持 API 将状态从 DQMH 循环转发到 CSM 主循环。例如，在用户单击 Start 按钮后，"Macro:DAQ continuous" 消息可以被转发到 CSM 主循环中进行进一步的逻辑处理。
- Step2：使用 CSM-Addon Logger Start File Logger.vi 来快速实现 CSM 全局事件文件记录功能。
- Step3：使用 CSM Loop-support API VI 来实现 while 循环。
    - Step3.1：Define Loop States(s).vi：定义多个消息字符串，用 "-><loop>" 标记该字符串，以便该消息字符串被连续处理。将所有这些字符串发送到 Define Loop States(s).VI 中。
    - Step3.2：Append Continuous States.vi：添加任何必要的连续参数，并将其附加到其他状态和参数中，以便所有这些都可以在一个循环中运行。
    - Step3.3 Remove Loop Tag to Break.vi：使用此 VI 停止 while 循环并处理循环后状态。
    - Step3.4：Remove Loop Tag and Previous States to Break.vi：使用此 VI 停止 while 循环，同时移除先前的状态，然后处理循环后状态。
