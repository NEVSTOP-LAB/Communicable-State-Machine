# CSM API

## ģ������ӿ�(Module Operation API)

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

### CSM - Status Change Event.vi

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
