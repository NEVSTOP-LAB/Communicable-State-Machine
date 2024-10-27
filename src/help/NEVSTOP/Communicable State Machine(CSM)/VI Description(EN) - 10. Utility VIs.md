# CSM API

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

### U8 Data to Hex Str.vi

-- <b>����ؼ�</b> --
- <b>u8 Data[]</b>:

-- <b>����ؼ�</b> --
- <b>HEX String (0-9,A-F)</b>:
