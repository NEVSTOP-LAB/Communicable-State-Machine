# CSM API

- [01. Templates](./VI%20Description(EN)%20-%2001.%20Templates.md)
- [02. Core Functions](./VI%20Description(EN)%20-%2002.%20Core%20Functions.md)
- [03. Arguments](./VI%20Description(EN)%20-%2003.%20Arguments.md)
- [04. Management API](./VI%20Description(EN)%20-%2004%20.Management%20API.md)
- [05. Module Operation API](./VI%20Description(EN)%20-%2005.%20Module%20Operation%20API.md)
- [06. Status Registration](./VI%20Description(EN)%20-%2006.%20Status%20Registration.md)
- [07. Global Log](./VI%20Description(EN)%20-%2007.%20Global%20Log.md)
- [08. Advanced Mode](./VI%20Description(EN)%20-%2008.%20Advance%20Modes.md)
- [09. Built-in Addons](./VI%20Description(EN)%20-%2009.%20Build-in%20Addons.md)
- [10. Utility VIs](./VI%20Description(EN)%20-%2010.%20Utility%20VIs.md)
- [11. CSM-Helper API](./VI%20Description(EN)%20-%2011.%20CSM-Helper%20API.md)
- [12. Debug, Doc, Tools](./VI%20Description(EN)%20-%2012.%20Debug,Doc,Tools.md)
- [13. Internal](./VI%20Description(EN)%20-%2013.%20Internal.md)

## Unsorted

### CSM - Flood of Events Handler Side Loop.vi

### CSM - Forward States to CSM.vi

-- <b>Inputs</b> --
- <b>High Priority(T)</b>:
- <b>Module Name</b>: Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters
- <b>State(s) in ("")</b>: Wire the existing states to this input. The default is an empty string.

### CSM - Forward UI Operations to CSM.vi

-- <b>Inputs</b> --
- <b>Name("" to use uuid)</b>:
- <b>State(s) in ("")</b>:

-- <b>Outputs</b> --
- <b>States Out</b>:

### CSM - Remove Module in Broadcast Registry.vi

-- <b>Inputs</b> --
- <b>CSM Name</b>:

-- <b>Outputs</b> --
- <b>CSM Name(dup)</b>:

### Parse VI Documentation String.vi

-- <b>Inputs</b> --
- <b>NOTE-Map</b>:
- <b>Documentation</b>:

-- <b>Outputs</b> --
- <b>Ctrl-Doc Map</b>:
- <b>Control Docs</b>:
- <b>Core Doc</b>:
- <b>Documentation (dup)</b>:

### Gevt-ThreadQueueName.vi

-- <b>Outputs</b> --
- <b>ThreadQueueName</b>:

### CSM - Status Change Event.vi

-- <b>Inputs</b> --
- <b>CSM Module</b>:

-- <b>Outputs</b> --
- <b>Status Change Event</b>: