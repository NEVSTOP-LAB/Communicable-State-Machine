<table>  
  <tr align="left">
      <td> Test Case No. </td>
      <td> Test Case Description </td>
      <td> Test Case VI </td>
      <td> Chain Mode </td>
  </tr>
  <tr align="left">
      <td>1</td>
      <td>All nodes share the same CSM Attribute data space. Data written externally is read identically by all internal modules.</td>
      <td>test1-AllChainNodesShareTheSameData.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>Three nodes (A->B->C), each with different Allowed Messages. Messages are sent to the corresponding allowed module; using the API to send synchronous messages returns the correct parameters.</td>
      <td>test2-DifferentChainNodesProcessDifferentAllowedMessages.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>3</td>
      <td>Three nodes (A->B->C), with Allowed Messages combinations of AB, BC, AC, and ABC. Messages should be executed by the first node in the chain. Using the API to send synchronous messages returns the correct parameters.</td>
      <td>test3-FirstChainNodeProcessesAllowedMessages.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>4</td>
      <td>Three nodes (A->B->C), with Allowed Messages defined. If no module can execute the message, the sender reports an error.</td>
      <td>test4-EndNodeHandlesErrorForNotAllowedMessages.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>5</td>
      <td>Three nodes (A->B->C), each node broadcasts a message. After subscribing, the corresponding module's API is triggered; after unsubscribing, none can be triggered.</td>
      <td>test5-ChainNodeBroadcast.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>6</td>
      <td>Three nodes (A->B->C). If the "Macro: Exit" command does not specify a node (i.e., uses the core name without the $ suffix), nodes should exit in order from the end to the head of the chain. If the command specifies a node, only that node exits and others are unaffected.</td>
      <td>test6-ChainNodeExitSequenceCheck.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  </tr>

</table>
