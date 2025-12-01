# CSM API

## 状态订阅管理(Status Registration)

### CSM - Register Status Change.vi

注册以接收其他CSM模块状态更改的通知。如果未连接 “Response Message” 或输入为空，则将使用相同的<b>Status</b> 名称作为响应消息。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称.
- <b>Source CSM Name ('*' as Default)</b>: 生成状态的CSM模块。您可以使用“*”来表示所有生成相同状态的模块。
- <b>Status</b>: 状态字符串
- <b>API (if "", same as Status)</b>: 注册后，如果状态发生变化，将接收到此消息。
- <b>Priority(T:As Status,F:As Interrupt)</b>: 如果响应消息为False，则将其插入到状态队列的前面；否则，将其附加到队列的尾部。

-- <b>输出控件</b> --
- <b>CSM Name(dup)</b>: 返回 <b>CSM Name</b>

### CSM - Unregister Status Change.vi

取消注册其他 CSM 模块状态更改的通知。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称.
- <b>Source CSM Name</b>: 生成状态的CSM模块。您可以使用“*”来表示所有生成相同状态的模块。
- <b>Status</b>: 状态字符串

-- <b>输出控件</b> --
- <b>CSM Name(dup)</b>: 返回 <b>CSM Name</b>

### CSM - List All Status Registration.vi

-- <b>输出控件</b> --
- <b>Status Array</b>:

### CSM - List Mapping Relationships in Broadcast Registry.vi

-- <b>输出控件</b> --
- <b>Mapping Relationships</b>:

### CSM - List Rules in Broadcast Registry.vi

-- <b>输出控件</b> --
- <b>Rules</b>:

### CSM - List Status in Broadcast Registry.vi

-- <b>输出控件</b> --
- <b>Status in Registry</b>:

### CSM - Check Mapping Relationship in Broadcast Registry.vi

-- <b>输入控件</b> --
- <b>CSM Name</b>:
- <b>Broadcast state</b>:

-- <b>输出控件</b> --
- <b>Array</b>:

### CSM - Check Status Registration.vi

-- <b>输入控件</b> --
- <b>CSM Name</b>:
- <b>Broadcast state</b>:

-- <b>输出控件</b> --
- <b>Array</b>:

### CSM - Remove Module in Broadcast Registry.vi

-- <b>输入控件</b> --
- <b>CSM Name</b>:

-- <b>输出控件</b> --
- <b>CSM Name(dup)</b>: