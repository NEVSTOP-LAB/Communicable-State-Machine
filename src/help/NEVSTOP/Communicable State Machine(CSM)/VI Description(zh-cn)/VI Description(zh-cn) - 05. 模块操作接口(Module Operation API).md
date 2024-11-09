# CSM API

## 模块操作接口(Module Operation API)

### CSM - Wait for Module to Be Alive.vi

在指定的超时时间内等待 CSM 模块上线。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称
- <b>Wait(5000ms)</b>: 等待超时时间，默认为5s

-- <b>输出控件</b> --
- <b>CSM Name(dup)</b>: CSM 模块名称
- <b>Waited(ms)</b>: 已等待的时间

### CSM - Wait for All Modules to be Alive.vi

在指定的超时时间内等待一组 CSM 模块全部上线。

-- <b>输入控件</b> --
- <b>CSM Names</b>: CSM 模块名称
- <b>Timeout(5000ms)</b>: 等待超时时间，默认为5s

-- <b>输出控件</b> --
- <b>CSMs Left</b>: 超时后还未上线的 CSM 模块
- <b>waited(ms)</b>: 已等待的时间

### CSM - Wait for All Modules to Exit.vi

在指定的超时时间内等待一组 CSM 模块全部下线，通常用于程序退出。

-- <b>输入控件</b> --
- <b>CSM Names</b>: CSM 模块名称
- <b>Timeout(5000ms)</b>: 等待超时时间，默认为5s

-- <b>输出控件</b> --
- <b>CSMs Left</b>: 超时后还未下线的 CSM 模块
- <b>waited(ms)</b>: 已等待的时间

### CSM - Post Message.vi

发送不带返回的异步消息到CSM，消息发送后继续执行之后的代码。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称
- <b>State</b>: 消息字符串
- <b>Arguments("")</b>: 消息参数
- <b>Current Module("" to generate a ID)</b>:当前模块名称，当没有输入时，生成一个临时ID，便于调试判断位置。

### CSM - Wait and Post Message.vi

发送不带返回的异步消息到CSM，消息发送后继续执行之后的代码。CSM模块未上线时，会等待指定的时间。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称
- <b>State</b>: 消息字符串
- <b>Arguments("")</b>: 消息参数
- <b>Current Module("" to generate a ID)</b>: 当前模块名称，当没有输入时，生成一个临时ID，便于调试判断位置。
- <b>Wait(5000ms)</b>: 等待超时时间，默认为5s

### CSM - Send Message and Wait for Reply.vi

发送同步消息到CSM，等待返回消息。超时未获取到返回消息，将返回超时错误。

-- <b>输入控件</b> --
- <b>Target Module</b>: 目标 CSM 模块名称
- <b>State</b>: 消息字符串
- <b>Arguments("")</b>: 消息参数
- <b>Response Timeout(5000ms)</b>: 等待返回的超时设置，默认 5000ms.

-- <b>输出控件</b> --
- <b>Response</b>: 返回的响应

### CSM - Wait and Send Message for Reply.vi

发送同步消息到CSM，等待返回消息。超时未获取到返回消息，将返回超时错误。CSM模块未上线时，会等待指定的时间。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称
- <b>State</b>: 消息字符串
- <b>Arguments("")</b>: 消息参数
- <b>Response Timeout(5000ms)</b>: 等待返回的超时设置，默认 5000ms.
- <b>Current Module("" to generate a ID)</b>: 当前模块名称，当没有输入时，生成一个临时ID，便于调试判断位置。
- <b>Wait(5000ms)</b>: 等待超时时间，默认为5s

-- <b>输出控件</b> --
- <b>Response</b>: 返回的响应
- <b>Source CSM</b>: 返回的响应的来源 CSM 模块名称

### CSM - Run Script.vi

运行 CSM 脚本。可以一次性的执行多条消息指令。

-- <b>输入控件</b> --
- <b>CSM Scripts</b>: 待运行的脚本
- <b>Response Timeout(5000ms)</b>: 等待返回的超时设置，默认 5000ms.
- <b>Continue If Error?(F)</b>: 发生错误是是否继续执行
- <b>Current Module("" to generate a ID)</b>: 当前模块名称，当没有输入时，生成一个临时ID，便于调试判断位置。
- <b>Wait(5000ms)</b>: 等待超时时间，默认为5s

-- <b>输出控件</b> --
- <b>Scripts Left</b>: 剩余未执行的脚本

### CSM - Status Change Event.vi

获取 CSM 状态更改事件句柄。

-- <b>输入控件</b> --
- <b>CSM Module</b>: CSM 模块名称

-- <b>输出控件</b> --
- <b>Status Change Event</b>: CSM 状态更改事件句柄

### CSM - Destroy Status Change Event.vi

释放 CSM 状态更改事件句柄。

-- <b>输入控件</b> --
- <b>Status Change Event</b>: CSM 状态更改事件句柄

### CSM - Module Exit Event.vi

获取 CSM 模块退出事件句柄

-- <b>输入控件</b> --
- <b>CSM Module</b>: CSM 模块名称

-- <b>输出控件</b> --
- <b>CSM Exit Event</b>: CSM 模块退出事件句柄
