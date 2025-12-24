# Template Description

## README FIRST

Communicable State Machine(CSM) 是一个基于 JKI State Machine(JKISM)扩展的 LabVIEW 应用框架. 它遵循 JKISM 的模式, 并扩展了关键词, 用于描述模块之间的消息通信, 包括同步消息、异步消息、状态订阅/取消订阅等概念, 这些是创建可重用代码模块的基本要素. 更多信息, 请访问 CSM 的维基页面: <https://nevstop-lab.github.io/CSM-Wiki/>

- 有关 JKI State Machine 的使用说明, 请访问: <http://jki.net/state-machine/>
- 有关 NEVSTOP-LAB 的信息, 请访问: <https://github.com/NEVSTOP-LAB>

## State Syntax

文本描述示例:
    // 本地消息示例
    DoSth: DoA >> Arguments

    // 同步调用示例
    API: xxxx >> Arguments -@ TargetModule

    // 异步调用示例
    API: xxxx >> Arguments -> TargetModule

    // 没有返回值的异步调用示例
    API: xxxx >> Arguments ->| TargetModule

    // 状态发布示例
    Status >> StatusArguments  -> <all>

## Commenting

要添加注释, 使用 "//", 右边的所有文本将被忽略

注释示例:
UI: Initialize // This initializes the UI
// Another comment line

### Name of the CSM

模块名称. 如果不接受其他模块的消息, 可以使用""作为名称.

### This controls the loop rate

"-1" 表示永远等待新状态的到来或用户操作在事件结构中被检测到

## Case Description

## "Default"

本分支用于捕获未处理的状态、消息和打字错误

### "Documentation"

无其他意义, 保存CSM文档供参考

### "Idle/Event Handler"

当状态队列为空时执行此分支逻辑

#### "New State Notifier Event"

This user event is used to break out CSM from waiting in the event structure, to process the next state from external. DO NOT place any code here unless you really need to.

#### Discard Panel Close?

Discard the event because we'll close the front panel ourselves in Macro: Exit

### "Error Handler"

处理模块错误

#### Internal Error Handler Case

如果发生了错误, "Error Occurred" 状态将被广播到整个系统. 参数是HexStr格式的错误簇.

#### External Error Handler Case

此分支的执行是由于本模块订阅了其他模块的 "Error Occurred" 状态并关联到 "Error Handler".
如果其他模块发生了错误, 错误也将被传递到这里进行集中式的处理.

### "Critical Error"

当不可恢复错误发生时, 模块进入此分支

#### Stop in Critical Error

当严重错误发生时, 直接停止循环. 除非完全了解修改带来的影响, 不要修改此逻辑.

### "Target Busy Error"

当此模块尝试与忙碌的模块通讯时, 模块将进入此分支处理, 在此分支处理此错误逻辑

### "Target Timeout Error"

当此模块与其他模块消息超时未获得反馈时, 模块将进入此分支处理, 在此分支处理此错误逻辑

### "Target Error"

当此模块尝试与不存在的模块通讯时, 模块将进入此分支处理, 在此分支处理此错误逻辑

### "Async Response"

处理异步调用响应 ("Async Response" for ->)

### "Response"

处理同步调用响应 ("Response" for -@)

#### Response Comments

当Message被执行后, CSM进入此状态以接收响应
    对于异步调用(->), "Async Response"分支被执行. "Async Message Posted"在异步调用消息发送后此模块, 当消息被执行完毕后, "Async Response"分支被执行.
    对于同步调用(-@), 此模块在发送完同步消息后, 将等待, 消息被执行完毕后, "Response"分支被立即执行.

### "Async Message Posted"

在异步调用消息发送后 (-> or ->| ), 此分支被执行, 用于处理消息发送后事件.
可以使用 "Argument - State" 分辨发送的异步消息内容.

### "Initialize Core Data"

此分支用于确定退出时面板的行为

### "Exit"

此分支用于退出循环. 这里发生的任何错误都不会被处理.

## "Category Separator"

分隔分支,不要在这个分支中放入任何代码。

### "Data: Initialize"

初始化移位寄存器的数据, 数据名称由连接到bundle函数中的内容决定.

### "Data: Cleanup"

此分支用于清除所有数据和引用, 由Macro: Exit自动调用的.

### "Events: Register"

注册用户事件. 默认情况下, 注册 "New Message Event" 以打破事件结构中的CSM等待.

#### Register New Message Event

注册消息事件以打破事件结构中的等待状态.

### "Events: Unregister"

注销用户事件

### "UI: Initialize"

此分支用于初始化界面(由Macro: Init自动调用)

### "UI: Cursor Set"

设置鼠标忙碌或空闲
(用法: "UI: Cursor Set >> Busy|Idle")

### "UI: Front Panel State"

前面板打开或关闭
(用法: "UI: Front Panel State >> Open|Close")

### "Macro: Initialize"

初始化宏(在VI启动时调用一次)

### "Macro: Exit"

退出宏(当VI退出时调用一次)

### API Example

复制/重命名创建API

#### >> From Who >>

用于区分是谁发送的此消息. 如果是本模块, 字符串为"".

#### >> Arguments >>

调用参数

#### Response

连接的字符串将作为响应返回给调用模块

## Debug User Event

(No-Event Template Only)
通过发送 "Macro: Exit" 消息停止下方的 CSM 模块. 当开发完毕后, 应该移除此部分逻辑

## "Internal State"

此分支用于实现模块的内部逻辑状态
