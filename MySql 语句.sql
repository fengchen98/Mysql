一、数据库的操作
1.创建数据库
create database if not exists test0306;

2.使用数据库 
use test;

3.展示数据库
show databases;

4.展示表
show tables;

5.删除数据库
drop database test;

二、常用的数据类型

数值类型：
整型：      BIT(M)         如果不写M   默认是一位
	TINYINT      
	SMALLINT
	INT
	BIGINT
	
浮点型:	DECIMAL(M,D)  用来表示小数，M代表有效长度，D代表小数点后几位

字符串类型：VARCHAR(SIZE)    varchar(4):四个字节
	   TEXT	默认长度是0-65535

日期类型：DATATIME:八个字节    表示的时间范围是1000-9999年（缺点：不会进行时区的检索和转换）
	TIMESTAMP:四个字节  表示的时间范围是1970-2038年

三、表的操作

1.创建表
drop table if exists stu_test;
create table stu_test(
id int,
name varchar(10) comment '姓名',
password varchar(10),
age int,
sex varchar(1),
birthday timestamp,
amout decimal(6,2) comment '钱',
resume text
);

2.显示表
show tables;

3.删除表
drop table if exists stu_test;


4.查看表结构
desc stu_test;

四、习题练习

create database store;
use store;

create table goods(
goods_id int comment '商品编号',
goods_name varchar(10) comment '商品名称',
unitprice decimal(6,2) comment '单价',
category varchar(10) comment'商品类别',
provider varchar(30) comment'供应商'
);

create table customer(
customer_id int comment '客户号',
name varchar(15) comment '姓名',
address varchar(30) comment'住址',
emil varchar(15) comment'邮箱',
sex varchar(1) comment'性别',
card_id  varchar(18) comment '身份证'
);

create table purchase
(
   order_id  int comment '订单号',
   customer_id int comment '客户编号',
   goods_id  int comment '商品编号',
   nums  int comment '购买数量'
);

五、操作表（CRUD）

-- 创建一张学生表
DROP TABLE IF EXISTS student;
CREATE TABLE student (
   id INT,
   sn INT comment '学号',
   name VARCHAR(20) comment '姓名',
   qq_mail VARCHAR(20) comment 'QQ邮箱'
);

1.插入

--单行全列插入（每次只能插入一行，，且每一个字段要和数据库对应）
insert into student values(1,1001,'fc','249841036@qq.com');
insert into student values(2,1002,'gxx','1250403818@qq.com');

select * from student;

--多行指定列插入(如果没有指定某个字段的值，默认为NULL)
insert into student(id,sn,name) values(3,1003,'fccc'),(4,1004,'gxxx');
select * from student;


INSERT INTO student VALUES (100, 10000, '唐三藏', NULL);
INSERT INTO student VALUES (101, 10001, '孙悟空', '11111');
INSERT INTO student (id, sn, name) VALUES
 (102, 20001, '曹孟德'),
 (103, 20002, '孙仲谋');

DROP TABLE IF EXISTS exam_result;
CREATE TABLE exam_result (
 id INT,
 name VARCHAR(20),
 chinese DECIMAL(3,1),
 math DECIMAL(3,1),
 english DECIMAL(3,1)
);

alter table exam_result modify name varchar(20) character set utf8;
INSERT INTO exam_result (id,name, chinese, math, english) VALUES
 (1,'唐三藏', 67, 98, 56),
 (2,'孙悟空', 87.5, 78, 77),
 (3,'猪悟能', 88, 98.5, 90),
 (4,'曹孟德', 82, 84, 67),
 (5,'刘玄德', 55.5, 85, 45),
 (6,'孙权', 70, 73, 78.5),
 (7,'宋公明', 75, 65, 30);

select id,name,math as 数学成绩 from exam_result;
使用as可以给属性和表起别名
