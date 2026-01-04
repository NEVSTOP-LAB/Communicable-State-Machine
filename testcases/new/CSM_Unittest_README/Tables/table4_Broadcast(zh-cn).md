<table>  
  <tr align="left">
      <td> 测试项序号 </td>
      <td> 测试项内容 </td>
      <td> 对应测试项VI¹ </td>
      <td> 普通模式 </td>
      <td> 子模块模式 </td>
      <td> 系统级模式 </td>
      <td> 协作者模式 </td>
      <td> 责任链模式 </td>
      <td> 打包项目库模式 </td>
  </tr>
  <tr align="left">
      <td>1</td>
      <td>CSM1抛出Status, 可以通过 Register/Unregister 在内部、外部，控制Status 触发 CSM2绑定的State</td>
      <td>test1-LocalExternalStatusRegistration.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>      
  </tr>
  <tr align="left">
      <td>2</td>
      <td>CSM1抛出Status, 可以通过 API 在内部、外部，控制Status 触发 CSM2绑定的State</td>
      <td>test2-LocalExternalStatusRegistrationViaAPI.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>3</td>
      <td>CSM1抛出Status, 可以通过 API 在内部、外部，控制Status 触发 CSM2绑定的State</td>
      <td>test24-MappingRelationshipByExternalRegistration_API.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>4</td>
      <td>CSM1抛出Status, 在外部使用语句订阅时，CSM退出后，订阅关系不会消失</td>
      <td>test25-MappingRelationshipByExternalRegistration.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>5</td>
      <td>CSM1抛出Status, 在内部使用语句订阅到本模块的State时:如果明确写出订阅者名字为CSM1，退出后，订阅关系不会消失；如果省略订阅者名字，退出后，订阅关系会自动被移除；</td>
      <td>test26-MappingRelationshipByLocalRegistration_WithSubcriberName.vi
         <br><br>
test27-MappingRelationshipByLocalRegistration_WithoutSubcriberName.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>6</td>
      <td>CSM1抛出Status, 可以被订阅到多个模块的多个状态，抛出后全部会自动触发</td>
      <td>test3-1ToNBroadcastStatus.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>7</td>
      <td>CSM1抛出Status, 可以在非CSM中，使用UserEvent 进行订阅</td>
      <td>test4-RegisterStatusFromNonCSM.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>8</td>
      <td>CSM1/CSM3 抛出不同的Status, 可以订阅到 CSM2 的State, 都能触发 CSM2 执行 State</td>
      <td>test5-RegisterMultipleStatusesToOneState.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
    <tr align="left">
      <td>9</td>
      <td>订阅时Source Module Name 可以使用 * 作为通配符，一次性订阅多个模块的同一个Status，可以取消订阅某一个module 的该Status,其他模块的不被影响</td>
      <td>test6-AsteriskWildcardStatusRegistration.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>10</td>
      <td>订阅成功后，CSM1 抛出多次 Status, 订阅方会收到所有的State 触发，不会丢失</td>
      <td>test15-LosslessRegisterStatusMultipleTimes.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>11</td>
      <td>订阅成功后，CSM1 抛出多次Status, 订阅方会收到所有的State 触发，不会丢失（非CSM中，使用UserEvent 进行订阅）</td>
      <td>test16-LosslessRegisterStatusMultipleTimesNonCSM.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>12</td>
      <td>Status 的 Argument, 就是触发后的State 的Argument</td>
      <td>已测试，见test1-LocalExternalStatusRegistration.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>13</td>
      <td>被触发的Status ,可以通过 Argument Info 中获取 Source State Name/ Source module</td>
      <td>test7-TestArgumentInfoOfTriggeredState_Status.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>14</td>
      <td>CSM1抛出Interrupt, 可以被订阅到多个模块的多个状态，抛出后全部会自动触发</td>
      <td>test19-1ToNInterruptStatus.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>15</td>
      <td>CSM1抛出Interrupt, 可以在非CSM 中，使用 Interrupt User Event 进行订阅获取，Status User Event 不会触发</td>
      <td>test21-RegisterInterruptFromNonCSM.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>16</td>
      <td>CSM1抛出Status, 订阅为 interrupt, 可以在非CSM 中，使用 Interrupt User Event 进行订阅获取，Status  User Event 不会触发</td>
      <td>test20-RegisterStatusAsInterruptFromNonCSM.vi
      </td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
    <tr align="left">
      <td>17</td>
      <td>CSM1抛出Interrupt, 订阅为 Status, 可以在非CSM 中，使用Status User Event 进行订阅获取，Interrupt  User Event 不会触发</td>
      <td>test22-RegisterInterruptAsStatusFromNonCSM.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>18</td>
      <td>CSM1不抛出Status,它的State, 可以通过 Regiseter/Unregister 在内部、外部，控制Status 触发 CSM2绑定的State</td>
      <td>test8-LocalExternalStateRegistration.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>19</td>
      <td>CSM1不抛出Status,它的State, 可以通过 API 在内部、外部，控制Status 触发 CSM2绑定的State</td>
      <td>test9-LocalExternalStateRegistrationViaAPI.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>20</td>
      <td>CSM1不抛出Status,它的State, 在外部使用语句订阅时，推出后，订阅关系不会消失</td>
      <td>test29-MappingRelationshipByExternalRegistration_State.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>21</td>
      <td>CSM1不抛出Status,它的State, 在外部使用API订阅时，推出后，订阅关系不会消失</td>
      <td>test28-MappingRelationshipByExternalRegistration_API_State.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>22</td>
      <td>CSM1不抛出Status,它的State, 在内部使用语句订阅到本模块的State时：如果明确写出订阅者名字为CSM1，退出后，订阅关系不会消失；如果省略订阅者名字，退出后，订阅关系会自动被移除；</td>
      <td>test30-MappingRelationshipByLocalRegistration_WIthSubscriberName_State.vi
    <br><br>
test31-MappingRelationshipByLocalRegistration_WIthoutSubscriberName_State.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>23</td>
      <td>CSM1不抛出Status,它的State, 可以被订阅到多个模块的多个状态，抛出后全部会自动触发</td>
      <td>test10-1ToNBroadcastState.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>24</td>
      <td>CSM1不抛出Status,它的State, 可以在非CSM中，使用UserEvent 进行订阅</td>
      <td>test11-RegisterStatesFromNonCSM_State.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>25</td>
      <td>CSM1/CSM3 不同的State, 可以订阅到 CSM2 的State, 都能触发 CSM2 执行 State</td>
      <td>test12-RegisterMultipleStatesToOneState.vi/td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>26</td>
      <td>订阅时Source Module Name 可以使用 * 作为通配符，一次性订阅多个模块的同一个State，可以取消订阅某一个module 的该State,其他模块的不被影响</td>
      <td>test13-AsteriskWildcardStateRegistration.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>27</td>
      <td>订阅成功后，CSM1 抛出多次 State, 订阅方会收到所有State 触发，不会丢失</td>
      <td>test17-LosslessRegisterStateMultipleTimes.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>28</td>
      <td>订阅成功后，CSM1 抛出多次 State, 订阅方会收到所有State 触发，不会丢失（非CSM中，使用UserEvent 进行订阅）</td>
      <td>test16-LosslessRegisterStateMultipleTimesNonCSM.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>29</td>
      <td>State 的 Response, 就是触发后的State 的Argument </td>
      <td>已测试，见test8-LocalExternalStateRegistration.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>30</td>
      <td>被触发的State ,可以通过 Argument Info 中获取 Source State Name/ Source module</td>
      <td>test14-TestArgumentInfoOfTriggeredState_State.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>31</td>
      <td>将state 订阅为 interrupt, Non-CSM 模式下，只能在interrupt User Event 中获取事件，在 Status User Event 中无法获取队列</td>
      <td>test23-RegisterStatusAsInterruptFromNonCSM_State.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr>
      <td colspan="9">
¹：该类的单元测试vi未按照该表格从上至下顺序排序，而是按照实际测试机台，特别是Git CI/CD实际运行机台性能而做的排序。
<br><br>
          备注：CSM模式包含普通模式、子模块模式、系统级模式、协作者模式、责任链模式、打包项目库模式，CSM1和CSM2之间包含所有可能的CSM模式对应关系。
      </td>
  </tr>
</table>
