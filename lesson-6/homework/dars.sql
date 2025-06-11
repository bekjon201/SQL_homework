

CREATE TABLE InputTbl (
    col1 VARCHAR(10),
    col2 VARCHAR(10)
);
    INSERT INTO InputTbl (col1, col2) VALUES 
('a', 'b'),
('a', 'b'),
('b', 'a'),
('c', 'd'),
('c', 'd'),
('m', 'n'),
('n', 'm');
select distinct * from  table when col1<col2
a b
c d
select * from InputTbl
select case when col1<col2 then col1 else col2 end from InputTbl
select case when col1>col2 then col2 else col1 end from InputTbl




CREATE TABLE TestMultipleZero (
    A INT NULL,
    B INT NULL,
    C INT NULL,
    D INT NULL
);

INSERT INTO TestMultipleZero(A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);

  select * FROMTestMultipleZero
  where not(a=0 and b=0 and c=0 and d=0)



  create table section1(id int, name varchar(20))
insert into section1 values (1, 'BEEN'),
       (2, 'roma'),
       (3, 'steven'),
       (4, 'paulo'),
       (5, 'genryh'),
       (6, 'bruno'),
       (7, 'fred'),
       (8, 'andro'),

     select * from 
     order by  id asc 
     LIMIT 1;

	 select * from order by id desc
	 limit 1;
	 select * from people where name like 'b%';

	 CREATE TABLE ProductCodes (More actions
    Code VARCHAR(20)
);

INSERT INTO ProductCodes (Code) VALUES
('X-123'),
('X_456'),
('X#789'),
('X-001'),
('X%202'),
('X_ABC'),
('X#DEF'),
('X-999');
    select * from ProductCodes 
	   where Code like ('%[/]%)
