# CSM API

> [!NOTE] ����ƴ��API
> ��� VI ֻ������ģ�������ַ�������û��ʵ�ʹ��ܣ���˵���Ϥ CSM ����󣬿���ֱ�������Ӧ�������ַ����͹�����ţ����Ǳ�����ô�API.

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

### CSM - Mark As Worker Module.vi

��CSM���ƺ���ӡ�#�����Ա�Ǵ�ģ�鹤���ڹ�����ģʽ�¡�

> Ref: ����ƴ��API
> Ref: CSM ������ģʽ(worker mode)

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������

-- <b>����ؼ�</b> --
- <b>CSM Name(marked as worker)</b>: ��ӡ�#����ǵ�CSMģ������

## ������ģʽ (Chain of Responsibility API) - ������

> [!NOTE] CSM ������ģʽ(Chain of Responsibility mode)
>
> ��� CSM ģ�飬��������ƺ���ӡ�$��,��ɴ��������һ��������ͨ��������ģʽ�γ�һ��������ģ�顣

> - ���ⲿ�����Ͽ�����Щʵ��һ�������һ�����ϵ�ģ�飬����Ϊ Chain��
> - ÿһ��ʵ��������Ϊ chain node��
>
> ��Ϊ��
> �ⲿ�����߿�����Ϊ Chain ����һ�� CSM ģ�飬���Խ�����ϢͨѶ��״̬ע��Ȳ�����
> ���ڲ�����Nodes ���������˳�����γ��Դ�����Ϣ���� node ���е�ǰ��Ϣ���������ʱ����Ϣ������������󴫵ݡ�
>
> ������
> //����ģ������Ϊ module$, module �� chain ���ƣ�ʵ���� 4 ��ʵ�������ĸ�ʵ�������ֿ���Ϊ��
> // - module$1
> // - module$2
> // - module$3
> // - module$4
> // ��ɵ� Chain ˳��Ϊ module$1 >> module$2 >> module$3 >> module$4
> // ���� module$3 module$4 �ܹ����� "csm message"
> csm message >> arguments -@ module
> // �����Ϣ���� module$3 ����, module$4 ������Ӧ
>
> Ӧ�ó�����
> 1. Ȩ���������̣�����ְλ�㼶�����߼���ľ����ܹ�����������¼�
> 2. ����ƴ�ӣ���ͬģ��ʵ�ֲ�ͬ������ͨ��ƴ�ӿ�����ɲ�ͬ���ܺϼ������
> 3. ���ܸ��ǣ�ͨ������ʵ��OOP�е�����

### CSM - Mark As Chain Module.vi

[!WARNING] ���鹦�ܻ�δ��ȫ��֤���������ʹ�á�

> Ref: CSM ������ģʽ(Chain of Responsibility mode)
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
