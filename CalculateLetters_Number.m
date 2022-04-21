clc
clear
%导入pages.txt文件，获取文章中的字符串
fid = fopen('shuju.txt');
tline = fgetl(fid);
i = 1
while ischar(tline)
    disp(tline)  %显示每一行
    pages{i} = tline;   %将文章中的每一行的字符串存在数据类型为元包（cell）变量中
    tline = fgetl(fid);
    i=i+1
end
fclose(fid);
%显示出元包变量pages第一元素中的字符串，自行与文章第一行进行校对
pages{1}
%for循环实现pages中的所有行字符串存储在同一个名为：str的字符串变量中
str1 = ''
for i=1:length(pages)
    str = strcat(str1,pages{i})
    str1 = str
end
str    %拿str字符串，自行与文章全文进行校对
a = lower(str) %大写字母转小写
char = unique(a);%计算有多少个不重复的字符串
for i = 1:length(char)
    char(i)
    number(i) = length(strfind(a,char(i))); %统计字符的数目
end
char %显示字符
number %显示个数
%将空格部分，用“空”汉字标出注明
char(find(char == ' ')) = '空'
%计算频率frequency
frequency = number/sum(number)
%分别将所有出现过的字符：char,每个char出现的次数：number,每个char出现的频率：frequency
%输出到名字分别为：（  write1.xls、write2.xls、write3.xls ）的Excel文件中
xlswrite('字符.xls',char','A1');%excel文件创建在matlab根目录下
xlswrite('次数.xls',number');
xlswrite('频率.xls',frequency');
