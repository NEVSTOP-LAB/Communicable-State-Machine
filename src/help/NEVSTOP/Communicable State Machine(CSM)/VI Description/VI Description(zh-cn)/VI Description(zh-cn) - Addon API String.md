# CSM API String Addon

> [!NOTE]
><b>API String参数支持</b>
>
> API String参数支持用于增强通信状态机(CSM)的API参数功能，支持以纯文本格式传递各种数据类型，并特别优化了手动输入体验。API String未定义参数类型(Argument Type)，通过CSM - Argument Type VI获取的结果为空，通常在默认分支中处理。支持的数据类型包括:
> - 字符串(String)
> - 路径(Path)
> - 布尔值(Boolean)
> - 标签(Tag)
> - 引用号(Refnum，包括IVI/VISA/UserDefinedRefnumTag)
> - 整数(I8, I16, I32, I64, U8, U16, U32, U64)
> - 浮点数(DBL/SGL)
> - 复数(DBL/SGL)
> - 时间戳(Timestamp)
> - 枚举(Enum)
> - 数组(Array)
> - 簇(Cluster)
> - 其他类型(使用 CSM-Hexstr 表示)
>
> 更多详细信息请访问: https://github.com/NEVSTOP-LAB/CSM-API-String-Arguments-Support
>
> 或参考范例，所有数据类型均有详细说明和示例。

> [!NOTE]
> <b>TRUE值的默认字符串</b>
>
> 支持`1`, `Active`, `Enable`, `Non-null`, `On`, `T`, `True`, `valid`, `yes`
> 不区分大小写

> [!NOTE]
> <b>FALSE值的默认字符串</b>
>
> 支持`0`, `Disable`, `F`, `False`, `Inactive`, `Invalid`, `No`, `Off`, `Void`, `null`
> 不区分大小写

> [!NOTE]
> <b>浮点数默认格式</b>
>
> 浮点数默认格式为`%.6p`。

> [!NOTE]
> <b>带索引的枚举类型(Indexed Enum)</b>
>
> 格式为`[索引编号(index)][分隔符(separator)][枚举字符串]`，索引编号支持多种数值表示方式
>
> 索引编号使用`==`分隔符示例:
> `1 == boolean | 2 == string | 4 == dbl | 8 == number`
>
> 索引编号使用`--`分隔符示例:
> `0x01 -- boolean | 0x02 -- string | 0x04 -- dbl | 0x08 -- number`
>
> 索引编号使用`__`分隔符示例:
> `0b0001 __ boolean | 0b0100 __ dbl | 0b1000 __ number`

## API String 核心功能

### API String - Is Supported Datatype.vi
判断数据类型是否为API String支持的转换数据类型。

> - Ref: API String参数支持
> - Ref: CSM HEXSTR格式

-- <b>输入控件(Controls)</b> --
- <b>Data</b>: 输入数据。

-- <b>输出控件(Indicators)</b> --
- <b>Data(Dup)</b>: 输入数据副本。
- <b>Supported Datatype?</b>: 是否支持API String的布尔值。

### Convert Data To API String Arguments.vim
将数据转换为API String格式。

> - Ref: API String参数支持

-- <b>输入控件(Controls)</b> --
- <b>Data</b>: 输入数据。
- <b>Reference Cluster Data</b>: 参考簇数据，转换簇数据时，会比较输入数据和参考数据中的元素，若完全匹配，则转换结果将忽略该元素。
- <b>No Tag Mode? (F)</b>: 对于簇数据，当为TRUE时，转换为API String时不包含标签信息。

-- <b>输出控件(Indicators)</b> --
- <b>API String</b>: 转换后的API String格式。

### Convert API String Arguments to Data.vim
将API String转换为相应的数据类型。

> - Ref: API String参数支持

-- <b>输入控件(Controls)</b> --
- <b>API String</b>: API String格式的输入字符串。
- <b>Strict Label Check? (T)</b>: 严格标签检查，当为TRUE时，若参考数据中不包含标签，转换将失败报错。
- <b>Reference Type</b>: 参考数据。

-- <b>输出控件(Indicators)</b> --
- <b>Data</b>: 转换后的数据。

### Query Data as API String Arguments.vim
查询簇数据中的指定数据项，并转换为API String格式。

<b>应用场景</b>: 例如在API String Addon包含的新CSM模块模板中，新增了`Data: Get Configuration`状态，在此状态下，通过发送希望查询的数据项名称，即可返回对应的数据项值。

特殊情况: 若将<b>Name</b>设置为`<list>`，将返回所有可用设置的列表。

-- <b>输入控件(Controls)</b> --
- <b>Cluster Data</b>: 簇数据。
- <b>Name</b>: 数据名称。

-- <b>输出控件(Indicators)</b> --
- <b>Cluster Data(dup)</b>: 簇数据副本。
- <b>API String</b>: API String格式的查询结果。

## 配置

### API String - Add Boolean Strings.vi
将自定义布尔字符串添加到API String布尔值解析列表中，并返回更新后的列表。

> - Ref: TRUE值的默认字符串
> - Ref: FALSE值的默认字符串

-- <b>输入控件(Controls)</b> --
- <b>Custom False Boolean Strings</b>: 自定义FALSE字符串列表。
- <b>Custom True Boolean Strings</b>: 自定义TRUE字符串列表。

-- <b>输出控件(Indicators)</b> --
- <b>False Boolean Strings</b>: 更新后的FALSE字符串列表。
- <b>True Boolean Strings</b>: 更新后的TRUE字符串列表。

### API String - Remove Boolean Strings.vi
从API String布尔值解析列表中移除自定义布尔字符串，并返回更新后的列表。

> - Ref: TRUE值的默认字符串
> - Ref: FALSE值的默认字符串

-- <b>输入控件(Controls)</b> --
- <b>Custom False Boolean Strings</b>: 要移除的FALSE字符串列表。
- <b>Custom True Boolean Strings</b>: 要移除的TRUE字符串列表。

-- <b>输出控件(Indicators)</b> --
- <b>False Boolean Strings</b>: 更新后的FALSE字符串列表。
- <b>True Boolean Strings</b>: 更新后的TRUE字符串列表。

### API String - List Boolean Strings.vi
列出当前所有可用的布尔值字符串。

> - Ref: TRUE值的默认字符串
> - Ref: FALSE值的默认字符串

-- <b>输出控件(Indicators)</b> --
- <b>False Boolean Strings</b>: 当前的FALSE字符串列表。
- <b>True Boolean Strings</b>: 当前的TRUE字符串列表。

### API String - Set Float Format String.vi
设置浮点数的格式字符串，可参考LabVIEW format string格式。

> - Ref: 浮点数默认格式

-- <b>输入控件(Controls)</b> --
- <b>Float Format String Setting</b>: 浮点数格式字符串设置。

-- <b>输出控件(Indicators)</b> --
- <b>Float Format String</b>: 当前的浮点数格式字符串。

### API String - Float Format String.vi
获取当前的浮点数格式字符串。

> - Ref: 浮点数默认格式

-- <b>输出控件(Indicators)</b> --
- <b>Float Format String</b>: 当前的浮点数格式字符串。

### API String - Set Float Precision.vi
设置浮点数的精度。

> [!NOTE]
> - 默认精度为6位有效数字，格式为`%.6p`。
> - 此VI是API String - Set Float Format String VI的简化版本，仅用于设置有效数字位数。

> - Ref: 浮点数默认格式

-- <b>输入控件(Controls)</b> --
- <b>Precision</b>: 浮点数精度设置。

-- <b>输出控件(Indicators)</b> --
- <b>Float Format String</b>: 更新后的浮点数格式字符串。

## 字符串转换

### String to Boolean_csm.vi
将字符串转换为布尔值。支持多种TRUE/FALSE表示方式，可通过API String - Add Boolean Strings VI添加自定义的TRUE/FALSE字符串。

> - Ref: TRUE值的默认字符串
> - Ref: FALSE值的默认字符串

-- <b>输入控件(Controls)</b> --
- <b>String</b>: 输入字符串。
- <b>Default (F)</b>: 转换失败时的默认值。

-- <b>输出控件(Indicators)</b> --
- <b>Boolean</b>: 转换后的布尔值。

### String To Float_csm.vi
将字符串转换为浮点数。支持多种浮点数格式和单位，可通过API String - Set Float Format String VI设置格式。

> [!NOTE]
> 空字符串将转换为默认数据。
> 带有单位的浮点数字符串也支持正确解析。
> `e`、`-e`、`pi`、`-pi`、`inf`、`+inf`、`-inf`和`NaN`等特殊浮点数值不支持单位。

> - Ref: 浮点数默认格式

-- <b>输入控件(Controls)</b> --
- <b>String</b>: 输入字符串。
- <b>Default (0)</b>: 转换失败时的默认值。

-- <b>输出控件(Indicators)</b> --
- <b>Float</b>: 转换后的浮点数。
- <b>Unit String</b>: 提取的单位字符串。

### String To Number(I64)_csm.vi
将字符串转换为64位整数。支持多种数字格式，包括普通整数、十进制、十六进制、二进制、八进制，以及带后缀的表示方法，转换失败时返回0。

-- <b>输入控件(Controls)</b> --
- <b>String</b>: 输入字符串。

-- <b>输出控件(Indicators)</b> --
- <b>Numeric</b>: 转换后的64位整数。

### String To Indexed Enum_csm.vi
将字符串转换为带索引的枚举类型。

> - Ref: 带索引的枚举类型(Indexed Enum)

    _<b>转换规则1: 无索引编号</b>_

    通过字符串匹配进行转换

    例如Enum = {AAA, BBBB, CCCC}
    - 字符串"AAA"将转换为Enum(AAA)，数字值为0
    - 字符串"CCC"将转换为Enum(CCC)，数字值为2

    _<b>转换规则2: 有索引编号</b>_

    既可以通过字符串匹配转换，也可以通过索引编号匹配转换

    例如Enum = {1- AAA, 5 - BBBB, 9 - CCCC}
    - 字符串"AAA"将转换为Enum(1- AAA)，数字值为0
    - 字符串"5"将转换为Enum(5 - BBBB)，数字值为1
    - 字符串"9 - CCCC"将转换为Enum(9 - CCCC)，数字值为2

-- <b>输入控件(Controls)</b> --
- <b>String</b>: 输入字符串。
- <b>Enum Prototype</b>: 枚举原型。

-- <b>输出控件(Indicators)</b> --
- <b>Enum</b>: 转换后的枚举值。

### Indexed Enum to Numeric_csm.vim
将枚举转换为数值，支持带索引的枚举类型，当枚举数值携带索引编号时，将直接使用索引编号作为数值。

> - Ref: 带索引的枚举类型(Indexed Enum)

-- <b>输入控件(Controls)</b> --
- <b>Enum</b>: 输入枚举值。

-- <b>输出控件(Indicators)</b> --
- <b>Numeric</b>: 枚举的数字值。
- <b>String</b>: 枚举的字符串表示。

### Numeric to Indexed Enum_csm.vim
将数字值转换为带索引的枚举。

规则1: 当匹配到索引编号时，将直接使用该索引。

规则2: 当没有匹配到索引编号时，将使用数字值作为枚举索引。

> - Ref: 带索引的枚举类型(Indexed Enum)

-- <b>输入控件(Controls)</b> --
- <b>Numeric</b>: 输入数字值。
- <b>Enum Prototype</b>: 枚举原型。

-- <b>输出控件(Indicators)</b> --
- <b>Enum</b>: 转换后的枚举值。

### CSM - Timestamp to API String Arguments.vi
将LabVIEW时间戳转换为API String字符串。

-- <b>输入控件(Controls)</b> --
- <b>Timestamp (now)</b>: 输入时间戳，默认为当前时间。
- <b>Format(Empty to use UTC)</b>: 时间格式字符串，为空时使用UTC格式。

-- <b>输出控件(Indicators)</b> --
- <b>API String</b>: 转换后的API String格式。

## 工具函数

### CSM - Convert HexStr to Data.vim
提供CSM - Convert HexStr to Data VI自适应数据类型的版本。

-- <b>输入控件(Controls)</b> --
- <b>HEX String</b>: HEX格式字符串。
- <b>Type</b>: 数据类型。

-- <b>输出控件(Indicators)</b> --
- <b>data</b>: 转换后的数据。

### CSM - Broadcast Data As API String.vim
使用CSM - Generate User Global Log VI将数据以API String格式广播。

-- <b>输入控件(Controls)</b> --
- <b>Data</b>: 要广播的数据。
- <b>CSM</b>: CSM模块引用。
- <b>API/Condition</b>: API或条件字符串。

-- <b>输出控件(Indicators)</b> --
- <b>Data (dup)</b>: 数据副本。

### CSM - Query Internal Data Names By API String.vi
查询CSM模块的内部数据名称。实现逻辑: 使用同步消息发送`Data: Get Internal Data`命令，参数为`<list>`，获取CSM模块的内部数据名称列表。

-- <b>输入控件(Controls)</b> --
- <b>Target Module</b>: CSM 目标模块。
- <b>Current Module ("" to Generate an ID)</b>: 当前模块(空字符串表示生成ID)。
- <b>Wait (5000ms)</b>: 等待时间(毫秒)。

-- <b>输出控件(Indicators)</b> --
- <b>Configurations</b>: 配置列表。
