# CSM API

## 参数(Arguments)

> [!NOTE] CSM 消息关键字
> 包括: '->','->|','-@','-&','<-", "\r", "\n", "//", ">>", ">>>", ">>>>", ";", ","

> [!NOTE] CSM HEXSTR 格式参数
> 为了在 CSM 参数中传递任何数据类型，CSM 默认提供了一种 名为 HEXSTR 的参数格式，用于传递任何数据类型。
> HEXSTR：将 LabVIEW 任意数据类型转换为变体，然后将此变体的内存格式表示为十六进制字符串，以便在 CSM 参数中传递。
> HEXSTR可以安全地用作状态参数，而不会破坏 CSM 消息字符串的解析。

> [!NOTE] CSM ERROR 参数
> LabVIEW 错误簇信息通常包含回车，并且可能包含 CSM 的消息关键字，因此它通常不能直接作为 CSM 参数传递。
> 虽然可以将错误簇信息转换为 HEXSTR 格式，但是它并不具备可读性，在 log 中不能直观的读取信息。
> 因此为了在 CSM 参数中传递 LabVIEW 错误信息, 提供了一个标准的 CSM 错误参数格式。可以安全地用作状态参数，而不会破坏 CSM 消息字符串的解析。
> 它的格式为: "[Error: error-code] error-description-As-safe-argument-string"

### CSM - Keywords.vi

CSM 消息中的关键字列表。

> Ref: CSM 消息关键字

-- <b>输出控件</b> --
- <b>keywords</b>: CSM 关键字列表
- <b>keywords(%Hex format)</b>: CSM 关键字列表的%Hex格式

### CSM - Make String Arguments Safe.vi

将参数字符串中的 CSM 关键字转换为%Hex格式, 保证不影响 CSM 消息字符串解析。

> Ref: CSM 消息关键字

-- <b>输入控件</b> --
- <b>Argument String</b>: 字符串参数

-- <b>输出控件</b> --
- <b>Safe Argument String</b>: 安全的字符串参数

### CSM - Revert Arguments-Safe String.vi

将安全的字符串参数中的 %Hex格式的 CSM 关键字转换回普通格式。

> Ref: CSM 消息关键字

-- <b>输入控件</b> --
- <b>Safe Argument String</b>:  安全的字符串参数

-- <b>输出控件</b> --
- <b>Origin Argument String</b>: 字符串参数

### CSM - Convert Data to HexStr.vi

将 LabVIEW 任意数据类型转换为为 HEXSTR 格式参数字符串。

> Ref: CSM HEXSTR 格式参数

-- <b>输入控件</b> --
- <b>Variant</b>: LabVIEW 数据，通过变体支持任意数据类型

-- <b>输出控件</b> --
- <b>HEXSTR</b>: CSM HEXSTR 格式参数

### CSM - Convert HexStr to Data.vi

将十六进制字符串参数转换回变体数据。

> Ref: CSM HEXSTR 格式参数

-- <b>输入控件</b> --
- <b>HEXSTR</b>: CSM HEXSTR 格式参数

-- <b>输出控件</b> --
- <b>Variant</b>: LabVIEW 数据，通过变体支持任意数据类型

### CSM - Convert Error to Argument.vi

将 LabVIEW 错误簇转换为 CSM 错误参数格式。

> Ref: CSM ERROR 参数

-- <b>输入控件</b> --
- <b>error</b>: LabVIEW 错误簇

-- <b>输出控件</b> --
- <b>Argument</b>: CSM 错误参数格式

### CSM - Convert Argument to Error.vi

将 CSM 错误参数格式转换为 LabVIEW 错误簇。

> Ref: CSM ERROR 参数

-- <b>输入控件</b> --
- <b>Argument</b>: CSM 错误参数格式

-- <b>输出控件</b> --
- <b>error</b>: LabVIEW 错误簇
