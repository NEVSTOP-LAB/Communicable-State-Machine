<table>  
  <tr align="left">
      <td> 测试项序号 </td>
      <td> 测试项内容 </td>
      <td> 对应测试项VI </td>
      <td> 普通模式 </td>
      <td> 子模块模式 </td>
      <td> 系统级模式 </td>
      <td> 协作者模式 </td>
      <td> 责任链模式 </td>
      <td> 打包项目库模式 </td>
  </tr>
  <tr align="left">
      <td>1</td>
      <td>可以通过全局日志队列获取模块创建和销毁的日志(module created/module destroyed)，并检查日志数量是否符合预期</td>
      <td>test1-ModuleCreatedDestroyed_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>可以通过全局日志队列获取模块状态轮转的日志(state change)： 通过外部API发送一条消息触发CSM模块内部状态变化(State Change), 可以在全局日志里既看到触发消息的日志，又可以看到被触发的状态变化</td>
      <td>test2-StateChange_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>3</td>
      <td>可以通过全局日志队列获取订阅、取消订阅的日志, 协作者和责任链模式的CSM模块名不能带有后缀</td>
      <td>test3-RegisterUnregister_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>4</td>
      <td>可以通过全局日志队列获得模块消息通讯的日志(messasge): 通过外部API发送一条同步消息触发CSM1模块内部状态，该内部状态里再发送一条同步消息给CSM2，检查这两条特定消息都按照严格的格式记录在日志里。</td>
      <td>test4-Message_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>5</td>
      <td>可以通过全局日志队列获得模块发布广播的日志(broadcast)</td>
      <td>test5-Broadcast_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>6</td>
      <td>可以通过全局日志队列获得模块发布高优先级广播的日志(interrupt)</td>
      <td>test6-Interrupt_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>7</td>
      <td>可以通过全局日志队列获得模块状态广播(state)的日志</td>
      <td>test7-StateBroadcast_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>8</td>
      <td>可以通过全局日志队列获得模块自定义用户消息的日志</td>
      <td>test8-UserLog_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
    <tr align="left">
      <td>9</td>
      <td>可以通过全局日志队列获得模块Sync/Async/NoRep-Async消息的日志</td>
      <td>已测试，见test4-Message_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>10</td>
      <td>可以通过全局日志自定义事件获取模块创建和销毁的日志(module created/module destroyed),并检查日志数量是否符合预期</td>
      <td>test9-ModuleCreatedDestroyed_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>11</td>
      <td>可以通过全局日志自定义事件获取模块状态轮转的日志(state change): 通过外部API发送一条消息触发CSM模块内部状态变化(State Change), 可以在全局日志里既看到触发消息的日志，又可以看到被触发的状态变化</td>
      <td>test10-StateChange_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>12</td>
      <td>可以通过全局日志自定义事件获取订阅、取消订阅的日志, 协作者和责任链模式的CSM模块名不能带有后缀</td>
      <td>test11-RegisterUnregister_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>13</td>
      <td>可以通过全局日志自定义事件获得模块消息通讯的日志(messasge)</td>
      <td>test12-Message_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>14</td>
      <td>可以通过全局日志自定义事件获得模块发布广播的日志(broadcast)</td>
      <td>test13-Broadcast_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>15</td>
      <td>可以通过全局日志自定义事件获得模块发布高优先级广播的日志(interrupt)</td>
      <td>test14-Interrupt_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>16</td>
      <td>可以通过全局日志自定义事件获得模块状态广播(state)的日志</td>
      <td>test15-StateBroadcast_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
    <tr align="left">
      <td>17</td>
      <td>可以通过全局日志自定义事件获得模块自定义用户消息的日志</td>
      <td>test16-UserLog_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>18</td>
      <td>可以通过全局日志自定义事件获得模块Sync/Async/NoRep-Async消息的日志 </td>
      <td>已测试，见test12-Message_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr>
      <td colspan="9">

备注：CSM模式包含普通模式、子模块模式、系统级模式、协作者模式、责任链模式、打包项目库模式，CSM1和CSM2之间包含所有可能的CSM模式对应关系。
      </td>
  </tr>
</table>
