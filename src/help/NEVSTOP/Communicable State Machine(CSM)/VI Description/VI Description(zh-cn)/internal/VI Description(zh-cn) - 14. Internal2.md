# 内部使用的一些帮助VI，客户不可见

## Build Error Cluster.vi

创建一个错误簇(error cluster)，以标准 LabVIEW 的方式从调用 VI 的调用链中构建源字符串。构建的源字符串形式为：
"<B>调用的 VI</B> 在 <B>调用 VI 的调用者</B>-><B>调用 VI 的调用者的调用者</B>->等等...->等等..."
可选的 'String to Prepend to source ("")' 字符串输入可用于在源字符串中添加额外的描述信息。如果存在这个字符串，它将用括号括起来，并添加到源字符串之前。

-- <b>Controls(输入控件)</b> --
- <b>code</b>: 错误码
- <b>String to Prepend to source ("")</b>: 错误信息字符串

## Build Internal State String.vi

构建包含 JKI 状态机状态、参数等信息的字符串。

-- <b>Controls(输入控件)</b> --
- <b>State</b>: 状态字符串
- <b>Arguments ("")</b>: <b>State</b>的参数
- <b>Arg-State ("")</b>: 发送此消息的模块在发送此消息时处于的状态
- <b>Source ("")</b>: 发送此消息的模块名称

-- <b>Indicators(输出控件)</b> --
- <b>CSM Message String</b>: 拼接生成的 CSM 消息字符串
- <b>>> Response Source Message >></b>:Controls
- <b>State With Arguments</b>:Indicators

### Trim Both Whitespace.vi

开头、结尾或两者同时移除所有 ASCII 空白字符(空格、制表符、回车和换行)。

-- <b>Controls(输入控件)</b> --
- <b>string</b>: 待处理字符串

-- <b>Indicators(输出控件)</b> --
- <b>trimmed string</b>: 处理后的字符串

## CSM - State Dashboard - DebugTool.vi

CSM整体程序模块的实时状态面板。

## CSM - State Table - DebugTool.vi

<开发中> CSM整体程序模块的实时状态表。

## CSM-DOC

### csmdoc_import_all_csm_VI_description_doc.vi

选择 CSM VI 功能描述的 markdown 文件，导入到所有的VI。

-- <b>Controls</b> --
- <b>Path</b>: CSM VI 功能描述的 markdown 文件路径

### csmdoc_export_all_csm_VI_description_doc.vi

分析所有CSM VI, 将 VI 功能描述导出到 markdown 文件中。

-- <b>Controls</b> --
- <b>Path</b>: CSM VI 功能描述的 markdown 文件路径

### csmdoc_export_VI_description.vi

-- <b>Controls</b> --
- <b>NOTE-Map</b>:
- <b>Path</b>:

-- <b>Indicators</b> --
- <b>concatenated string</b>:

### csmdoc_import_doc_to_singleVI.vi

### csmdoc_import_VI_description.vi

-- <b>Controls</b> --
- <b>NOTE-Map</b>:
- <b>string</b>:
- <b>Path</b>:

### csmdoc_list_all_csm_documented_VIs.vi

-- <b>Indicators</b> --
- <b>Array</b>:

### csmdoc_load vi description map.vi

-- <b>Controls</b> --
- <b>Path</b>:

-- <b>Indicators</b> --
- <b>text</b>:
- <b>variant 2</b>:
- <b>variant</b>:

## Scripts

### Script - JKISM to CSM.vi
