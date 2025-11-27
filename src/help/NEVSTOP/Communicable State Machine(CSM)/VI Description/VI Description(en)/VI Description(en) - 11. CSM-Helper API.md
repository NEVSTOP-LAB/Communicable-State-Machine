# CSM API

## CSM-Helper API

### Is CSM Module.vi

Use the minimum number of VI calls to determine if it is a CSM module, for pre-checking in LabVIEW plugins.

> [!NOTE] Polymorphic VI Options:
> - Is CSM Module - VIRef.vi
> - Is CSM Module - WhileLoop.vi
> - Is CSM Module - Structure.vi
> - Is CSM Module - CaseStructure.vi
> - Is CSM Module - EventStructure.vi
> - Is CSM Module - ParseStateVI.vi

#### Is CSM Module - VIRef.vi

Determine if it is a CSM module through VIRef

-- <b>Controls</b> --
- <b>VIRef</b>: VI Reference

-- <b>Indicators</b> --
- <b>Is CSM Module?</b>: True If it is a CSM module
- <b>CSM Basic Refs</b>: If This is a CSM module, It will return the basic references

#### Is CSM Module - WhileLoop.vi

Determine if it is a CSM module through While Loop reference

-- <b>Controls</b> --
- <b>WhileLoop</b>: While Loop reference

-- <b>Indicators</b> --
- <b>Is CSM Module?</b>: True If it is a CSM module
- <b>CSM Basic Refs</b>: If This is a CSM module, It will return the basic references

#### Is CSM Module - Structure.vi

Determine if it is a CSM module through Structure reference

-- <b>Controls</b> --
- <b>Structure</b>: Structure reference

-- <b>Indicators</b> --
- <b>Is CSM Module?</b>: True If it is a CSM module
- <b>CSM Basic Refs</b>: If This is a CSM module, It will return the basic references

#### Is CSM Module - CaseStructure.vi

Determine if it is a CSM module through case Structure reference

-- <b>Controls</b> --
- <b>CaseStructure</b>: CaseStructure reference

-- <b>Indicators</b> --
- <b>Is CSM Module?</b>: True If it is a CSM module
- <b>CSM Basic Refs</b>: If This is a CSM module, It will return the basic references

#### Is CSM Module - EventStructure.vi

Determine if it is a CSM module through Event Structure reference

-- <b>Controls</b> --
- <b>EventStructure</b>: EventStructure reference

-- <b>Indicators</b> --
- <b>Is CSM Module?</b>: True If it is a CSM module
- <b>CSM Basic Refs</b>: If This is a CSM module, It will return the basic references

#### Is CSM Module - ParseStateVI.vi

Determine if it is a CSM module through Parse State VI reference

-- <b>Controls</b> --
- <b>Parse State VI Ref</b>: Parse State VI reference

-- <b>Indicators</b> --
- <b>Is CSM Module?</b>: True If it is a CSM module
- <b>CSM Basic Refs</b>: If This is a CSM module, It will return the basic references

### CSM-Helper API.vi

### CSM-Helper usecase Template.vit

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### _Add VI Reference Case.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input
- <b>element</b>:
- <b>Add Frame</b>:

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Connect Information.vi

-- <b>Controls</b> --
- <b>Case</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output
- <b>Backend Connected Info</b>:
- <b>FrontEnd Connected Info</b>:

### Diagram Node Information.vi

-- <b>Controls</b> --
- <b>InnerTerminal in</b>:
- <b>Array in</b>:
- <b>Front Tunnels</b>:

-- <b>Indicators</b> --
- <b>Array</b>:
- <b>Array out</b>:

### Get Argument Info From back Term.vi

-- <b>Controls</b> --
- <b>Terminal in</b>:

-- <b>Indicators</b> --
- <b>Array</b>:

### Get Argument Info From Front Term.vi

-- <b>Controls</b> --
- <b>Terminal in</b>:

-- <b>Indicators</b> --
- <b>Array</b>:

### GObject Terminals.vi

-- <b>Controls</b> --
- <b>GObject in</b>:

-- <b>Indicators</b> --
- <b>error in (no error) (dup)</b>:
- <b>Class Name</b>:
- <b>Terms[]</b>:
- <b>Node Object</b>:
- <b>tunnel Relative Pos</b>:

### Relative Pos to InterData Tunnel of CaseContent.vi

-- <b>Controls</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Position</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Resize CaseStructure By Making Space.vi

-- <b>Controls</b> --
- <b>Bounds</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>DiffBound</b>:
- <b>MakeSpace.Rect</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Search With Pattern.vi

-- <b>Controls</b> --
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>Indicators</b> --
- <b>Numeric</b>:

### sub1.vi

-- <b>Controls</b> --
- <b>Part References.Parse State Queue</b>:
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>Indicators</b> --
- <b>Tunnel out</b>:

### sub2.vi

-- <b>Controls</b> --
- <b>Part References.Parse State Queue</b>:
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>Indicators</b> --
- <b>Tunnel out</b>:

### Refresh References.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Get ParentRef Until Type Matched.vi

-- <b>Controls</b> --
- <b>Class Name</b>:
- <b>reference in</b>:

-- <b>Indicators</b> --
- <b>Target Ref</b>:

### Is in JKISM or CSM.vi

-- <b>Controls</b> --
- <b>reference in</b>:

-- <b>Indicators</b> --
- <b>is in JKISM or CSM?</b>:

### Relationship Check.vi

-- <b>Controls</b> --
- <b>TestRef</b>:
- <b>reference in</b>:

-- <b>Indicators</b> --
- <b>Is TestRef</b>:
- <b>Is Child of TestRef</b>:

### Add State Frame.vi

-- <b>Controls</b> --
- <b>index(-1, use same group)</b>:
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Add Frame</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Check NewStateNotify is Registered.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>NewStateNotify Registered</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Connect Error Wire If not Connected.vi

-- <b>Controls</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Connect EventReg Wire If not Connected.vi

-- <b>Controls</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Connect Internal Data Wire If not Connected.vi

-- <b>Controls</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Connect LastResp to Response in Error Case.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Connect Paired Tunnels.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Connect StateQ Wire If not Connected.vi

-- <b>Controls</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Copy State.vi

-- <b>Controls</b> --
- <b>Already Exist Action:
Replace(T) / Skip(F)</b>:
- <b>SourceCSM</b>:
- <b>New(Empty to Use same Name)</b>:
- <b>Case</b>:
- <b>CSM-Helper.lvclass</b>:

-- <b>Indicators</b> --
- <b>CSM-Helper out 2</b>:

### Create From Basic Refs.vi

-- <b>Controls</b> --
- <b>CSM Basic Refs</b>:

-- <b>Indicators</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From CaseStructure Reference.vi

-- <b>Controls</b> --
- <b>CaseStructure</b>:

-- <b>Indicators</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From EventStructure Reference.vi

-- <b>Controls</b> --
- <b>CaseStructure</b>:

-- <b>Indicators</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From VI Reference.vi

-- <b>Controls</b> --
- <b>VI</b>:

-- <b>Indicators</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From WhileLoop Reference.vi

-- <b>Controls</b> --
- <b>Structure</b>:

-- <b>Indicators</b> --
- <b>CSM-Helper.lvclass</b>:

### Destroy.vi

-- <b>Controls</b> --
- <b>Save Instruments?(F)</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Doc.vi

-- <b>Controls</b> --
- <b>String 2</b>:
- <b>String</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>String 4</b>:
- <b>String 3</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Get All API Interface Info.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Get All Status Interface Info.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Array 3</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Get CaseFrame Index By CaseName.vi

-- <b>Controls</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>index</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Get CaseFrame Reference By CaseName.vi

-- <b>Controls</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Frame Refs</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Get Event Structure Num.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>EvtStrutNum</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Get Interface Info.vi

-- <b>Controls</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Response</b>:
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Get Internal Data Info.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Open Block Diagram.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Open Front Panel.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Remove State Frame.vi

-- <b>Controls</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Save Instrument.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Set Error Tunnel Use Default If not Connected.vi

-- <b>Controls</b> --
- <b>Use Default if not wired</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Set Visible Case Frame.vi

-- <b>Controls</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Set Wire Label Visible.vi

-- <b>Controls</b> --
- <b>Connected Wire.Label.Visible</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Start Undo.vi

-- <b>Controls</b> --
- <b>Name</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Stop Undo.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Undo.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Read APIs.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Value</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read Back Tunnel Internal TermRefs.vi

-- <b>Controls</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Back Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read Back Tunnels Refs.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Back Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read Block Diagram Ref.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Diagram</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read Case Structure Ref.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Case Structure</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read Event Structure Ref.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Event Structure</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read Front Tunnel Internal TermRefs.vi

-- <b>Controls</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Front Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read Front Tunnels Refs.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Front Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read New State Notifier Event State Ref.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>New State Notifier Event State Ref</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read Paired Tunnels of Case Structure.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Paired Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read Parse State Queue Ref.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Parse State Queue</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read States.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Value</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read Timeout Event State Ref.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>New State Notifier Event State Ref</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read Type.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Part References.Type</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read User-Defined States.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read VI Ref.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>VI</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Read While Loop Ref.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>While Loop</b>:
- <b>CSM-Helper out</b>: CSMHelper output

### Add VI Reference Case.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### Remove All CSM Bookmarks.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### standardize CSM Module.vi

-- <b>Controls</b> --
- <b>CSM-Helper in</b>: CSMHelper input

-- <b>Indicators</b> --
- <b>CSM-Helper out</b>: CSMHelper output

### CSM Essential States.vi

-- <b>Indicators</b> --
- <b>CSM Essential States</b>:

### CSM Module Type.vi

-- <b>Controls</b> --
- <b>CSM Basic Refs</b>:

-- <b>Indicators</b> --
- <b>CSM Basic Refs (dup)</b>:

### CaseStructure - Add Frame.vi

-- <b>Controls</b> --
- <b>Case Name</b>:
- <b>Reference Frame Index</b>:
- <b>CaseStructure in</b>:

-- <b>Indicators</b> --
- <b>Add Frame</b>:
- <b>CaseStructure out</b>:

### CaseStructure - Case Name to Group Name.vi

-- <b>Controls</b> --
- <b>element</b>:

-- <b>Indicators</b> --
- <b>String</b>:

### CaseStructure - Check If State Exist.vi

-- <b>Controls</b> --
- <b>Group Name</b>:
- <b>CaseStructure in</b>:

-- <b>Indicators</b> --
- <b>Numeric</b>:
- <b>CaseStructure out</b>:

### CaseStructure - Get Group Separator Case Index.vi

-- <b>Controls</b> --
- <b>Group Name</b>:
- <b>CaseStructure in</b>:

-- <b>Indicators</b> --
- <b>Numeric</b>:
- <b>CaseStructure out</b>:

### Diagram - Connect Tunnel with Wire 2.vi

-- <b>Controls</b> --
- <b>Wire Index</b>:
- <b>Front Tunnels</b>:
- <b>Diagram in</b>:

-- <b>Indicators</b> --
- <b>Array out</b>:
- <b>Diagram out</b>:

### Diagram - Connect Tunnel with Wire.vi

-- <b>Controls</b> --
- <b>FrontEnd Connected Info</b>:
- <b>Front Tunnels</b>:
- <b>Diagram in</b>:

-- <b>Indicators</b> --
- <b>Array out</b>:
- <b>Diagram out</b>:

### Diagram - Get All Decoration Refs.vi

-- <b>Controls</b> --
- <b>TopLevelDiagram in</b>:

-- <b>Indicators</b> --
- <b>TextRefs</b>:
- <b>TopLevelDiagram out</b>:

### Diagram - Get All Text Refs.vi

-- <b>Controls</b> --
- <b>TopLevelDiagram in</b>:

-- <b>Indicators</b> --
- <b>TextRefs</b>:
- <b>TopLevelDiagram out</b>:

### PairedTunnels - Connect Wire.vi

-- <b>Controls</b> --
- <b>index(-1 for all)</b>:
- <b>PairedTunnels</b>:

-- <b>Indicators</b> --
- <b>PairedTunnels</b>:

### Find Event Structure from Case Structure.vi

-- <b>Controls</b> --
- <b>CaseStructure</b>:

-- <b>Indicators</b> --
- <b>EvntStruct Refnum</b>:

### Find Parse State Queue from Case Structure.vi

-- <b>Controls</b> --
- <b>CaseStructure</b>:

-- <b>Indicators</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:

### Find Parse State Queue from Event Structure.vi

-- <b>Controls</b> --
- <b>EvntStruct Refnum</b>:

-- <b>Indicators</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:

### Find Parse State Queue from While Loop.vi

-- <b>Controls</b> --
- <b>WhileLoop in</b>:

-- <b>Indicators</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:
- <b>WhileLoop out</b>:

### Terminals - Filter Control Terms.vi

-- <b>Controls</b> --
- <b>Terms[]</b>:

-- <b>Indicators</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Error Terms.vi

-- <b>Controls</b> --
- <b>Terms[]</b>:

-- <b>Indicators</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Indicator Terms.vi

-- <b>Controls</b> --
- <b>Terms[]</b>:

-- <b>Indicators</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Input Term.vi

-- <b>Controls</b> --
- <b>InnerTerminal in</b>:
- <b>Wire.Terms[] in</b>:

-- <b>Indicators</b> --
- <b>Wire.Terms[] out</b>:

### Terminals - Filter invalid Terms.vi

-- <b>Controls</b> --
- <b>Terms[]</b>:

-- <b>Indicators</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Left-Top Term.vi

-- <b>Controls</b> --
- <b>Terms[]</b>:

-- <b>Indicators</b> --
- <b>Terms[] out</b>:

### Terminals - Left-Top Term.vi

-- <b>Controls</b> --
- <b>Terms[]</b>:

-- <b>Indicators</b> --
- <b>Terms[] out</b>:

### Terminals - Lower Term.vi

-- <b>Controls</b> --
- <b>Terms[]</b>:

-- <b>Indicators</b> --
- <b>Terms[] out</b>:

### Terminals - Upper Term.vi

-- <b>Controls</b> --
- <b>Terms[]</b>:

-- <b>Indicators</b> --
- <b>Terms[] out</b>:
