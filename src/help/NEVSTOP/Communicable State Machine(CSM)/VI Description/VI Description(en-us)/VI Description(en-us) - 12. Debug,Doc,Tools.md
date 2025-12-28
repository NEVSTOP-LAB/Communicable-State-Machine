# CSM Debug Tools

## CSM - Add VI Reference Case to CSMs.vi

The CSM template must include the "VI Reference" branch for external access to VI references. In early templates, this case was not included, and this tool is used to add it.

This tool scans all VIs in the lvproj directory; if a VI contains a CSM module, it will be listed, and then you can choose to batch add the "VI Reference" branch.

## CSM - Debug Console - DebugTool.vi

CSM Debug Console, you can use this tool:

1. Select an existing CSM instance, open the front panel and block diagram.
2. Scan the API interfaces of existing CSM instances.
3. Select an API interface, call synchronously or asynchronously, view the return value.
4. View the overall program's running log.

### CSM - Debug Console 2.vi

New version of the CSM Debug Console, you can use this tool:
1. Select an existing CSM instance, open the front panel and block diagram.
2. Scan the API interfaces of existing CSM instances.
3. Select an API interface, call synchronously or asynchronously, view the return value.
4. View the overall program's running log.
5. Run Scripts.

## CSM - Remove all CSM Bookmarks.vi

Remove all bookmarks in the CSM module.

## CSM - Running Log - DebugTool.vi

CSM overall program running log real-time viewer.

## CSM - Switch Language Tool.vi

Switch the language of CSM development tools, currently supports Chinese and English.

## CSM - Fix JKISM Editor RCM Entry.vi

Fix the issue where the right-click context menu of JKISM State Editor does not pop up in CSM.

## CSM - Create CSM Palette at Root.vi

Create a CSM module palette at the root of the function palette.

## CSM - Example Browser.vi

CSM example browser, which allows you to easily browse CSM example programs.

## CSM - Interface Browser.vi

Tools for browsing CSM module interfaces, allowing you to quickly view and search the API interfaces of CSM modules in the project.
