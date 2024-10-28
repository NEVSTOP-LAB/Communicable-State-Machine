# CSM API

## CSM-Helper API

### Is CSM Module.vi

使用最少的VI调用，判断是否是 CSM 模块，用于 LabVIEW 插件预先判断。

> [!NOTE] 多态VI(Polymorphic VI)选项:
> - Is CSM Module - VIRef.vi
> - Is CSM Module - WhileLoop.vi
> - Is CSM Module - Structure.vi
> - Is CSM Module - CaseStructure.vi
> - Is CSM Module - EventStructure.vi
> - Is CSM Module - ParseStateVI.vi

#### Is CSM Module - VIRef.vi

通过 VIRef 判断是否是是 CSM 模块

-- <b>输入控件</b> --
- <b>VIRef</b>: VI引用

-- <b>输出控件</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

#### Is CSM Module - WhileLoop.vi

通过 While Loop 引用判断是否是 CSM 模块

-- <b>输入控件</b> --
- <b>WhileLoop</b>: While Loop 引用

-- <b>输出控件</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

#### Is CSM Module - Structure.vi

通过 Structure 引用判断是否是 CSM 模块

-- <b>输入控件</b> --
- <b>Structure</b>: Structure 引用

-- <b>输出控件</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

#### Is CSM Module - CaseStructure.vi

通过 CaseStructure 引用判断是否是 CSM 模块

-- <b>输入控件</b> --
- <b>CaseStructure</b>: CaseStructure 引用

-- <b>输出控件</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

#### Is CSM Module - EventStructure.vi

通过 EventStructure 引用判断是否是 CSM 模块

-- <b>输入控件</b> --
- <b>EventStructure</b>: EventStructure 引用

-- <b>输出控件</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

#### Is CSM Module - ParseStateVI.vi

通过 Parse State VI 引用判断是否是 CSM 模块

-- <b>输入控件</b> --
- <b>Parse State VI Ref</b>: Parse State VI 引用

-- <b>输出控件</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

### CSM-Helper API.vi

### CSM-Helper usecase Template.vit

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### _Add VI Reference Case.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入
- <b>element</b>:
- <b>Add Frame</b>:

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect Information.vi

-- <b>输入控件</b> --
- <b>Case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Backend Connected Info</b>:
- <b>FrontEnd Connected Info</b>:

### Diagram Node Information.vi

-- <b>输入控件</b> --
- <b>InnerTerminal in</b>:
- <b>Array in</b>:
- <b>Front Tunnels</b>:

-- <b>输出控件</b> --
- <b>Array</b>:
- <b>Array out</b>:

### Get Argument Info From back Term.vi

-- <b>输入控件</b> --
- <b>Terminal in</b>:

-- <b>输出控件</b> --
- <b>Array</b>:

### Get Argument Info From Front Term.vi

-- <b>输入控件</b> --
- <b>Terminal in</b>:

-- <b>输出控件</b> --
- <b>Array</b>:

### GObject Terminals.vi

-- <b>输入控件</b> --
- <b>GObject in</b>:

-- <b>输出控件</b> --
- <b>error in (no error) (dup)</b>:
- <b>Class Name</b>:
- <b>Terms[]</b>:
- <b>Node Object</b>:
- <b>tunnel Relative Pos</b>:

### Relative Pos to InterData Tunnel of CaseContent.vi

-- <b>输入控件</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Position</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Resize CaseStructure By Making Space.vi

-- <b>输入控件</b> --
- <b>Bounds</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>DiffBound</b>:
- <b>MakeSpace.Rect</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Search With Pattern.vi

-- <b>输入控件</b> --
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>输出控件</b> --
- <b>Numeric</b>:

### sub1.vi

-- <b>输入控件</b> --
- <b>Part References.Parse State Queue</b>:
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>输出控件</b> --
- <b>Tunnel out</b>:

### sub2.vi

-- <b>输入控件</b> --
- <b>Part References.Parse State Queue</b>:
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>输出控件</b> --
- <b>Tunnel out</b>:

### Refresh References.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get ParentRef Until Type Matched.vi

-- <b>输入控件</b> --
- <b>Class Name</b>:
- <b>reference in</b>:

-- <b>输出控件</b> --
- <b>Target Ref</b>:

### Is in JKISM or CSM.vi

-- <b>输入控件</b> --
- <b>reference in</b>:

-- <b>输出控件</b> --
- <b>is in JKISM or CSM?</b>:

### Relationship Check.vi

-- <b>输入控件</b> --
- <b>TestRef</b>:
- <b>reference in</b>:

-- <b>输出控件</b> --
- <b>Is TestRef</b>:
- <b>Is Child of TestRef</b>:

### Add State Frame.vi

-- <b>输入控件</b> --
- <b>index(-1, use same group)</b>:
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Add Frame</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Check NewStateNotify is Registered.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>NewStateNotify Registered</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect Error Wire If not Connected.vi

-- <b>输入控件</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect EventReg Wire If not Connected.vi

-- <b>输入控件</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect Internal Data Wire If not Connected.vi

-- <b>输入控件</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect LastResp to Response in Error Case.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect Paired Tunnels.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect StateQ Wire If not Connected.vi

-- <b>输入控件</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Copy State.vi

-- <b>输入控件</b> --
- <b>Already Exist Action:
Replace(T) / Skip(F)</b>:
- <b>SourceCSM</b>:
- <b>New(Empty to Use same Name)</b>:
- <b>Case</b>:
- <b>CSM-Helper.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM-Helper out 2</b>:

### Create From Basic Refs.vi

-- <b>输入控件</b> --
- <b>CSM Basic Refs</b>:

-- <b>输出控件</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From CaseStructure Reference.vi

-- <b>输入控件</b> --
- <b>CaseStructure</b>:

-- <b>输出控件</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From EventStructure Reference.vi

-- <b>输入控件</b> --
- <b>CaseStructure</b>:

-- <b>输出控件</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From VI Reference.vi

-- <b>输入控件</b> --
- <b>VI</b>:

-- <b>输出控件</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From WhileLoop Reference.vi

-- <b>输入控件</b> --
- <b>Structure</b>:

-- <b>输出控件</b> --
- <b>CSM-Helper.lvclass</b>:

### Destroy.vi

-- <b>输入控件</b> --
- <b>Save Instruments?(F)</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Doc.vi

-- <b>输入控件</b> --
- <b>String 2</b>:
- <b>String</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>String 4</b>:
- <b>String 3</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get All API Interface Info.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get All Status Interface Info.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Array 3</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get CaseFrame Index By CaseName.vi

-- <b>输入控件</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>index</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get CaseFrame Reference By CaseName.vi

-- <b>输入控件</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Frame Refs</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get Event Structure Num.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>EvtStrutNum</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get Interface Info.vi

-- <b>输入控件</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Response</b>:
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get Internal Data Info.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Open Block Diagram.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Open Front Panel.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Remove State Frame.vi

-- <b>输入控件</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Save Instrument.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Set Error Tunnel Use Default If not Connected.vi

-- <b>输入控件</b> --
- <b>Use Default if not wired</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Set Visible Case Frame.vi

-- <b>输入控件</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Set Wire Label Visible.vi

-- <b>输入控件</b> --
- <b>Connected Wire.Label.Visible</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Start Undo.vi

-- <b>输入控件</b> --
- <b>Name</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Stop Undo.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Undo.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read APIs.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Value</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Back Tunnel Internal TermRefs.vi

-- <b>输入控件</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Back Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Back Tunnels Refs.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Back Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Block Diagram Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Diagram</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Case Structure Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Case Structure</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Event Structure Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Event Structure</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Front Tunnel Internal TermRefs.vi

-- <b>输入控件</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Front Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Front Tunnels Refs.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Front Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read New State Notifier Event State Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>New State Notifier Event State Ref</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Paired Tunnels of Case Structure.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Paired Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Parse State Queue Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Parse State Queue</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read States.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Value</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Timeout Event State Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>New State Notifier Event State Ref</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Type.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Part References.Type</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read User-Defined States.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read VI Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>VI</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read While Loop Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>While Loop</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Add VI Reference Case.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Remove All CSM Bookmarks.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### standardize CSM Module.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### CSM Essential States.vi

-- <b>输出控件</b> --
- <b>CSM Essential States</b>:

### CSM Module Type.vi

-- <b>输入控件</b> --
- <b>CSM Basic Refs</b>:

-- <b>输出控件</b> --
- <b>CSM Basic Refs (dup)</b>:

### CaseStructure - Add Frame.vi

-- <b>输入控件</b> --
- <b>Case Name</b>:
- <b>Reference Frame Index</b>:
- <b>CaseStructure in</b>:

-- <b>输出控件</b> --
- <b>Add Frame</b>:
- <b>CaseStructure out</b>:

### CaseStructure - Case Name to Group Name.vi

-- <b>输入控件</b> --
- <b>element</b>:

-- <b>输出控件</b> --
- <b>String</b>:

### CaseStructure - Check If State Exist.vi

-- <b>输入控件</b> --
- <b>Group Name</b>:
- <b>CaseStructure in</b>:

-- <b>输出控件</b> --
- <b>Numeric</b>:
- <b>CaseStructure out</b>:

### CaseStructure - Get Group Separator Case Index.vi

-- <b>输入控件</b> --
- <b>Group Name</b>:
- <b>CaseStructure in</b>:

-- <b>输出控件</b> --
- <b>Numeric</b>:
- <b>CaseStructure out</b>:

### Diagram - Connect Tunnel with Wire 2.vi

-- <b>输入控件</b> --
- <b>Wire Index</b>:
- <b>Front Tunnels</b>:
- <b>Diagram in</b>:

-- <b>输出控件</b> --
- <b>Array out</b>:
- <b>Diagram out</b>:

### Diagram - Connect Tunnel with Wire.vi

-- <b>输入控件</b> --
- <b>FrontEnd Connected Info</b>:
- <b>Front Tunnels</b>:
- <b>Diagram in</b>:

-- <b>输出控件</b> --
- <b>Array out</b>:
- <b>Diagram out</b>:

### Diagram - Get All Decoration Refs.vi

-- <b>输入控件</b> --
- <b>TopLevelDiagram in</b>:

-- <b>输出控件</b> --
- <b>TextRefs</b>:
- <b>TopLevelDiagram out</b>:

### Diagram - Get All Text Refs.vi

-- <b>输入控件</b> --
- <b>TopLevelDiagram in</b>:

-- <b>输出控件</b> --
- <b>TextRefs</b>:
- <b>TopLevelDiagram out</b>:

### PairedTunnels - Connect Wire.vi

-- <b>输入控件</b> --
- <b>index(-1 for all)</b>:
- <b>PairedTunnels</b>:

-- <b>输出控件</b> --
- <b>PairedTunnels</b>:

### Find Event Structure from Case Structure.vi

-- <b>输入控件</b> --
- <b>CaseStructure</b>:

-- <b>输出控件</b> --
- <b>EvntStruct Refnum</b>:

### Find Parse State Queue from Case Structure.vi

-- <b>输入控件</b> --
- <b>CaseStructure</b>:

-- <b>输出控件</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:

### Find Parse State Queue from Event Structure.vi

-- <b>输入控件</b> --
- <b>EvntStruct Refnum</b>:

-- <b>输出控件</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:

### Find Parse State Queue from While Loop.vi

-- <b>输入控件</b> --
- <b>WhileLoop in</b>:

-- <b>输出控件</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:
- <b>WhileLoop out</b>:

### Terminals - Filter Control Terms.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Error Terms.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Indicator Terms.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Input Term.vi

-- <b>输入控件</b> --
- <b>InnerTerminal in</b>:
- <b>Wire.Terms[] in</b>:

-- <b>输出控件</b> --
- <b>Wire.Terms[] out</b>:

### Terminals - Filter invalid Terms.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Left-Top Term.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

### Terminals - Left-Top Term.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

### Terminals - Lower Term.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

### Terminals - Upper Term.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:
