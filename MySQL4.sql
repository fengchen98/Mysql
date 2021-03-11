一.删除
--删除孙悟空同学的成绩
delete from exam_result where name='孙悟空';
二、数据库约束
1.null约束 （指定列不为空）
-- 重新设置学生表结构
DROP TABLE IF EXISTS student;
CREATE TABLE student (
   id INT NOT NULL,
   sn INT,
   name VARCHAR(20),
   qq_mail VARCHAR(20)
)；
2.unique 约束  （指定列时唯一不重复的）
DROP TABLE IF EXISTS student;
CREATE TABLE student (
   id INT NOT NULL,
   sn INT UNIQUE,
   name VARCHAR(20),
   qq_mail VARCHAR(20)
);
3.default约束  （默认值约束）
DROP TABLE IF EXISTS student;
CREATE TABLE student (
   id INT NOT NULL,
   sn INT UNIQUE,
   name VARCHAR(20) DEFAULT 'unkown',
   qq_mail VARCHAR(20)
);
4.primary key （主键约束，是not null 和 unique的结合）
（--id INT PRIMARY KEY auto_increment）

DROP TABLE IF EXISTS student;
CREATE TABLE student (
   id INT NOT NULL PRIMARY KEY,
   sn INT UNIQUE,
   name VARCHAR(20) DEFAULT 'unkown',
   qq_mail VARCHAR(20)
);
5.foreign key  （外键约束）
classes_id为外键，关联班级表id


DROP TABLE IF EXISTS classes;
CREATE TABLE classes (
 id INT PRIMARY KEY auto_increment,
 name VARCHAR(20),
 `desc` VARCHAR(100)
);


DROP TABLE IF EXISTS student;
CREATE TABLE student (
   id INT PRIMARY KEY auto_increment,
   sn INT UNIQUE,
   name VARCHAR(20) DEFAULT 'unkown',
   qq_mail VARCHAR(20),
 classes_id int,
 FOREIGN KEY (classes_id) REFERENCES classes(id)
);

6.check约束
drop table if exists test_user;
create table test_user (
   id int,
   name varchar(20),
   sex varchar(1),
   check (sex ='男' or sex='女')
);

三、查询
1.聚合查询
count

select count(*) from exam_result;
可以对查询数量去重
select count(distinct id) from exam_result;

sum
select sum(math) from exam_result;

avg
select avg(math) from exam_result;

max
select max(math) from exam_result;

--注：在where后面不能加聚合函数

min
select min(math) from exam_result where math>70;