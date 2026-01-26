# CSM API

## CSM-Helper API

### Is CSM Module.vi

使用最少的VI调用，判断是否是 CSM 模块，用于 LabVIEW 插件预先判断。

> [!NOTE] 
> <b>多态VI(Polymorphic VI)选项</b>
>
> - Is CSM Module - VIRef.vi
> - Is CSM Module - WhileLoop.vi
> - Is CSM Module - Structure.vi
> - Is CSM Module - CaseStructure.vi
> - Is CSM Module - EventStructure.vi
> - Is CSM Module - ParseStateVI.vi

#### Is CSM Module - VIRef.vi

通过 VIRef 判断是否是是 CSM 模块

-- <b>Controls(输入控件)</b> --
- <b>VIRef</b>: VI引用

-- <b>Indicators(输出控件)</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用
- <b>CSMType</b>:Indicators
#### Is CSM Module - WhileLoop.vi

通过 While Loop 引用判断是否是 CSM 模块

-- <b>Controls(输入控件)</b> --
- <b>WhileLoop</b>: While Loop 引用

-- <b>Indicators(输出控件)</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用
- <b>CSMType</b>:Indicators
- <b>WhileLoop in</b>:Controls
#### Is CSM Module - Structure.vi

通过 Structure 引用判断是否是 CSM 模块

-- <b>Controls(输入控件)</b> --
- <b>Structure</b>: Structure 引用

-- <b>Indicators(输出控件)</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

#### Is CSM Module - CaseStructure.vi

通过 CaseStructure 引用判断是否是 CSM 模块

-- <b>Controls(输入控件)</b> --
- <b>CaseStructure</b>: CaseStructure 引用

-- <b>Indicators(输出控件)</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

#### Is CSM Module - EventStructure.vi

通过 EventStructure 引用判断是否是 CSM 模块

-- <b>Controls(输入控件)</b> --
- <b>EventStructure</b>: EventStructure 引用

-- <b>Indicators(输出控件)</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

#### Is CSM Module - ParseStateVI.vi

通过 Parse State VI 引用判断是否是 CSM 模块

-- <b>Controls(输入控件)</b> --
- <b>Parse State VI Ref</b>: Parse State VI 引用

-- <b>Indicators(输出控件)</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

### CSM-Helper API.vi

### CSM-Helper usecase Template.vit

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### _Add VI Reference Case.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入
- <b>element</b>:
- <b>Add Frame</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>element</b>:Controls
### Connect Information.vi

-- <b>Controls(输入控件)</b> --
- <b>Case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Backend Connected Info</b>:
- <b>FrontEnd Connected Info</b>:
- <b>Backend Connected Info</b>:Indicators
- <b>Case</b>:Controls
- <b>FrontEnd Connected Info</b>:Indicators
### Diagram Node Information.vi

-- <b>Controls(输入控件)</b> --
- <b>InnerTerminal in</b>:
- <b>Array in</b>:
- <b>Front Tunnels</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Array</b>:
- <b>Array out</b>:
- <b>Array in</b>:Controls
- <b>Array out</b>:Indicators
- <b>Array</b>:Indicators
- <b>InnerTerminal in</b>:Controls
### Get Argument Info From back Term.vi

-- <b>Controls(输入控件)</b> --
- <b>Terminal in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Array</b>:
- <b>Array</b>:Indicators
### Get Argument Info From Front Term.vi

-- <b>Controls(输入控件)</b> --
- <b>Terminal in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Array</b>:
- <b>Array</b>:Indicators
### GObject Terminals.vi

-- <b>Controls(输入控件)</b> --
- <b>GObject in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>error in (no error) (dup)</b>:
- <b>Class Name</b>:
- <b>Terms[]</b>:
- <b>Node Object</b>:
- <b>tunnel Relative Pos</b>:

### Relative Pos to InterData Tunnel of CaseContent.vi

-- <b>Controls(输入控件)</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Position</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Position</b>:Indicators
- <b>element</b>:Controls
### Resize CaseStructure By Making Space.vi

-- <b>Controls(输入控件)</b> --
- <b>Bounds</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>DiffBound</b>:
- <b>MakeSpace.Rect</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Bounds</b>:Controls
- <b>MakeSpace.Rect</b>:Indicators
### Search With Pattern.vi

-- <b>Controls(输入控件)</b> --
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Numeric</b>:
- <b>Numeric</b>:Indicators
- <b>Regular Expression</b>:Controls
### sub1.vi

-- <b>Controls(输入控件)</b> --
- <b>Part References.Parse State Queue</b>:
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Tunnel out</b>:
- <b>Part References.Parse State Queue</b>:Controls
- <b>Tunnel out</b>:Indicators
- <b>regular expression</b>:Controls
### sub2.vi

-- <b>Controls(输入控件)</b> --
- <b>Part References.Parse State Queue</b>:
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Tunnel out</b>:
- <b>Part References.Parse State Queue</b>:Controls
- <b>Tunnel out</b>:Indicators
- <b>regular expression</b>:Controls
### Refresh References.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get ParentRef Until Type Matched.vi

-- <b>Controls(输入控件)</b> --
- <b>Class Name</b>:
- <b>reference in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Target Ref</b>:

### Is in JKISM or CSM.vi

-- <b>Controls(输入控件)</b> --
- <b>reference in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>is in JKISM or CSM?</b>:
- <b>Is In JKISM Or CSM?</b>:Indicators
### Relationship Check.vi

-- <b>Controls(输入控件)</b> --
- <b>TestRef</b>:
- <b>reference in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Is TestRef</b>:
- <b>Is Child of TestRef</b>:
- <b>Is Child of TestRef</b>:Indicators
- <b>Is TestRef</b>:Indicators
- <b>TestRef</b>:Controls
### Add State Frame.vi

-- <b>Controls(输入控件)</b> --
- <b>index(-1, use same group)</b>:
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Add Frame</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Add Frame</b>:Indicators
- <b>element</b>:Controls
- <b>index(-1, use same group)</b>:Controls
### Check NewStateNotify is Registered.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>NewStateNotify Registered</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>NewStateNotify Registed</b>:Indicators
### Connect Error Wire If not Connected.vi

-- <b>Controls(输入控件)</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>case</b>:Controls
### Connect EventReg Wire If not Connected.vi

-- <b>Controls(输入控件)</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>case</b>:Controls
### Connect Internal Data Wire If not Connected.vi

-- <b>Controls(输入控件)</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>case</b>:Controls
### Connect LastResp to Response in Error Case.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect Paired Tunnels.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect StateQ Wire If not Connected.vi

-- <b>Controls(输入控件)</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>case</b>:Controls
### Copy State.vi

-- <b>Controls(输入控件)</b> --
- <b>Already Exist Action:
Replace(T) / Skip(F)</b>:
- <b>SourceCSM</b>:
- <b>New(Empty to Use same Name)</b>:
- <b>Case</b>:
- <b>CSM-Helper.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out 2</b>:
- <b>Already Exist Action:
Replace(T) / Skip(F)</b>:Controls
- <b>CSM-Helper out 2</b>:Indicators
- <b>CSM-Helper.lvclass</b>:Controls
- <b>New(Empty to Use same Name)</b>:Controls
- <b>SourceCSM</b>:Controls
### Create From Basic Refs.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM Basic Refs</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper.lvclass</b>:
- <b>CSM-Helper.lvclass</b>:Indicators
### Create From CaseStructure Reference.vi

-- <b>Controls(输入控件)</b> --
- <b>CaseStructure</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper.lvclass</b>:
- <b>CSM-Helper.lvclass</b>:Indicators
### Create From EventStructure Reference.vi

-- <b>Controls(输入控件)</b> --
- <b>CaseStructure</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper.lvclass</b>:
- <b>CSM-Helper.lvclass</b>:Indicators
### Create From VI Reference.vi

-- <b>Controls(输入控件)</b> --
- <b>VI</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper.lvclass</b>:
- <b>CSM-Helper.lvclass</b>:Indicators
### Create From WhileLoop Reference.vi

-- <b>Controls(输入控件)</b> --
- <b>Structure</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper.lvclass</b>:
- <b>CSM-Helper.lvclass</b>:Indicators
### Destroy.vi

-- <b>Controls(输入控件)</b> --
- <b>Save Instruments?(F)</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Auto Save(T)</b>:Controls
- <b>Save Instruments?(F)</b>:Controls
### Doc.vi

-- <b>Controls(输入控件)</b> --
- <b>String 2</b>:
- <b>String</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>String 4</b>:
- <b>String 3</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>String 2</b>:Controls
- <b>String 3</b>:Indicators
- <b>String 4</b>:Indicators
- <b>String</b>:Controls
### Get All API Interface Info.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Array</b>:Indicators
### Get All Status Interface Info.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Array 3</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Array 3</b>:Indicators
### Get CaseFrame Index By CaseName.vi

-- <b>Controls(输入控件)</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>index</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>CASE</b>:Controls
- <b>CaseStruRef</b>:Indicators
- <b>index</b>:Indicators
### Get CaseFrame Reference By CaseName.vi

-- <b>Controls(输入控件)</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Frame Refs</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>CASE</b>:Controls
- <b>Frame Refs</b>:Indicators
### Get Event Structure Num.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>EvtStrutNum</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>EvtStruNum</b>:Indicators
### Get Interface Info.vi

-- <b>Controls(输入控件)</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Response</b>:
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Array</b>:Indicators
- <b>CASE</b>:Controls
- <b>Response</b>:Indicators
### Get Internal Data Info.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Array</b>:Indicators
### Open Block Diagram.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Open Front Panel.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Remove State Frame.vi

-- <b>Controls(输入控件)</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>element</b>:Controls
### Save Instrument.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Set Error Tunnel Use Default If not Connected.vi

-- <b>Controls(输入控件)</b> --
- <b>Use Default if not wired</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Use Default if Unwired</b>:Controls
### Set Visible Case Frame.vi

-- <b>Controls(输入控件)</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>element</b>:Controls
### Set Wire Label Visible.vi

-- <b>Controls(输入控件)</b> --
- <b>Connected Wire.Label.Visible</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Connected Wire.Label.Visible</b>:Controls
### Start Undo.vi

-- <b>Controls(输入控件)</b> --
- <b>Name</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Name</b>:Controls
### Stop Undo.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Undo.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read APIs.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Value</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Value</b>:Indicators
### Read Back Tunnel Internal TermRefs.vi

-- <b>Controls(输入控件)</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Back Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Back Tunnels</b>:Indicators
- <b>element</b>:Controls
### Read Back Tunnels Refs.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Back Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Back Tunnels</b>:Indicators
### Read Block Diagram Ref.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Diagram</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Diagram</b>:Indicators
### Read Case Structure Ref.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Case Structure</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Case Structure</b>:Indicators
### Read Event Structure Ref.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Event Structure</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Event Structure</b>:Indicators
### Read Front Tunnel Internal TermRefs.vi

-- <b>Controls(输入控件)</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Front Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Front Tunnels</b>:Indicators
- <b>case</b>:Controls
### Read Front Tunnels Refs.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Front Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Front Tunnels</b>:Indicators
### Read New State Notifier Event State Ref.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>New State Notifier Event State Ref</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>New State Notifier Event State Ref</b>:Indicators
### Read Paired Tunnels of Case Structure.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Paired Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Paired Tunnels</b>:Indicators
### Read Parse State Queue Ref.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Parse State Queue</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Parse State Queue</b>:Indicators
### Read States.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Value</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Value</b>:Indicators
### Read Timeout Event State Ref.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>New State Notifier Event State Ref</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>New State Notifier Event State Ref</b>:Indicators
### Read Type.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Part References.Type</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Part References.Type</b>:Indicators
### Read User-Defined States.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Array</b>:Indicators
### Read VI Ref.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>VI</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>VI</b>:Indicators
### Read While Loop Ref.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>While Loop</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>While Loop</b>:Indicators
### Add VI Reference Case.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Remove All CSM Bookmarks.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### standardize CSM Module.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>Indicators(输出控件)</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### CSM Essential States.vi

-- <b>Indicators(输出控件)</b> --
- <b>CSM Essential States</b>:
- <b>CSM Essential States</b>:Indicators
### CSM Module Type.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM Basic Refs</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM Basic Refs (dup)</b>:
- <b>CSM Basic Refs (dup)</b>:Indicators
- <b>CSMType</b>:Indicators
### CaseStructure - Add Frame.vi

-- <b>Controls(输入控件)</b> --
- <b>Case Name</b>:
- <b>Reference Frame Index</b>:
- <b>CaseStructure in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Add Frame</b>:
- <b>CaseStructure out</b>:

### CaseStructure - Case Name to Group Name.vi

-- <b>Controls(输入控件)</b> --
- <b>element</b>:

-- <b>Indicators(输出控件)</b> --
- <b>String</b>:

### CaseStructure - Check If State Exist.vi

-- <b>Controls(输入控件)</b> --
- <b>Group Name</b>:
- <b>CaseStructure in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Numeric</b>:
- <b>CaseStructure out</b>:

### CaseStructure - Get Group Separator Case Index.vi

-- <b>Controls(输入控件)</b> --
- <b>Group Name</b>:
- <b>CaseStructure in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Numeric</b>:
- <b>CaseStructure out</b>:

### Diagram - Connect Tunnel with Wire 2.vi

-- <b>Controls(输入控件)</b> --
- <b>Wire Index</b>:
- <b>Front Tunnels</b>:
- <b>Diagram in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Array out</b>:
- <b>Diagram out</b>:

### Diagram - Connect Tunnel with Wire.vi

-- <b>Controls(输入控件)</b> --
- <b>FrontEnd Connected Info</b>:
- <b>Front Tunnels</b>:
- <b>Diagram in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Array out</b>:
- <b>Diagram out</b>:

### Diagram - Get All Decoration Refs.vi

-- <b>Controls(输入控件)</b> --
- <b>TopLevelDiagram in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>TextRefs</b>:
- <b>TopLevelDiagram out</b>:

### Diagram - Get All Text Refs.vi

-- <b>Controls(输入控件)</b> --
- <b>TopLevelDiagram in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>TextRefs</b>:
- <b>TopLevelDiagram out</b>:

### PairedTunnels - Connect Wire.vi

-- <b>Controls(输入控件)</b> --
- <b>index(-1 for all)</b>:
- <b>PairedTunnels</b>:

-- <b>Indicators(输出控件)</b> --
- <b>PairedTunnels</b>:

### Find Event Structure from Case Structure.vi

-- <b>Controls(输入控件)</b> --
- <b>CaseStructure</b>:

-- <b>Indicators(输出控件)</b> --
- <b>EvntStruct Refnum</b>:

### Find Parse State Queue from Case Structure.vi

-- <b>Controls(输入控件)</b> --
- <b>CaseStructure</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:

### Find Parse State Queue from Event Structure.vi

-- <b>Controls(输入控件)</b> --
- <b>EvntStruct Refnum</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:

### Find Parse State Queue from While Loop.vi

-- <b>Controls(输入控件)</b> --
- <b>WhileLoop in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:
- <b>WhileLoop out</b>:

### Terminals - Filter Control Terms.vi

-- <b>Controls(输入控件)</b> --
- <b>Terms[]</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Error Terms.vi

-- <b>Controls(输入控件)</b> --
- <b>Terms[]</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Indicator Terms.vi

-- <b>Controls(输入控件)</b> --
- <b>Terms[]</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Input Term.vi

-- <b>Controls(输入控件)</b> --
- <b>InnerTerminal in</b>:
- <b>Wire.Terms[] in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Wire.Terms[] out</b>:

### Terminals - Filter invalid Terms.vi

-- <b>Controls(输入控件)</b> --
- <b>Terms[]</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Left-Top Term.vi

-- <b>Controls(输入控件)</b> --
- <b>Terms[]</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Terms[] out</b>:

### Terminals - Left-Top Term.vi

-- <b>Controls(输入控件)</b> --
- <b>Terms[]</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Terms[] out</b>:

### Terminals - Lower Term.vi

-- <b>Controls(输入控件)</b> --
- <b>Terms[]</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Terms[] out</b>:

### Terminals - Upper Term.vi

-- <b>Controls(输入控件)</b> --
- <b>Terms[]</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Terms[] out</b>:
