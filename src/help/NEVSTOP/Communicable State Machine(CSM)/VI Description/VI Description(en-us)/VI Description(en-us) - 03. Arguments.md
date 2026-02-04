# Arguments

> [!NOTE]
> <b>CSM Message Keywords</b>
>
> The following are CSM message keywords: `->`, `->|`, `-@`, `-&`, `<-`, `\r`, `\n`, `//`, `>>`, `>>>`, `>>>>`, `;`, `,`.

> [!NOTE]
> <b>CSM Argument Type</b>
>
> In CSM, all arguments and return values are presented in string format, but they can carry any data type underneath. Therefore, the sender must encode first, and the receiver must decode afterwards. For example, CSM has a built-in HEXSTR encoding scheme, and custom codecs can also be extended as needed. To facilitate the identification of the encoding method, it is recommended to write the encoded argument in the format `<Argument Type> STRING FORMAT ARGUMENT`. Use the CSM - Argument Type VI to extract the type tag and select the corresponding decoding function accordingly.

> [!NOTE]
> <b>CSM HEXSTR Format Argument</b>
>
> To pass arbitrary data types in CSM arguments, CSM has a built-in HEXSTR format argument encoding/decoding scheme. The argument type string is HEXSTR. The conversion process is as follows:
>
> 1. Convert LabVIEW data to a variant.
> 2. Serialize the memory image of the variant into a hexadecimal string;
> 3. Obtain the argument in the form `<HEXSTR> hexadecimal string`, which can be safely embedded in the state string without disrupting CSM message parsing.

> [!NOTE]
> <b>CSM ERRSTR Format Argument</b>
>
> The LabVIEW Error Cluster is a complex data type. The error information string usually contains carriage returns, which cannot be directly passed as a CSM argument. Although error cluster information can be converted to HEXSTR format, this method lacks readability, making it impossible to read information intuitively in logs. Therefore, to pass LabVIEW error information in CSM arguments, CSM has a built-in ERRSTR format argument encoding/decoding scheme. The argument type string is ERRSTR. The conversion process is as follows:
> 1. Format the code and source in the error cluster into a string with the following format:
>    - Error: `<ERRSTR>[Error: error-code] error-description-As-safe-argument-string`
>    - Warning: `<ERRSTR>[Warning: error-code] warning-description-As-safe-argument-string`
> 2. Replace special characters in this string with safe characters.
> 3. Obtain the CSM ERRSTR format argument, which can be safely embedded in the state string without disrupting CSM message parsing.

> [!NOTE]
> <b>CSM Safe String Argument</b>
>
> To pass arbitrary strings in CSM arguments without disrupting message parsing, CSM has a built-in Safe-String encoding/decoding scheme. The argument type string is SAFESTR. The conversion process is as follows:
> 1. Scan the input string. If any CSM keywords, such as `->`, `;`, `\r` appear, replace them with `%Hex` escape sequences.
> 2. Obtain the argument in the form `<SAFESTR> escaped string`, which can be safely embedded in the state string without disrupting CSM message parsing.

## CSM - Argument Type.vi
Extracts the parameter encoding type tag from the encoded argument string.
> - Ref: CSM Argument Type

-- <b>Controls</b> --
- <b>Arguments</b>: Argument string.

-- <b>Indicators</b> --
- <b>Arguments (Dup)</b>: A copy of the input argument string.
- <b>Argument Type</b>: Encoding type tag of the argument string.

## CSM - Keywords.vi
Lists keywords in CSM messages and their %Hex format.
> - Ref: CSM Message Keywords

-- <b>Indicators</b> --
- <b>keywords</b>: List of CSM keywords.
- <b>Keywords (%Hex Format)</b>: The %Hex format of the CSM keyword list.

## CSM - Make String Arguments Safe.vi
Converts CSM keywords in the argument string to %Hex format to ensure that CSM message string parsing is not affected.

> - Ref: CSM Message Keywords
> - Ref: CSM Safe String Argument

<b>Reference Example</b>: `[CSM-Example]\0. Base Concepts\4.3 Arguments - Safe Arguments if it contains key words of CSM.vi`.

-- <b>Controls</b> --
- <b>Argument String</b>: String argument.
- <b>Ignore Argument Type(F)</b>: Do not append argument type `SAFESTR`.

-- <b>Indicators</b> --
- <b>Safe Argument String</b>: Safe string argument.

## CSM - Revert Arguments-Safe String.vi
Converts the %Hex format CSM keywords in the safe string argument back to the original format.

- When <b>Force Convert (F)</b> is FALSE, conversion is performed only if the argument type tag is `SAFESTR`.
- When <b>Force Convert (F)</b> is TRUE, conversion is performed regardless of the argument type tag.

> - Ref: CSM Message Keywords
> - Ref: CSM Safe String Argument

<b>Reference Example</b>: `[CSM-Example]\0. Base Concepts\4.3 Arguments - Safe Arguments if it contains key words of CSM.vi`.

-- <b>Controls</b> --
- <b>Safe Argument String</b>: Safe string argument.
- <b>Force Convert (F)</b>: Force conversion, even if the argument type tag is not `SAFESTR`.

-- <b>Indicators</b> --
- <b>Origin Argument String</b>: String argument.

## CSM - Convert Data to HexStr.vi
Converts any LabVIEW data type to a HEXSTR format argument string.

> - Ref: CSM Argument Type
> - Ref: CSM HEXSTR Format Argument

<b>Reference Example</b>: `[CSM-Example]\0. Base Concepts\4.1 Arguments - Complex Data As Arguments.vi`.

-- <b>Controls</b> --
- <b>Variant</b>: LabVIEW data. Supports any data type via Variant.

-- <b>Indicators</b> --
- <b>HEX String (0-9,A-F)</b>: CSM HEXSTR format argument.

## CSM - Convert HexStr to Data.vi
Converts the hexadecimal string argument back to Variant data.

> - Ref: CSM Argument Type
> - Ref: CSM HEXSTR Format Argument

<b>Reference Example</b>: `[CSM-Example]\0. Base Concepts\4.1 Arguments - Complex Data As Arguments.vi`.

-- <b>Controls</b> --
- <b>HEX String</b>: CSM HEXSTR format argument.

-- <b>Indicators</b> --
- <b>Variant</b>: LabVIEW data. Supports any data type via Variant.

## CSM - Convert Error to Argument.vi
Converts a LabVIEW Error Cluster to the CSM error argument format.

> - Ref: CSM Argument Type
> - Ref: CSM ERRSTR Format Argument

<b>Reference Example</b>: `[CSM-Example]\0. Base Concepts\4.2 Arguments - Error As Arguments.vi`.

-- <b>Controls</b> --
- <b>Error</b>: LabVIEW Error Cluster.

-- <b>Indicators</b> --
- <b>Argument</b>: CSM error argument format.

## CSM - Convert Argument to Error.vi
Converts the CSM error argument format to a LabVIEW Error Cluster.

> - Ref: CSM Argument Type
> - Ref: CSM ERRSTR Format Argument

<b>Reference Example</b>: `[CSM-Example]\0. Base Concepts\4.2 Arguments - Error As Arguments.vi`.

-- <b>Controls</b> --
- <b>Argument</b>: CSM error argument format.

-- <b>Indicators</b> --
- <b>Error</b>: LabVIEW Error Cluster.
