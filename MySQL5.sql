准备数据
create table emp(
 id int primary key auto_increment,
 name varchar(20) not null,
 role varchar(20) not null,
 salary numeric(11,2)
);
insert into emp(name, role, salary) values
('马云','服务员', 1000.20),
('马化腾','游戏陪玩', 2000.99),
('孙悟空','游戏角色', 999.11),
('猪无能','游戏角色', 333.5),
('沙和尚','游戏角色', 700.33),
('隔壁老王','董事长', 12000.66);

一、聚合查询
1.group by
查询每个角色的最高工资、最低工资和平均工资
select role,max(salary),min(salary),avg(salary) from emp group by role;

2.having
GROUP BY 子句进行分组以后，需要对分组结果再进行条件过滤时，
不能使用 WHERE 语句，而需要用HAVING
select role,max(salary),min(salary),avg(salary) from emp group by role having avg(salary)<1500;

二、联合查询

准备数据

drop database if exists test0311;

create database test0311;

use test0311;

drop table if exists classes;
create table classes(
    id int primary key auto_increment,
    name varchar(50),
    `desc` varchar(50)
);
insert into classes(name, `desc`) values
('计算机系2019级1班', '学习了计算机原理、C和Java语言、数据结构和算法'),
('中文系2019级3班','学习了中国传统文学'),
('自动化2019级5班','学习了机械自动化');


drop table if exists student;
create table student(
    id int primary key auto_increment,
    sn int,
    name varchar(30),
    qq_mail varchar(30),
    classes_id int
);

insert into student(sn, name, qq_mail, classes_id) values
('09982','黑旋风李逵','xuanfeng@qq.com',1),
('00835','菩提老祖',null,1),
('00391','白素贞',null,1),
('00031','许仙','xuxian@qq.com',1),
('00054','不想毕业',null,1),
('51234','好好说话','say@qq.com',2),
('83223','tellme',null,2),
('09527','老外学中文','foreigner@qq.com',2);



drop table if exists course;
create table course(
    id int primary key auto_increment,
    name varchar(20)
);


insert into course(name) values
('Java'),('中国传统文化'),('计算机原理'),('语文'),('高阶数学'),('英文');



drop table if exists score;
create table score(
    id int primary key auto_increment,
    score DECIMAL,
    student_id int,
    course_id int
);


insert into score(score, student_id, course_id) values
-- 黑旋风李逵
(70.5, 1, 1),(98.5, 1, 3),(33, 1, 5),(98, 1, 6),
-- 菩提老祖
(60, 2, 1),(59.5, 2, 5),
-- 白素贞
(33, 3, 1),(68, 3, 3),(99, 3, 5),
-- 许仙
(67, 4, 1),(23, 4, 3),(56, 4, 5),(72, 4, 6),
-- 不想毕业
(81, 5, 1),(37, 5, 5),
-- 好好说话
(56, 6, 2),(43, 6, 4),(79, 6, 6),
-- tellme
(80, 7, 2),(92, 7, 6);

1.内连接
查询“许仙”同学的 成绩
select student.name,score.score from student,score where student.name='许仙' and student.id=score.student_id;
或者
select student.name,score.score
from student inner join score
on  student.name='许仙' and student.id=score.student_id;

查询所有同学的总成绩，及同学的个人信息
select student.name,sum(score)
from student inner join score
on student.id=score.student_id
group by student.id;

2.外连接
-- 左外连接，表1完全显示
select 字段名  from 表名1 left join 表名2 on 连接条件;
-- 右外连接，表2完全显示
select 字段 from 表名1 right join 表名2 on 连接条件;

-- “老外学中文”同学 没有考试成绩，也显示出来了
select * from student stu left join score sco on stu.id=sco.student_id;

3.自连接
显示所有“计算机原理”成绩比“Java”成绩高的成绩信息
select s2.* from score s1,score s2
where s1.student_id=s2.student_id
and s1.course_id=1
and s2.course_id=3
and s1.score<s2.score;

4.子查询
4.1 单行子查询
查询与“不想毕业” 同学的同班同学
select * from student
 where classes_id=(select classes_id from student where
name='不想毕业');

4.2 多行子查询
查询“语文”或“英文”课程的成绩信息

in关键字：
select * from score where course_id in(select id from course where name='语文' or name='英语'；);

exists关键字：
select * from score sco where exists (select sco.id from course cou 
where (name='语文' or name='英文') and cou.id = sco.course_id);

