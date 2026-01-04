<table>  
    <tr align="left">
            <td> Test Case No. </td>
            <td> Test Case Description </td>
            <td> Test Case VI </td>
            <td> Normal Mode </td>
            <td> Submodule Mode </td>
            <td> System-Level Mode </td>
            <td> Worker Mode </td>
            <td> Chain Mode </td>
            <td> lvlibp </td>
    </tr>
  <tr align="left">
    <td>1</td>
    <td>Basic message response function, already tested in message test class, including Sync/Async/AsyncNoRep</td>
    <td>Tested</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>2</td>
    <td>CSM1 sends a message to CSM2, single message response. When an error occurs, it first enters the Error Handler, but still returns the Response of the message execution case.</td>
    <td>test1-ResponseWithError.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>3</td>
    <td>Macro message execution returns the response of the last SubMessage</td>
    <td>test2-MacroWithSubMessages.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>4</td>
    <td>Macro message execution with PostStep messages returns the response of the last SubMessage</td>
    <td>test3-MacroWithSubAndPostMessages.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>5¹</td>
    <td>Macro message execution: if the last SubMessage sends a message to another module (sync/async with response/async no response), the final return value is empty</td>
    <td>test4-MacroWithNonLocalSubMessages.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>6</td>
    <td>Message response: Sync message API carries the name of the executing module, already tested in test3-SyncMessage_API.vi of the message test class</td>
    <td>Tested</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>7</td>
    <td>In Response/Async Response, the source module name, message name, and message parameters can be obtained, already tested in Sync/Async/AsyncNoRep message test cases.</td>
    <td>Tested</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>8</td>
    <td>Message response with Error, already tested in Sync/Async/AsyncNoRep message test cases</td>
    <td>Tested</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr>
      <td colspan="9">
       ¹ Related issue tracking:  
          <a href="https://github.com/NEVSTOP-LAB/Communicable-State-Machine/issues/547">
          https://github.com/NEVSTOP-LAB/Communicable-State-Machine/issues/547
          </a>
          <br><br>
          Note: CSM modes include Normal Mode, Submodule Mode, System-Level Mode, Worker Mode, Chain Mode, and lvlibp. All possible CSM mode relationships between CSM1 and CSM2 are included.
      </td>
  </tr>
</table>
