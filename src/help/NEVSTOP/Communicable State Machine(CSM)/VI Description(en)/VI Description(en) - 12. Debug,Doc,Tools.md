# CSM API

## Documentation

### CSM - Copyright QuickDrop.vi

### CSM - Documentation QuickDrop.vi

### CSM - Keywords QuickDrop.vi

### CSM Dummy Module.vi

-- <b>Controls</b> --
- <b>Init State("Macro: Initialize")</b>:
- <b>Name("" to use uuid)</b>:

## CSM Debug Tools

### CSM - Add VI Reference Case to CSMs.vi

The CSM template must include the "VI Reference" case, which is used to obtain references to VIs externally. In earlier templates, this case was not included. This tool is used to add it.

The tool scans all VIs in the lvproj directory. If a VI contains a CSM module, it will be listed, and you can choose to add the "VI Reference" case in bulk.

### CSM - Debug Console - DebugTool.vi

CSM Debug Console, you can use this tool to:

1. Select an existing CSM instance and open the front panel and back panel.
2. Scan the API interfaces of the existing CSM instance.
3. Select an API interface, call it synchronously or asynchronously, and view the return values.
4. View the running log of the entire program.

### CSM - Remove All CSM Bookmarks.vi

Remove all bookmarks in the CSM module.

### CSM - Running Log - DebugTool.vi

Real-time tool for viewing the running log of the entire CSM program.

### CSM - State Dashboard - DebugTool.vi

Real-time status dashboard for the entire CSM program module.

### CSM - State Table - DebugTool.vi

<In Development> Real-time status table for the entire CSM program module.

### CSM - Switch Language Tool.vi

Switch the language of CSM module VI descriptions and comments. Currently supports Chinese and English.

## CSM-DOC

### csmdoc_import_all_csm_VI_description_doc.vi

Select the markdown file describing the functionality of CSM VIs and import it into all VIs.

-- <b>Controls</b> --
- <b>Path</b>: Path to the markdown file describing the functionality of CSM VIs

### csmdoc_export_all_csm_VI_description_doc.vi

Analyze all CSM VIs and export the VI functionality descriptions to a markdown file.

-- <b>Controls</b> --
- <b>Path</b>: Path to the markdown file describing the functionality of CSM VIs

### csmdoc_export_VI_description.vi

-- <b>Controls</b> --
- <b>NOTE-Map</b>:
- <b>Path</b>:

-- <b>Indicators</b> --
- <b>concatenated string</b>:

### csmdoc_import_doc_to_singleVI.vi

### csmdoc_import_VI_description.vi

-- <b>Controls</b> --
- <b>NOTE-Map</b>:
- <b>string</b>:
- <b>Path</b>:

### csmdoc_list_all_csm_documented_VIs.vi

-- <b>Indicators</b> --
- <b>Array</b>:

### csmdoc_load vi description map.vi

-- <b>Controls</b> --
- <b>Path</b>:

-- <b>Indicators</b> --
- <b>text</b>:
- <b>variant 2</b>:
- <b>variant</b>:

## Scripts

### Script - JKISM to CSM.vi
