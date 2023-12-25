# 同步调用 (-@)

`同步消息`是`消息`的一种。CSM 发出`同步消息`后，将暂停`状态`变化，等待被调用方完成`消息`处理。`同步消息`通过 -@ 描述。
一个 CSM模块通过`同步消息`对另一个模块的调用，叫做`同步调用`。

## CSM `同步消息` 执行过程

``` mermaid
sequenceDiagram
Caller-CSM ->> Callee-CSM: API: DoSth >> Arguments -@ Callee-CSM
activate Callee-CSM
Note left of Caller-CSM: 卡在 Parse State 等待
Callee-CSM ->> Callee-CSM: 进入 API: DoSth 状态，参数为 Arguments

alt Callee-CSM 是一个不存在的模块
    Caller-CSM --> Caller-CSM: 进入 "Target Error" 状态 <br/> State Arguments 为 "API: DoSth"
end

alt Callee-CSM 超时未发出响应

    Caller-CSM --> Caller-CSM: 进入 "Target Timeout Error" 状态 <br/> State Arguments 为 "API: DoSth"
end

alt 正常返回
    Callee-CSM -->> Caller-CSM : Response >> RespArguments <- Callee-CSM
    deactivate Callee-CSM
    Caller-CSM --> Caller-CSM: 进入 "Response" 状态 <br/> 参数为 RespArguments
end

```

## 示例

### 底层模块

**"SubModule" 模块实现 "API: EchoArguments" 状态**

    功能：将参数作为响应返回。

![API: EchoArguments@Sub-Module](./_img/265700817-2070416f-2f2d-4ba9-831b-b3b22540607c.png)


### CSM 模块间的同步调用

**"MainModule" 模块通过 "API: EchoArguments >> xyz -@ SubModule"同步调用SubModule执行"API: EchoArguments" 状态**

按键中添加同步消息 "API: EchoArguments >> xyz -@ SubModule"
![Alt text](./_img/EchoArguments%20%20xyz%20-@%20SubModule.png)

在"Response"状态中处理同步消息的响应
![Alt text](./_img/Response@MainModule2.png)

**运行状态**

先运行 SubModule，再运行主模块，点击按钮。

![Alt text](./_img/SyncCall%20by%20CSM%20result.png)

### 非 CSM 的调用

可以使用 `AdvanceAPI\CSM Send Message and Wait for Reply.vi` 在非CSM的代码中调用 SubModule 的"API: EchoArguments" 状态

![Alt text](./_img/SyncCall%20with%20advanceAPI.png)