# CSM调试工具(CSM Debug Tools)

## 所有CSM添加"VI Reference"分支(CSM - Add VI Reference Case to CSMs.vi)

CSM 模板中必须包含"VI Reference" 分支，用于外部获取VI的引用。在早期的模板中并不包含此case，此工具用于添加它。

此工具会扫描 lvproj 目录中所有的 VI，如果这个 VI 包含 CSM 模块，它将被罗列出来，然后你可以选择批量的添加 "VI Reference" 分支。

## CSM调试控制台(CSM - Debug Console - DebugTool.vi)

CSM 调试控制台，你可以使用此工具：

1. 选择已有的 CSM 实例，打开前面板、后面板。
2. 扫描已有的 CSM 实例的API接口。
3. 选择一个API接口，同步、异步调用，查看返回值。
4. 查看整体程序的运行日志。

## 移除CSM模块中所有的书签(CSM - Remove all CSM Bookmarks.vi)

移除 CSM 模块中所有的书签。

## CSM日志实时查看工具(CSM - Running Log - DebugTool.vi)

CSM整体程序的运行日志实时查看工具。

## 切换CSM开发工具语言(CSM - Switch Language Tool.vi)

切换CSM开发工具语言, 目前支持中文、英文。

## 修复JKISM右键弹出菜单(CSM - Fix JKISM Editor RCM Entry.vi)

修复 JKISM State Editor 右键弹出菜单在 CSM中不能弹出的问题。

## 函数选板根目录添加CSM(CSM - Create CSM Palette at Root.vi)

在函数选板根目录创建 CSM 模块的函数选板。

## CSM范例查看助手(CSM - Example Browser.vi)

CSM范例查看助手，可以方便的浏览 CSM 范例程序。
