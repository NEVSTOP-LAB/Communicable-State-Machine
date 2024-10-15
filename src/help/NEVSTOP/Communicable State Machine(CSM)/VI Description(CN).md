# CSM API

## ģ��(Templates)

> [!NOTE] CSM Name ����
> - CSM ģ������Ӧ����Ψһ�ģ�����ᵼ�� CSM ���� "Critical Error" ״̬��
> - �������Ϊ ""����ʹ�� UUID ��Ϊģ�����ơ���ģ�鱻���Ϊ����ģʽ�����������ģ���б��С�
> - ��������� '#' ��β�����ģ�齫�ڹ���ģʽ�����С�������ͬ���Ƶ�ģ�齫����ͬһ��Ϣ���С��κ��ⲿ��Ϣ��������һ��ģ�鴦��ȡ�����ĸ�ģ����С�
>

> [!NOTE] CSM ��ʼ��״̬
> - Ĭ��ֵ�� JKISM ״̬������һ��, �� "Macro: Initialize"��
> - ͨ�������޸Ĵ�״̬����Ϊ�����Ŀ����Ϊ�˷����ⲿ�����޸ĳ�ʼ��״̬��
>

### CSM Module Template.vi

���ڴ����������û������ CSM ģ���ģ��

> Ref: CSM Name ����
> Ref: CSM ��ʼ��״̬

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid)</b>: CSM ģ������
- <b>Init State("Macro: Initialize")</b>: CSM ��ʼ��״̬, Ĭ��Ϊ "Macro: Initialize"

### CSM User Interface(UI) Module Template.vi

���ڴ��������û������ CSM ģ���ģ�壬ģ���а����û��¼��ṹ������Ӧ�û�������

> Ref: CSM Name ����
> Ref: CSM ��ʼ��״̬

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid)</b>: CSM ģ������
- <b>Init State("Macro: Initialize")</b>: CSM ��ʼ��״̬, Ĭ��Ϊ "Macro: Initialize"

### CSM Module Template - Tiny.vi

���ڴ����������û������ CSM ģ���ģ�塣��ģ��Ĵ���ȽϽ��ա�

> Ref: CSM Name ����
> Ref: CSM ��ʼ��״̬

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid)</b>: CSM ģ������
- <b>Init State("Macro: Initialize")</b>: CSM ��ʼ��״̬, Ĭ��Ϊ "Macro: Initialize"

### CSM User Interface(UI) Module Template - Tiny.vi

���ڴ��������û������ CSM ģ���ģ�壬ģ���а����û��¼��ṹ������Ӧ�û���������ģ��Ĵ���ȽϽ��ա�

> Ref: CSM Name ����
> Ref: CSM ��ʼ��״̬

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid)</b>: CSM ģ������
- <b>Init State("Macro: Initialize")</b>: CSM ��ʼ��״̬, Ĭ��Ϊ "Macro: Initialize"

## ���Ĺ��� (Core Functions)

> [!NOTE] CSM ��Ϣ��ʽ����
> [CSM ��Ϣ�ַ���(CSM Message)] >> [����(Arguments)] [��Ϣ���ͷ���(Message Symbol) ->|,->,-@] [Ŀ��ģ��(Target Module)] // [ע��(Comments)]
> - CSM ��Ϣ�ַ���(CSM Message): CSM����Ϣ�������԰���CSM�ؼ��ֺͻ��з�
> - ">>": CSM ��Ϣ�ַ���(CSM Message) �� ����(Arguments) �ķָ���
> - ����(Arguments): CSM ��Ϣ�Ĳ����������԰���CSM�ؼ��ֺͻ��з�
> - ��Ϣ���ͷ���(Message Symbol): ��Ϣ���ͷ��ţ����ڱ�ʶ��Ϣ���ͣ�����ͬ������(-@)���첽����(->)���첽���ȴ�����(->|)��
> - Ŀ��ģ��(Target Module): ��Ϣ���͵�Ŀ��ģ�飬���Ϊ�գ����ʾ��Ϣ�ᱻ��ģ�鴦��Ϊ��ʱ����Ϣ���ͷ���Ҳ���ܴ���
> - ע��(Comments): ע����Ϣ�����ᱻ����
>

> [!NOTE] CSM ������Ϣ��ʽ����
> [CSM �����ַ���(CSM Operation)] >> [����(Arguments)] -> <[��������(operation)]> // [ע��(Comments)]
> TODO
>

### Parse State Queue++.vi

���� CSM ״̬���У����ؽ�ִ�е���һ����ǰ״̬����������Ϣ��

-- <b>����ؼ�</b> --
- <b>State Queue</b>: ����״̬���б����ӵ������롣��Ӧ������ CSM ����λ�Ĵ�����
- <b>Previous Error</b>: ���� CSM �Ĵ���ر����ӵ������롣����������󲢳����ڴ������ϣ���ǰ״̬��������� "Error Handler" ״̬��
- <b>Name("" to use uuid)</b>: CSM ģ������
- <b>Response Timeout(5000ms)</b>:ͬ������ʱ����Ӧ��ʱ���ã�Ĭ�� 5000 ms.
- <b>Dequeue Timeout(0ms)</b>: ��� CSM ��Ϣ���еĳ�ʱ���ã�Ĭ��Ϊ0�������еȴ���
- <b>Response Arguments</b>: ������һ��״̬����Ӧ��������Ӧ�������� CSM ����λ�Ĵ��������ڴ����ⲿ���õķ���ֵ��

-- <b>����ؼ�</b> --
- <b>Remaining States</b>:  ƴ�Ӻ������״̬������
- <b>Arguments</b>: ���ؿ����ڵ�ǰ״̬�ַ�����ʹ�õ��κβ�������Щ����λ�ڡ�>>���ַ�֮��<b>ע�⣺</b>�����������ð����κβ��ɴ�ӡ���ַ������绻�з���س�����
- <b>Current State</b>: ��ִ�е���һ����ǰ״̬
- <b>Name Used</b>: �������CSMģ���ʵ������
- <b>Argument - State</b>: ����� CSM ���������״̬���˲�����ʾ��״̬��ǰ״̬
- <b>From Who</b>: ���<b>Current State</b> �����ⲿ���͵ģ�������ԴCSMģ�����ơ�

### Build State String with Arguments++.vi

�� VI ���ڹ��� CSM ��Ϣ�ַ���(����״̬��������Ŀ��ģ�顢��Ϣ���͵���Ϣ)���Ա㷢�͵����� CSM ģ�顣

> [!NOTE]
> �� VI ֻ�ܲ���ƴ��"�첽���ȴ�����"���첽��Ϣ�����ں���������أ�����ʹ�� Build Message with Arguments++.vi ����� VI��
>

- <B>����:</B>

���͸�����״̬��ʱ, <b>Target Module ("")</b> Ӧ��Ϊ��.

      If State = A ����û�в���, ��ô <b>State with Arguments</b> = A
      If State = A , Arguments = B ��ô <b>State with Arguments</b> = A >> B

�ڷ��͸�����CSM�������, ���� <b>Target Module ("")</b> �������� "Target"

- ͬ�����ã����͵���Ϣ��ȴ�����:

      If State = A ����û�в���, ��ô <b>State with Arguments</b> = A -@target
      If State = A , Arguments = B ��ô <b>State with Arguments</b> = A >> B -@target

- �첽���ã�������Ϣ�󣬽�����"Async Message Posted" ״̬�����ⲿģ�鴦����Ϻ󣬱���ģ�齫�յ� "Async Response" ��Ϣ:

      If State = A ����û�в���, ��ô <b>State with Arguments</b> = A ->target
      If State = A , Arguments = B ��ô <b>State with Arguments</b> = A >> B ->target

-- <b>����ؼ�</b> --
- <b>State</b>: ״̬����Ϣ�����ַ���
- <b>Arguments ("")</b>: <b>State</b> �Ĳ���
- <b>Target Module ("")</b>: ����Ϣ���͵�Ŀ�� CSM ģ������
- <b>Sync-Call(-@) T By Default/Async-Call(->) F</b>: ͬ����������"TRUE"; �첽��������"FALSE"

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>: ƴ�����ɵ� CSM ��Ϣ�ַ���

### Build Message with Arguments++.vi

�� VI ���ڹ��� CSM ��Ϣ�ַ����������ַ�����

> [!NOTE] ��Ϣƴ��API
> ������API����ֱ�ӷ�����Ϣ��ֻ��ƴ����Ϣ�ַ�������Ҫ���ַ������� CSM ��״̬���к��� Parse State Queue++.vi �з�����Ϣ��ִ�в�����
> ����Ϥ CSM ���������£����Բ�ʹ�ô���API, ֱ�����ַ����м����Ӧ����Ϣ�ַ����������ַ�����
>

��̬VI(Polymorphic VI)ѡ��:
- Build Message with Arguments(Auto Check).vi
- Build Asynchronous Message with Arguments.vi
- Build No-Reply Asynchronous Message with Arguments.vi
- Build Synchronous Message with Arguments.vi
- Build Interrupt Status Message.vi
- Build Normal Status Message.vi
- Build Register Status Message.vi
- Build Unregister Status Message.vi
- CSM - Replace Substitution Marks in Messages.vi

#### Build Message with Arguments(Auto Check).vi

ƴ������ CSM ��Ϣ�ַ���, ��Ϣ�����ͷ��Ż��������� <b>State with Arguments</b> �Զ���⡣

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: CSM ״̬�ַ��������԰���������Ŀ��ģ����Ϣ��
- <b>Arguments ("")</b>: ������Ϣ��<b>State with Arguments</b>�а����Ĳ������ᱻ�滻��
- <b>Target Module ("")</b>: Ŀ��ģ�顣Ϊ��ʱ, ��ʹ�� <b>State with Arguments</b> �е�Ĭ��ģ�顣

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>: ƴ�����ɵ� CSM ��Ϣ�ַ���

#### Build Synchronous Message with Arguments.vi

ƴ������ CSM ͬ����Ϣ�ַ�������Ϣ���ͷ���Ϊ "-@", ����:

      Message >> Arguments -@ Target

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: CSM ״̬�ַ�����
- <b>Arguments ("")</b>: ������Ϣ��<b>State with Arguments</b>�а����Ĳ������ᱻ�滻��
- <b>Target Module ("")</b>: Ŀ��ģ�顣Ϊ��ʱ, ��ʹ�� <b>State with Arguments</b> �е�Ĭ��ģ�顣

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>: ƴ�����ɵ� CSM ��Ϣ�ַ���

#### Build Asynchronous Message with Arguments.vi

ƴ�����ɵ� CSM �첽��Ϣ�ַ�������Ϣ���ͷ���Ϊ "->", ����:

      Message >> Arguments -> Target

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: CSM ״̬�ַ�����
- <b>Arguments ("")</b>: ������Ϣ��<b>State with Arguments</b>�а����Ĳ������ᱻ�滻��
- <b>Target Module ("")</b>: Ŀ��ģ�顣Ϊ��ʱ, ��ʹ�� <b>State with Arguments</b> �е�Ĭ��ģ�顣

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>: ƴ�����ɵ� CSM ��Ϣ�ַ���

#### Build No-Reply Asynchronous Message with Arguments.vi

ƴ�����ɵ� CSM �첽��Ϣ�ַ�������Ϣ���ͷ���Ϊ "->|", ����:

      Message >> Arguments ->| Target

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: CSM ״̬�ַ�����
- <b>Arguments ("")</b>: ������Ϣ��<b>State with Arguments</b>�а����Ĳ������ᱻ�滻��
- <b>Target Module ("")</b>: Ŀ��ģ�顣Ϊ��ʱ, ��ʹ�� <b>State with Arguments</b> �е�Ĭ��ģ�顣

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>: ƴ�����ɵ� CSM ��Ϣ�ַ���

#### Build Normal Status Message.vi

ƴ����ͨ״̬��Ϣ�ַ�������Ϣ��ʽ����:

      Status >> Arguments -><status>
      //�����ַ���Ϊ��Ч������ֻ��Ϊ�˸����׼�����䣬�����˸���Ĳ����ַ�
      Status >> Arguments -><broadcast>
      Status >> Arguments -><all>

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: CSM ��ͨ״̬��Ϣ�ַ�����
- <b>Arguments ("")</b>: ������Ϣ��<b>State with Arguments</b>�а����Ĳ������ᱻ�滻��

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>:ƴ�����ɵ� CSM ��Ϣ�ַ���

#### Build Interrupt Status Message.vi

ƴ���ж�״̬��Ϣ����Ϣ��ʽ����:

      Status >> Arguments -><interrupt>

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: CSM �ж�״̬��Ϣ�ַ�����
- <b>Arguments ("")</b>: ������Ϣ��<b>State with Arguments</b>�а����Ĳ������ᱻ�滻��

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>:ƴ�����ɵ� CSM ��Ϣ�ַ���

#### Build Register Status Message.vi

ƴ��ע��״̬������Ϣ�ַ�������Ϣ��ʽ����:

      //[source-state]@[source-module] >> [response-message]@[response-module] -><register>
      status @ Source >> API @ Target -><register>

����: ����������ģ������������Ϣ���󶨵�������ģ��Ŀ�ʼ����API

      //������ģ������������Ϣ���󶨵�������ģ��Ŀ�ʼ����API
      DownloadFinished@Downloader >> StartPlay@Player -><register>
      //��������ģ����ִ����Ϣʱ��Player ��ȱʡ
      DownloadFinished@Downloader >> StartPlay -><register>
      //���ж��ģ�鶼�����������Ϣ������ʹ�� * ��ʾ����ģ�����Ϣ���󶨵�������ģ��Ŀ�ʼ����API
      DownloadFinished@* >> StartPlay@Player -><register>

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>Target CSM</b>: ����״̬�� CSM ģ������
- <b>Source CSM(* as Default)</b>: ����״̬�� CSM ģ������
- <b>Status</b>: ע���״̬
- <b>API (if "", same as Status)</b>: ����״̬ģ����Ӧ�� API ����

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>:ƴ�����ɵ� CSM ��Ϣ�ַ���

#### Build Unregister Status Message.vi

ƴ��ȡ��ע��״̬������Ϣ�ַ�������Ϣ��ʽ���£�

      //[source-state]@[source-module] >> [response-message]@[response-module] -><unregister>
      status @ Source >> API @ Target -><unregister>

������ ȡ��������ģ������������Ϣ���󶨵�������ģ��Ŀ�ʼ����API

      //������ģ������������Ϣ���󶨵�������ģ��Ŀ�ʼ����API
      DownloadFinished@Downloader >> StartPlay@Player -><unregister>
      //��������ģ����ִ����Ϣʱ��Player ��ȱʡ
      DownloadFinished@Downloader >> StartPlay -><unregister>

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>Target CSM</b>: ����״̬�� CSM ģ������
- <b>Source CSM(* as Default)</b>: ����״̬�� CSM ģ������
- <b>Status</b>: ע���״̬

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>:ƴ�����ɵ� CSM ��Ϣ�ַ���

#### CSM - Replace Substitution Marks in Messages.vi

Ϊ���ܹ������ı༭���� CSM ��Ϣ�ַ������ṩ�����滻��ǵĹ��ܡ���4����ǿ����滻��
- <param> ��ǣ� ͨ����ʾ��ͬ�Ĳ���
- <target> ��ǣ� ͨ����ʾ��ͬ��Ŀ��
- <1> ��ǣ���ʾ�Զ�����1
- <2> ��ǣ���ʾ�Զ�����2

���磺���߶� <target> �������ַ���Ϊ "DAQDevice"��<b>States with Replace Token</b> �ַ���Ϊ��

```
Initialize -@ <target>
Configure -@ <target>
Read -@ <target>
Close -@ <target>
```

<b>States</b>���Ϊ��

```
Initialize -@ DAQDevice
Configure -@ DAQDevice
Read -@ DAQDevice
Close -@ DAQDevice
```

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>States with Replace Token</b>: �����滻��ǵ� CSM ״̬�ַ���
- <b><param></b>: <param> ��ǣ� ͨ����ʾ��ͬ�Ĳ���
- <b><target></b>: <target> ��ǣ� ͨ����ʾ��ͬ��Ŀ��
- <b><1></b>: �Զ�����1
- <b><2></b>: �Զ�����2

-- <b>����ؼ�</b> --
- <b>States</b>: �滻��

### CSM - Broadcast Status Change.vi

��ϵͳ�㲥״̬���ġ���ע��״̬�� CSM ģ�齫���յ�״̬���ġ����磺

      //�㲥״̬����
      Status >> Arguments -><broadcast>

> [!NOTE] CSM ��״̬���в���API
> ������ API ����ֱ�ӷ�����Ϣ��ֻ��ƴ����Ϣ�ַ������� Parse State Queue++.vi �з�����Ϣ��ִ�в�����
> �� ��Ϣƴ��API ��ͬ���ǣ����� API ����� CSM ��״̬�����ַ����������룬�൱����״̬�����в�����Ϣ��
>

-- <b>����ؼ�</b> --
- <b>Status with Arguments</b>: �����㲥��״̬��������֧�ֶ���, ÿ��״̬��������� "-><broadcast>"
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>Broadcast(T)</b>: �����Ƿ�㲥�Ŀ�������

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ƴ�Ӻ������״̬��������

### Add State(s) to Queue By BOOL++.vi

�� CSM ��Ϣ�ַ������� CSM ��Ϣ�����С��ṩ�� TRUE/FALSE ����״̬���ַ���ѡ��ܹ�����ʹ�������ṹ����ߴ���ɶ��ԣ���߱��Ч�ʡ�

> Ref: CSM ��״̬���в���API

��̬VI(Polymorphic VI)ѡ��:
- add State(s) to Queue By BOOL(Element).vi
- add State(s) to Queue By BOOL(Array Left).vi
- add State(s) to Queue By BOOL(Array Right).vi
- add State(s) to Queue By BOOL(Array All).vi

#### Add State(s) to Queue By BOOL(Element).vi

�� CSM ��Ϣ�ַ������� CSM ��Ϣ�����С��ṩ�� TRUE/FALSE ����״̬���ַ���ѡ��ܹ�����ʹ�������ṹ����ߴ���ɶ��ԣ���߱��Ч�ʡ�

> Ref: CSM ��״̬���в���API

-- <b>����ؼ�</b> --
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>TRUE("")</b>: <b>Condition</b> Ϊ True ʱ�����״̬�ַ���
- <b>FALSE("")</b>: <b>Condition</b> Ϊ False ʱ�����״̬�ַ���
- <b>Condition</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
- <b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>��ǰ�ˡ����ΪFalse���������ӵ�β����

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ƴ�Ӻ������״̬��������

#### Add State(s) to Queue By BOOL(Array Left).vi

�� CSM ��Ϣ�ַ������� CSM ��Ϣ�����С��ṩ�� TRUE/FALSE ����״̬���ַ���ѡ��ܹ�����ʹ�������ṹ����ߴ���ɶ��ԣ���߱��Ч�ʡ�

> Ref: CSM ��״̬���в���API

-- <b>����ؼ�</b> --
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>TRUE("")</b>: <b>Condition</b> Ϊ True ʱ�����״̬�ַ���
- <b>FALSE("")</b>: <b>Condition</b> Ϊ False ʱ�����״̬�ַ���
- <b>Condition</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
- <b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>��ǰ�ˡ����ΪFalse���������ӵ�β����

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ƴ�Ӻ������״̬��������

#### Add State(s) to Queue By BOOL(Array Right).vi

�� CSM ��Ϣ�ַ������� CSM ��Ϣ�����С��ṩ�� TRUE/FALSE ����״̬���ַ���ѡ��ܹ�����ʹ�������ṹ����ߴ���ɶ��ԣ���߱��Ч�ʡ�

> Ref: CSM ��״̬���в���API

-- <b>����ؼ�</b> --
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>TRUE("")</b>: <b>Condition</b> Ϊ True ʱ�����״̬�ַ���
- <b>FALSE("")</b>: <b>Condition</b> Ϊ False ʱ�����״̬�ַ���
- <b>Condition</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
- <b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>��ǰ�ˡ����ΪFalse���������ӵ�β����

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ƴ�Ӻ������״̬��������

#### Add State(s) to Queue By BOOL(Array All).vi

���ݸ����ȼ���Bool���룬��VI����TRUE/False��ʣ��״̬������״̬��
High Priority��������Ƿ���ʣ��״̬֮ǰ��֮������TRUE��False�ַ�����
Bool�������Ҫ���ӵ��ַ�����TRUE����False��

> Ref: CSM ��״̬���в���API

-- <b>����ؼ�</b> --
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>TRUE("")</b>: <b>Condition</b> Ϊ True ʱ�����״̬�ַ���
- <b>FALSE("")</b>: <b>Condition</b> Ϊ False ʱ�����״̬�ַ���
- <b>Condition</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
- <b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>��ǰ�ˡ����ΪFalse���������ӵ�β����

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ƴ�Ӻ������״̬��������

## ���� (Arguments)

> [!NOTE] CSM ��Ϣ�ؼ���
> ����: '->','->|','-@','-&','<-", "\r", "\n", "//", ">>", ">>>", ">>>>", ";", ","
>

> [!NOTE] CSM HEXSTR ��ʽ����
> Ϊ���� CSM �����д����κ��������ͣ�CSM Ĭ���ṩ��һ�� ��Ϊ HEXSTR �Ĳ�����ʽ�����ڴ����κ��������͡�
> HEXSTR���� LabVIEW ������������ת��Ϊ���壬Ȼ�󽫴˱�����ڴ��ʽ��ʾΪʮ�������ַ������Ա��� CSM �����д��ݡ�
> HEXSTR���԰�ȫ������״̬�������������ƻ� CSM ��Ϣ�ַ����Ľ�����
>

> [!NOTE] CSM ERROR ����
> LabVIEW �������Ϣͨ�������س������ҿ��ܰ��� CSM ����Ϣ�ؼ��֣������ͨ������ֱ����Ϊ CSM �������ݡ�
> ��Ȼ���Խ��������Ϣת��Ϊ HEXSTR ��ʽ�������������߱��ɶ��ԣ��� log �в���ֱ�۵Ķ�ȡ��Ϣ��
> ���Ϊ���� CSM �����д��� LabVIEW ������Ϣ, �ṩ��һ����׼�� CSM ���������ʽ�����԰�ȫ������״̬�������������ƻ� CSM ��Ϣ�ַ����Ľ�����
> ���ĸ�ʽΪ: "[Error: error-code] error-description-As-safe-argument-string"
>

### CSM - Keywords.vi

CSM ��Ϣ�еĹؼ����б�

> Ref: CSM ��Ϣ�ؼ���

-- <b>����ؼ�</b> --
- <b>keywords</b>: CSM �ؼ����б�
- <b>keywords(%Hex format)</b>: CSM �ؼ����б��%Hex��ʽ

### CSM - Make String Arguments Safe.vi

�������ַ����е� CSM �ؼ���ת��Ϊ%Hex��ʽ, ��֤��Ӱ�� CSM ��Ϣ�ַ���������

> Ref: CSM ��Ϣ�ؼ���

-- <b>����ؼ�</b> --
- <b>Argument String</b>: �ַ�������

-- <b>����ؼ�</b> --
- <b>Safe Argument String</b>: ��ȫ���ַ�������

### CSM - Revert Arguments-Safe String.vi

����ȫ���ַ��������е� %Hex��ʽ�� CSM �ؼ���ת������ͨ��ʽ��

> Ref: CSM ��Ϣ�ؼ���

-- <b>����ؼ�</b> --
- <b>Safe Argument String</b>:  ��ȫ���ַ�������

-- <b>����ؼ�</b> --
- <b>Origin Argument String</b>: �ַ�������

### CSM - Convert Data to HexStr.vi

�� LabVIEW ������������ת��ΪΪ HEXSTR ��ʽ�����ַ�����

> Ref: CSM HEXSTR ��ʽ����

-- <b>����ؼ�</b> --
- <b>Variant</b>: LabVIEW ���ݣ�ͨ������֧��������������

-- <b>����ؼ�</b> --
- <b>HEXSTR</b>: CSM HEXSTR ��ʽ����

### CSM - Convert HexStr to Data.vi

��ʮ�������ַ�������ת���ر������ݡ�

> Ref: CSM HEXSTR ��ʽ����

-- <b>����ؼ�</b> --
- <b>HEXSTR</b>: CSM HEXSTR ��ʽ����

-- <b>����ؼ�</b> --
- <b>Variant</b>: LabVIEW ���ݣ�ͨ������֧��������������

### CSM - Convert Error to Argument.vi

�� LabVIEW �����ת��Ϊ CSM ���������ʽ��

> Ref: CSM ERROR ����

-- <b>����ؼ�</b> --
- <b>error</b>: LabVIEW �����

-- <b>����ؼ�</b> --
- <b>Argument</b>: CSM ���������ʽ

### CSM - Convert Argument to Error.vi

�� CSM ���������ʽת��Ϊ LabVIEW ����ء�

> Ref: CSM ERROR ����

-- <b>����ؼ�</b> --
- <b>Argument</b>: CSM ���������ʽ

-- <b>����ؼ�</b> --
- <b>error</b>: LabVIEW �����

## ����ӿ�(Management API)

> [!NOTE] CSM ����ģʽ
> 1. Stand-alone: ��������ģʽ��������ģ�����ƣ����Զ�����һ�����ID, ���ڱ�ʶģ�顣
> 2. CSM: ��ͨ CSM ģ�顣
> 3. Action Worker: ������ģʽ����ģ�����ƺ���ӡ�#�����Ա�Ǵ�ģ��Ϊ�����ߣ����������ͬ���Ƶ����������߹�����ͬ����Ϣ���С�
> 4. Chain Node: ��ʽ�ڵ㡣��ģ�����ƺ���ӡ�$�����Ա�Ǵ�ģ��Ϊ��ʽ�ڵ㣬ͬһ�����ϵ���Ϣ�������δ��ݣ�ֱ��ĳ���ڵ㴦����Ϣ��
>

### CSM - Start Async Call.vi

�첽����ģ������VIƬ��

### CSM - Synchronized Call.vi

ͬ������ģ������VIƬ��

### CSM - Module VI Reference.vi

ͨ�� ���� "VI Reference" ͬ����Ϣ����ѯ��ȡ CSM ģ��� VI ���á�

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������
- <b>Current Module("" to generate a ID)</b>: ��ѯCSMģ��ı��, Ϊ��ʱ��������һ��Ψһ��ID
- <b>Response Timeout(5000ms)</b>: ͬ����Ϣ��ʱʱ�䣬Ĭ�� 5000 ms

-- <b>����ؼ�</b> --
- <b>CSM Module VIRef</b>: CSM ģ��� VI ����

### CSM - Check If Module Exists.vi

��� CSM ģ���Ƿ����

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������

-- <b>����ؼ�</b> --
- <b>Exist?</b>: ����ģʽ�Ƿ����
- <b>CSM Name(dup)</b>: ���� <b>CSM Name</b>

### CSM - List Modules.vi

�г����л��CSMģ�顣

> Ref: CSM ����ģʽ

-- <b>����ؼ�</b> --
- <b>Exclude Standalone CSM(T)</b>: �Ƿ������������ģʽ��ģ��

-- <b>����ؼ�</b> --
- <b>Module Names</b>: CSM ģ�������б�

### CSM - Module Status.vi

��ȡCSMģ���״̬������������ģʽ����������������Ϣ�����еĴ�������Ϣ������

> Ref: CSM ����ģʽ

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������.

-- <b>����ؼ�</b> --
- <b>Mode</b>: ����ģ��Ĺ���ģʽ
- <b>#As Worker</b>: ������ģʽ�£���ģ��Ĺ���������
- <b>#msg to be processed</b>: CSM��Ϣ�����еĴ�������Ϣ����
- <b>CSM Name(dup)</b>: ���� <b>CSM Name</b>

### CSM - Get New State Notifier Event.vi

��ȡ�û��¼���������ڰ����¼��ṹ�� CSM ģ���С������¼��ṹ�� CSM ģ�飬ͨ�������¼��ṹ���ȴ�������¼������յ��µ���Ϣʱ�ж����¼��ṹ�еĵȴ�������ִ�С�

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid) in</b>: CSM ģ������

-- <b>����ؼ�</b> --
- <b>New State Notifier Event</b>: �û��¼�������������յ���Ϣʱ��ʹ��CSMģ���ж����¼��ṹ�еĵȴ�

## �ⲿ�����ӿ�(External API)

### CSM - Wait for Module to Be Alive.vi

��ָ���ĳ�ʱʱ���ڵȴ� CSM ģ�����ߡ�

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������
- <b>Wait(5000ms)</b>: �ȴ���ʱʱ�䣬Ĭ��Ϊ5s

-- <b>����ؼ�</b> --
- <b>CSM Name(dup)</b>: CSM ģ������
- <b>Waited(ms)</b>: �ѵȴ���ʱ��

### CSM - Wait for All Modules to be Alive.vi

��ָ���ĳ�ʱʱ���ڵȴ�һ�� CSM ģ��ȫ�����ߡ�

-- <b>����ؼ�</b> --
- <b>CSM Names</b>: CSM ģ������
- <b>Timeout(5000ms)</b>: �ȴ���ʱʱ�䣬Ĭ��Ϊ5s

-- <b>����ؼ�</b> --
- <b>CSMs Left</b>: ��ʱ��δ���ߵ� CSM ģ��
- <b>waited(ms)</b>: �ѵȴ���ʱ��

### CSM - Wait for All Modules to Exit.vi

��ָ���ĳ�ʱʱ���ڵȴ�һ�� CSM ģ��ȫ�����ߣ�ͨ�����ڳ����˳���

-- <b>����ؼ�</b> --
- <b>CSM Names</b>: CSM ģ������
- <b>Timeout(5000ms)</b>: �ȴ���ʱʱ�䣬Ĭ��Ϊ5s

-- <b>����ؼ�</b> --
- <b>CSMs Left</b>: ��ʱ��δ���ߵ� CSM ģ��
- <b>waited(ms)</b>: �ѵȴ���ʱ��

### CSM - Post Message.vi

���Ͳ������ص��첽��Ϣ��CSM����Ϣ���ͺ����ִ��֮��Ĵ��롣

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������
- <b>State</b>: ��Ϣ�ַ���
- <b>Arguments("")</b>: ��Ϣ����
- <b>Current Module("" to generate a ID)</b>:��ǰģ�����ƣ���û������ʱ������һ����ʱID�����ڵ����ж�λ�á�

### CSM - Wait and Post Message.vi

���Ͳ������ص��첽��Ϣ��CSM����Ϣ���ͺ����ִ��֮��Ĵ��롣CSMģ��δ����ʱ����ȴ�ָ����ʱ�䡣

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������
- <b>State</b>: ��Ϣ�ַ���
- <b>Arguments("")</b>: ��Ϣ����
- <b>Current Module("" to generate a ID)</b>: ��ǰģ�����ƣ���û������ʱ������һ����ʱID�����ڵ����ж�λ�á�
- <b>Wait(5000ms)</b>: �ȴ���ʱʱ�䣬Ĭ��Ϊ5s

### CSM - Send Message and Wait for Reply.vi

����ͬ����Ϣ��CSM���ȴ�������Ϣ����ʱδ��ȡ��������Ϣ�������س�ʱ����

-- <b>����ؼ�</b> --
- <b>Target Module</b>: Ŀ�� CSM ģ������
- <b>State</b>: ��Ϣ�ַ���
- <b>Arguments("")</b>: ��Ϣ����
- <b>Response Timeout(5000ms)</b>: �ȴ����صĳ�ʱ���ã�Ĭ�� 5000ms.

-- <b>����ؼ�</b> --
- <b>Response</b>: ���ص���Ӧ

### CSM - Wait and Send Message for Reply.vi

����ͬ����Ϣ��CSM���ȴ�������Ϣ����ʱδ��ȡ��������Ϣ�������س�ʱ����CSMģ��δ����ʱ����ȴ�ָ����ʱ�䡣

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������
- <b>State</b>: ��Ϣ�ַ���
- <b>Arguments("")</b>: ��Ϣ����
- <b>Response Timeout(5000ms)</b>: �ȴ����صĳ�ʱ���ã�Ĭ�� 5000ms.
- <b>Current Module("" to generate a ID)</b>: ��ǰģ�����ƣ���û������ʱ������һ����ʱID�����ڵ����ж�λ�á�
- <b>Wait(5000ms)</b>: �ȴ���ʱʱ�䣬Ĭ��Ϊ5s

-- <b>����ؼ�</b> --
- <b>Response</b>: ���ص���Ӧ
- <b>Source CSM</b>: ���ص���Ӧ����Դ CSM ģ������

### CSM - Run Script.vi

���� CSM �ű�������һ���Ե�ִ�ж�����Ϣָ�

-- <b>����ؼ�</b> --
- <b>CSM Scripts</b>: �����еĽű�
- <b>Response Timeout(5000ms)</b>: �ȴ����صĳ�ʱ���ã�Ĭ�� 5000ms.
- <b>Continue If Error?(F)</b>: �����������Ƿ����ִ��
- <b>Current Module("" to generate a ID)</b>: ��ǰģ�����ƣ���û������ʱ������һ����ʱID�����ڵ����ж�λ�á�
- <b>Wait(5000ms)</b>: �ȴ���ʱʱ�䣬Ĭ��Ϊ5s

-- <b>����ؼ�</b> --
- <b>Scripts Left</b>: ʣ��δִ�еĽű�

### CSM - Status Change Event

��ȡ CSM ״̬�����¼������

-- <b>����ؼ�</b> --
- <b>CSM Module</b>: CSM ģ������

-- <b>����ؼ�</b> --
- <b>Status Change Event</b>: CSM ״̬�����¼����

### CSM - Destroy Status Change Event.vi

�ͷ� CSM ״̬�����¼������

-- <b>����ؼ�</b> --
- <b>Status Change Event</b>: CSM ״̬�����¼����

### CSM - Module Exit Event.vi

��ȡ CSM ģ���˳��¼����

-- <b>����ؼ�</b> --
- <b>CSM Module</b>: CSM ģ������

-- <b>����ؼ�</b> --
- <b>CSM Exit Event</b>: CSM ģ���˳��¼����

## ״̬���Ĺ���(Status Registration)

### CSM - Register Status Change.vi

ע���Խ�������CSMģ��״̬���ĵ�֪ͨ�����δ���� ��Response Message�� ������Ϊ�գ���ʹ����ͬ��<b>Status</b> ������Ϊ��Ӧ��Ϣ��

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������.
- <b>Source CSM Name ('*' as Default)</b>: ����״̬��CSMģ�顣������ʹ�á�*������ʾ����������ͬ״̬��ģ�顣
- <b>Status</b>: ״̬�ַ���
- <b>API (if "", same as Status)</b>: ע������״̬�����仯�������յ�����Ϣ��
- <b>Priority(T:As Status,F:As Interrupt)</b>: �����Ӧ��ϢΪFalse��������뵽״̬���е�ǰ�棻���򣬽��丽�ӵ����е�β����

-- <b>����ؼ�</b> --
- <b>CSM Name(dup)</b>: ���� <b>CSM Name</b>

### CSM - Unregister Status Change.vi

ȡ��ע������ CSM ģ��״̬���ĵ�֪ͨ��

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������.
- <b>Source CSM Name</b>: ����״̬��CSMģ�顣������ʹ�á�*������ʾ����������ͬ״̬��ģ�顣
- <b>Status</b>: ״̬�ַ���

-- <b>����ؼ�</b> --
- <b>CSM Name(dup)</b>: ���� <b>CSM Name</b>

### CSM - List All Status Registration.vi

-- <b>����ؼ�</b> --
- <b>Status Array</b>:

### CSM - List Mapping Relationships in Broadcast Registry.vi

-- <b>����ؼ�</b> --
- <b>Mapping Relationships</b>:

### CSM - List Rules in Broadcast Registry.vi

-- <b>����ؼ�</b> --
- <b>Rules</b>:

### CSM - List Status in Broadcast Registry.vi

-- <b>����ؼ�</b> --
- <b>Status in Registry</b>:

### CSM - Check Mapping Relationship in Broadcast Registry.vi

-- <b>����ؼ�</b> --
- <b>CSM Name</b>:
- <b>Broadcast state</b>:

-- <b>����ؼ�</b> --
- <b>Array</b>:

### CSM - Check Status Registration.vi

-- <b>����ؼ�</b> --
- <b>CSM Name</b>:
- <b>Broadcast state</b>:

-- <b>����ؼ�</b> --
- <b>Array</b>:

## ȫ����־����(Global Log)

### CSM - Global Log Event.vi

��ȡ CSM ȫ��״̬�û��¼����

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>: CSM ȫ��״̬�û��¼����

### CSM - Destroy Global Log Event.vi

�ͷ� CSM ȫ��״̬�û��¼����

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>: CSM ȫ��״̬�û��¼����

### CSM - Generate User Global Log.vi

�����û�ȫ���¼�����;���Եȳ�����

-- <b>����ؼ�</b> --
- <b>Log</b>: �¼�����
- <b>Arguments</b>: �¼�����
- <b>From Who</b>: ��Դ
- <b>ModuleName</b>: ģ������

### CSM - Global Log Error Handler.vi

-- <b>����ؼ�</b> --
- <b>Place("" to use VI's Name)</b>:
- <b>Clear Error(T)</b>:

### CSM - Set Log Filter Rules.vi

### CSM - List Log Filter Rules As Strings.vi

-- <b>����ؼ�</b> --
- <b>Rule Strings</b>:

### CSM - Convert Filter Rules.vi

### CSM - Filter Global Log.vi

## ������ģʽ (Work Mode API)

> [!NOTE] CSM ������ģʽ(worker mode)
>
> һ�� CSM ģ�飬ͨ��ʵ�������ʵ������������ƺ���ӡ�#��,��������ͬ����Ϣ���У�ʵ�ֹ�����ģʽ��
> - ���ⲿ�����Ͽ�����Щʵ��һ�������һ�����ϵ�ģ�飬����Ϊ Worker Agent��
> - ÿһ��ʵ��������Ϊ Worker��
>
> ��Ϊ��
> �ⲿ�����߿�����Ϊ Worker Agent ����һ��CSMģ�飬���Խ�����ϢͨѶ��״̬ע��Ȳ�����
> ���ڲ��������е� Worker ��� Worker Agent ��Ϣ������ȡ����Ϣ��������Ϣ����ˣ�Worker ģʽ�ܹ�ʵ��һ�� CSM ģ��Ĳ�����Ϣ����
>
> ������
> //����ģ������Ϊ module#, module �� Worker Agent���ƣ�ʵ���� 4 ��ʵ�������ĸ�ʵ�������ֿ���Ϊ��
> // - module#59703F3AD837
> // - module#106A470BA5EC
> // ����ֱ�Ӻ� worker ����ͨѶ����Ҫ�� Worker Agent ͨѶ������
> csm message >> arguments -@ module //ͬ����Ϣ�����е� worker ���������Ϣ
> csm message >> arguments -> module //ͬ����Ϣ�����е� worker ���������Ϣ
>
> Ӧ�ó�����
> 1. 10086 ����Ա�ĳ���
> 2. �������������صĳ���
> 3. ��������������ĳ���
> 4. TCP Server ������Client����

> [!NOTE] ����ƴ��API
> ��� VI ֻ������ģ�������ַ�������û��ʵ�ʹ��ܣ���˵���Ϥ CSM ����󣬿���ֱ�������Ӧ�������ַ����͹�����ţ����Ǳ�����ô�API.
>

### CSM - Mark As Worker Module.vi

��CSM���ƺ���ӡ�#�����Ա�Ǵ�ģ�鹤���ڹ�����ģʽ�¡�

> Ref: ����ƴ��API
> Ref: CSM ������ģʽ(worker mode)

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������

-- <b>����ؼ�</b> --
- <b>CSM Name(marked as worker)</b>: ��ӡ�#����ǵ�CSMģ������

## ������ģʽ (Chain of Responsibility API)

### CSM - Mark As Chain Module.vi

[!WARNING] ���鹦�ܻ�δ��ȫ��֤���������ʹ�á�

> Ref: ����ƴ��API

-- <b>����ؼ�</b> --
- <b>CSM Name</b>:  CSM ģ������
- <b>Order</b>:  ������ģʽ�µ�˳��

-- <b>����ؼ�</b> --
- <b>CSM Name(marked as Chain)</b>:��ӡ�$����ǵ�CSMģ������

## ��·ѭ��֧��(Side-Loop Support)

### CSM - Request CSM to Post Message.vi

���� CSM ������Ϣ��ͨ�����ں�CSM���еĹ���ѭ������Щ����ѭ���� CSM һ���������ģ�鹦�ܡ�

-- <b>����ؼ�</b> --
- <b>Module Name</b>:����״̬��CSM
- <b>Status</b>: �����㲥��״̬
- <b>Arguments ("")</b>: �����㲥��״̬����
- <b>Target Module</b>:Ŀ��ģ��

### CSM - Request CSM to Broadcast Status Change.vi

���� CSM ����״̬��ͨ�����ں�CSM���еĹ���ѭ������Щ����ѭ���� CSM һ���������ģ�鹦�ܡ�

-- <b>����ؼ�</b> --
- <b>Module Name</b>:����״̬��CSM
- <b>Status</b>: �����㲥��״̬
- <b>Arguments ("")</b>: �����㲥��״̬����
- <b>Broadcast(T)</b>: �����Ƿ�㲥�Ŀ�������

### CSM - Module Turns Invalid.vi

���CSM�Ƿ��Ѿ��˳���ͨ�����ں�CSM���еĹ���ѭ������Щ����ѭ���� CSM һ���������ģ�鹦�ܡ� ��VI���ڲ���ѭ�����˳�������

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: ģ������

-- <b>����ؼ�</b> --
- <b>Turn Invalid(Exit)?</b>: �Ƿ��Ѿ��˳�

## ����VI(Utility VIs)

### CSM - Compact Multiple States.vi

�����״̬���ճɵ����ַ����Թ�����ʹ��

-- <b>����ؼ�</b> --
- <b>Multiple States</b>: CSM״̬�ַ�������

-- <b>����ؼ�</b> --
- <b>States</b>: ��������CSM״̬�ַ������ַ���

### CSM - Break Down Multiple States String.vi

����������CSM״̬�ַ������ַ����и��CSM״̬�ַ�������

-- <b>����ؼ�</b> --
- <b>States</b>: ��������CSM״̬�ַ������ַ���

-- <b>����ؼ�</b> --
- <b>Multiple States</b>: CSM״̬�ַ�������

### CSM - Build Exit Messages of CSMs.vi

����CSMģ�����ƣ�ƴ�������˳���Ϣ("Macro: Exit")��

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>CSMs</b>: CSMģ����������
- <b>State with Arguments("Macro: Exit��)</b>: �˳���Ϣ

-- <b>����ؼ�</b> --
- <b>States</b>: ƴ�����ɵ�CSM��Ϣ�ַ���

### CSM - Filter Duplicate Messages By Name.vi

�����ظ�����Ϣ��ֻ�������µ���Ϣ��

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>States</b>: �������Ϣ�ַ���
- <b>Whole Messages in Check?(T)</b>: �Ƿ���������Ϣ�ַ���������� FALSE����ֻ�����Ϣ���ơ�

-- <b>����ؼ�</b> --
- <b>Filtered States</b>: ���˺����Ϣ�ַ���

### CSM - Filter Messages to Non-Existing Modules.vi

���˷��͸������ڵ�ģ�����Ϣ��
���VI�л�ʹ�� CSM - List Modules.vi ��ȡ���л��CSMģ�飬Ȼ����˵����͸�������ģ�����Ϣ��

-- <b>����ؼ�</b> --
- <b>States</b>: �������Ϣ�ַ���

-- <b>����ؼ�</b> --
- <b>Filtered States</b>: ���˺����Ϣ�ַ���

### CSM - Remove Duplicated Following Messages.vi

-- <b>����ؼ�</b> --
- <b>Current State</b>:
- <b>Remaining States</b>:

-- <b>����ؼ�</b> --
- <b>Remaining States Left</b>:

### CSM Data Type String to Enum.vi

### CSM Data Type String.vi

-- <b>����ؼ�</b> --
- <b>Data</b>:

-- <b>����ؼ�</b> --
- <b>Data Type String</b>:

### Replace Tag with Array.vi

-- <b>����ؼ�</b> --
- <b>Enum</b>:
- <b>replace string</b>:
- <b>single-line text</b>:

-- <b>����ؼ�</b> --
- <b>States</b>:

### CSM Data Type String to Enum(RefnumEnum).vi

-- <b>����ؼ�</b> --
- <b>Data Type String</b>:

-- <b>����ؼ�</b> --
- <b>Array Dim</b>:
- <b>Secondary Type</b>:
- <b>Primary Type</b>:

### CSM Data Type String to Enum(String).vi

-- <b>����ؼ�</b> --
- <b>Data Type String</b>:

-- <b>����ؼ�</b> --
- <b>Array Dim</b>:
- <b>Secondary Type String</b>:
- <b>Primary Type</b>:

### CSM Data Type String to Enum(TypeEnum).vi

-- <b>����ؼ�</b> --
- <b>Data Type String</b>:

-- <b>����ؼ�</b> --
- <b>Array Dim</b>:
- <b>Secondary Type</b>:
- <b>Primary Type</b>:

### Build Error Cluster.vi

����һ�������(error cluster)���Ա�׼ LabVIEW �ķ�ʽ�ӵ��� VI �ĵ������й���Դ�ַ�����������Դ�ַ�����ʽΪ��
"<B>���õ� VI</B> �� <B>���� VI �ĵ�����</B>-><B>���� VI �ĵ����ߵĵ�����</B>->�ȵ�...->�ȵ�..."
��ѡ�� 'String to Prepend to source ("")' �ַ��������������Դ�ַ�������Ӷ����������Ϣ�������������ַ���������������������������ӵ�Դ�ַ���֮ǰ��

-- <b>����ؼ�</b> --
- <b>code</b>: ������
- <b>String to Prepend to source ("")</b>: ������Ϣ�ַ���

### Build Internal State String.vi

�������� JKI ״̬��״̬����������Ϣ���ַ�����

-- <b>����ؼ�</b> --s
- <b>State</b>: ״̬�ַ���
- <b>Arguments ("")</b>: <b>State</b>�Ĳ���
- <b>Arg-State ("")</b>: ���ʹ���Ϣ��ģ���ڷ��ʹ���Ϣʱ���ڵ�״̬
- <b>Source ("")</b>: ���ʹ���Ϣ��ģ������

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>: ƴ�����ɵ� CSM ��Ϣ�ַ���

### String History Cacher.vi

���浱ǰ������ַ��������棬�������ʷ�ַ�������������󳤶�����ʱ�����Ƚ���Ļ����ַ����������ǡ����ڵ���CSM����ʷ״̬��

-- <b>����ؼ�</b> --
- <b>String</b>: �������ַ���
- <b>length</b>: �������ʷ�ַ�������ַ�������
- <b>Include Timestamp(F)</b>: �Ƿ���ÿ�п�ͷ����ʱ�����

-- <b>����ؼ�</b> --
- <b>String Cache</b>: �������ʷ�ַ���

### Timeout Selector.vi

���ڰ����û��¼��ṹ��ģ����

-- <b>����ؼ�</b> --
- <b>Timeout Expected</b>: Ԥ�ڵĳ�ʱ����
- <b>Remaining States</b>: �������ʣ���״̬�������Ϊ 0���������ΪԤ��ֵ

-- <b>����ؼ�</b> --
- <b>Timeout</b>: �ٲú�ʹ�õĳ�ʱ����

### Trim Both Whitespace.vi

��ͷ����β������ͬʱ�Ƴ����� ASCII �հ��ַ�(�ո��Ʊ�����س��ͻ���)��

-- <b>����ؼ�</b> --
- <b>string</b>: �������ַ���

-- <b>����ؼ�</b> --
- <b>trimmed string</b>: �������ַ���

### uuid.vi

���ݱ�׼�������� <b>Universally Unique Identifier(UUID)</b>�� ����:
- 59703F3AD837
- 106A470BA5EC
- 9B781DB313AF

-- <b>����ؼ�</b> --
- <b>UUID</b>: ���ɵ� UUID

### Random Change Flag.vi

����һ���������ֵ�����ڱ��״̬�ı仯��CSM��Ϊ�����Ч�ʣ���Щ�ط��Ļ���(cache)�������������ж��Ƿ���Ҫ���¡�

-- <b>����ؼ�</b> --
- <b>Random Change Flag</b>: ���ɵ������ֵ

### Global Log To String.vi

ȫ����־(Global Log)���ݴ�ת��Ϊ�ַ�����

-- <b>����ؼ�</b> --
- <b>Log</b>: ȫ����־���ݴ�

-- <b>����ؼ�</b> --
- <b>Log String</b>: ȫ����־�ַ���

## Build-in Addons

### CSM WatchDog

> [!NOTE] CSM WatchDog ʵ�ֵ�ԭ��
> LabVIEW VI �˳�ʱ�����Զ��ͷ����ж��С��¼��Ⱦ����Դ����ˣ����ǿ���ͨ������һ�� WatchDog �̣߳����һ����������VI���봴���Ķ�����Դ�������������Դ����VI�˳����ͷ�ʱ������ WatchDog �̸߳���δ�˳��� CSM ģ�鷢�� "Macro: Exit"����֤�����������˳���
>

#### CSM - Start Watchdog to Ensure All Modules Exit.vi

����CSM Watchdog �̣߳����ڱ�֤���������˳������е��첽������ CSM ģ�鶼�������˳���

> Ref: CSM WatchDog ʵ�ֵ�ԭ��

#### CSM Watchdog Thread.vi

CSM Watchdog �̣߳����ڱ�֤���������˳������е��첽������ CSM ģ�鶼�������˳���

> Ref: CSM WatchDog ʵ�ֵ�ԭ��

-- <b>����ؼ�</b> --
- <b>WatchdogQ</b>: Watchdog ������Դ��

### CSM File Logger

> CSM File Logger ʵ�ֵ�ԭ��
> ͨ������ CSM �� Global Log Event �¼������Խ�Ӧ���е�ȫ�� CSM ���Ϣ��¼���������ں��ڷ����ʹ���λ��
> �ļ�Ϊ�ı��ļ�����׺��Ϊ .csmlog������ͨ�����±����ı��༭��ѯ���ߴ򿪡�
>

#### CSM - Start File Logger.vi

���� CSM �¼��ļ���¼���ܡ�

> Ref: CSM File Logger ʵ�ֵ�ԭ��

-- <b>����ؼ�</b> --
- <b>Log File Path</b>: ��¼�ļ�·��
- <b>Enable? (T)</b>: �Ƿ�����
- <b>log limit</b>: ��¼�ļ�����
- <b>Timestamp format</b>: ʱ���ʽ
- <b>WatchDog? (T)</b>: �Ƿ����� WatchDog
- <b>Filter Rules</b>: ʱ����˹���
- <b>Exit When All Module Exist?(F)</b>: CSM ȫ��ģ���˳����Ƿ��˳�

-- <b>����ؼ�</b> --
- <b>LogFile</b>:
- <b>WatchDogQueue</b>:

#### CSM-Logger-Thread.vi

���� CSM Global Log �ļ���¼�߳�VI��

> Ref: CSM File Logger ʵ�ֵ�ԭ��

-- <b>����ؼ�</b> --
- <b>Log File Path</b>: ��¼�ļ�·��
- <b>log limit</b>: ��¼�ļ�����
- <b>Timestamp format</b>: ʱ���ʽ
- <b>WatchDogQ</b>: WatchDog��Դ�����ڼ���������Ƿ��˳�
- <b>GlobalLogFilter.lvclass</b>: �¼�����������
- <b>Exit When All Module Exist?(F)</b>: CSM ȫ��ģ���˳����Ƿ��˳�

### CSM Loop Support

#### CSMLS - Add Exit State(s) with Loop Check.vi

-- <b>����ؼ�</b> --
- <b>States Out in</b>:
- <b>Remaining States</b>:

-- <b>����ؼ�</b> --
- <b>States Out out</b>:

#### CSMLS - Append Continuous State.vi

-- <b>����ؼ�</b> --
- <b>Loop State(s) and Arguments</b>: This allows you to place new states in the front of the state machine queue. The default is an empty string.
- <b>Append(T)</b>:
- <b>Continuous Arguments ("")</b>:
- <b>Continuous State</b>:The State string that requires the argument.
- <b>Remaining States</b>:

-- <b>����ؼ�</b> --
- <b>States Out</b>:

#### CSMLS - Define Loop State(s).vi

-- <b>����ؼ�</b> --
- <b>States Out in</b>:
- <b>Remaining States</b>:

-- <b>����ؼ�</b> --
- <b>States Out out</b>:

#### CSMLS - Remove Loop Tag and previous State(s) to Break.vi

-- <b>����ؼ�</b> --
- <b>Remaining States</b>:

-- <b>����ؼ�</b> --
- <b>States</b>:

#### CSMLS - Remove Loop Tag to Break.vi

-- <b>����ؼ�</b> --
- <b>Remaining States</b>:

-- <b>����ؼ�</b> --
- <b>States</b>:

## CSM-Helper API

### CSM-Helper API.vi

### CSM-Helper usecase Template.vit

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### _Add VI Reference Case.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����
- <b>element</b>:
- <b>Add Frame</b>:

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Connect Information.vi

-- <b>����ؼ�</b> --
- <b>Case</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���
- <b>Backend Connected Info</b>:
- <b>FrontEnd Connected Info</b>:

### Diagram Node Information.vi

-- <b>����ؼ�</b> --
- <b>InnerTerminal in</b>:
- <b>Array in</b>:
- <b>Front Tunnels</b>:

-- <b>����ؼ�</b> --
- <b>Array</b>:
- <b>Array out</b>:

### Get Argument Info From back Term.vi

-- <b>����ؼ�</b> --
- <b>Terminal in</b>:

-- <b>����ؼ�</b> --
- <b>Array</b>:

### Get Argument Info From Front Term.vi

-- <b>����ؼ�</b> --
- <b>Terminal in</b>:

-- <b>����ؼ�</b> --
- <b>Array</b>:

### GObject Terminals.vi

-- <b>����ؼ�</b> --
- <b>GObject in</b>:

-- <b>����ؼ�</b> --
- <b>error in (no error) (dup)</b>:
- <b>Class Name</b>:
- <b>Terms[]</b>:
- <b>Node Object</b>:
- <b>tunnel Relative Pos</b>:

### Relative Pos to InterData Tunnel of CaseContent.vi

-- <b>����ؼ�</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Position</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Resize CaseStructure By Making Space.vi

-- <b>����ؼ�</b> --
- <b>Bounds</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>DiffBound</b>:
- <b>MakeSpace.Rect</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Search With Pattern.vi

-- <b>����ؼ�</b> --
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>����ؼ�</b> --
- <b>Numeric</b>:

### sub1.vi

-- <b>����ؼ�</b> --
- <b>Part References.Parse State Queue</b>:
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>����ؼ�</b> --
- <b>Tunnel out</b>:

### sub2.vi

-- <b>����ؼ�</b> --
- <b>Part References.Parse State Queue</b>:
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>����ؼ�</b> --
- <b>Tunnel out</b>:

### Refresh References.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Get ParentRef Until Type Matched.vi

-- <b>����ؼ�</b> --
- <b>Class Name</b>:
- <b>reference in</b>:

-- <b>����ؼ�</b> --
- <b>Target Ref</b>:

### Is in JKISM or CSM.vi

-- <b>����ؼ�</b> --
- <b>reference in</b>:

-- <b>����ؼ�</b> --
- <b>is in JKISM or CSM?</b>:

### Relationship Check.vi

-- <b>����ؼ�</b> --
- <b>TestRef</b>:
- <b>reference in</b>:

-- <b>����ؼ�</b> --
- <b>Is TestRef</b>:
- <b>Is Child of TestRef</b>:

### Add State Frame.vi

-- <b>����ؼ�</b> --
- <b>index(-1, use same group)</b>:
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Add Frame</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Check NewStateNotify is Registered.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>NewStateNotify Registered</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Connect Error Wire If not Connected.vi

-- <b>����ؼ�</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Connect EventReg Wire If not Connected.vi

-- <b>����ؼ�</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Connect Internal Data Wire If not Connected.vi

-- <b>����ؼ�</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Connect LastResp to Response in Error Case.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Connect Paired Tunnels.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Connect StateQ Wire If not Connected.vi

-- <b>����ؼ�</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Copy State.vi

-- <b>����ؼ�</b> --
- <b>Already Exist Action:
Replace(T) / Skip(F)</b>:
- <b>SourceCSM</b>:
- <b>New(Empty to Use same Name)</b>:
- <b>Case</b>:
- <b>CSM-Helper.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>CSM-Helper out 2</b>:

### Create From Basic Refs.vi

-- <b>����ؼ�</b> --
- <b>CSM Basic Refs</b>:

-- <b>����ؼ�</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From CaseStructure Reference.vi

-- <b>����ؼ�</b> --
- <b>CaseStructure</b>:

-- <b>����ؼ�</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From EventStructure Reference.vi

-- <b>����ؼ�</b> --
- <b>CaseStructure</b>:

-- <b>����ؼ�</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From VI Reference.vi

-- <b>����ؼ�</b> --
- <b>VI</b>:

-- <b>����ؼ�</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From WhileLoop Reference.vi

-- <b>����ؼ�</b> --
- <b>Structure</b>:

-- <b>����ؼ�</b> --
- <b>CSM-Helper.lvclass</b>:

### Destroy.vi

-- <b>����ؼ�</b> --
- <b>Save Instruments?(F)</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Doc.vi

-- <b>����ؼ�</b> --
- <b>String 2</b>:
- <b>String</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>String 4</b>:
- <b>String 3</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Get All API Interface Info.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Get All Status Interface Info.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Array 3</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Get CaseFrame Index By CaseName.vi

-- <b>����ؼ�</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>index</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Get CaseFrame Reference By CaseName.vi

-- <b>����ؼ�</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Frame Refs</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Get Event Structure Num.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>EvtStrutNum</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Get Interface Info.vi

-- <b>����ؼ�</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Response</b>:
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Get Internal Data Info.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Open Block Diagram.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Open Front Panel.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Remove State Frame.vi

-- <b>����ؼ�</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Save Instrument.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Set Error Tunnel Use Default If not Connected.vi

-- <b>����ؼ�</b> --
- <b>Use Default if Unwired</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Set Visible Case Frame.vi

-- <b>����ؼ�</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Set Wire Label Visible.vi

-- <b>����ؼ�</b> --
- <b>Connected Wire.Label.Visible</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Start Undo.vi

-- <b>����ؼ�</b> --
- <b>Name</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Stop Undo.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Undo.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Read APIs.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Value</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read Back Tunnel Internal TermRefs.vi

-- <b>����ؼ�</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Back Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read Back Tunnels Refs.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Back Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read Block Diagram Ref.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Diagram</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read Case Structure Ref.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Case Structure</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read Event Structure Ref.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Event Structure</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read Front Tunnel Internal TermRefs.vi

-- <b>����ؼ�</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Front Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read Front Tunnels Refs.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Front Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read New State Notifier Event State Ref.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>New State Notifier Event State Ref</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read Paired Tunnels of Case Structure.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Paired Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read Parse State Queue Ref.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Parse State Queue</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read States.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Value</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read Timeout Event State Ref.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>New State Notifier Event State Ref</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read Type.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Part References.Type</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read User-Defined States.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read VI Ref.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>VI</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Read While Loop Ref.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>While Loop</b>:
- <b>CSM-Helper out</b>: CSMHelper ���

### Add VI Reference Case.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### Remove All CSM Bookmarks.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### standardize CSM Module.vi

-- <b>����ؼ�</b> --
- <b>CSM-Helper in</b>: CSMHelper ����

-- <b>����ؼ�</b> --
- <b>CSM-Helper out</b>: CSMHelper ���

### CSM Essential States.vi

-- <b>����ؼ�</b> --
- <b>CSM Essential States</b>:

### CSM Module Type.vi

-- <b>����ؼ�</b> --
- <b>CSM Basic Refs</b>:

-- <b>����ؼ�</b> --
- <b>CSM Basic Refs (dup)</b>:

### Is CSM Module.vi

ʹ�����ٵ�VI���ã��ж��Ƿ��� CSM ģ�飬���� LabVIEW ���Ԥ���жϡ�

��̬VI(Polymorphic VI)ѡ��:
- Is CSM Module - VIRef.vi
- Is CSM Module - WhileLoop.vi
- Is CSM Module - Structure.vi
- Is CSM Module - CaseStructure.vi
- Is CSM Module - EventStructure.vi
- Is CSM Module - ParseStateVI.vi

#### Is CSM Module - VIRef.vi

ͨ�� VIRef �ж��Ƿ����� CSM ģ��

-- <b>����ؼ�</b> --
- <b>VIRef</b>: VI����

-- <b>����ؼ�</b> --
- <b>Is CSM Module?</b>: ������ CSM ģ��
- <b>CSM Basic Refs</b>: ����� CSMģ�飬����ذ����ˡ�CSM��ģ��Ļ���Ԫ�ص�����

#### Is CSM Module - WhileLoop.vi

ͨ�� While Loop �����ж��Ƿ��� CSM ģ��

-- <b>����ؼ�</b> --
- <b>WhileLoop</b>: While Loop ����

-- <b>����ؼ�</b> --
- <b>Is CSM Module?</b>: ������ CSM ģ��
- <b>CSM Basic Refs</b>: ����� CSMģ�飬����ذ����ˡ�CSM��ģ��Ļ���Ԫ�ص�����

#### Is CSM Module - Structure.vi

ͨ�� Structure �����ж��Ƿ��� CSM ģ��

-- <b>����ؼ�</b> --
- <b>Structure</b>: Structure ����

-- <b>����ؼ�</b> --
- <b>Is CSM Module?</b>: ������ CSM ģ��
- <b>CSM Basic Refs</b>: ����� CSMģ�飬����ذ����ˡ�CSM��ģ��Ļ���Ԫ�ص�����

#### Is CSM Module - CaseStructure.vi

ͨ�� CaseStructure �����ж��Ƿ��� CSM ģ��

-- <b>����ؼ�</b> --
- <b>CaseStructure</b>: CaseStructure ����

-- <b>����ؼ�</b> --
- <b>Is CSM Module?</b>: ������ CSM ģ��
- <b>CSM Basic Refs</b>: ����� CSMģ�飬����ذ����ˡ�CSM��ģ��Ļ���Ԫ�ص�����

#### Is CSM Module - EventStructure.vi

ͨ�� EventStructure �����ж��Ƿ��� CSM ģ��

-- <b>����ؼ�</b> --
- <b>EventStructure</b>: EventStructure ����

-- <b>����ؼ�</b> --
- <b>Is CSM Module?</b>: ������ CSM ģ��
- <b>CSM Basic Refs</b>: ����� CSMģ�飬����ذ����ˡ�CSM��ģ��Ļ���Ԫ�ص�����

#### Is CSM Module - ParseStateVI.vi

ͨ�� Parse State VI �����ж��Ƿ��� CSM ģ��

-- <b>����ؼ�</b> --
- <b>Parse State VI Ref</b>: Parse State VI ����

-- <b>����ؼ�</b> --
- <b>Is CSM Module?</b>: ������ CSM ģ��
- <b>CSM Basic Refs</b>: ����� CSMģ�飬����ذ����ˡ�CSM��ģ��Ļ���Ԫ�ص�����

### CaseStructure - Add Frame.vi

-- <b>����ؼ�</b> --
- <b>Case Name</b>:
- <b>Reference Frame Index</b>:
- <b>CaseStructure in</b>:

-- <b>����ؼ�</b> --
- <b>Add Frame</b>:
- <b>CaseStructure out</b>:

### CaseStructure - Case Name to Group Name.vi

-- <b>����ؼ�</b> --
- <b>element</b>:

-- <b>����ؼ�</b> --
- <b>String</b>:

### CaseStructure - Check If State Exist.vi

-- <b>����ؼ�</b> --
- <b>Group Name</b>:
- <b>CaseStructure in</b>:

-- <b>����ؼ�</b> --
- <b>Numeric</b>:
- <b>CaseStructure out</b>:

### CaseStructure - Get Group Separator Case Index.vi

-- <b>����ؼ�</b> --
- <b>Group Name</b>:
- <b>CaseStructure in</b>:

-- <b>����ؼ�</b> --
- <b>Numeric</b>:
- <b>CaseStructure out</b>:

### Diagram - Connect Tunnel with Wire 2.vi

-- <b>����ؼ�</b> --
- <b>Wire Index</b>:
- <b>Front Tunnels</b>:
- <b>Diagram in</b>:

-- <b>����ؼ�</b> --
- <b>Array out</b>:
- <b>Diagram out</b>:

### Diagram - Connect Tunnel with Wire.vi

-- <b>����ؼ�</b> --
- <b>FrontEnd Connected Info</b>:
- <b>Front Tunnels</b>:
- <b>Diagram in</b>:

-- <b>����ؼ�</b> --
- <b>Array out</b>:
- <b>Diagram out</b>:

### Diagram - Get All Decoration Refs.vi

-- <b>����ؼ�</b> --
- <b>TopLevelDiagram in</b>:

-- <b>����ؼ�</b> --
- <b>TextRefs</b>:
- <b>TopLevelDiagram out</b>:

### Diagram - Get All Text Refs.vi

-- <b>����ؼ�</b> --
- <b>TopLevelDiagram in</b>:

-- <b>����ؼ�</b> --
- <b>TextRefs</b>:
- <b>TopLevelDiagram out</b>:

### PairedTunnels - Connect Wire.vi

-- <b>����ؼ�</b> --
- <b>index(-1 for all)</b>:
- <b>PairedTunnels</b>:

-- <b>����ؼ�</b> --
- <b>PairedTunnels</b>:

### Find Event Structure from Case Structure.vi

-- <b>����ؼ�</b> --
- <b>CaseStructure</b>:

-- <b>����ؼ�</b> --
- <b>EvntStruct Refnum</b>:

### Find Parse State Queue from Case Structure.vi

-- <b>����ؼ�</b> --
- <b>CaseStructure</b>:

-- <b>����ؼ�</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:

### Find Parse State Queue from Event Structure.vi

-- <b>����ؼ�</b> --
- <b>EvntStruct Refnum</b>:

-- <b>����ؼ�</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:

### Find Parse State Queue from While Loop.vi

-- <b>����ؼ�</b> --
- <b>WhileLoop in</b>:

-- <b>����ؼ�</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:
- <b>WhileLoop out</b>:

### Terminals - Filter Control Terms.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:

-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Error Terms.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:

-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Indicator Terms.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:

-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Input Term.vi

-- <b>����ؼ�</b> --
- <b>InnerTerminal in</b>:
- <b>Wire.Terms[] in</b>:

-- <b>����ؼ�</b> --
- <b>Wire.Terms[] out</b>:

### Terminals - Filter invalid Terms.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:

-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Left-Top Term.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:

-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

### Terminals - Left-Top Term.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:

-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

### Terminals - Lower Term.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:

-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

### Terminals - Upper Term.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:

-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

## Documentation

### CSM - Copyright QuickDrop.vi

### CSM - Documentation QuickDrop.vi

### CSM - Keywords QuickDrop.vi

### CSM Dummy Module.vi

-- <b>����ؼ�</b> --
- <b>Init State("Macro: Initialize")</b>:
- <b>Name("" to use uuid)</b>:

## CSM Internal

### Naming Check.vi

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters

-- <b>����ؼ�</b> --
- <b>Name(dup)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters

### Check.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:
- <b>Status</b>:
- <b>Source</b>:
- <b>Target</b>:

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:
- <b>Response Message Info</b>:

### Delete Source Module.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

### Delete Target Module.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

### Initialize.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

### List Entries.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:
- <b>Array</b>:

### List Status in Registry.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:
- <b>Status</b>:

### Register.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:
- <b>status</b>:
- <b>source</b>:
- <b>api</b>:
- <b>target</b>:

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

### Remove Module.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

### Unregister.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:
- <b>Status</b>:
- <b>Source</b>:
- <b>api</b>:
- <b>Target</b>:

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

### Broadcast Item Key.vi

-- <b>����ؼ�</b> --
- <b>status</b>:
- <b>target</b>:
- <b>source</b>:

-- <b>����ؼ�</b> --
- <b>key</b>:

### Preview.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:

-- <b>����ؼ�</b> --
- <b>Registry</b>:
- <b>BroadcastRegistry out</b>:

### Remove response API from List.vi

-- <b>����ؼ�</b> --
- <b>API</b>:
- <b>output cluster in</b>:

-- <b>����ؼ�</b> --
- <b>output cluster out</b>:

### Concatenate State with Arguments.vi

-- <b>����ؼ�</b> --
- <b>Arguments</b>:
- <b>State</b>:

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>:

### CSM-Name to CSM-Mode.vi

-- <b>����ؼ�</b> --
- <b>String</b>:

-- <b>����ؼ�</b> --
- <b>ParentCSM Name</b>:
- <b>CSM Mode</b>:
- <b>Requested Name</b>:

### Format Timestamp.vi

-- <b>����ؼ�</b> --
- <b>timestamp</b>:
- <b>format string</b>:

-- <b>����ؼ�</b> --
- <b>String</b>:

### Hex Str to U8 Data.vi

-- <b>����ؼ�</b> --
- <b>HEX String (0-9,A-F)</b>:

-- <b>����ؼ�</b> --
- <b>u8 Data[]</b>:

### Parse Next Single-line State.vi

-- <b>����ؼ�</b> --
- <b>States Queue</b>:

-- <b>����ؼ�</b> --
- <b>Next Single-line State</b>:
- <b>Remaining States Queue</b>:

### Remove Comments from Line.vi

-- <b>����ؼ�</b> --
- <b>single-line text</b>:

-- <b>����ؼ�</b> --
- <b>single-line text without comments</b>:

### Splite Reason String Part.vi

-- <b>����ؼ�</b> --
- <b>Single-line -& Reason</b>:

-- <b>����ؼ�</b> --
- <b>CSM Name</b>:
- <b>`State</b>:
- <b>`Arguments</b>:

### Splite Single-line Message.vi

-- <b>����ؼ�</b> --
- <b>single-line text</b>:

-- <b>����ؼ�</b> --
- <b>operator</b>:
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:

### Trim Single line Text.vi

-- <b>����ؼ�</b> --
- <b>single-line text</b>:

-- <b>����ؼ�</b> --
- <b>trimmed text</b>:

### U8 Data to Hex Str.vi

-- <b>����ؼ�</b> --
- <b>u8 Data[]</b>:

-- <b>����ؼ�</b> --
- <b>HEX String (0-9,A-F)</b>:

### CSM Critical Error.vi

-- <b>����ؼ�</b> --
- <b>Arguments(as Reason)</b>:
- <b>CSM Name</b>:

### CSM No Target Error.vi

### CSM Not Allowed Message.vi

-- <b>����ؼ�</b> --
- <b>State</b>:
- <b>CSM</b>:

### CSM Target Error.vi

-- <b>����ؼ�</b> --
- <b>Arguments(as CSM Name)</b>:

### CSM Target Timeout Error.vi

-- <b>����ؼ�</b> --
- <b>Arguments(as CSM Name)</b>:

### CSM Unhandled State Error.vi

-- <b>����ؼ�</b> --
- <b>Current State</b>:
- <b>CSM Name</b>:

### Cache-Broadcast Registry Search Result.vi

-- <b>����ؼ�</b> --
- <b>CSM Name</b>:
- <b>Broadcast state</b>:

-- <b>����ؼ�</b> --
- <b>Array</b>:

### FGV-BroadcastRegistry.vi

-- <b>����ؼ�</b> --
- <b>Source</b>:
- <b>Target</b>:
- <b>Status</b>:
- <b>API</b>:
- <b>Operation</b>:

-- <b>����ؼ�</b> --
- <b>response message</b>:

### global-Broadcast Cache Change Flag.vi

ȫ�ֱ��������ڱ�ǹ㲥�����Ƿ����仯

### global-CSMQ FGV Change Flag.vi

ȫ�ֱ��������ڱ�� CSM ģ�������Ϣ�Ƿ����仯

### global-GEvnt Filter Change Flag.vi

ȫ�ֱ��������ڱ�� Global Event �Ĺ��������Ƿ����仯

### Cache-GEvt Filter Object.vi

-- <b>����ؼ�</b> --
- <b>CSM:LogFilter.lvclass</b>:

### FGV-GEvt Filter Obj.vi

-- <b>����ؼ�</b> --
- <b>Set(T)/Get(F)</b>:
- <b>Rules-v1</b>:

-- <b>����ؼ�</b> --
- <b>CSM:LogFilter.lvclass</b>:

### FGV-GlobalEventRef.vi

-- <b>����ؼ�</b> --
- <b>Create(F)</b>:

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:

### FGV-StatusChangeEventRef.vi

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid) in</b>:

-- <b>����ؼ�</b> --
- <b>Status Change Event</b>:

### GEvt-BackgroundThread.vi

### GEvt-Convert Filter Rules - v1.0.vi

-- <b>����ؼ�</b> --
- <b>Rules-v1</b>:

-- <b>����ؼ�</b> --
- <b>GlobalLogFilter</b>:

### GEvt-Filter Global Log - v1.0.vi

-- <b>����ؼ�</b> --
- <b>Rules-v1</b>:
- <b>Cross CSM Data (in)</b>:

-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:

### GEvt-Generate Complete Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:
- <b>event data</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:

### GEvt-Generate Interrupt Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Module Created Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:
- <b>Name("" to use uuid)</b>:
- <b>Created?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Module Destroyed Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:
- <b>Name("" to use uuid)</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Register Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Remaining States Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:
- <b>Remaining States</b>:
- <b>Name("" to use uuid)</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate State Change Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Source Message.*State</b>:
- <b>Source Message.*Arguments</b>:
- <b>Source Module</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Status Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Unregister Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate with Rule Check.vi

-- <b>����ؼ�</b> --
- <b>LogFilter in</b>:
- <b>event data</b>:
- <b>CSM Global Log Event in</b>:

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:

### GEvt-Set Source Filter Rules - v1.0.vi

-- <b>����ؼ�</b> --
- <b>Rules-v1</b>:

### GEvt-ThreadQueueName.vi

-- <b>����ؼ�</b> --
- <b>ThreadQueueName</b>:

### GEvt-WatchdogThread.vi

-- <b>����ؼ�</b> --
- <b>WatchDogQ</b>:

### Filter Check.vi

-- <b>����ؼ�</b> --
- <b>Cross CSM Data in</b>:
- <b>GlobalLogFilter in</b>:

-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data out</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### List Rules as Strings.vi

-- <b>����ؼ�</b> --
- <b>GlobalLogFilter in</b>:

-- <b>����ؼ�</b> --
- <b>Rule Strings</b>:
- <b>GlobalLogFilter out</b>:

### CSM Check - LogType.vi

-- <b>����ؼ�</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### CSM Check - State.vi

-- <b>����ؼ�</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### CSM Check - StateType.vi

-- <b>����ؼ�</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - CSM.vi

-- <b>����ؼ�</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - LogType.vi

-- <b>����ؼ�</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - State.vi

-- <b>����ؼ�</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - StateType.vi

-- <b>����ؼ�</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Set CSM LogType Filter.vi

-- <b>����ؼ�</b> --
- <b>LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>����ؼ�</b> --
- <b>GlobalLogFilter out</b>:

### Set CSM State Filter.vi

-- <b>����ؼ�</b> --
- <b>CSM:State</b>:
- <b>GlobalLogFilter in</b>:

-- <b>����ؼ�</b> --
- <b>GlobalLogFilter out</b>:

### Set CSM StateType Filter.vi

-- <b>����ؼ�</b> --
- <b>LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>����ؼ�</b> --
- <b>GlobalLogFilter out</b>:

### Set Global CSM Filter.vi

-- <b>����ؼ�</b> --
- <b>Group:CSM</b>:
- <b>GlobalLogFilter in</b>:

-- <b>����ؼ�</b> --
- <b>GlobalLogFilter out</b>:

### Set Global LogType Filter.vi

-- <b>����ؼ�</b> --
- <b>Group:LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>����ؼ�</b> --
- <b>GlobalLogFilter out</b>:

### Set Global State Filter.vi

-- <b>����ؼ�</b> --
- <b>Group:State</b>:
- <b>GlobalLogFilter in</b>:

-- <b>����ؼ�</b> --
- <b>GlobalLogFilter out</b>:

### Set Global StateType Filter.vi

-- <b>����ؼ�</b> --
- <b>Group:LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>����ؼ�</b> --
- <b>GlobalLogFilter out</b>:

### Log State Type.vi

-- <b>����ؼ�</b> --
- <b>Complete(T)/Start(F)</b>:
- <b>Source Module</b>:
- <b>��State</b>:

-- <b>����ؼ�</b> --
- <b>CSM_GlobalLog_STATE_TYPE</b>:

### Parse Register Message.vi

-- <b>����ؼ�</b> --
- <b>state</b>:
- <b>Module Name </b>:
- <b>args</b>:

-- <b>����ؼ�</b> --
- <b>target</b>:
- <b>source</b>:
- <b>status</b>:
- <b>api</b>:

### Parse State with Arguments String.vi

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>:
The State string that requires the argument.

-- <b>����ؼ�</b> --
- <b>State</b>:
- <b>Arguments</b>:
- <b>Target Module</b>:
- <b>Message Symbol</b>:

### Parse Unregister Message.vi

-- <b>����ؼ�</b> --
- <b>state</b>:
- <b>Module Name </b>:
- <b>args</b>:

-- <b>����ؼ�</b> --
- <b>target</b>:
- <b>source</b>:
- <b>status</b>:
- <b>api</b>:

### Dequeue Element.vi

-- <b>����ؼ�</b> --
- <b>timeout in ms (-1)</b>:
- <b>Priority Queue</b>:

-- <b>����ؼ�</b> --
- <b>timed out?</b>:
- <b>Cross JKI State Machine State</b>:
- <b>Priority Queue(dup)</b>:
- <b>High Priority?</b>:

### Enqueue Element.vi

-- <b>����ؼ�</b> --
- <b>High Priority?(F)</b>:
- <b>timeout in ms (-1)</b>:
- <b>Cross JKI State Machine State</b>:
- <b>Priority Queue</b>:

-- <b>����ؼ�</b> --
- <b>Priority Queue(dup)</b>:

### Get Queue Status.vi

-- <b>����ؼ�</b> --
- <b>Priority Queue in</b>:

-- <b>����ؼ�</b> --
- <b># pending insert</b>:
- <b># pending remove</b>:
- <b>Priority Queue out</b>:
- <b># elements in queue</b>:

### Not a Refnum.vi

-- <b>����ؼ�</b> --
- <b>Priority Queue.lvclass</b>:

-- <b>����ؼ�</b> --
- <b>NaN/Path/Refnum?</b>:

### Obtain Priority Queue.vi

-- <b>����ؼ�</b> --
- <b>create if not found? (T)</b>:
- <b>name</b>:

-- <b>����ؼ�</b> --
- <b>created new?</b>:
- <b>Priority Queue</b>:

### Release Priority Queue.vi

-- <b>����ؼ�</b> --
- <b>force destroy? (F)</b>:
- <b>Priority Queue</b>:

### CSMP-Async Call.vi

-- <b>����ؼ�</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:
- <b>Msg Type</b>:

-- <b>����ؼ�</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-Broadcast.vi

-- <b>����ؼ�</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:
- <b>Msg Type</b>:

-- <b>����ؼ�</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-PostPostMsg.vi

-- <b>����ؼ�</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Pre-State in</b>:
- <b>Pre-Args in</b>:
- <b>session error</b>:
- <b>Module Name</b>:
- <b>Response Arguments</b>:

-- <b>����ؼ�</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-PostSendMsg.vi

-- <b>����ؼ�</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>session error</b>:
- <b>Module Name</b>:
- <b>Response Arguments</b>:

-- <b>����ؼ�</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>error</b>:

### CSMP-Register Status.vi

-- <b>����ؼ�</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:

-- <b>����ؼ�</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-Sync Call.vi

-- <b>����ؼ�</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Response Timeout(5000ms)</b>:
- <b>Module Name</b>:

-- <b>����ؼ�</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-Unregister Status.vi

-- <b>����ؼ�</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:

-- <b>����ؼ�</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSM - Add VI Reference Case to CSMs.vi

### CSM - Debug Console - DebugTool.vi

### CSM - Remove all CSM Bookmarks.vi

### CSM - Running Log - DebugTool.vi

### CSM - State Dashboard - DebugTool.vi

### CSM - State Table - DebugTool.vi

### CSM - Switch Language Tool.vi

### Autosize All MultiListbox Columns (Uniform Text).vi

-- <b>����ؼ�</b> --
- <b>IgnoreCols(Empty as default)</b>:
- <b>Array</b>:
- <b>Control in</b>:

### Dashboard Cell Resize.vi

-- <b>����ؼ�</b> --
- <b>Cluster</b>:
- <b>Cluster Size:Height</b>:
- <b>Cluster Size:Width</b>:
- <b>����ѹ��P4 4</b>:

-- <b>����ؼ�</b> --
- <b>Bounds:Area Height</b>:
- <b>Bounds:Area Width</b>:

### Dashboard Cell2 Array Resize.vi

-- <b>����ؼ�</b> --
- <b>Num Columns</b>:
- <b>Cluster</b>:
- <b>Num Rows</b>:
- <b>area height</b>:
- <b>area width</b>:
- <b>Array 2</b>:

### Open CSM BD.vi

-- <b>����ؼ�</b> --
- <b>Current Module("" to generate a ID)</b>:
- <b>CSM</b>:

### Open CSM FP.vi

-- <b>����ؼ�</b> --
- <b>Current Module("" to generate a ID)</b>:
- <b>CSM</b>:

### Select Greater_nevstop.vi

-- <b>����ؼ�</b> --
- <b>A</b>:
- <b>B</b>:

-- <b>����ؼ�</b> --
- <b>lesser</b>:

### Append Application Directory If Relative.vi

-- <b>����ؼ�</b> --
- <b>Relative path (.)</b>:

-- <b>����ؼ�</b> --
- <b>Application Directory (+ Relative)</b>:

### Convert File Extension (Path)__ogtk.vi

-- <b>����ؼ�</b> --
- <b>new ending (none)</b>:
- <b>file name</b>:

-- <b>����ؼ�</b> --
- <b>prev ending</b>:
- <b>new filename</b>:

### Convert File Extension (String)__ogtk.vi

-- <b>����ؼ�</b> --
- <b>new ending (none)</b>:
- <b>file name</b>:

-- <b>����ؼ�</b> --
- <b>prev ending</b>:
- <b>new filename</b>:

## CSM-DOC

### csmdoc_import_all_csm_VI_description_doc.vi

ѡ�� CSM VI ���������� markdown �ļ������뵽���е�VI��

-- <b>Inputs</b> --
- <b>Path</b>: CSM VI ���������� markdown �ļ�·��

### csmdoc_export_all_csm_VI_description_doc.vi

��������CSM VI, �� VI �������������� markdown �ļ��С�

-- <b>Inputs</b> --
- <b>Path</b>: CSM VI ���������� markdown �ļ�·��

### csmdoc_export_VI_description.vi

-- <b>Inputs</b> --
- <b>NOTE-Map</b>:
- <b>Path</b>:

-- <b>Outputs</b> --
- <b>concatenated string</b>:

### csmdoc_import_doc_to_singleVI.vi

### csmdoc_import_VI_description.vi

-- <b>Inputs</b> --
- <b>NOTE-Map</b>:
- <b>string</b>:
- <b>Path</b>:

### csmdoc_list_all_csm_documented_VIs.vi

-- <b>Outputs</b> --
- <b>Array</b>:

### csmdoc_load vi description map.vi

-- <b>Inputs</b> --
- <b>Path</b>:

-- <b>Outputs</b> --
- <b>text</b>:
- <b>variant 2</b>:
- <b>variant</b>:

## Unsorted

### CSM - Flood of Events Handler Side Loop.vi

### CSM - Forward States to CSM.vi

-- <b>����ؼ�</b> --
- <b>High Priority(T)</b>:
- <b>Module Name</b>:Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters
- <b>State(s) in ("")</b>:Wire the existing states to this input. The default is an empty string.

### CSM - Forward UI Operations to CSM.vi

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid)</b>:
- <b>State(s) in ("")</b>:

-- <b>����ؼ�</b> --
- <b>States Out</b>:

### CSM - Remove Module in Broadcast Registry.vi

-- <b>����ؼ�</b> --
- <b>CSM Name</b>:

-- <b>����ؼ�</b> --
- <b>CSM Name(dup)</b>:

### Parse VI Documentation String.vi

-- <b>Inputs</b> --
- <b>NOTE-Map</b>:
- <b>Documentation</b>:

-- <b>Outputs</b> --
- <b>Ctrl-Doc Map</b>:
- <b>Control Docs</b>:
- <b>Core Doc</b>:
- <b>Documentation (dup)</b>:

### Gevt-ThreadQueueName.vi

-- <b>Outputs</b> --
- <b>ThreadQueueName</b>:

### Script - JKISM to CSM.vi

### CSM - Status Change Event.vi

-- <b>Inputs</b> --
- <b>CSM Module</b>:

-- <b>Outputs</b> --
- <b>Status Change Event</b>:
