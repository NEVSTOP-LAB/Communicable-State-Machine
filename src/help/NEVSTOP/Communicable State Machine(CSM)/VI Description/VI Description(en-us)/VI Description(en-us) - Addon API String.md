# CSM API String Addon

> [!NOTE]
> <b>API String Parameter Support</b>
>
> API String parameter support is used to enhance the API parameter functionality of the Communicable State Machine (CSM). API String supports passing various data types in plain text format and is specifically optimized for manual input experiences. API String does not define an argument type. The result obtained via the CSM - Argument Type VI is empty, and it is typically handled in the default case. The following are supported data types:
> - String
> - Path
> - Boolean
> - Tag
> - Refnum (including IVI/VISA/UserDefinedRefnumTag)
> - Integer (I8, I16, I32, I64, U8, U16, U32, U64)
> - Floating-point (DBL/SGL)
> - Complex (DBL/SGL)
> - Timestamp
> - Enum
> - Array
> - Cluster
> - Other types (represented using CSM-Hexstr)
>
> For more details, visit: https://github.com/NEVSTOP-LAB/CSM-API-String-Arguments-Support.
>
> You can also refer to the examples. All data types have detailed descriptions and examples.

> [!NOTE]
> <b>Default Strings for TRUE Value</b>
>
> Supports `1`, `Active`, `Enable`, `Non-null`, `On`, `T`, `True`, `valid`, `yes`.
>
> Case insensitive.

> [!NOTE]
> <b>Default Strings for FALSE Value</b>
>
> Supports `0`, `Disable`, `F`, `False`, `Inactive`, `Invalid`, `No`, `Off`, `Void`, `null`.
>
> Case insensitive.

> [!NOTE]
> <b>Default Floating-point Format</b>
>
> The default floating-point format is `%.6p`.

> [!NOTE]
> <b>Indexed Enum</b>
>
> Format: `[Index Number][Separator][Enum String]`.
>
> The index number supports multiple numeric representations.
>
> Example of Index Number using `==` separator:
> `1 == boolean | 2 == string | 4 == dbl | 8 == number`
>
> Example of Index Number using `--` separator:
> `0x01 -- boolean | 0x02 -- string | 0x04 -- dbl | 0x08 -- number`
>
> Example of Index Number using `__` separator:
> `0b0001 __ boolean | 0b0100 __ dbl | 0b1000 __ number`

## API String Core Functions

### API String - Is Supported Datatype.vi
Determines whether the data type is a conversion data type supported by API String.

> - Ref: API String Parameter Support
> - Ref: CSM HEXSTR Format Argument

-- <b>Controls</b> --
- <b>Data</b>: Input data.

-- <b>Indicators</b> --
- <b>Data(Dup)</b>: A copy of the input data.
- <b>Supported Datatype?</b>: Boolean indicating whether API String supports the input data.

### Convert Data To API String Arguments.vim
Converts data to API String format.

> - Ref: API String Parameter Support

-- <b>Controls</b> --
- <b>Data</b>: Input data.
- <b>Reference Cluster Data</b>: Reference cluster data. When converting cluster data, the elements in the input data and reference data are compared. If they match completely, the elements are ignored in the conversion result.
- <b>No Tag Mode? (F)</b>: For cluster data, when TRUE, tag information is not included when converting to API String.

-- <b>Indicators</b> --
- <b>API String</b>: Converted API String format.

### Convert API String Arguments to Data.vim
Converts an API String to the corresponding data type.

> - Ref: API String Parameter Support

-- <b>Controls</b> --
- <b>API String</b>: Input string in API String format.
- <b>Strict Label Check? (T)</b>: Strict label check. When TRUE, if the reference data does not contain the label, the conversion fails and reports an error.
- <b>Reference Type</b>: Reference data.

-- <b>Indicators</b> --
- <b>Data</b>: Converted data.

### Query Data as API String Arguments.vim
Queries a specified data item within cluster data and converts it to API String format.

<b>Application Scenario</b>: For example, in a new CSM module template included with the API String Addon, a `Data: Get Configuration` state is added. In this state, by sending the name of the desired data item, the corresponding data item value can be returned.

<b>Special Case</b>: If <b>Name</b> is set to `<list>`, a list of all available settings is returned.

-- <b>Controls</b> --
- <b>Cluster Data</b>: Cluster data.
- <b>Name</b>: Data name.

-- <b>Indicators</b> --
- <b>Cluster Data(dup)</b>: A copy of the cluster data.
- <b>API String</b>: Query result in API String format.

## Configuration

### API String - Add Boolean Strings.vi
Adds custom boolean strings to the API String boolean parsing list and returns the updated list.

> - Ref: Default Strings for TRUE Value
> - Ref: Default Strings for FALSE Value

-- <b>Controls</b> --
- <b>Custom False Boolean Strings</b>: List of custom FALSE strings.
- <b>Custom True Boolean Strings</b>: List of custom TRUE strings.

-- <b>Indicators</b> --
- <b>False Boolean Strings</b>: Updated list of FALSE strings.
- <b>True Boolean Strings</b>: Updated list of TRUE strings.

### API String - Remove Boolean Strings.vi
Removes custom boolean strings from the API String boolean parsing list and returns the updated list.

> - Ref: Default Strings for TRUE Value
> - Ref: Default Strings for FALSE Value

-- <b>Controls</b> --
- <b>Custom False Boolean Strings</b>: List of FALSE strings to remove.
- <b>Custom True Boolean Strings</b>: List of TRUE strings to remove.

-- <b>Indicators</b> --
- <b>False Boolean Strings</b>: Updated list of FALSE strings.
- <b>True Boolean Strings</b>: Updated list of TRUE strings.

### API String - List Boolean Strings.vi
Lists all currently available boolean value strings.

> - Ref: Default Strings for TRUE Value
> - Ref: Default Strings for FALSE Value

-- <b>Indicators</b> --
- <b>False Boolean Strings</b>: Current list of FALSE strings.
- <b>True Boolean Strings</b>: Current list of TRUE strings.

### API String - Set Float Format String.vi
Sets the format string for floating-point numbers. Refer to LabVIEW format string syntax.

> - Ref: Default Floating-point Format

-- <b>Controls</b> --
- <b>Float Format String Setting</b>: Floating-point format string setting.

-- <b>Indicators</b> --
- <b>Float Format String</b>: Current floating-point format string.

### API String - Float Format String.vi
Gets the current floating-point format string.

> - Ref: Default Floating-point Format

-- <b>Indicators</b> --
- <b>Float Format String</b>: Current floating-point format string.

### API String - Set Float Precision.vi
Sets the precision for floating-point numbers.

> [!NOTE]
> - The default precision is 6 significant digits, with the format `%.6p`.
> - This VI is a simplified version of the API String - Set Float Format String VI, used only for setting the number of significant digits.

> - Ref: Default Floating-point Format

-- <b>Controls</b> --
- <b>Precision</b>: Floating-point precision setting.

-- <b>Indicators</b> --
- <b>Float Format String</b>: Updated floating-point format string.

## String Conversion

### String to Boolean_csm.vi
Converts a string to a boolean value. Supports multiple representations for TRUE/FALSE. Custom TRUE/FALSE strings can be added via the API String - Add Boolean Strings VI.

> - Ref: Default Strings for TRUE Value
> - Ref: Default Strings for FALSE Value

-- <b>Controls</b> --
- <b>String</b>: Input string.
- <b>Default (F)</b>: Default value if conversion fails.

-- <b>Indicators</b> --
- <b>Boolean</b>: Converted boolean value.

### String To Float_csm.vi
Converts a string to a floating-point number. Supports various floating-point formats and units. Format can be set using the API String - Set Float Format String VI.

> [!NOTE]
> Empty strings will be converted to the default data. Floating-point strings with units are also supported and parsed correctly. Special floating-point values like `e`, `-e`, `pi`, `-pi`, `inf`, `+inf`, `-inf`, and `NaN` do not support units.

> - Ref: Default Floating-point Format

-- <b>Controls</b> --
- <b>String</b>: Input string.
- <b>Default (0)</b>: Default value if conversion fails.

-- <b>Indicators</b> --
- <b>Float</b>: Converted floating-point number.
- <b>Unit String</b>: Extracted unit string.

### String To Number(I64)_csm.vi
Converts a string to a 64-bit integer. Supports multiple numeric formats, including standard integer, decimal, hexadecimal, binary, octal, and suffix notations. Returns 0 if conversion fails.

-- <b>Controls</b> --
- <b>String</b>: Input string.

-- <b>Indicators</b> --
- <b>Numeric</b>: Converted 64-bit integer.

### String To Indexed Enum_csm.vi
Converts a string to an indexed enum type.

> - Ref: Indexed Enum

      _<b>Conversion Rule 1: No Index Number</b>_

      Convert by string matching.

      Example Enum = {AAA, BBBB, CCCC}

      - String "AAA" converts to Enum(AAA), numeric value 0.
      - String "CCC" converts to Enum(CCC), numeric value 2.

      _<b>Conversion Rule 2: With Index Number</b>_

      Convert by either string matching or index number matching.

      Example Enum = {1- AAA, 5 - BBBB, 9 - CCCC}

      - String "AAA" converts to Enum(1- AAA), numeric value 0.
      - String "5" converts to Enum(5 - BBBB), numeric value 1.
      - String "9 - CCCC" converts to Enum(9 - CCCC), numeric value 2.

-- <b>Controls</b> --
- <b>String</b>: Input string.
- <b>Enum Prototype</b>: Enum prototype.

-- <b>Indicators</b> --
- <b>Enum</b>: Converted enum value.

### Indexed Enum to Numeric_csm.vim
Converts an enum to a numeric value. Supports indexed enum types. When the enum value carries an index number, the index number is used directly as the numeric value.

> - Ref: Indexed Enum

-- <b>Controls</b> --
- <b>Enum</b>: Input enum value.

-- <b>Indicators</b> --
- <b>Numeric</b>: Numeric value of the enum.
- <b>String</b>: String representation of the enum.

### Numeric to Indexed Enum_csm.vim
Converts a numeric value to an indexed enum.

Rule 1: If an index number is matched, use that index directly.

Rule 2: If no index number is matched, use the numeric value as the enum index.

> - Ref: Indexed Enum

-- <b>Controls</b> --
- <b>Numeric</b>: Input numeric value.
- <b>Enum Prototype</b>: Enum prototype.

-- <b>Indicators</b> --
- <b>Enum</b>: Converted enum value.

### CSM - Timestamp to API String Arguments.vi
Converts a LabVIEW timestamp to an API String.

-- <b>Controls</b> --
- <b>Timestamp (now)</b>: Input timestamp. The default is the current time.
- <b>Format(Empty to use UTC)</b>: Time format string. Uses UTC format if empty.

-- <b>Indicators</b> --
- <b>API String</b>: Converted API String format.

## Utility Functions

### CSM - Convert HexStr to Data.vim
Provides a version of the CSM - Convert HexStr to Data VI that adapts to data types.

-- <b>Controls</b> --
- <b>HEX String</b>: String in HEX format.
- <b>Type</b>: Data type.

-- <b>Indicators</b> --
- <b>data</b>: Converted data.

### CSM - Broadcast Data As API String.vim
Broadcasts data in API String format using the CSM - Generate User Global Log VI.

-- <b>Controls</b> --
- <b>Data</b>: Data to be broadcast.
- <b>CSM</b>: CSM module reference.
- <b>API/Condition</b>: API or condition string.

-- <b>Indicators</b> --
- <b>Data (dup)</b>: A copy of the input data.

### CSM - Query Internal Data Names By API String.vi
Queries the internal data names of a CSM module. This VI sends a synchronous `Data: Get Internal Data` command with the argument `<list>` to retrieve the list of internal data names of the CSM module.

-- <b>Controls</b> --
- <b>Target Module</b>: Target CSM module.
- <b>Current Module ("" to Generate an ID)</b>: Current module. Empty string generates an ID.
- <b>Wait (5000ms)</b>: Wait time in milliseconds. The default is 5000 ms.

-- <b>Indicators</b> --
- <b>Configurations</b>: Configuration list.
