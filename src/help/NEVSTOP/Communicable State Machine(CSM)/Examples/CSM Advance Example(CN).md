# CSM Advance Example Description

## 工作者模式范例

### 调用程序(Action Worker Mode Example.vi)

#### Overview

本示例演示CSM框架中的工作者模式(Worker Mode)。在本示例中，四个worker在后台运行,共同组成了一个处于工作者模式的CSM模块。

#### Introduction

本示例演示CSM框架中的工作者模式(Worker Mode)。在工作者模式中，多个可克隆的CSM实例作为node 运行。为避免命名冲突，使用附加“#”后缀的模块名称，告知CSM框架这是一个工作者模块。当消息发送给工作者时，将使用公平队列机制处理它，第一个空闲的模块将会处理这个消息。从外部看，系统表现得好像只有一个模块在运行，所有CSM 概念(例如同步、异步和广播)都保持不变。

在本示例中，四个worker在后台运行。

#### Steps

- Step1: 使用高级VI将CSM模块标标记为worker模式(添加#作为后缀)，如果您熟悉CSM规则，也可以只键入正确的名称后缀，而不使用此VI。 然后异步调用4个工作者CSM模块，无需等待回复。或者，您也可以同步调用4个工作者CSM模块，甚至异步调用并带回复，请参阅禁用case中的代码。
- Step2: 此循环为主程序模块，模块名称是WorkerModeExample。
- Step3: 使用While循环来获取所有正在运行的CSM模块的状态信息，包括名称、模式、实例数和要处理的消息队列数。使用高级VI停止While循环，即一旦调用者/主CSM模块退出，While循环将停止。
- Step4: 
    - Step4.1: UI事件处理，在用户单击以下六个用户按钮中的任何一个后，将向第一个空闲的工作者 CSM模块发送一条模块间消息。
      -  "DoSth: DoA -> Worker"
      - "DoSth: DoA -@ Worker"
      - "DoSth: Error -> Worker"
      - "DoSth: Error -@ Worker" 
      - "Macro: Exit -@ Worker"
      - "Macro: Exit -> Worker" 
    - Step4.2 然后在 UI 中添加一个Response Source Manager指示器，以处理"Async Response"和 "Response" case
- Step5: 模块退出。在`Macro: Exit`消息中，使用CSM - Build Exit Messages of CSMs VI创建所有正在运行的 CSM 工作者模块发送`Macro:Exit`的同步消息(您也可以手动键入模块间消息，注意有多少个正在运行的工作者模块。每个正在运行的工作者模式都需要一条消息)，并向调用者/主CSM模块发送本地消息`Macro:Exit`。然后所有CSM模块将按顺序退出。

### 工作者模式模块实现(Action Worker.vi)

#### Overview

本示例为工作者模式中CSM模块节点的实现。它被`Action Worker Mode Example.vi`调用，实例化出多个节点，共同组成了一个处于工作者模式的CSM模块。为了能够同时运行，CSM工作者模块的VI，必须设置为可重入。

#### Introduction

本示例为工作者模式中CSM模块节点的实现。提供以下两个方法: 

- DoSth: DoA: 无实际操作，仅用于演示。
- DoSth: Error: 无实际操作，会产生一个Code=12345的错误，仅用于演示。

为了工作者模式的node能够同时运行，VI执行属性设置为可重入。

#### Steps

- Step1: 添加 "DoSth: DoA" 方法。
- Step2: 添加 "DoSth: Error" 方法。
- Step3: 设置VI执行属性为可重入。

## 责任链模式范例

### 调用程序(Chain of Responsibility Example.vi)

#### Overview

演示CSM框架中实现的责任链(responsibility chain)设计模式。通过单击前面板上的按钮，您可以观察责任链如何按定义的顺序处理允许的消息。每条消息都从最低顺序的模块传递到最高顺序的模块。当一个模块成功处理该消息时，处理停止，并且该消息不会转发到后续模块。如果链中没有模块可以处理该消息，本示例将返回一个错误。

#### Instructions

1. 运行此 VI。
2. 单击前面板上的任何按钮，例如<b>Action: action 1 -> Chain</b>，然后您可以看到哪个链模块处理了哪条消息。
3. 单击<b>Macro: Exit -> Chain</b>或<b>Macro: Exit -@ Chain</b>按钮，然后您可以看到链模块将按顺序启动。

#### Introduction

本示例演示CSM框架中的责任链模式。责任链CSM模块应始终以后缀“$”和整数标记，例如 "CSMName$1"、"CSMName$2"等。

一组责任链CSM模块以允许的方式并按顺序处理消息: 

- 每个单独的链模块只能处理特别允许的消息。
- 如果一条消息被多个链模块允许，则顺序最低的链模块将处理该消息，并且该消息不会再被更高顺序的链模块处理。

#### Steps

- Step1: 为每个将标记为链模式的CSM子模块添加特殊允许的消息，例如本示例中"Chain$1" CSM子模块的"Action: action 1"和"Action: action 2"。
- Step2: 此循环为主程序模块，模块名称是`ChainModeExample`。
- Step3: 在 UI 中创建布尔按钮，例如 "Action: action 1 -> Chain" 等，以模拟模块间消息传输。
- Step4: 使用While循环来获取所有正在运行的CSM模块的状态信息，包括名称、模式、实例数和要处理的消息队列数。使用高级 VI 停止While 循环，即一旦调用者/主 CSM 模块退出，While循环将停止。
- Step5: 使用全局日志API计算和监控实时日志记录能力，更多详情请参阅4. Advance Examples\6. Global Log Handling Capability。

### 责任链模式模块实现(ChainNode A.vi)

#### Overview

本示例为责任链模式中CSM模块节点的实现。它被`Chain of Responsibility Example.vi`调用。

#### Introduction

本示例为责任链模式中CSM模块节点的实现。通过"Allowed Messages"参数，定义了该节点可以处理的消息名称。例如，本CSM模块的"Action: action 1" 和 "Action: action 2"消息。

### 责任链模式模块实现(ChainNode B.vi)

#### Overview

本示例为责任链模式中CSM模块节点的实现。它被`Chain of Responsibility Example.vi`调用。

#### Introduction

本示例为责任链模式中CSM模块节点的实现。通过"Allowed Messages"参数，定义了该节点可以处理的消息名称。例如，本CSM模块的"Action: action 2", "Action: action 3", "Action: action 4", "Action: action 5"消息。

### 责任链模式模块实现(ChainNode C.vi)

#### Overview

本示例为责任链模式中CSM模块节点的实现。它被`Chain of Responsibility Example.vi`调用。

#### Introduction

本示例为责任链模式中CSM模块节点的实现。通过"Allowed Messages"参数，定义了该节点可以处理的消息名称。例如，本CSM 模块的"Action: action 4", "Action: action 5", "Action: action 6"消息。

## 全局错误处理机制示例

### 主程序(Topmost VI who Registers all Errors.vi)

#### Overview

演示如何使用状态订阅机制，实现全局的错误处理机制，主程序也兼职错误处理模块，所有CSM子模块的错误都可以在主程序中捕获并处理。

#### Introduction


演示如何使用状态订阅机制，实现全局的错误处理机制，主程序也兼职错误处理模块，所有CSM子模块的错误都可以在主程序中捕获并处理。每个CSM模块在发生错误时，会自动广播Error Occurred状态更新。通过在主程序中添加一个模块间消息字符串以注册该广播，即可捕获所有CSM子模块的错误。

如果调用者VI不是CSM模块，您可以使用Non-CSM Caller Support VI实现订阅CSM模块错误的功能。

#### Steps

- Step1: 主程序核心为一个名为`GlobalErrorHandlingExample`的CSM模块。
- Step2: 同步调用另外两个CSM模块，这两个子模块可以通过点击按钮产生一些预定的错误。
- Step3: 启动时就注册"Error Occurred"广播事件，"Error Occurred@* >> Error Handler -><register>". 该事件在任何CSM子模块抛出Error Occurred状态变化时，会触发 GlobalErrorHandlingExample的 "Error Handler", 处理捕获的事件。
- Step4: (Optional)退出逻辑中，通过`CSM - Filter Messages to Non-Existing Modules.vi`过滤掉所有不存在的CSM模块的消息，以避免在退出时触发错误。

### 模拟错误生成模块(Error Module.vi)

#### Overview

一个CSM示例模块，用于在点击按钮时产生预定的错误。

#### Introduction

本示例为全局错误处理机制的一个子模块，用于在点击按钮时产生预定的错误。这个CSM模块被设置为可重入，可以同时运行多个实例。启动后面板被自动打开。点击界面上上的产生错误按钮，会生成一个模拟的错误。这个错误通过状态机的轮转，会运行至“Error handler” 状态，并将此错误通过Error Occurred状态抛出。任何订阅该模块Error Occurred状态的模块，可以捕获并处理此错误。

#### Steps

- Step1: 产生一个模拟的错误，通过错误线传递到模块中，这也是通常我们会遇到的错误场景。
- Step2: 这个错误信息会触发CSM模块轮转到Error Handler状态, 这个行为和JKISM一致。
- Step3: 在Error handler状态中，会将错误信息通过Error Occurred状态抛出。

## 全局日志过滤示例

### 基于事件的源过滤示例(Filter From Source(Event).vi)

#### Overview

演示使用CSM全局日志API记录状态更改事件以进行调试和监控。本示例基于用户事件机制，并设置了源端过滤规则。

#### Introduction

本示例演示使用CSM全局日志API记录状态更改事件以进行调试和监控。本示例基于用户事件机制，并设置了源端过滤规则。


#### Steps

- Step1: 使用事件结构获取CSM全局日志，并显示在界面。
    - Step1.1: 获取CSM全局状态用户事件句柄，并注册它。
    - Step1.2: 设置源端全局过滤规则。第一个用于全局过滤，第二个用于特定的 CSM 模块。例如，过滤掉来自Module2的所有日志(全局)以及Module1的"State Change" LogType(特定模块日志)。
    - Step1.3: 在<CSM Global Log Event>中，处理CSM全局日志事件，将其打印到LabVIEW UI。
    - Step1.4: 程序退出过程中，注销CSM全局状态用户事件句柄。
- Step2: 同步调用`1. Create a reuse Module\CSM Reuse Module.vi`, 创建四个运行的CSM模块实例。
    - Step2.1: 创建四个运行的CSM模块实例。
    - Step2.2: 在全局日志处理准备好后，发送 "API:start" 消息，让所有的模块开始运行。
    - Step2.3: 观测运行中的Log信息，可以看到规则中下相关日志已经被过滤。
    - Step2.4: 程序开始退出后，发送“Macro: Exit"消息，以同步退出所有正在运行的CSM模块。

### 基于队列的源过滤示例(Filter From Source(Queue).vi)

#### Overview

演示使用CSM全局日志API记录状态更改事件以进行调试和监控。本示例基于用户事件机制，并设置了源端过滤规则。

#### Introduction

本示例演示使用CSM全局日志API记录状态更改事件以进行调试和监控。本示例基于基于队列(queue-based)的机制，并设置了源端过滤规则。

#### Steps

- Step1: 使用事件结构获取CSM全局日志，并显示在界面。
    - Step1.1: 获取CSM全局状态队列句柄，并注册它。
    - Step1.2: 设置源端全局过滤规则。第一个用于全局过滤，第二个用于特定的CSM模块。例如，过滤掉来自Module2的所有日志(全局)以及Module1的 "State Change" LogType(特定模块日志)。
    - Step1.3: 查询队列状态，并计算日志处理速度等指标。
    - Step1.4: 使用出队结构，处理CSM全局日志事件，将其打印到 LabVIEW UI。
    - Step1.5: 程序退出过程中，注销CSM全局状态队列句柄。
- Step2: 同步调用`1. Create a reuse Module\CSM Reuse Module.vi`, 创建四个运行的CSM模块实例。
    - Step2.1: 创建四个运行的CSM模块实例。
    - Step2.2: 在全局日志处理准备好后，发送"API:start"消息，让所有的模块开始运行。
    - Step2.3: 观测运行中的Log信息，可以看到规则中下相关日志已经被过滤。
    - Step2.4: 程序开始退出后，发送“Macro: Exit"消息，以同步退出所有正在运行的CSM模块。

### 基于事件的订阅端过滤示例(Filter From Subscriber(Event).vi)

#### Overview

演示使用CSM全局日志API记录状态更改事件以进行调试和监控。本示例基于用户事件机制，并设置了订阅端过滤规则。订阅端规则的设置，只影响订阅端接收到的日志，不会影响其他订阅端或全局日志。

#### Introduction

本示例演示使用CSM全局日志API记录状态更改事件以进行调试和监控。本示例基于用户事件机制，并设置了订阅端过滤规则。订阅端规则的设置，只影响订阅端接收到的日志，不会影响其他订阅端或全局日志。

#### Steps

- Step1: 使用事件结构获取CSM全局日志，并显示在界面。
    - Step1.1: 获取CSM全局状态用户事件句柄，并注册它。
    - Step1.2: 设置订阅端全局过滤规则。第一个用于全局过滤，第二个用于特定的CSM 模块。例如，过滤掉来自Module2的所有日志(全局)以及Module1的"State Change" LogType(特定模块日志)。
    - Step1.3: 在<CSM Global Log Event>中，处理CSM全局日志事件，将其打印到LabVIEW UI。
    - Step1.4: 程序退出过程中，注销CSM全局状态用户事件句柄。
- Step2: 同步调用 `1. Create a reuse Module\CSM Reuse Module.vi`, 创建四个运行的CSM模块实例。
    - Step2.1: 创建四个运行的CSM模块实例。
    - Step2.2: 在全局日志处理准备好后，发送"API:start"消息，让所有的模块开始运行。
    - Step2.3: 观测运行中的Log信息，可以看到规则中下相关日志已经被过滤。
    - Step2.4: 程序开始退出后，发送“Macro: Exit"消息，以同步退出所有正在运行的CSM模块。

### 基于队列的订阅端过滤示例(Filter From Subscriber(Queue).vi)

#### Overview

演示使用CSM全局日志API记录状态更改事件以进行调试和监控。本示例基于用户事件机制，并设置了订阅端过滤规则。订阅端规则的设置，只影响订阅端接收到的日志，不会影响其他订阅端或全局日志。

#### Introduction

本示例演示使用CSM全局日志API记录状态更改事件以进行调试和监控。本示例基于基于队列(queue-based)的机制，并设置了订阅端过滤规则。订阅端规则的设置，只影响订阅端接收到的日志，不会影响其他订阅端或全局日志。

#### Steps

- Step1: 使用事件结构获取CSM全局日志，并显示在界面。
    - Step1.1: 获取CSM全局状态队列句柄，并注册它。
    - Step1.2: 设置订阅端全局过滤规则。第一个用于全局过滤，第二个用于特定的CSM模块。例如，过滤掉来自Module2的所有日志(全局)以及Module1的 "State Change" LogType(特定模块日志)。
    - Step1.3: 查询队列状态，并计算日志处理速度等指标。
    - Step1.4: 使用出队结构，处理CSM全局日志事件，将其打印到LabVIEW UI。
    - Step1.5: 程序退出过程中，注销CSM全局状态队列句柄。
- Step2: 同步调用 `1. Create a reuse Module\CSM Reuse Module.vi`, 创建四个运行的CSM模块实例。
    - Step2.1: 创建四个运行的CSM模块实例。
    - Step2.2: 在全局日志处理准备好后，发送"API:start"消息，让所有的模块开始运行。
    - Step2.3: 观测运行中的Log信息，可以看到规则中下相关日志已经被过滤。
    - Step2.4: 程序开始退出后，发送“Macro: Exit"消息，以同步退出所有正在运行的CSM模块。

## 多循环模块示例(Main - Call and Monitor TCP Traffic.vi)

### 多循环模块(TCP Server Module(Multi-Loop Support).vi)

#### Overview

本示例演示如何创建一个带有旁路循环的CSM模块。在某些场景下，将逻辑放在CSM循环之外实现会简单得多。此时，您可以利用旁路循环支持API，将您的逻辑与CSM循环集成，从而构成一个子模块。

本示例创建了一个简单的TCP服务器子模块，直观易懂，并充分利用了CSM作为接口的优势。

#### Instructions

1. 运行此VI。
2. 运行`Simple TCP - Client.vi`。
3. 修改此前面板和客户端上的string控件，观察日志信息。
4. 您可以重新启动`Simple TCP - Client.vi`来查看日志。

#### Introduction

CSM循环作为接口，允许您使用“TCP: Send”通过TCP发送消息，“TCP: Receive”用于处理接收到的消息。本示例中仅将消息显示出来。通过将CSM循环与旁路TCP循环结合，该模块可作为TCP服务，用于与客户端之间通过TCP连接收发消息。

可以看出，这种编写方式，可以很方便的改造已有的代码，将CSM作为通讯接口，与其他模块进行交互。 尤其在一些对定时要求高的场景，需要使用定时循环，多循环模式就是一种很好的选择。

#### Steps

- step1: CSM循环作作为通讯接口。
    - step1.1: 创建TCP: Send接口，用于处理发送TCP数据包。
    - step1.2: 创建TCP: Receive接口，用于处理接收TCP数据包。
    - step1.3: 将接收到的TCP数据包通过“TCP Received”状态变化抛出。
- step2: TCP旁路循环
    - step2.1: TCP监听。硬编码端口号。
    - step2.2: 当TCP首次连接时广播“TCP Connected”状态。
    - step2.3: 监控TCP连接是否有消息传入。
    - step2.4: 清除错误56，因为它表示TCP空闲。
    - step2.5: 调用旁路循环API: "CSM Module Turns Invalid.vi"使旁路循环随CSM循环一起退出。
    - step2.6: 停止内部循环。
    - step2.7: 关闭TCP引用句柄。
    - step2.8: 当TCP连接断开时广播"TCP Disconnected"状态。
    - step2.9: 停止外部循环。

### TCP 服务器程序(Main - Call and Monitor TCP Traffic.vi)

#### Overview

基于调用`TCP Server Module(Multi-Loop Support).vi`实现一个TCP服务器程序。可以看出，从外部看，该模块的交互与标准CSM模块的交互相同，只是在内部，该模块的状态变化是通过旁路循环抛出的。

#### Instructions

1. 运行本VI。
2. 运行`Simple TCP - Client.vi`。
3. 在本VI和客户端VI上修改字符串控件，观察通信日志。
4. 根据需要重新启动Simple TCP - Client.vi，观察重连日志。

#### Introduction

不使用CSM框架，调用`TCP Server Module(Multi-Loop Support).vi`实现一个TCP服务器程序。可以看出，从外部看，该模块的交互与标准CSM模块的交互相同，只是在内部，该模块的状态变化是通过旁路循环抛出的。

#### Steps

- Step1: 初始化UI。
- Step2: 异步调用 `TCP Server Module(Multi-Loop Support).vi`, 启动名称为 TCPServer的CSM模块。
- step3: 订阅TCPServer模块的状态变化事件。
- step4: 在客户端VI上修改字符串控件，观察通信日志。
- Step5: 运行`Simple TCP - Client.vi`，在这个VI上点击发送按钮，发送一条TCP消息到服务器。
- step6: 任何收到的TCP消息，会被TCPServer以“TCP Received”状态变化抛出，因此在状态处理事件中可以处理此状态，本程序将其显示在界面上。
- step7: String控件修改内容并键入回车后，本程序将其作为TCP消息发送到Client。
- step8: 程序开始退出后，取消订阅TCPServer模块的状态变化事件。
- step9: 发送“Macro: Exit”消息，以同步退出TCPServer模块。

## Global Log Handling Capability(Global Log Handling Capability Example.vi)

### Overview

演示CSM的全局日志处理能力。本示例调用30个持续生成事件的子模块。主VI捕获这些事件，并使用全局日志API来计算和显示关键处理指标，例如LogInQ、更改速度和处理速度。

使用此示例来基准测试CSM的全局日志性能，并作为自定义实现的参考。

### Introduction

本示例演示CSM的全局日志处理能力。本示例调用30个持续生成事件的子模块。主VI捕获这些事件，并使用全局日志API来计算和显示关键处理指标，例如LogInQ、更改速度和处理速度。

使用此示例来基准测试CSM的全局日志性能，并作为自定义实现的参考。

### Steps

- Step1: 异步调用30个CSM子模块，每个子模块随后将持续生成事件。
- Step2: 启动CSM看门狗 (Watchdog) 线程，以确保所有异步启动的CSM模块在主程序退出后都能正常退出。
- Step3: 使用CSM的内置全局日志API捕获和计算一些典型的日志记录能力数据。
- Step4: 退出调用者和所有其他正在运行的CSM模块。

## State订阅范例

### State订阅范例子模块(State Register Example Submodule.vi)

#### Overview

本示例为状态订阅的子模块。它被State订阅范例主程序(`Register State as Status Example.vi`)调用。

#### Introduction

本示例为状态订阅的子模块。它被State订阅范例主程序(`Register State as Status Example.vi`)调用。本程序界面按钮点击时，会运行按钮名称上的状态。

### State订阅范例主程序(Register State as Status Example.vi)

#### Overview

本范例主要演示了如何使用状态订阅功能。和信号广播(Status)相比，状态订阅的优势在于: 

- 不需要显示的发布信号广播(Status)，只要运行到某个状态，只要被订阅，就会自动触发，并将状态的Response作为参数传递给订阅者。
- 可以很容易的不侵入原先代码，实现观察者模式。
- 可以实现链式的订阅，但是要注意逻辑上不要形成循环订阅，否则会导致死循环。

#### Introduction

本示例演示如何使用状态订阅功能。单击示例UI中的按钮，查看相应的响应。您还可以在示例 UI中更改注册字符串，以查看进一步的自定义响应。

状态订阅和信号广播(Status)的订阅语法上没有任何不同，区别在于信号广播(Status)需要通过API显示抛出，而状态变化可以订阅CSM任意一个状态。

以本范例为例: 

```
//任意模块的Macro: Initialize状态执行完毕后，都会触发主程序CSM模块(缺省)的Echo: Echo1
Macro: Initialize@* >> Echo: Echo1 -><register> 
//任意模块的API: API1状态执行完毕后，都会触发主程序CSM模块(缺省)的Echo: Echo1
API: API1@* >> Echo: Echo1-><register>
//SubModule1的API: API2状态执行完毕后，都会触发主程序CSM模块(缺省)的Echo: Echo2
API: API2@SubModule1 >> Echo: Echo2 -><register>
//Main模块的Echo: Echo2状态执行完毕后，都会触发SubModule1的API: API1
Echo: Echo2@main >> API: API1@submodule1 -><register>
//SubModule1的Exit状态执行完毕后，都会触发主程序CSM模块(缺省)的Echo: Echo1
Exit@submodule1 >> Echo: Echo1 -><register>
//SubModule2的Macro: Exit状态执行完毕后，都会触发主程序CSM模块(缺省)的Echo: Echo1
Macro: Exit@submodule2 >> Echo: Echo1 -><register>
```

其中，main模块Echo: Echo2执行后，触发SubModule1的API: API1状态; 根据零一条规则，API: API1 状态执行完毕后，会触发主程序CSM模块(缺省)的Echo: Echo1。这是一个链式订阅的场景。

#### Steps
- Step1: 根据全局日志模板，创建一个监控循环，用于观测系统中所有模块的状态变化。
- Step2: 异步调用两个CSM子模块(在调用子模块前等待1秒，以获得更好的UI显示顺序)子模块可以通过点击界面按钮，触发其状态变化。
- Step3: 通过模板实现一个CSM主程序模块，名字叫做main.
    - Step3.1: 主程序界面按钮的点击，会触发其状态发生变化。逻辑上将按钮的名称作为状态，用于减少代码编写。
    - Step3.2: 主程序启动时，自动订阅预设的状态订阅规则。
    - Step3.3: "Echo: Echo1"状态中，会将参数等信息以弹窗的形式显示出来。这个状态的运行，同时会在全局日志中有记录。
- Step4: 可以点击主界面的按钮，或子模块界面的按钮，触发对应的逻辑，查看全局日志，验证状态订阅是否生效。

# Addons - Logger

## CSM Application Running Log Example.vi

### Overview

演示如何使用CSM Logger VIs来实现全局CSM事件文件记录功能。

### Introduction

本示例演示如何使用CSM Logger VIs来实现全局CSM事件文件记录功能。使用CSM-Start File Logger VI(此VI可以在LabVIEW选板 -> CSM -> Addons -> Logger下找到)来快速实现全局CSM事件文件记录功能。

例如，我们按顺序放置两个这样的VI，手动设置日志记录的文件路径和名称，并分别启用全局规则过滤器。运行此示例后，您还可以找到并查看相应的日志文件，以加深理解。如果以后要添加/调用更多CSM模块，您无需更改此处的任何代码以实现日志记录功能。总之，您只需要这样一个高级CSM附加组件日志记录器 VI 即可快速实现全局日志记录功能。

### Steps

- Step1: 这是一个简单的CSM模块，名称为`RunningLogExample`。
- Setp2: 任何的一个按钮，都会运行到"API: Button Click"状态, 并抛出同名的一个状态变化，他们的参数都是按钮的名称。
- step3: 在API: Button Click中，不需要做任何事情，因为我们要观察的是日志文件。
- step4: 程序启动后，会启动两个log文件的后台记录线程，他们会随着程序的退出而退出。
- Step5: 运行完程序后，在范例VI所在目录，检查是否存在两个日志文件。
    - Step5.1: `CSM Application Running Log Example.csmlog`记录了所有的日志。
    - Step5.2: `CSM Application Running Log Example.no-state.csmlog`所记录的日志，没有状态变化记录。

# Addons - Loop Support

## CSMLS - Continuous Loop in CSM Example.vi

### Overview

循环是状态机运行的基本单位，它会在状态机运行时不断地执行。用户可以自己通过逻辑来定义循环的条件，也可以使用CSM推荐的循环支持API来定义循环。它的优势是可以在循环运行时，依然响应其他事件，而不会阻塞状态机的运行。这类似于 While循环的连续循环机制。您无需手动嵌入While 循环，而是可以使用CSM Loop-Support VI 来定义、附加和终止循环。这组API通过对状态队列的分析来完成此功能。

本示例展示了CSM框架内的连续DAQ采集。单击<b>Start</b>开始连续采集，单击<b>Stop</b>(或触发高优先级错误)结束循环。作为比较，单击<b>DAQ: Once</b>运行单次采集。低优先级错误不会停止循环。

### Instructions

1. 运行VI并单击<b>DAQ: Once</b>以执行单次DAQ采集。
2. 单击<b>Start</b>开始连续采集。波形图和日志历史记录会实时更新。
3. 单击<b>Stop</b>或<b>High-Priority Error</b>终止循环。
4. 循环运行时，单击<b>Low-Priority Error</b>。错误被忽略，循环仍会运行。

### Introduction

本示例演示如何使用CSM Loop-Support VIs来实现While循环的连续DAQ采集的功能。单击<b>Start</b>开始连续采集，单击<b>Stop</b>(或触发高优先级错误)结束循环。作为比较，单击<b>DAQ: Once</b>运行单次采集。

### Steps

- Step1: 界面事件处理循环。
    - Step1.1: 如果UI事件变得非常复杂，建议使用CSM DQMH-Style Template，可以将UI逻辑与其他CSM相关逻辑分开处理。您可以在LabVIEW 选板 -> CSM -> More Templates下找到此模板。
    - Step1.2: 此外，已使用多循环支持API将状态从DQMH循环转发到CSM主循环。例如，在用户单击<b>Start</b>按钮后，"Macro:DAQ continuous"消息可以被转发到CSM主循环中进行进一步的逻辑处理。
- Step2: 使用`CSM-Addon Logger Start File Logger.vi`来快速实现CSM全局事件文件记录功能。
- Step3: CSM循环，用于处理界面的操作，及外部的响应，并实现具体的操作逻辑。
    - Step3.1: 在DAQ分组中，实现对DAQ采集的具体操作逻辑。
- Step4: 使用CSM Loop-Support VIs来实现While循环。
    - Step4.1: `Define Loop States(s).vi`: 定义连续的状态，用"-><loop>"标记该循环检查状态，以便该消息字符串被连续处理。
    - Step4.2: `Append Continuous States.vi`: 添加下一轮的状态，并通过参数将状态检查循环继续添加到状态队列中。
    - Step4.3: `Remove Loop Tag to Break.vi`: 使用此VI移除<loop>标签，以便退出循环状态，本次循环相关的状态可以被正常处理。
    - Step4.4: `Remove Loop Tag and Previous States to Break.vi`: 移除 <loop>标签，以及之前的所有状态，以便退出循环状态，本次循环相关的状态被移除。
    - Step4.5: 需要添加延迟函数，控制循环的速率。
- Step5: 可以看出，可以使用相同的状态，实现普通的单次采集。
