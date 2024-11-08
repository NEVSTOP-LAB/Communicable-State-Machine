# CSM API

## ����(Arguments)

> [!NOTE] CSM ��Ϣ�ؼ���
> ����: '->','->|','-@','-&','<-", "\r", "\n", "//", ">>", ">>>", ">>>>", ";", ","

> [!NOTE] CSM HEXSTR ��ʽ����
> Ϊ���� CSM �����д����κ��������ͣ�CSM Ĭ���ṩ��һ�� ��Ϊ HEXSTR �Ĳ�����ʽ�����ڴ����κ��������͡�
> HEXSTR���� LabVIEW ������������ת��Ϊ���壬Ȼ�󽫴˱�����ڴ��ʽ��ʾΪʮ�������ַ������Ա��� CSM �����д��ݡ�
> HEXSTR���԰�ȫ������״̬�������������ƻ� CSM ��Ϣ�ַ����Ľ�����

> [!NOTE] CSM ERROR ����
> LabVIEW �������Ϣͨ�������س������ҿ��ܰ��� CSM ����Ϣ�ؼ��֣������ͨ������ֱ����Ϊ CSM �������ݡ�
> ��Ȼ���Խ��������Ϣת��Ϊ HEXSTR ��ʽ�������������߱��ɶ��ԣ��� log �в���ֱ�۵Ķ�ȡ��Ϣ��
> ���Ϊ���� CSM �����д��� LabVIEW ������Ϣ, �ṩ��һ����׼�� CSM ���������ʽ�����԰�ȫ������״̬�������������ƻ� CSM ��Ϣ�ַ����Ľ�����
> ���ĸ�ʽΪ: "[Error: error-code] error-description-As-safe-argument-string"

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
