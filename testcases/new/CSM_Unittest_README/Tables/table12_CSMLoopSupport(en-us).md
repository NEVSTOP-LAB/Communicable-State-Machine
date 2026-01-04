<table>  
  <tr align="left">
      <td> Test Case No. </td>
      <td> Test Case Description </td>
      <td> Test Case VI </td>
      <td> Normal Mode </td>
      <td> Submodule Mode </td>
      <td> System-Level Mode </td>
      <td> lvlibp </td>
  </tr>
  <tr align="left">
      <td>1</td>
      <td>While running in Loop mode: 1. Can receive and process synchronous messages sent from outside; 2. Can also send synchronous messages to other modules.</td>
      <td>test1-ProcessSyncMessageInCSMLoop(SendAndReceive).vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>While running in Loop mode: 1. Can receive and process asynchronous messages with reply sent from outside; 2. Can also send asynchronous messages with reply to other modules.</td>
      <td>test2-ProcessAsyncMessageWithReplyInCSMLoop(SendAndReceive).vi
      </td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>3</td>
      <td>While running in Loop mode: 1. Can receive and process asynchronous messages without reply sent from outside; 2. Can also send asynchronous messages without reply to other modules.</td>
      <td>test3-ProcessAsyncMessageWithoutReplyInCSMLoop(SendAndReceive).vi
      </td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr>
      <td colspan="7">
          Note: The CSM (=worker and chain modes are special module patterns composed of multiple running nodes. Messages sent in these modes cannot reliably target a specific node to execute. When a node operates in worker or chain modes, it cannot be clearly instructed by messages to stop a loop. Therefore, it is not recommended to use the CSM Loop Support addon in worker and chain modes. Therefore, this testclass does not cover worker and chain modes.
      </td>
  </tr>
</table>
