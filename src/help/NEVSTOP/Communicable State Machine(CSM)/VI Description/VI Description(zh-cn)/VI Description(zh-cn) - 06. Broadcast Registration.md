# 广播订阅管理(Broadcast Registration)

## CSM - Register Broadcast.vi
注册以接收其他CSM模块触发更改的通知。如果未连接<b>API</b>或输入为空，则将使用相同的触发名称作为响应消息。触发名称可以是源模块的广播名称，或者源模块的状态名称。

协作者模式和责任链模式下，输入节点的名称，会被自动解析为模块的名称，因为CSM是以模块为单位实现订阅的。

<b>参考范例</b>：`2. Caller is CSM Scenario\CSM Example - Caller is a CSM.vi`。

> - Ref: CSM订阅
> - Ref: CSM订阅位置
> - Ref: CSM广播优先级

-- <b>输入控件(Controls)</b> --
- <b>CSM Name</b>: CSM模块名称。
- <b>Source CSM Name (* as Default)</b>: 生成状态的CSM模块。您可以使用`*`来表示所有生成相同状态的模块。
- <b>Trigger</b>: 触发字符串。
- <b>API (if "", same as Trigger)</b>: 注册后，如果触发发生变化，将接收到此消息。
- <b>Priority (No Change)</b>: 订阅后的广播优先级。

-- <b>输出控件(Indicators)</b> --
- <b>CSM Name (Dup)</b>: 输入的CSM模块名称副本。

## CSM - Unregister Broadcast.vi
取消注册其他CSM模块状态更改的通知。

协作者模式和责任链模式下，输入节点的名称，会被自动解析为模块的名称，因为CSM是以模块为单位实现订阅的。

<b>参考范例</b>：`2. Caller is CSM Scenario\CSM Example - Caller is a CSM.vi`。

> - Ref: CSM订阅
> - Ref: CSM订阅位置

-- <b>输入控件(Controls)</b> --
- <b>CSM Name</b>: CSM模块名称。
- <b>Source CSM Name (* as Default)</b>: 生成状态的CSM模块。您可以使用`*`来表示所有生成相同状态的模块。
- <b>Trigger</b>: 触发字符串。
- <b>API ("*" as Default)</b>: 取消注册的API名称。如果为空，则为所有API。

-- <b>输出控件(Indicators)</b> --
- <b>CSM Name (Dup)</b>: 输入的CSM模块名称副本。

## CSM - List Rules in Broadcast Registry.vi
列出CSM注册表中的的所有规则。

> - Ref: CSM广播
> - Ref: CSM订阅

-- <b>输出控件(Indicators)</b> --
- <b>Rule Entries</b>: 所有规则条目。

## CSM - List Mapping Relationships in Broadcast Registry.vi
列出当前CSM模块的所有广播订阅关系。和规则不同，广播订阅关系是当前的CSM模块在当前的规则下所有的广播订阅关系。

> [!NOTE]
> CSM使用订阅、取消订阅操作，添加的是CSM模块广播订阅的规则。根据当前规则和实际存在的模块，可以推算出当前CSM模块的所有广播订阅关系。CSM内部会进行缓存当前的订阅关系，当CSM模块的订阅规则或CSM模块数目发生变化时，会自动更新订阅关系缓存。

> - Ref: CSM广播
> - Ref: CSM订阅

-- <b>输出控件(Indicators)</b> --
- <b>Mapping Relationships</b>: 当前CSM模块的所有广播订阅关系。

## CSM - List Sources in Broadcast Registry.vi
列出当前所有广播订阅关系的广播名称。

> - Ref: CSM广播
> - Ref: CSM订阅

-- <b>输出控件(Indicators)</b> --
- <b>Broadcast Names</b>: 当前所有广播订阅关系的广播名称。

## CSM - Check Mapping Relationship in Broadcast Registry.vi
检查CSM模块的某广播名称对应所有的订阅关系。

> - Ref: CSM广播
> - Ref: CSM订阅

-- <b>输入控件(Controls)</b> --
- <b>CSM Name</b>: CSM模块名称。
- <b>Broadcast Name</b>: 广播的名称。

-- <b>输出控件(Indicators)</b> --
- <b>Mapping Relationships</b>: 当前CSM模块的某广播名称对应所有的订阅关系。

## CSM - Remove Module in Broadcast Registry.vi
从广播注册中删除所有与指定CSM模块相关的订阅关系。

> - Ref: CSM广播
> - Ref: CSM订阅

-- <b>输入控件(Controls)</b> --
- <b>CSM Name</b>: CSM模块名称。

-- <b>输出控件(Indicators)</b> --
- <b>CSM Name (Dup)</b>: 输入的CSM模块名称副本。

## CSM - Drop Broadcast Registry.vi
重置后台广播注册的所有信息，应用在完全重置订阅关系的场景中。

> - Ref: CSM广播
> - Ref: CSM订阅
