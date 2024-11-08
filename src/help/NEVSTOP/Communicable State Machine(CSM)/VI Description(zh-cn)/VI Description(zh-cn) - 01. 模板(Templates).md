# CSM API

## ģ��(Templates)

> [!NOTE] CSM Name ����
> - CSM ģ������Ӧ����Ψһ�ģ�����ᵼ�� CSM ���� "Critical Error" ״̬��
> - �������Ϊ ""����ʹ�� UUID ��Ϊģ�����ơ���ģ�鱻���Ϊ����ģʽ�����������ģ���б��С�
> - ��������� '#' ��β�����ģ�齫�ڹ���ģʽ�����С�������ͬ���Ƶ�ģ�齫����ͬһ��Ϣ���С��κ��ⲿ��Ϣ��������һ��ģ�鴦��ȡ�����ĸ�ģ����С�

> [!NOTE] CSM ��ʼ��״̬
> - Ĭ��ֵ�� JKISM ״̬������һ��, �� "Macro: Initialize"��
> - ͨ�������޸Ĵ�״̬����Ϊ�����Ŀ����Ϊ�˷����ⲿ�����޸ĳ�ʼ��״̬��

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

### ģ��֧��

#### CSM - Get New State Notifier Event.vi

��ȡ�û��¼���������ڰ����¼��ṹ�� CSM ģ���С������¼��ṹ�� CSM ģ�飬ͨ�������¼��ṹ���ȴ�������¼������յ��µ���Ϣʱ�ж����¼��ṹ�еĵȴ�������ִ�С�

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid) in</b>: CSM ģ������

-- <b>����ؼ�</b> --
- <b>New State Notifier Event</b>: �û��¼�������������յ���Ϣʱ��ʹ��CSMģ���ж����¼��ṹ�еĵȴ�

#### Timeout Selector.vi

���ڰ����û��¼��ṹ��ģ����

-- <b>����ؼ�</b> --
- <b>Timeout Expected</b>: Ԥ�ڵĳ�ʱ����
- <b>Remaining States</b>: �������ʣ���״̬�������Ϊ 0���������ΪԤ��ֵ

-- <b>����ؼ�</b> --
- <b>Timeout</b>: �ٲú�ʹ�õĳ�ʱ����

#### ģ�������

##### CSM Critical Error.vi

���� CSM ģ������ش�����Ϣ��ͨ��������ģ�������ظ����µġ�

-- <b>����ؼ�</b> --
- <b>Arguments(as Reason)</b>: ����ԭ��
- <b>CSM Name</b>: CSM ģ������

##### CSM No Target Error.vi

������Ҫ���� CSM ģ�����Ƶ������˿��ַ���ʱ������ CSM ģ���Ŀ��ģ�鲻���ڴ�����Ϣ��

##### CSM Target Error.vi

���� CSM ģ�����ϢĿ��ģ�鲻���ڴ�����Ϣ��

-- <b>����ؼ�</b> --
- <b>Arguments(as CSM Name)</b>: ���Ӳ��������ݵ�������Ŀ��ģ������

##### CSM Target Timeout Error.vi

���� CSM ģ�����ϢĿ��ģ�鳬ʱ������Ϣ��

-- <b>����ؼ�</b> --
- <b>Arguments(as CSM Name)</b>: ���Ӳ��������ݵ�������Ŀ��ģ������

##### CSM Unhandled State Error.vi

���� CSM ģ���δ����״̬������Ϣ�����ܵ������
- �ڲ���Ϣ��ת��ʹ���˱�ģ��δ�����״̬ʱ����(�� JKISM ��Ϊһ��)
- �յ��ⲿ���ͱ�ģ��δ�����״̬ʱ����

-- <b>����ؼ�</b> --
- <b>Undefined State</b>: δ�����״̬
- <b>CSM Name</b>: CSM ģ������

