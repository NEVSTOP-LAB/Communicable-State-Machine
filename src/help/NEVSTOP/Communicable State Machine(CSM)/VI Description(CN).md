# CSM API

- [01. 模板(Templates)](./VI%20Description(CN)%20-%2001.%20模板(Templates).md)
- [02. 核心功能(Core Functions)](./VI%20Description(CN)%20-%2002.%20核心功能(Core%20Functions).md)
- [03. 参数(Arguments)](./VI%20Description(CN)%20-%2003.%20参数(Arguments).md)
- [04. 管理接口(Management API)](./VI%20Description(CN)%20-%2004%20.管理接口(Management%20API).md)
- [05. 模块操作接口(Module Operation API)](./VI%20Description(CN)%20-%2005.%20模块操作接口(Module%20Operation%20API).md)
- [06. 状态订阅管理(Status Registration)](./VI%20Description(CN)%20-%2006.%20状态订阅管理(Status%20Registration).md)
- [07. 全局日志(Global Log)](./VI%20Description(CN)%20-%2007.%20全局日志(Global%20Log).md)
- [08. 高级模式](./VI%20Description(CN)%20-%2008.%20高级模式.md)
- [09. 内置插件(Built-in Addons)](./VI%20Description(CN)%20-%2009.%20内置插件(Build-in%20Addons).md)
- [10. 工具VI(Utiliy VIs)](./VI%20Description(CN)%20-%2010.%20工具VI(Utility%20VIs).md)
- [11. CSM-Helper API](./VI%20Description(CN)%20-%2011.%20CSM-Helper%20API.md)
- [12. Debug,Doc,Tools](./VI%20Description(CN)%20-%2012.%20Debug,Doc,Tools.md)
- [13. Internal](./VI%20Description(CN)%20-%2013.%20Internal.md)

## Unsorted

### CSM - Flood of Events Handler Side Loop.vi

### CSM - Forward States to CSM.vi

-- <b>输入控件</b> --
- <b>High Priority(T)</b>:
- <b>Module Name</b>:Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters
- <b>State(s) in ("")</b>:Wire the existing states to this input. The default is an empty string.

### CSM - Forward UI Operations to CSM.vi

-- <b>输入控件</b> --
- <b>Name("" to use uuid)</b>:
- <b>State(s) in ("")</b>:

-- <b>输出控件</b> --
- <b>States Out</b>:

### CSM - Remove Module in Broadcast Registry.vi

-- <b>输入控件</b> --
- <b>CSM Name</b>:

-- <b>输出控件</b> --
- <b>CSM Name(dup)</b>:

### Parse VI Documentation String.vi

-- <b>Inputs</b> --
- <b>NOTE-Map</b>:
- <b>Documentation</b>:

-- <b>Outputs</b> --
- <b>Ctrl-Doc Map</b>:
- <b>Control Docs</b>:
- <b>Core Doc</b>:
- <b>Documentation (dup)</b>:

### Gevt-ThreadQueueName.vi

-- <b>Outputs</b> --
- <b>ThreadQueueName</b>:

### CSM - Status Change Event.vi

-- <b>Inputs</b> --
- <b>CSM Module</b>:

-- <b>Outputs</b> --
- <b>Status Change Event</b>:
