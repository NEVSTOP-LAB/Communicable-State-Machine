# 参数(Arguments)

> [!NOTE]
> <b>CSM消息关键字</b>
>
> 包括：`->`、`->|`、`-@`、`-&`、`<-`、`\r`、`\n`、`//`、`>>`、`>>>`、`>>>>`、`;`、`,`。

> [!NOTE]
> <b>CSM参数类型(Argument Type)</b>
>
> 在CSM中，所有参数/返回均以字符串形式呈现，但其背后可承载任意数据类型。因此，发送端需先进行编码，接收端再进行解码。
> 例如CSM内置HEXSTR编码方案，也可按需扩展自定义编解码器。
> 为便于识别编码方式，推荐将编码后的参数写成`<Argument Type> STRING FORMAT ARGUMENT`格式。
> 使用CSM - Argument Type VI即可提取类型标记，据此选择对应的解码函数。

> [!NOTE]
> <b>CSM HEXSTR格式参数</b>
>
> 为了在CSM参数中传递任意数据类型，CSM内置了HEXSTR格式参数编解码方案。其参数类型字符串为HEXSTR。转换过程如下:
> 1. 将LabVIEW数据先转为变体；
> 2. 再将变体的内存映像序列化为十六进制字符串；
> 3. 得到`<HEXSTR>十六进制字符串`形式的参数，可安全嵌入状态字符串，不会破坏CSM消息解析。

> [!NOTE]
> <b>CSM ERRSTR格式参数</b>
>
> LabVIEW错误簇是一个复杂数据类型，错误信息字符串中通常包含回车符，因此它通常不能直接作为CSM参数传递。虽然可以将错误簇信息转换为HEXSTR格式，但这种方式缺乏可读性，在日志中无法直观读取信息。
> 因此，为了在CSM参数中传递LabVIEW错误信息，CSM内置了ERRSTR格式参数编解码方案。其参数类型字符串为ERRSTR。转换过程如下:
>
> 1. 将错误簇中的code、source格式化为以下格式的字符串:
>    - 错误: `<ERRSTR>[Error: error-code] error-description-As-safe-argument-string`
>    - 警告: `<ERRSTR>[Warning: error-code] warning-description-As-safe-argument-string`
> 2. 将这段字符串中的特殊字符替换为安全字符；
> 3. 得到CSM ERRSTR格式参数，可安全嵌入状态字符串，不会破坏CSM消息解析。

> [!NOTE]
> <b>CSM安全字符串参数(CSM Safe String Argument)</b>
>
> 为了在CSM参数中传递任意字符串且不破坏消息解析，CSM内置了Safe-String编解码方案，其参数类型字符串为SAFESTR。转换过程如下:
> 1. 扫描输入字符串，若出现CSM关键字(如`->`、`;`、`\r`等)，则将其替换为`%Hex`转义序列；
> 2. 最终得到形如`<SAFESTR> 已转义字符串`的参数，可安全嵌入状态字符串，不会破坏CSM消息解析。

## CSM - Argument Type.vi
从编码后的参数字符串中提取参数的编码类型标记。

> - Ref: CSM参数类型

-- <b>输入控件(Controls)</b> --
- <b>Arguments</b>: 参数字符串。

-- <b>输出控件(Indicators)</b> --
- <b>Arguments (Dup)</b>: 输入的参数字符串副本。
- <b>Argument Type</b>: 参数字符串的编码类型标记。

## CSM - Keywords.vi
用于罗列CSM消息中的关键字及其%Hex格式。

> - Ref: CSM消息关键字

-- <b>输出控件(Indicators)</b> --
- <b>keywords</b>: CSM关键字列表。
- <b>Keywords (%Hex Format)</b>: CSM关键字列表的%Hex格式。

## CSM - Make String Arguments Safe.vi
将参数字符串中的CSM关键字转换为%Hex格式，确保不影响CSM消息字符串解析。

> - Ref: CSM消息关键字
> - Ref: CSM安全字符串参数

<b>参考范例</b>：`[CSM-Example]\0. Base Concepts\4.3 Arguments - Safe Arguments if it contains key words of CSM.vi`。

-- <b>输入控件(Controls)</b> --
- <b>Argument String</b>: 字符串参数。
- <b>Ignore Argument Type(F)</b>: 不添加参数类型标记`SAFESTR`。

-- <b>输出控件(Indicators)</b> --
- <b>Safe Argument String</b>: 安全的字符串参数。

## CSM - Revert Arguments-Safe String.vi
将安全的字符串参数中的%Hex格式的CSM关键字转换回普通格式。

- 当<b>Force Convert (F)</b>为FALSE时，仅当参数类型标记为`SAFESTR`时才进行转换。
- 当<b>Force Convert (F)</b>为TRUE时，无论参数类型标记为何值均进行转换。

> - Ref: CSM消息关键字
> - Ref: CSM安全字符串参数

<b>参考范例</b>：`[CSM-Example]\0. Base Concepts\4.3 Arguments - Safe Arguments if it contains key words of CSM.vi`。

-- <b>输入控件(Controls)</b> --
- <b>Safe Argument String</b>:  安全的字符串参数。
- <b>Force Convert (F)</b>: 强制转换，即使参数类型标记不是`SAFESTR`。

-- <b>输出控件(Indicators)</b> --
- <b>Origin Argument String</b>: 字符串参数。

## CSM - Convert Data to HexStr.vi
将LabVIEW任意数据类型转换为HEXSTR格式参数字符串。

> - Ref: CSM参数类型
> - Ref: CSM HEXSTR格式参数

<b>参考范例</b>：`[CSM-Example]\0. Base Concepts\4.1 Arguments - Complex Data As Arguments.vi`。

-- <b>输入控件(Controls)</b> --
- <b>Variant</b>: LabVIEW数据，通过变体支持任意数据类型。

-- <b>输出控件(Indicators)</b> --
- <b>HEX String (0-9,A-F)</b>: CSM HEXSTR格式参数。

## CSM - Convert HexStr to Data.vi
将十六进制字符串参数转换回变体数据。

> - Ref: CSM参数类型
> - Ref: CSM HEXSTR格式参数

<b>参考范例</b>：`[CSM-Example]\0. Base Concepts\4.1 Arguments - Complex Data As Arguments.vi`。

-- <b>输入控件(Controls)</b> --
- <b>HEX String</b>: CSM HEXSTR格式参数。

-- <b>输出控件(Indicators)</b> --
- <b>Variant</b>: LabVIEW数据，通过变体支持任意数据类型。

## CSM - Convert Error to Argument.vi
将LabVIEW错误簇转换为CSM错误参数格式。

> - Ref: CSM 参数类型
> - Ref: CSM ERRSTR 格式参数

<b>参考范例</b>：`[CSM-Example]\0. Base Concepts\4.2 Arguments - Error As Arguments.vi`。

-- <b>输入控件(Controls)</b> --
- <b>Error</b>: LabVIEW错误簇。

-- <b>输出控件(Indicators)</b> --
- <b>Argument</b>: CSM错误参数格式。

## CSM - Convert Argument to Error.vi
将CSM错误参数格式转换为LabVIEW错误簇。

> - Ref: CSM参数类型
> - Ref: CSM ERRSTR格式参数

<b>参考范例</b>：`[CSM-Example]\0. Base Concepts\4.2 Arguments - Error As Arguments.vi`。

-- <b>输入控件(Controls)</b> --
- <b>Argument</b>: CSM错误参数格式。

-- <b>输出控件(Indicators)</b> --
- <b>Error</b>: LabVIEW错误簇。
