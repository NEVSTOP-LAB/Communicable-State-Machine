# CSM INI-Variable Addon

> [!NOTE]
> <b>CSM INI-Variable Addon</b>
>
> Configuration files are an essential component of application development. The CSM INI-Variable Addon provides simple and easy-to-use configuration file support for CSM, allowing users to configure applications without explicitly reading or writing configuration files.
>
> CSM INI-Variable configuration file data uses the CSM API String format.
>
> The following are key features:
> 1. <b>Default Configuration Handling</b>: Automatically loads the default configuration file upon the first library function call, eliminating the need for explicit user loading.
> 2. <b>Multi-File Support</b>: Supports loading multiple configuration files via specialized functions.
> 3. <b>Memory Caching</b>: Maintains a cached copy in memory. Applications retrieve configuration information from this cache.
> 4. <b>INI Format Compatibility</b>: Both configuration files and the memory copy use the standard INI format, supporting sections and key-value pairs.
> 5. <b>Efficient Caching Mechanism</b>: Optimizes performance using a global modification flag, re-reading the memory copy only when the configuration has been modified.
>
> This library includes and utilizes a copy of [LabVIEW-Config](https://github.com/rcpacini/LabVIEW-Config) developed by [@rcpacini](https://github.com/rcpacini).

> [!NOTE]
> <b>CSM INI-Variable Format</b>
>
> Format Definition: `${section.variable:defaultValue}`
> - `${}`: Variable reference syntax.
> - `section` (Optional): The section name in the configuration file.
> - `variable`: The variable name in the configuration file.
> - `defaultValue` (Optional): The default value used when the variable does not exist.
>
> <b>Notes</b>:
> - Supports nested variable references. For example, `${section1.variable1:${section2.variable2:defaultValue2}}`.
> - The `section` parameter is optional. If omitted, the default configuration section `SectionName=LabVIEW` is used.
> - The default value is optional. If unspecified, it defaults to an empty string ("").

> [!NOTE]
> <b>CSM INI-Variable Configuration File Path</b>
>
> - <b>Development State</b>: The first INI configuration file found in the Application Directory. If no configuration file exists, it defaults to `csm-app.ini`.
> - <b>Post-Compilation</b>: An INI configuration file in the same directory as the executable file, with the same name as the executable. LabVIEW automatically generates this file after compilation.
> - Supports loading multiple configuration files. Configuration items in files loaded later will overwrite identical items in previously loaded files.
> - Configuration files can use the `[__include]` section to reference other configuration files.
>   - Supports both relative and absolute paths.
>   - Relative paths are relative to the path of the current configuration file.
>   - The name of the configuration file in the `[__include]` section is not critical, as long as the path is correct.
>   - To avoid circular references, the same configuration file will be automatically ignored if loaded a second time.

> [!NOTE]
> <b>CSM INI-Variable Multi-File Configuration Scenario</b>
>
> - When loading multiple files, configuration items in files loaded later will overwrite identical items in previously loaded files.
> - When saving cache changes to a file, modifications are saved to the configuration file loaded last.

> [!WARNING] <b>CSM INI-Variable Caching Mechanism Warning</b>
>
> Note that since this library uses a global cache modification flag, frequent configuration changes will reduce the effectiveness of the caching mechanism in reading VIs. Therefore, this library is not recommended for scenarios requiring frequent configuration modifications.

## Core Function VIs

### CSM - Populate Configuration Variables.vi
Populates configuration variables within a string.

<b>Application Scenario</b>: Using INI-Variable variables directly in CSM scripts or serving as arguments for CSM messages.

<b>Reference Example</b>: `1. Used as parameters parsed by CSM.vi`.

> - Ref: CSM INI-Variable Addon
> - Ref: CSM INI-Variable Format
> - Ref: CSM INI-Variable Configuration File Path

-- <b>Controls</b> --
- <b>Section Name ("" as Default)</b>: Section name. An empty string indicates the default section.
- <b>String with INI-Variable</b>: Input string containing variable references.

-- <b>Indicators</b> --
- <b>String</b>: Output string with populated variables.

### CSM - Read Configuration Variable.vim
Reads a variable value from the configuration based on a prototype.
- It is recommended to use a cluster as the configuration prototype, where element names in the cluster correspond to variable names in the INI configuration file.
- If using other data types, the corresponding variable name is `Config`.
- If the variable corresponding to the prototype does not exist in the configuration, the <b>Write If not found?</b> parameter determines whether to write the default value.

<b>Application Scenario</b>: Reading configuration directly from an INI configuration file into LabVIEW data.

<b>Reference Example</b>: `2. Load the corresponding configuration by providing the prototype.vi`.

> - Ref: CSM INI-Variable Configuration File Path

-- <b>Controls</b> --
- <b>Configuration Prototype (Cluster Preferred)</b>: Configuration prototype (Cluster is preferred).
- <b>Section Name ("" as Default)</b>: Section name. An empty string indicates the default section.
- <b>Write If not found? (F)</b>: Whether to write the default value if the variable is not found. The default is FALSE.

-- <b>Indicators</b> --
- <b>Configuration</b>: Output configuration value.

### CSM - Read Cluster Elements From Session.vim
Reads cluster data from the configuration. The data is stored in the specified section, and element names in the cluster correspond to keys in the section.
- If the specified section does not exist, the default section is used.
- If a key corresponding to a cluster element does not exist, the value from the input prototype is used as the default value.

<b>Application Scenario</b>: Reading configuration directly from an INI configuration file into LabVIEW data.

<b>Reference Example</b>: `2. Load the corresponding configuration by providing the prototype.vi`.

> - Ref: CSM INI-Variable Configuration File Path

-- <b>Controls</b> --
- <b>Cluster</b>: Cluster prototype.
- <b>Section Name ("" as Default)</b>: Section name. An empty string indicates the default section.

-- <b>Indicators</b> --
- <b>Cluster out</b>: Output cluster.

### CSM - Read Cluster Elements From Key.vim
Reads cluster data from the configuration. The data is stored in a specified key within a specified section, and the data is saved in API String format.

<b>Application Scenario</b>: Reading configuration directly from an INI configuration file into LabVIEW data.

<b>Reference Example</b>: `2. Load the corresponding configuration by providing the prototype.vi`.

> - Ref: CSM INI-Variable Configuration File Path

-- <b>Controls</b> --
- <b>Cluster</b>: Cluster prototype.
- <b>Key</b>: Key name.
- <b>Section Name ("" as Default)</b>: Section name. An empty string indicates the default section.

-- <b>Indicators</b> --
- <b>Cluster out</b>: Output cluster.
- <b>Key Found?</b>: Whether the key exists.

### CSM - Write Configuration Variable.vim
Writes a configuration variable.
- It is recommended to use a cluster as the configuration prototype, where element names in the cluster correspond to variable names in the INI configuration file.
- If using other data types, the corresponding variable name is `Config`.

<b>Reference Example</b>: `7. Write and Read Configuration.vi`.

> - Ref: CSM INI-Variable Configuration File Path
> - Ref: CSM INI-Variable Caching Mechanism Warning

-- <b>Controls</b> --
- <b>Configuration</b>: Configuration data to be written.
- <b>Section Name ("" as Default)</b>: Section name. An empty string indicates the default section.

-- <b>Indicators</b> --
- <b>Configuration (dup)</b>: A copy of the written configuration data.

### Convert API String to Cluster(Default in Session).vim
Converts an API String to a cluster. The data is stored in the specified section, and element names in the cluster correspond to keys in the section. This VI follows a defined priority hierarchy: CSM API Parameters > Configuration File Parameters > Default Constant Parameters. This makes it simple to fix serial port initialization parameters in a configuration file.

- During initialization, explicitly sent parameters have the highest priority.
- If no parameters are sent, parameters from the configuration file are used.
- In the absence of configuration file parameters, default constant parameters are applied.

<b>Application Scenario</b>: Used to save CSM parameters into a configuration file.

<b>Reference Example</b>: `3. In CSM API parameters.vi`.

-- <b>Controls</b> --
- <b>API String</b>: Input API String.
- <b>Section Name ("" as Default)</b>: Section name. An empty string indicates the default section.
- <b>Type</b>: Data type.

-- <b>Indicators</b> --
- <b>Data</b>: Converted data.
- <b>error</b>: Error information.

### Convert API String to Cluster(Default in Key).vim
Converts an API String to a cluster. The data is stored in a specified key within a specified section. This VI follows a defined priority hierarchy: CSM API Parameters > Configuration File Parameters > Default Constant Parameters. This makes it simple to fix serial port initialization parameters in a configuration file.

- During initialization, explicitly sent parameters have the highest priority.
- If no parameters are sent, parameters from the configuration file are used.
- In the absence of configuration file parameters, default constant parameters are applied.

<b>Application Scenario</b>: Used to save CSM parameters into a configuration file.

<b>Reference Example</b>: `3. In CSM API parameters.vi`.

-- <b>Controls</b> --
- <b>API String</b>: Input API String.
- <b>Section Name ("" as Default)</b>: Section name. An empty string indicates the default section.
- <b>Type</b>: Data type.
- <b>Variable Name</b>: Variable name.

-- <b>Indicators</b> --
- <b>Data</b>: Converted data.
- <b>error</b>: Error information.

## Raw Configuration Read and Write

### CSM - Read All Variable Names.vi
Reads all variable names currently in memory.

-- <b>Controls</b> --
- <b>Permanent Variables Only? (F)</b>: Whether to read only permanent variables.

-- <b>Indicators</b> --
- <b>All Variable Names</b>: Array of variable names.

### CSM - Read Sections.vi
Reads all section names currently in memory.

-- <b>Indicators</b> --
- <b>Sections</b>: Array of section names.

### CSM - Read Key Names.vi
Reads all key names in a specified section.

-- <b>Controls</b> --
- <b>Section Name ("" as Default)</b>: Section name. An empty string indicates the default section.

-- <b>Indicators</b> --
- <b>Keys</b>: Array of key names.

### CSM - Read INI String.vi
Reads the configuration information string. This VI retrieves the raw string description without replacing INI variable references.

<b>Application Scenario</b>: Need to read raw configuration information instead of configuration information after replacing internal variable references.

<b>Reference Example</b>: `6. Read Nested Variables.vi`.

-- <b>Controls</b> --
- <b>Section Name ("" as Default)</b>: Section name. An empty string indicates the default section.
- <b>Key</b>: Input string containing variable references.
- <b>Default Value</b>: Default value.
- <b>Write If not found? (F)</b>: Whether to write the default value if not found.

-- <b>Indicators</b> --
- <b>Value</b>: Output string after replacing variables.
- <b>Key Found?</b>: Whether the key exists.

### CSM - Write INI String.vi
Writes configuration information string.

<b>Reference Example</b>: `6. Read Nested Variables.vi`.

> - Ref: CSM INI-Variable Caching Mechanism Warning

-- <b>Controls</b> --
- <b>Section Name ("" as Default)</b>: Section name. An empty string indicates the default section.
- <b>Key</b>: Key name.
- <b>Value</b>: Variable value string.

-- <b>Indicators</b> --
- <b>Key Replace?</b>: Whether the key was replaced.

## Multi-File Support and Configuration Management

### CSM - Configuration File Path.vi
Returns the paths of all loaded configuration files.

<b>Reference Example</b>: `5. import Config.ini with __include section.vi`.

> - Ref: CSM INI-Variable Configuration File Path

-- <b>Controls</b> --
- <b>Include All Paths?(F)</b>: Whether to include all configuration file paths.

-- <b>Indicators</b> --
- <b>Default Config File Path</b>: Default configuration file path.
- <b>All Config Files</b>: List of all configuration files.

### CSM - Load Configuration Variables From File.vi
Loads configuration variables from a specified file. If the section name postfix is not empty, the loaded section names will have this postfix appended.

<b>Section Postfix ("")</b> is primarily used when loading multiple configuration files that have identical sections. For example, two configuration files `Hardware1.ini` and `Hardware2.ini` both have a section named `Serial` with identical internal keys indicating serial port configuration. In this case, the configuration in the file loaded later would overwrite the configuration in the file loaded earlier. Using <b>Section Postfix ("")</b> prevents section name conflicts.

<b>Reference Example</b>: `5. import Config.ini with __include section.vi`.

> - Ref: CSM INI-Variable Configuration File Path

-- <b>Controls</b> --
- <b>Configuration Path</b>: Configuration file path.
- <b>Section Postfix ("")</b>: Section name postfix.

### CSM - Unload Configuration Variable File.vi
Unloads a configuration variable file.

> - Ref: CSM INI-Variable Configuration File Path

-- <b>Controls</b> --
- <b>Path</b>: Configuration file path.

### CSM - Mark All Temp Variables as Permanent.vi
Marks all temporary variables as permanent variables and stores the variables into the specified configuration file.

<b>Note</b>: Although marked as permanent variables, these variables will still not be synchronized to the file if CSM - Sync Configuration Variables to File VI is not used.

> - Ref: CSM INI-Variable Configuration File Path

-- <b>Controls</b> --
- <b>Path ("" to Use Default File)</b>: Configuration file path. An empty string indicates the default INI file.

### CSM - Sync Configuration Variables to File.vi
Synchronizes variables in memory to the specified configuration file.

<b>Note</b>: Only permanent variables are synchronized to the file. If you want to write temporary variables to the file, you need to mark the temporary variables as permanent in advance.

> - Ref: CSM INI-Variable Configuration File Path

-- <b>Controls</b> --
- <b>All Temp Variable to Default Ini(F)</b>: Whether to synchronize all temporary variables to the default INI file.
- <b>Write UnSupported Datatype?(F)</b>: Whether to write unsupported data types.

### CSM - Restore Variable Value.vi
Restores variable values. Refreshes all permanent variables to the configuration values loaded initially. Temporary variables are not be modified.

> - Ref: CSM INI-Variable Configuration File Path

### CSM - Reset to Default.vi
Resets the configuration to default values. All variables will be cleared, and all configurations will be reloaded from the currently loaded configuration files.

> - Ref: CSM INI-Variable Configuration File Path

## Utility VIs

### CSM - Read Log Filter Rules from INI Strings.vi
Reads log filter rules from the configuration. This configuration is primarily used with the following VIs:

- `CSM - Set Log Filter Rules.vi`
- `addons\Logger\CSM - Start File Logger.vi`

### CSM - Read File Logger Configuration from INI String.vi
Reads log recording configuration from the configuration. This configuration is primarily used with the following VI:

- `addons\Logger\CSM - Start File Logger.vi`
