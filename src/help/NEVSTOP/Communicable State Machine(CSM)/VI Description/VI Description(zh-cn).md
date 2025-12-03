# CSM API

- [01. 模板(Templates)](./VI%20Description(zh-cn)/VI%20Description(zh-cn)%20-%2001.%20模板(Templates).md)
- [02. 核心功能(Core Functions)](./VI%20Description(zh-cn)/VI%20Description(zh-cn)%20-%2002.%20核心功能(Core%20Functions).md)
- [03. 参数(Arguments)](./VI%20Description(zh-cn)/VI%20Description(zh-cn)%20-%2003.%20参数(Arguments).md)
- [04. 管理接口(Management API)](./VI%20Description(zh-cn)/VI%20Description(zh-cn)%20-%2004%20.管理接口(Management%20API).md)
- [05. 模块操作接口(Module Operation API)](./VI%20Description(zh-cn)/VI%20Description(zh-cn)%20-%2005.%20模块操作接口(Module%20Operation%20API).md)
- [06. 状态订阅管理(Status Registration)](./VI%20Description(zh-cn)/VI%20Description(zh-cn)%20-%2006.%20状态订阅管理(Status%20Registration).md)
- [07. 全局日志(Global Log)](./VI%20Description(zh-cn)/VI%20Description(zh-cn)%20-%2007.%20全局日志(Global%20Log).md)
- [08. 高级模式](./VI%20Description(zh-cn)/VI%20Description(zh-cn)%20-%2008.%20高级模式.md)
- [09. 内置插件(Built-in Addons)](./VI%20Description(zh-cn)/VI%20Description(zh-cn)%20-%2009.%20内置插件(Build-in%20Addons).md)
- [10. 工具VI(Utility VIs)](./VI%20Description(zh-cn)/VI%20Description(zh-cn)%20-%2010.%20工具VI(Utility%20VIs).md)
- [11. CSM-Helper API](./VI%20Description(zh-cn)/VI%20Description(zh-cn)%20-%2011.%20CSM-Helper%20API.md)
- [12. Debug,Doc,Tools](./VI%20Description(zh-cn)/VI%20Description(zh-cn)%20-%2012.%20Debug,Doc,Tools.md)
- [13. Internal](./VI%20Description(zh-cn)/VI%20Description(zh-cn)%20-%2013.%20Internal.md)


> [!NOTE] CSM 模块间通信类型
> CSM 模块间的通信分为两类：消息和广播。
> - 消息：模块间1:1的通信，根据消息处理的方式，又可分为同步调用(-@)、异步调用(->)、异步不等待返回(->|)等。
> - 广播：模块间1:N的通信，广播模块会将广播推送给所有订阅了该广播的模块。根据广播处理的优先级，又可分为信号广播(status)和中断广播(interrupt)


> [!NOTE] CSM 模块外部接口
> 基于CSM框架编写的模块，具有良好的复用性。使用者只需了解以下接口信息，即可在不了解具体实现的情况下，使用CSM模块。
> - 消息接口(message)：外部可调用的消息名称、参数信息和返回信息
> - 广播接口(broadcast)：外部可调用的广播名称、参数信息
> - 属性接口(Attribute)：模块可使用的属性名称、属性数据类型(LabVIEW数据类型)


> [!NOTE] CSM 消息类型
> CSM 消息分为三类：同步调用(-@)、异步调用(->)、异步不等待返回(->|)。
> - 同步调用(-@)：模块会等待目标模块返回结果，才会继续执行后续代码。
> - 异步调用(->)：模块会立即继续执行后续代码，而不会等待目标模块返回结果。
> - 异步不等待返回(->|)：模块会立即继续执行后续代码，而不会等待目标模块返回结果。与异步调用(->)不同的是，异步不等待返回(->|)不会等待目标模块返回结果，也不会抛出错误。


> [!NOTE] CSM 消息格式解析
> [CSM 消息字符串(CSM Message)] >> [参数(Arguments)] [消息类型符号(Message Symbol) ->|,->,-@] [目标模块(Target Module)] // [注释(Comments)]
> - CSM 消息字符串(CSM Message)：CSM的消息，不可包含CSM关键字和换行符
> - ">>": CSM 消息字符串(CSM Message) 和 参数(Arguments) 的分隔符
> - 参数(Arguments)：CSM 消息的参数，不可包含CSM关键字和换行符
> - 消息类型符号(Message Symbol)：消息类型符号，用于标识消息类型，包括同步调用(-@)、异步调用(->)、异步不等待返回(->|)等
> - 目标模块(Target Module)：消息发送的目标模块，如为空，则表示消息会被本模块处理。为空时，消息类型符号也不能存在
> - 注释(Comments)：注释信息，不会被解析


>[!NOTE] CSM消息的目标模块说明
> 普通模式下，CSM消息的目标模块为指定的模块名称。
> 系统级模块只是名称上以"."起始, CSM消息的目标模块包含"."的名称, 如申请的模块名称为".System",CSM消息的目标模块就是".System"。
> 工作者模式下，CSM消息的目标模块只能是整体模块名称，不能是节点的名称，例如申请的模块名称为"Worker#", CSM消息的目标模块就是"Worker"。
> 责任链模式下，CSM消息的目标模块只能是整体模块名称，不能是节点的名称。例如申请的模块名称为"Chain$1", CSM消息的目标模块就是"Chain"。


> [!NOTE] CSM 广播类型
> CSM 广播分为两类：信号广播(status)和中断广播(interrupt), 模块会将信号广播推送给所有订阅了该信号广播的模块.
> - 信号广播(status)：普通优先级的广播，类似异步消息，会通过低优先级队列传递。当模块中存在其他未处理的异步消息或者信号广播时，会依次被处理。
> - 中断广播(interrupt)：高优先级的广播，类似同步消息，会通过高优先级队列传递。当模块中存在其他低优先级的异步消息或者信号广播时，会被优先处理，但是如果存在其他未处理的同步消息或中断广播时，会被依次处理。


> [!NOTE] CSM 广播格式解析
> [CSM 广播字符串(CSM Broadcast)] >> [参数(Arguments)] -> <broadcast> // [注释(Comments)]
> [CSM 信号广播字符串(CSM Broadcast)] >> [参数(Arguments)] -> <status> // [注释(Comments)]
> [CSM 中断广播字符串(CSM Broadcast)] >> [参数(Arguments)] -> <interrupt> // [注释(Comments)]
>
> - CSM 广播字符串(CSM Broadcast)：CSM的广播，不可包含CSM关键字和换行符
> - ">>": CSM 广播字符串(CSM Broadcast) 和 参数(Arguments) 的分隔符
> - 参数(Arguments)：CSM 广播的参数，不可包含CSM关键字和换行符
> - 广播类型(Broadcast Type)：<broadcast>,<status>为信号广播(status)，<interrupt>为中断广播(interrupt)
> - 注释(Comments)：注释信息，不会被解析

> [!NOTE] CSM 操作消息格式解析
> //[CSM 操作字符串(CSM Operation)] >> [参数(Arguments)] -> <[操作类型(operation)]> // [注释(Comments)]
> 待完善