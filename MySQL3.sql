去重
SELECT DISTINCT math FROM exam_result;

排序(默认是升序的)
select * from exam_result order by math;
select * from exam_result order by math desc;

1.NULL 数据排序，视为比任何值都小，升序出现在最上面，降序出现在最下面
2.使用表达式及别名排序
SELECT name, chinese + english + math FROM exam_result 
 ORDER BY chinese + english + math DESC;

SELECT name, chinese + english + math total FROM exam_result 
 ORDER BY total DESC;
3. 可以对多个字段进行排序，排序优先级随书写顺序
-- 查询同学各门成绩，依次按 数学降序，英语升序，语文升序的方式显示
SELECT name, math, english, chinese FROM exam_result 
 ORDER BY math DESC, english, chinese;

4.模糊查询
-- % 匹配任意多个（包括 0 个）字符
SELECT name FROM exam_result WHERE name LIKE '孙%';-- 匹配到孙悟空、孙权
-- _ 匹配严格的一个任意字符
SELECT name FROM exam_result WHERE name LIKE '孙_';-- 匹配到孙权

练习：
-- 查询英语不及格的同学及英语成绩 ( < 60 )
select name,english from exam_result where english<60;
-- 查询语文成绩好于英语成绩的同学
select name,chinese,english from exam_result where english<chinese;
-- 查询总分在 200 分以下的同学
select name,chinese+math+english from exam_result where chinese+math+english<200;
-- 查询语文成绩大于80分，且英语成绩大于80分的同学
select name from exam_result where chinese>80 and english>80;
-- 查询语文成绩在 [80, 90] 分的同学及语文成绩
select name,chinese from exam_result where chinese between 80 and 90;
-- 查询数学成绩是 58 或者 59 或者 98 或者 99 分的同学及数学成绩
select name,math from exam_result where math in(58,59,98,99);
-- 查询 qq_mail 已知的同学姓名
select name,qq_mail from student where qq_mail is not null;
