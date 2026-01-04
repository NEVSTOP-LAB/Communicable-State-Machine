# 可通信状态机 (CSM) 单元测试

## 📖 1 项目简介

### 1.1 项目背景
本项目利用 **JKI VI Tester** 工具包开发了一套单元测试，用于测试并验证 **可通信状态机 (CSM) 编程框架** 的功能正确性。该单元测试为 CSM 的长期维护提供了可靠的功能验证保障。  
单元测试已集成至 **Git CI/CD 平台**，通过自动化测试流程完成测试并生成报告，帮助 CSM 框架开发人员快速定位问题、维护和调试。

### 1.2 安装环境
- Windows 10 OS  
- NI LabVIEW 2017 (32-bit)  
- JKI VI Tester （[JKI VI Tester Toolkit for LabVIEW - VIPM 下载](https://www.ni.com/zh-cn/support/downloads/tools-network/download.vi-tester-unit-test-framework.html#378053）)）

---

## ⚙️ 2 功能描述

以下两张图片分别展示了LabVIEW项目结构与JKI VI Tester测试工具界面：  
<div align="left"> 
<img src="./Pictures/LabVIEW_Project.png" alt="LabVIEW Project" width="400"/> 
<img src="./Pictures/JKI_VI_Tester.png" alt="JKI VI Tester" width="400"/> </div>

单元测试按照 CSM 框架功能分类，主要包括以下测试类：

1. **消息 (Message)**  
   测试不同 CSM 模式间（普通模式、子模块模式、系统级模式、协作者模式、责任链模式、打包项目库模式）的消息传递。包括同步消息、异步有返回消息、异步无返回消息三类，验证消息是否能正确传达,消息携带参数，返回值以及错误信息是否能被正确携带。  
   具体测试项请见下方表格，代码详见 `testcase-CSMMessage.lvclass`。
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
      <td>CSM1发送同步消息给CSM2，CSM2返回正确的Response, CSM1进入Response Case 处理返回</td>
      <td>test1-SyncMessage.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>CSM1发送同步消息给CSM2，CSM2执行出错，CSM1进入Response Case, 携带了Response和错误信息</td>
      <td>test2-SycnMessageWithError.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>3</td>
      <td>CSM1使用API发送同步消息给CSM2，CSM2返回正确的Response, CSM1通过API拿到返回</td>
      <td>test3-SyncMessage_API.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>4</td>
      <td>CSM1使用API发送同步消息给CSM2，CSM2执行出错，CSM1通过API拿到Response和错误信息</td>
      <td>test4-SyncMessageWithError_API.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>5</td>
      <td>CSM1发送异步有返回消息给CSM2，CSM2返回正确的Response, CSM1进入Async Response 处理返回</td>
      <td>test5-AsyncMessageWithReply.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>6</td>
      <td>CSM1发送异步有返回消息给CSM2，CSM2执行出错，CSM1进入Async Response, 携带了Response和错误信息</td>
      <td>test6-AsyncMessageWithReplyWithError.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>7</td>
      <td>CSM1发送异步无返回消息给CSM2，检查确认CSM2执行，CSM1不处理返回</td>
      <td>test7-AsyncMessageWithoutReply.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>8</td>
      <td>CSM1使用API发送异步无返回消息给CSM，检查确认调用方异步执行，不处理返回</td>
      <td>test8-AsyncMessageWithoutReply_API.vi</td>
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


2. **参数 (Argument)**  
   在消息测试的基础上，进一步验证不同CSM模式间（普通模式、子模块模式、系统级模式、协作者模式、责任链模式、打包项目库模式）消息所携带的参数是否能正常传递。  
   具体测试项请见下方表格，代码详见 `testcase-CSMArgument.lvclass`。
<table>  
  <tr align="left">
      <td> 测试项序号 </td>
      <td> 测试项内容 </td>
      <td> 对应测试项VI </td>
      <td> 普通模式 </td>
  </tr>
  <tr align="left">
      <td>1</td>
      <td>创建预设的信息，检查HexString转换没有问题  1.检查一个嵌套的复杂Cluster; 2. 检查空字符串解析行为</td>
      <td>test1-HexStr conversion.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>创建预设的信息，检查ErrorString转换没有问题  1. Error 的转换; 2. No Error 的转换; 3. 空字符串行为</td>
      <td>test2-ErrorStr conversion.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>3</td>
      <td>创建预设的信息，检查SafeString转换没有问题 1. 空字符串行为，空字符串不做转换 2. 带有特殊字符的字符串行为；3. 有回车的行为</td>
      <td>test3-SafeStr conversion.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>4</td>
      <td>CSM - Argument Type.vi 能够正常的识别 HexString/ErrorString/SafeString 的Type</td>
      <td>集成于test1,2,3</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>5</td>
      <td>CSM1发送到CSM2的参数，会正常的被携带到TargetCSM中，即CSM中</td>
      <td>test4-ArgumentCanBeTakenToTargetModule.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  </tr>
    <tr>
      <td colspan="4">
          备注：CSM1和CSM2之间只测试普通模式，其他的模式在消息类中已经测试。
      </td>
  </tr>
</table>


3. **返回 (Response)**  
   验证不同模式间（普通模式、子模块模式、系统级模式、协作者模式、责任链模式、打包项目库模式）消息返回值的正确性，包括错误信息的传递，以及**宏消息**执行时的返回值在不同情况下的表现是否符合预期。  
   具体测试项请见下方表格，代码详见`testcase-CSMResponse.lvclass`。
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
      <td>普通的消息返回功能，已经在 包含Sync/Async/AsyncNoRep 的消息类测试过</td>
      <td>已测试</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>CSM1发送消息给CSM2，单条消息的返回，当产生错误后，会首先进入Error Handler, 但是依然会返回消息执行case的Response</td>
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
      <td>宏消息执行，会返回最后一条 SubMessage 的返回</td>
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
      <td>宏消息执行，包含PostStep的消息，会返回最后一条 SubMessage 的返回</td>
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
      <td>宏消息执行，如果SubMessage最后一条是发送消息到其他模块(同步/异步有返回/异步无返回)，最终返回值为空</td>
      <td>test4-MacroWithNonLocalSubMessages.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  </tr>
  <tr align="left">
      <td>6</td>
      <td>消息返回，同步消息API会携带执行模块的名称，在消息测试类的test3-SyncMessage_API.vi已测</td>
      <td>已测试</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>7</td>
      <td>Response/Async Response 中，可以获取Source Module 名称、消息名称、消息参数，已经在 Sync/Async/AsyncNoRep 消息的 testcases 中测试过</td>
      <td>已测试</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>8</td>
      <td>消息返回携带Error的功能，已经在 Sync/Async/AsyncNoRep 消息的 testcases 中测试过</td>
      <td>已测试</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr>
      <td colspan="9">
       ¹ 相关问题跟踪：  
          <a href="https://github.com/NEVSTOP-LAB/Communicable-State-Machine/issues/547">
          https://github.com/NEVSTOP-LAB/Communicable-State-Machine/issues/547
          </a>
          <br><br>
          备注：CSM模式包含普通模式、子模块模式、系统级模式、协作者模式、责任链模式、打包项目库模式，CSM1和CSM2之间包含所有可能的CSM模式对应关系。
      </td>
  </tr>
</table>


4. **广播 (Broadcast)**  
   测试不同模式间（普通模式、子模块模式、系统级模式、协作者模式、责任链模式、打包项目库模式）的信号广播（status）、中断广播（interrupt，高优先级，触发后优先处理）、状态变化广播（state change，CSM 独特的广播机制，支持更灵活的广播注册功能）的注册、反注册、选择性注册（发送方与接收方均可灵活决定优先级）。此外，还测试了非 CSM 框架调用广播功能的场景，扩展了跨框架的兼容性。  
   具体测试项请见下方表格，代码详见 `testcase-CSMBroadcast.lvclass`。
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


5. **全局日志 (Global Log)**  
   测试不同模式下（普通模式、子模块模式、系统级模式、协作者模式、责任链模式、打包项目库模式）的全局日志功能，包括模块创建与销毁、状态轮转、注册与反注册、同步与异步消息、广播及用户自定义事件。  
   CSM编程框架提供两种实现方式：全局日志队列 (Global Log Queue) 与用户事件 (Global Log User Event)，该类单元测试覆盖了以上两种实现方式的所有可能场景。  
   具体测试项请见下方表格，代码详见 `testcase-CSMGlobalLog.lvclass`。
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

6. **系统级模块 (System Level Module)**  
   测试 `CSM List Module.vi`API 功能，通过修改输入 Scope参数，识别包含或不包含系统级模块的场景。其它相关系统级模块功能已包含在消息（Message）类测试过。  
   具体测试项请见下方表格，代码详见 `testcase-CSMSystemLevelModule.lvclass`。
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
      <td>CSM List Module.vi 默认不能列出来 systemlevel module, 但是修改 scope 为 all 后，可以识别出来</td>
      <td>test1-SystemLevelModuleInListModuleAPI.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>SystemLevel的消息功能，已经在 Sync/Async/AsyncNoRep 消息的 testcases 中测试过</td>
      <td>已测试，见消息类测试</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
</table>


7. **子模块 (SubModule)**  
   测试 `CSM List SubModules.vi` API 功能，根据输入的模块/子模块名称，正确找出对应的一级或多级子模块（recursive）。  
   具体测试项请见下方表格，代码详见 `testcase-CSMSubModule.lvclass`。
<table>  
  <tr align="left">
      <td> 测试项序号 </td>
      <td> 测试项内容 </td>
      <td> 对应测试项VI </td>
      <td> 子模块模式 </td>
  </tr>
  <tr align="left">
      <td>1</td>
      <td>CSM List SubModules.vi 在 UI, UI.a1(不存在), UI.a2, UI.a1.b1, UI.a2.b2 存在的情况下，可以根据输入参数，正确的罗列出需要的 Submodule</td>
      <td>test1-ListSubModulesInDifferentSenarios.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
</table>

8. **协作者模式 (Worker Mode)**  
   测试多个协作者节点间的数据共享，确保外部写入的数据能被所有节点/模块通过 `CSM Attribute` 读取。其它相关功能已包含在消息（Message）类测试过。  
   具体测试项请见下方表格，代码详见 `testcase-CSMWorkerMode.lvclass`。
<table>  
  <tr align="left">
      <td> 测试项序号 </td>
      <td> 测试项内容 </td>
      <td> 对应测试项VI </td>
      <td> 协作者模式 </td>
  </tr>
  <tr align="left">
      <td>1</td>
      <td>节点之间共享相同的CSM Attribute 数据空间，外部写入数据，内部所有模块读取的数据相同</td>
      <td>test1-AllWorkerNodesShareTheSameData.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
</table>


9. **责任链模式 (Chain Mode)**  
   测试多个节点间的数据共享与消息处理，验证不同节点定义的允许消息 (Allowed Messages) 是否能正确处理与报错，并测试节点退出时的顺序。其它相关功能已包含在消息（Message）类测试过。  
   具体测试项请见下方表格，代码详见 `testcase-CSMChainMode.lvclass`。
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

10.  **管理接口 (Management API)**  
    测试 CSM 内置管理接口，如 `Module Status.vi`，验证其是否能正确读取模块信息（名称、节点数量等），并测试带有多种过滤功能的多态 VI。其它相关功能已包含在消息（Message）类测试过。  
    具体测试项请见下方表格，代码详见 `testcase-CSMManagementAPI.lvclass`。
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
      <td>模块实例化后，通过此接口可以读取模块的信息，测试所有不同的Mode是否能够读出，并且node个数是否正确，消息队列的数据个数可以不测</td>
      <td>test1-TestModuleStatusVI.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>创造一个复杂的消息列表，测试过滤功能只会过滤到对应的消息，测试多态VI里的每一个VI对应的过滤功能，不需要实际发送</td>
      <td>test2-TestFilterJKISMStringQueueVI.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
</table>


11. **非 CSM 调用支持接口 (Non-CSM Caller Support API)**  
    测试模块退出时生效的接口 API，如 `Module Exit Event.vi` 和 `Module Turns Invalid.vi`。其它相关功能已包含在消息（Message）类测试过。  
    具体测试项请见下方表格，代码详见 `testcase-CSMNonCSMCallerSupportAPI.lvclass`。
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
      <td>模块的退出能够触发Exit模块事件，协作者和责任链模式，在全部模块退出时才会触发此事件</td>
      <td>test1-testModuleExitEventAPI.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>模块的退出能够触发此状态修改，协作者和责任链模式，在全部模块退出时才会触发此事件</td>
      <td>test2-testModuleTurnsInvalidAPI.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
</table>


12. **CSM 循环支持 (CSM Loop Support)**  
    测试 CSM 框架支持的循环模式，验证模块在循环运行中既能接收外部消息并处理，又能向其他模块发送消息而不发生阻塞。  
    具体测试项请见下方表格，代码详见 `testcase-CSMAddonLoopSupport.lvclass`。
<table>  
  <tr align="left">
      <td> 测试项序号 </td>
      <td> 测试项内容 </td>
      <td> 对应测试项VI </td>
      <td> 普通模式 </td>
      <td> 子模块模式 </td>
      <td> 系统级模式 </td>
      <td> 打包项目库模式 </td>
  </tr>
  <tr align="left">
      <td>1</td>
      <td>Loop 模式运行中，1. 可以接收外部发送的同步消息并相应处理；2.也可以发送同步消息到其他模块；</td>
      <td>test1-ProcessSyncMessageInCSMLoop(SendAndReceive).vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>Loop 模式运行中，1. 可以接收外部发送的异步有返回消息并相应处理；2.也可以发送异步有返回消息到其他模块；	</td>
      <td>test2-ProcessAsyncMessageWithReplyInCSMLoop(SendAndReceive).vi
      </td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>3</td>
      <td>Loop 模式运行中，1. 可以接收外部发送的异步无返回消息并相应处理；2.也可以发送异步无返回消息到其他模块；	 </td>
      <td>test3-ProcessAsyncMessageWithoutReplyInCSMLoop(SendAndReceive).vi
      </td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr>
      <td colspan="7">
          备注：CSM 的协作者模式(worker) 和 责任链(chain)模式，是由多个运行的节点组成特殊的模块，发送的消息，并不能明确的让某个节点执行。当某节点使用此模式时，就不能明确的使用消息通知它停止循环，因此，不建议在协作者模式(worker) 和 责任链(chain)模式中使用CSM LOOP Support,固该类单元测试不包含协作者模式和责任链模式的测试。
      </td>
  </tr>
</table>



---

## 🛡️3 维护注意事项

为确保该单元测试的长期维护与稳定运行，请注意以下事项：

1. **广播测试顺序**  
   广播 (Broadcast) 测试类建议放置为最后一个类执行，因为其占用硬件资源较多，若测试不当可能影响后续测试。

2. **新增测试项规范**  
   如需添加新的测试项，请先检查对应测试类的最后一个测试项的尾部代码，如已禁用重新启动 CSM 模块，请先启用，再在最后添加新的测试项，并酌情决定是否在新增测试项结尾代码处重新启动模块。

3. **调试工具推荐**  
   建议使用 CSM 自带的调试工具 `Debug Console – DebugTool.vi`。调试人员可使用该工具在不同模块间手动发送消息、查看返回值，并通过监测日志性能参数（如日志处理速度、队列数量）进行高级调试。

---

## 📜4 许可证
本项目遵循 MIT License。

---

## 🔗 5 相关资源
- [NI LabVIEW 官方文档](https://www.ni.com/labview)  
- [CSM 框架 Wiki](https://github.com/NEVSTOP-LAB/Communicable-State-Machine)  
- [JKI VI Tester Toolkit](https://www.ni.com/zh-cn/support/downloads/tools-network/download.vi-tester-unit-test-framework.html#378053)  


