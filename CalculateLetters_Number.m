clc
clear
%����pages.txt�ļ�����ȡ�����е��ַ���
fid = fopen('shuju.txt');
tline = fgetl(fid);
i = 1
while ischar(tline)
    disp(tline)  %��ʾÿһ��
    pages{i} = tline;   %�������е�ÿһ�е��ַ���������������ΪԪ����cell��������
    tline = fgetl(fid);
    i=i+1
end
fclose(fid);
%��ʾ��Ԫ������pages��һԪ���е��ַ��������������µ�һ�н���У��
pages{1}
%forѭ��ʵ��pages�е��������ַ����洢��ͬһ����Ϊ��str���ַ���������
str1 = ''
for i=1:length(pages)
    str = strcat(str1,pages{i})
    str1 = str
end
str    %��str�ַ���������������ȫ�Ľ���У��
a = lower(str) %��д��ĸתСд
char = unique(a);%�����ж��ٸ����ظ����ַ���
for i = 1:length(char)
    char(i)
    number(i) = length(strfind(a,char(i))); %ͳ���ַ�����Ŀ
end
char %��ʾ�ַ�
number %��ʾ����
%���ո񲿷֣��á��ա����ֱ��ע��
char(find(char == ' ')) = '��'
%����Ƶ��frequency
frequency = number/sum(number)
%�ֱ����г��ֹ����ַ���char,ÿ��char���ֵĴ�����number,ÿ��char���ֵ�Ƶ�ʣ�frequency
%��������ֱַ�Ϊ����  write1.xls��write2.xls��write3.xls ����Excel�ļ���
xlswrite('�ַ�.xls',char','A1');%excel�ļ�������matlab��Ŀ¼��
xlswrite('����.xls',number');
xlswrite('Ƶ��.xls',frequency');
