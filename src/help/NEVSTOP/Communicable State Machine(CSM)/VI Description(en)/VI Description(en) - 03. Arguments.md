# CSM API

## Arguments

> [!NOTE] CSM Message Keywords
> Includes: '->','->|','-@','-&','<-", "\r", "\n", "//", ">>", ">>>", ">>>>", ";", ","

> [!NOTE] CSM HEXSTR Format Parameters
> To pass any data type in CSM parameters, CSM provides a default parameter format called HEXSTR for passing any data type.
> HEXSTR: Converts any LabVIEW data type to a variant, then represents this variant's memory format as a hexadecimal string for passing in CSM parameters.
> HEXSTR can be safely used as a state parameter without disrupting the parsing of CSM message strings.

> [!NOTE] CSM ERROR Parameters
> LabVIEW error cluster information typically contains carriage returns and may include CSM message keywords, so it usually cannot be directly passed as a CSM parameter.
> Although the error cluster information can be converted to HEXSTR format, it is not readable and cannot be intuitively read in logs.
> Therefore, to pass LabVIEW error information in CSM parameters, a standard CSM error parameter format is provided. It can be safely used as a state parameter without disrupting the parsing of CSM message strings.
> Its format is: "[Error: error-code] error-description-As-safe-argument-string"

### CSM - Keywords.vi

List of keywords in CSM messages.

> Ref: CSM Message Keywords

-- <b>Indicators</b> --
- <b>keywords</b>: List of CSM keywords
- <b>keywords(%Hex format)</b>: List of CSM keywords in %Hex format

### CSM - Make String Arguments Safe.vi

Converts CSM keywords in the argument string to %Hex format to ensure they do not affect the parsing of CSM message strings.

> Ref: CSM Message Keywords

-- <b>Controls</b> --
- <b>Argument String</b>: String argument

-- <b>Indicators</b> --
- <b>Safe Argument String</b>: Safe string argument

### CSM - Revert Arguments-Safe String.vi

Converts CSM keywords in %Hex format back to their normal format in the safe string argument.

> Ref: CSM Message Keywords

-- <b>Controls</b> --
- <b>Safe Argument String</b>: Safe string argument

-- <b>Indicators</b> --
- <b>Origin Argument String</b>: Original string argument

### CSM - Convert Data to HexStr.vi

Converts any LabVIEW data type to a HEXSTR format parameter string.

> Ref: CSM HEXSTR Format Parameters

-- <b>Controls</b> --
- <b>Variant</b>: LabVIEW data, supports any data type through variants

-- <b>Indicators</b> --
- <b>HEXSTR</b>: CSM HEXSTR format parameter

### CSM - Convert HexStr to Data.vi

Converts a hexadecimal string parameter back to variant data.

> Ref: CSM HEXSTR Format Parameters

-- <b>Controls</b> --
- <b>HEXSTR</b>: CSM HEXSTR format parameter

-- <b>Indicators</b> --
- <b>Variant</b>: LabVIEW data, supports any data type through variants

### CSM - Convert Error to Argument.vi

Converts a LabVIEW error cluster to a CSM error parameter format.

> Ref: CSM ERROR Parameters

-- <b>Controls</b> --
- <b>error</b>: LabVIEW error cluster

-- <b>Indicators</b> --
- <b>Argument</b>: CSM error parameter format

### CSM - Convert Argument to Error.vi

Converts a CSM error parameter format back to a LabVIEW error cluster.

> Ref: CSM ERROR Parameters

-- <b>Controls</b> --
- <b>Argument</b>: CSM error parameter format

-- <b>Indicators</b> --
- <b>error</b>: LabVIEW error cluster
