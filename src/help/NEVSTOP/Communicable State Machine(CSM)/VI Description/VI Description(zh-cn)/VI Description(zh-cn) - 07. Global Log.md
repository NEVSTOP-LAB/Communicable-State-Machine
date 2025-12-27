# 全局日志(Global Log)

> [!NOTE]
> <b>CSM全局日志功能</b>
>
> CSM全局日志功能，用于查看全局日志更改事件，用于调试、监控等场景。
>
> 可以记录的信息包括:
> - 模块的状态修改
> - 模块间的消息通讯，包括数据返回
> - 模块的状态发布
> - 模块的创建和销毁
> - 模块的状态订阅和取消订阅
> - 模块处理的错误信息
> - 用户自定义事件
>
> 调试工具主要基于全局日志功能API进行开发，用户可以根据自己的需要，开发调试工具。

> [!NOTE]
> <b>CSM全局日志获取方法</b>
>
> CSM全局日志提供了队列和事件两种获取方法。推荐使用队列处理的方法，因为队列接口的效率更高，也能根据队列中的累积日志数量，选择处理日志的方案，更加的灵活。

## CSM - Global Log Queue.vi
获取全局日志的队列句柄，可以从这个队列中获取全局日志事件。

> - Ref: CSM全局日志功能
> - Ref: CSM全局日志获取方法

<b>参考范例</b>：
- `4. Advance Examples\Filter From Source(Queue).vi`
- `4. Advance Examples\Filter From Subscriber(Queue).vi`

-- <b>输出控件(Indicators)</b> --
- <b>Global Log Queue</b>: 全局日志队列句柄。

## CSM - Global Log Event.vi
获取CSM全局日志用户事件句柄，用于从全局日志队列中获取全局日志用户事件。

> - Ref: CSM全局日志功能
> - Ref: CSM全局日志获取方法

<b>参考范例</b>：
- `4. Advance Examples\Filter From Source(Event).vi`
- `4. Advance Examples\Filter From Subscriber(Event).vi`

-- <b>输出控件(Indicators)</b> --
- <b>CSM Global Log Event</b>: CSM全局日志用户事件句柄。
- <b>Timeout In ms (5000ms)</b>: 超时时间，默认5000 ms。

## CSM - Destroy Global Log Queue.vi
释放全局日志队列句柄。

> - Ref: CSM全局日志功能
> - Ref: CSM全局日志获取方法

<b>参考范例</b>：
- `4. Advance Examples\Filter From Source(Queue).vi`
- `4. Advance Examples\Filter From Subscriber(Queue).vi`

-- <b>输入控件(Controls)</b> --
- <b>Global Log Queue</b>: 全局日志队列句柄。

## CSM - Destroy Global Log Event.vi
释放CSM全局日志用户事件句柄。

> - Ref: CSM全局日志功能
> - Ref: CSM全局日志获取方法

<b>参考范例</b>：
- `4. Advance Examples\Filter From Source(Event).vi`
- `4. Advance Examples\Filter From Subscriber(Event).vi`

-- <b>输入控件(Controls)</b> --
- <b>CSM Global Log Event</b>: CSM全局日志用户事件句柄。
- <b>Force Destroy? (F)</b>: 是否强制销毁，默认不强制。
- <b>Timeout In ms (5000ms)</b>: 超时时间，默认5000 ms。

## CSM - Global Log Error Handler.vi
CSM错误处理函数。如果发生错误，错误信息将通过CSM Global Log发布。从而可以将一些不在CSM框架的错误信息统一的记录在全局日志中。

-- <b>输入控件(Controls)</b> --
- <b>Place ("" to Use VI's Name)</b>: 标记发生错误的位置，默认使用调用VI的名称。
- <b>Clear Error? (T)</b>: 是否清除错误。默认清除，经过此VI后，错误将被清除。

## CSM - Generate User Global Log.vi
生成一个自定义的用户日志，用于调试等场景。当此VI的输入参数中包含错误信息时，将调用CSM - Global Log Error Handler VI记录错误信息。

-- <b>输入控件(Controls)</b> --
- <b>Log</b>: 事件名称。
- <b>Arguments</b>: 事件参数。
- <b>From Who</b>: 来源。
- <b>ModuleName</b>: 模块名称。
- <b>Place ("" to Use VI's Name)</b>: 发生错误的地点，默认使用VI的名称。

## Filter Rules

> [!NOTE]
> <b>全局日志过滤位置</b>
>
> 全局日志的过滤可以分为两种：源端过滤和订阅端过滤。
> - <b>源端过滤</b>: CSM框架内置了过滤规则，根据用户的设置，可以在源头不发送日志
> - <b>订阅端过滤</b>: 同样的规则，CSM提供了一些帮助VI，可以在接收到日志后，判断是否符合过滤规则，从而实现不同的逻辑处理。
>
> 源端处理会完全不发送日志，可以减轻系统负担，订阅端过滤只会影响此订阅端逻辑，不会后台日志保存等，具有更高的灵活性。

> [!NOTE]
> <b>全局日志过滤规则</b>
>
> 全局日志过滤规则是可以将一类日志进行过滤，不出现在全局日志中。
>
> 目前有三类:
> - 全局规则，针对符合条件的所有模块，目前可设置:
>    - 模块名称: 该模块所有名称均会被过滤。
>    - 日志类型: 如状态、消息、广播、模块初始化等。
>    - 状态名称: 任意模块的该名称状态都会被过滤。
>    - 状态类型: 状态的类型，内部状态、外部消息等。
>
> - 模块规则，可针对模块设置对应的规则，目前可设置:
>    - 模块的日志类型: 该模块的日志类型会被过滤。
>    - 状态名称: 该模块的同名状态会被过滤。
>    - 状态类型: 该模块的状态类型会被过滤。
>
> - 周期过滤规则: 此规则目前只能针对订阅处有效，因为发布位置不容易统计数目。
>    - 是否启用周期过滤。
>    - Threshold(#/s): 周期过滤阈值。
>    - CheckPeriod(s): 检查窗口时间。

### CSM - Set Log Filter Rules.vi
设置全局的源端过滤规则，当log满足过滤规则时，将不会在源头被发送，因此任何工具也将不能再检测到这个log记录。

> [!NOTE]
> 这个VI是一个多态VI，用于保证修改后的接口向前兼容，建议选择版本更新的实例。

> - Ref: 全局日志过滤位置
> - Ref: 全局日志过滤规则

<b>参考范例</b>：
- `4. Advance Examples\Filter From Source(Queue).vi`
- `4. Advance Examples\Filter From Source(Event).vi`

### CSM - List Log Filter Rules As Strings.vi
以字符串的格式将全局过滤规则列出来，每个规则占一行，可供用户查看。主要用于后台日志文件保存、调试界面查看等。

> - Ref: 全局日志过滤规则

-- <b>输出控件(Indicators)</b> --
- <b>Rule Strings</b>: 过滤规则字符串。

### CSM - Convert Filter Rules.vi
将过滤规则簇列表转换为过滤规则类实例。以类的形式提供接口可以保证接口的向前兼容，在功能修改后，旧的接口不变。目前这个VI主要用于CSM File Logger Addon.

> [!NOTE]
> 这个VI是一个多态VI，用于保证修改后的接口向前兼容，建议选择版本更新的实例。

> - Ref: 全局日志过滤规则

### CSM - Filter Global Log.vi
这是一个订阅端过滤VI，用于判断是否log被满足过滤规则。过滤判断发生在订阅端，因此不会影响其他工具的订阅。

> [!NOTE]
> 这个VI是一个多态VI，用于保证修改后的接口向前兼容，建议选择版本更新的实例。

> - Ref: 全局日志过滤规则

### Utility VIs

#### Global Log To String.vi
全局日志(Global Log)数据簇转换为字符串。

-- <b>输入控件(Controls)</b> --
- <b>Log</b>: 全局日志数据簇。

-- <b>输出控件(Indicators)</b> --
- <b>Log String</b>: 全局日志字符串。

#### Global Log To String(Source Time).vi
将全局日志(Global Log)数据簇转换为字符串，使用发送时间作为时间戳。

-- <b>输入控件(Controls)</b> --
- <b>Log</b>: 全局日志数据簇。
- <b>Format String</b>: 时间戳格式。

-- <b>输出控件(Indicators)</b> --
- <b>Log String</b>: 全局日志字符串。

#### Global Log History Cacher.vi
保存当前输入的字符串到缓存，缓存的历史字符串，当超出最大长度限制时，最先进入的缓存字符串将被覆盖。用于调试CSM的历史状态。

-- <b>输入控件(Controls)</b> --
- <b>Global Log Data</b>: 收到的Global Log信息数据包。
- <b>Length (10000)</b>: 缓存的历史字符串最大字符串长度。
- <b>Level (Normal)</b>: 处理等级，Normal为正常处理，更高的等级会省略不同的信息，以提高处理速度。
- <b>Time Format String</b>: 时间戳格式。
- <b>With Periodic Info? (T)</b>: 是否折叠周期性的log。
- <b>Remove Immediately? (F)</b>: 是否立即移除周期性的折叠信息。
- <b>Reset?</b>: 重置标志。
- <b>Settings</b>: 周期性的log配置信息，可以设置检测周期与周期性阈值，来判断是否折叠。

-- <b>输出控件(Indicators)</b> --
- <b>String Cache</b>: 缓存的历史字符串。

#### Auto Processing Level.vi
根据当前全局日志队列的日志数量，动态的推算推荐的日志处理等级。

-- <b>输入控件(Controls)</b> --
- <b>#Left In Q</b>: 全局日志队列中剩余的日志数量。
- <b>Debounce Period (5s)</b>: 日志处理升级时间，在指定时间内全局日志失踪在增加，将提高处理等级。
- <b>Period (0.1s)</b>: 检测周期，默认100 ms。
- <b>Reset? (F)</b>: 重置标志。

-- <b>输出控件(Indicators)</b> --
- <b>Level</b>: 处理等级，Normal为正常处理，更高的等级会省略不同的信息，以提高处理速度。
- <b>LogInQ Changing Speed (#/s)</b>: 当前全局日志队列的日志变化速度。
- <b>Since Upgraded (S)</b>: 自从上次升级处理等级以来的时间。

### Exit With Empty Queue Check.vi
此VI用于使用Global Log Queue的全局日志监控循环，例如`template/CSM - Global Log Queue Monitoring Loop.vi`或CSM File Logger的后台线程。

通常这些全局日志的监控循环的退出条件会在程序退出时成立，这时可能队列中的日志还没有完全的处理完毕，这个VI用于在<b>Stop</b>信号到来后，再给一段时间<b>Timeout (5s)</b>来处理队列中的日志。当队列中日志的数量为空或超时后，才会将 <b>Exit</b>置真，真正的退出循环。

-- <b>输入控件(Controls)</b> --
- <b>Queue</b>: 队列资源，例如Global Log Queue。
- <b>Stop</b>: 输入的停止信号，当此信号为真时，将开始检查队列是否为空。

-- <b>输入控件(Controls)</b> --
- <b>Timeout (5s)</b>: 超时时间，默认5 s。
- <b>Exit</b>: 真实的退出信号，当队列为空，或超时时为TRUE。
- <b>Since Exiting (s)</b>: 自退出开始的时间，单位为秒。
