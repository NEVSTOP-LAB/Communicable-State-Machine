# CSM API

## 内置插件(Build-in Addons)

### CSM WatchDog

> [!NOTE] CSM WatchDog 实现的原理
> LabVIEW VI 退出时，会自动释放所有队列、事件等句柄资源。因此，我们可以通过创建一个 WatchDog 线程，监控一个由主程序VI申请创建的队列资源，当这个队列资源在主VI退出后被释放时，触发 WatchDog 线程给还未退出的 CSM 模块发送 "Macro: Exit"，保证他们正常的退出。

#### CSM - Start Watchdog to Ensure All Modules Exit.vi

启动CSM Watchdog 线程，用于保证在主程序退出后，所有的异步启动的 CSM 模块都能正常退出。

> Ref: CSM WatchDog 实现的原理

#### CSM Watchdog Thread.vi

CSM Watchdog 线程，用于保证在主程序退出后，所有的异步启动的 CSM 模块都能正常退出。

> Ref: CSM WatchDog 实现的原理

-- <b>输入控件</b> --
- <b>WatchdogQ</b>: Watchdog 队列资源，

### CSM File Logger

> [!NOTE] CSM File Logger 实现的原理
> 通过订阅 CSM 的 Global Log Event 事件，可以将应用中的全部 CSM 活动信息记录下来，用于后期分析和错误定位。
> 文件为文本文件，后缀名为 .csmlog，可以通过记事本等文本编辑查询工具打开。

#### CSM - Start File Logger.vi

启动 CSM 事件文件记录功能。

> Ref: CSM File Logger 实现的原理

-- <b>输入控件</b> --
- <b>Log File Path</b>: 记录文件路径
- <b>Enable? (T)</b>: 是否启用
- <b>log limit</b>: 记录文件限制
- <b>Timestamp format</b>: 时间格式
- <b>WatchDog? (T)</b>: 是否启用 WatchDog
- <b>Filter Rules</b>: 时间过滤规则
- <b>Exit When All Module Exist?(F)</b>: CSM 全部模块退出后是否退出

-- <b>输出控件</b> --
- <b>LogFile</b>: CSM lOG 文件路径
- <b>WatchDogQueue</b>: WatchDog 资源句柄

#### CSM-Logger-Thread.vi

启动 CSM Global Log 文件记录线程VI。

> Ref: CSM File Logger 实现的原理

-- <b>输入控件</b> --
- <b>Log File Path</b>: 记录文件路径
- <b>log limit</b>: 记录文件限制
- <b>Timestamp format</b>: 时间格式
- <b>WatchDogQ</b>: WatchDog资源，用于检测主程序是否退出
- <b>GlobalLogFilter.lvclass</b>: 事件过滤器对象
- <b>Exit When All Module Exist?(F)</b>: CSM 全部模块退出后是否退出

### CSM Loop Support

> [!NOTE] CSM LOOP 设计的原因
> JKISM/CSM 是一个状态机框架，完成循环工作是一种常见的场景。实现循环没有一个较好的方案。
> - 如果在一个Case分支中使用循环实现，会导致状态机的卡死在此状态中，无法正常切换，也不能响应外部的消息；
> - 如果通过在状态循环的最后一个状态中，继续插入下一个循环的状态，也会导致不能很好的响应外部的消息，且很不直观。
> 因此，这个插件主要是为了提供一个标准的循环实现方式，解决以上的问题。
>

#### CSMLS - Add Exit State(s) with Loop Check.vi

退出时检查循环。

-- <b>输入控件</b> --
- <b>States Queue</b>: 整个状态队列被连接到此输入
- <b>Exiting States</b>: 退出所需的状态

-- <b>输出控件</b> --
- <b>Remaining States</b>: 剩余的消息队列

#### CSMLS - Append Continuous State.vi

添加循环状态。

-- <b>输入控件</b> --
- <b>States Queue</b>: 整个状态队列被连接到此输入
- <b>Loop State(s) and Arguments</b>: 循环状态
- <b>Continuous State</b>:循环状态名称
- <b>Continuous Arguments ("")</b>: 循环状态参数
- <b>Append(T)</b>: 是否添加

-- <b>输出控件</b> --
- <b>Remaining States</b>: 剩余的消息队列

#### CSMLS - Define Loop State(s).vi

定义循环操作。

-- <b>输入控件</b> --
- <b>States Queue</b>: 整个状态队列被连接到此输入
- <b>Loop State(s) and Arguments</b>: 循环状态

-- <b>输出控件</b> --
- <b>Remaining States</b>: 剩余的消息队列

#### CSMLS - Remove Loop Tag and previous State(s) to Break.vi

通过移除 <loop> 标记和 <loop> 标记前的所有状态，达到停止循环。

举例：

假如 CSM 的消息队列中，还存在以下消息，此时执行当前API操作，将移除注释所在的消息

    DAQ: Acquire                    //<b>将被移除</b>
    DAQ: Continuous Check -><loop>  //<b>将被移除</b>
    DAQ: Stop
    DAQ: Release

相当于不会执行任何DAQ操作，立即直接进入停止和释放。

-- <b>输入控件</b> --
- <b>States Queue</b>: 整个状态队列被连接到此输入

-- <b>输出控件</b> --
- <b>Remaining States</b>: 剩余的消息队列

#### CSMLS - Remove Loop Tag to Break.vi

通过移除 <loop> 标记，达到停止循环。

举例：

假如 CSM 的消息队列中，还存在以下消息，此时执行当前API操作，将移除注释所在的消息

    DAQ: Acquire
    DAQ: Continuous Check -><loop>  //<b>将被移除</b>
    DAQ: Stop
    DAQ: Release

相当于依然会执行当前的DAQ操作，然后进入停止和释放。

-- <b>输入控件</b> --
- <b>States Queue</b>: 整个状态队列被连接到此输入

-- <b>输出控件</b> --
- <b>Remaining States</b>: 剩余的消息队列
