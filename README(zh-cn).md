# Communicable State Machine(CSM)

[English](./README.md) | [中文](./README(zh-cn).md)

[![Image](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/badge.svg?metric=installs)](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/)
[![Image](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/badge.svg?metric=stars)](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/)
[![GitHub all releases](https://img.shields.io/github/downloads/NEVSTOP-LAB/Communicable-State-Machine/total)](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/releases)

可通信状态机（CSM）是一个基于JKI状态机（JKISM）的LabVIEW应用框架。它遵循 JKISM 的模式，扩展了关键词以描述模块之间的消息通信，包括同步消息、异步消息、状态订阅/取消订阅等概念-这些是创建可重用代码模块所必需的要素。请访问CSM Wiki页面了解更多信息: <https://nevstop-lab.github.io/CSM-Wiki/>

- 关于 JKI State Machine(JKISM) 更多信息, 请访问: <http://jki.net/state-machine/>
- 关于 NEVSTOP-LAB 更多信息, 请访问: <https://github.com/NEVSTOP-LAB>

![image](.doc/_img/csm-intro.png)

_**CSM 函数面板**_

![image](.doc/_img/CSM%20Palette.png)

CSM 代码模板介绍:
[English](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/Template%20Description(EN).md) | [中文](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/Template%20Description(zh-cn).md)

CSM API 介绍:
[English](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description(EN).md) | [中文](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description(zh-cn).md)

## 创建基于 CSM 的可重用模块

创建一个可重用模块通常不需要与其他模块进行消息交互；它只需要提供外部接口和发布模块的状态变化。因此，只要明确描述了这两个方面，就可以在不了解内部实现细节的情况下，调用可重用模块。

 在CSM模块中，所有 case 分支都可以被视为调用的消息，但建议使用 API 分组作为外部接口。当发送状态更新时，通过发送 Status 或 Interrupt Status 来通知外部模块内部的状态变化。

可参考范例 _**/Example/1. Create a reusable module**_.

## 使用 CSM 作为应用框架场景

在这种情况下，模块之间的通信完全依赖于消息字符串队列操作，你可以使用 **Build Message with Arguments++.vi** 函数生成一个 Message 字符串，或者，如果你熟悉规则，你可以直接使用编写用于描述通讯的字符串。

``` c
#CSM 状态语法
    // 本地消息示例
    DoSth: DoA >> 参数

    // 同步调用示例
    API: xxxx >> 参数 -@ TargetModule

    // 异步调用示例
    API: xxxx >> 参数 -> TargetModule

    // 无应答异步调用示例
    API: xxxx >> 参数 ->| TargetModule

    // 广播正常状态：
    Status >> StatusArguments -><status>

    // 广播中断状态：
    Interrupt >> StatusArguments -><interrupt>

    // 将源模块的状态注册到处理程序模块
    Status@Source Module >> API@Handler Module -><register>

    // 取消注册源模块的状态
    Status@Source Module >> API@Handler Module -><unregister>
    Status@Source Module >> Handler Module -><unregister> // API Name可以缺省

#CSM 注释
    // 要添加注释，请使用 "//"，右边的所有文本将被忽略。
    UI: Initialize // 初始化 UI
    // Another comment line

```

可参考范例 _**/Example/2. Caller is CSM Scenario**_.

## Reuse CSM Module in another Application Framework

在这种情况下，模块之间的通信完全依赖于Post/Send Message API和模块状态更改用户事件。

可参考范例 _**/Example/3. Caller is Other Framework Scenario**_.

## CSM Arguments Support

JKISM 只支持 STRING TYPE 作为参数，但是需要传输的数据种类繁多。因此，对参数的支持至关重要。下表列出了当前支持不同数据类型的一些方法，其中一些是 CSM 内置的，而其他一些则需要安装额外的支持插件。

| 参数 | 类型 | 描述 |
|---|---|---|
| SafeStr | 内置 | “->\| -> -@ & <- ， ； []{} `”将被替换为%[HEXCODE] |
| HexStr | 内置 | 数据将被转换为十六进制字符串作为参数 |
|[MassData](https：//github.com/NEVSTOP-LAB/CSM-MassData-Parameter-Support) |插件|数据将被保存在循环缓冲区中。传递带有起始地址和数据长度|
|[API Arguments](https：//github.com/NEVSTOP-LAB/CSM-API-String-Arugments-Support) |插件|支持将纯字符串作为 CSM API 参数|
|[INI Static Variable](https：//github.com/NEVSTOP-LAB/CSM-INI-Static-Variable-Support)|插件|为 CSM 提供 ${variable} 支持|
