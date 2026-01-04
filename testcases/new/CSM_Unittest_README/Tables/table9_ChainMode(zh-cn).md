<table>  
  <tr align="left">
      <td> 测试项序号 </td>
      <td> 测试项内容 </td>
      <td> 对应测试项VI </td>
      <td> 责任链模式 </td>
  </tr>
  <tr align="left">
      <td>1</td>
      <td>节点之间共享相同的CSM Attribute 数据空间，外部写入数据，内部所有模块读取的数据相同</td>
      <td>test1-AllChainNodesShareTheSameData.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>3个节点（A->B->C)，定义节点的Allowed Messages，互不相同的允许的消息，会发送到对应允许的模块运行；使用API发送同步消息，可以携带回正确的参数</td>
      <td>test2-DifferentChainNodesProcessDifferentAllowedMessages.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>3</td>
      <td>3个节点（A->B->C)，定义节点的Allowed Messages，AB, BC, AC, ABC 组合允许的消息，应该由链条端头的节点执行, 使用API发送同步消息，可以携带回正确的参数	</td>
      <td>test3-FirstChainNodeProcessesAllowedMessages.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>4</td>
      <td>3个节点（A->B->C)，定义节点的Allowed Messages, 没有可以执行的模块，由消息发送方报错</td>
      <td>test4-EndNodeHandlesErrorForNotAllowedMessages.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>5</td>
      <td>3个节点（A->B->C)，不同的节点都发出一个广播，订阅后，都能触发对应绑定模块的API, 取消订阅后，任意一个都不能触发</td>
      <td>test5-ChainNodeBroadcast.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>6</td>
      <td>3个节点（A->B->C)，如果使用”Macro: Exit“命令不显性明确哪个节点，而是用不带$后缀的核心名字退出时，需按照从链条底端到端头的顺序依次退出；如果使用”Macro: Exit“命令显性明确哪个节点，则只退出该节点模块，其余节点模块不受影响</td>
      <td>test6-ChainNodeExitSequenceCheck.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  </tr>

</table>
