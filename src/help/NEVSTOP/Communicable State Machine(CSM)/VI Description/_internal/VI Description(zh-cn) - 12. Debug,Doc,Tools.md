# CSM API

## Documentation

### CSM - Copyright QuickDrop.vi

### CSM - Documentation QuickDrop.vi

### CSM - Keywords QuickDrop.vi

### CSM Dummy Module.vi

-- <b>Controls(输入控件)</b> --
- <b>Init State("Macro: Initialize")</b>:
- <b>Name("" to use uuid)</b>:
- <b>Name ("" to Use UUID)</b>:Controls
## CSM Debug Tools

### CSM - Add VI Reference Case to CSMs.vi

CSM 模板中必须包含"VI Reference" 分支，用于外部获取VI的引用。在早期的模板中并不包含此case，此工具用于添加它。

此工具会扫描 lvproj 目录中所有的 VI，如果这个 VI 包含 CSM 模块，它将被罗列出来，然后你可以选择批量的添加 "VI Reference" 分支。

### CSM - Debug Console - DebugTool.vi

CSM 调试控制台，你可以使用此工具：

1. 选择已有的 CSM 实例，打开前面板、后面板。
2. 扫描已有的 CSM 实例的API接口。
3. 选择一个API接口，同步、异步调用，查看返回值。
4. 查看整体程序的运行日志。

### CSM - Remove all CSM Bookmarks.vi

移除 CSM 模块中所有的书签。

### CSM - Running Log - DebugTool.vi

CSM整体程序的运行日志实时查看工具。

### CSM - State Dashboard - DebugTool.vi

CSM整体程序模块的实时状态面板。

### CSM - State Table - DebugTool.vi

<开发中> CSM整体程序模块的实时状态表。

### CSM - Switch Language Tool.vi

切换 CSM 模块 VI描述、注释的语言。目前支持中文、英文。

### CSM - Fix JKISM Editor RCM Entry.vi

修复 JKISM State Editor 右键弹出菜单在 CSM中不能弹出的问题。

### CSM - Create CSM Palette at Root.vi

在项目根目录创建 CSM 模块的函数选板。

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
