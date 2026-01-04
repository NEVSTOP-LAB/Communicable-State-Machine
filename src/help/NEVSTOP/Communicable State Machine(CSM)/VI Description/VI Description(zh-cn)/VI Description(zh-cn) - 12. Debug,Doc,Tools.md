# CSM Debug Tools

## 扫描添加"VI Reference" 分支(CSM - Add VI Reference Case to CSMs.vi)

CSM 模板中必须包含"VI Reference" 分支，用于外部获取VI的引用。在早期的模板中并不包含此case，此工具用于添加它。

此工具会扫描 lvproj 目录中所有的 VI，如果这个 VI 包含 CSM 模块，它将被罗列出来，然后你可以选择批量的添加 "VI Reference" 分支。

## CSM调试控制台-旧版本(CSM - Debug Console - previous.vi)

CSM 调试控制台，你可以使用此工具：

1. 选择已有的 CSM 实例，打开前面板、后面板。
2. 扫描已有的 CSM 实例的API接口。
3. 选择一个API接口，同步、异步调用，查看返回值。
4. 查看整体程序的运行日志。

## CSM调试控制台(CSM - Debug Console - DebugTool.vi)

更新后的CSM 调试控制台，你可以使用此工具：

1. 选择已有的 CSM 实例，打开前面板、后面板。
2. 扫描已有的 CSM 实例的API接口。
3. 选择一个API接口，同步、异步调用，查看返回值。
4. 查看整体程序的运行日志。
5. 运行 Scripts。

## 移除 CSM 模块中所有的书签(CSM - Remove all CSM Bookmarks.vi)

移除 CSM 模块中所有的书签。

## 日志实时查看工具(CSM - Running Log - DebugTool.vi)

CSM整体程序的运行日志实时查看工具。

## 实时状态面板(CSM - State Dashboard - DebugTool.vi)

CSM整体程序模块的实时状态面板。

## 实时状态表(CSM - State Table - DebugTool.vi)

<开发中> CSM整体程序模块的实时状态表。

## 切换 CSM 模块 VI描述、注释的语言(CSM - Switch Language Tool.vi)

切换 CSM 模块 VI描述、注释的语言。目前支持中文、英文。

## 修复 JKISM State Editor 右键弹出菜单(CSM - Fix JKISM Editor RCM Entry.vi)

修复 JKISM State Editor 右键弹出菜单在 CSM中不能弹出的问题。

## 在项目根目录创建 CSM 模块的函数选板(CSM - Create CSM Palette at Root.vi)

在项目根目录创建 CSM 模块的函数选板。

## CSM 示例浏览器(CSM - Example Browser.vi)

CSM 示例浏览器，允许您轻松浏览 CSM 示例程序。

## CSM接口浏览器(CSM - Interface Browser.vi)

用于浏览 CSM 模块接口的工具，允许您快速查看和搜索项目中 CSM 模块的 API 接口。
