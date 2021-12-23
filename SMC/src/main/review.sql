DROP TABLE review;
CREATE TABLE review(
	code number,
	name varchar(100),
	grade int,
	text varchar(100), 
	rev_num NUMBER GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT rev_pri PRIMARY KEY(code,rev_num),
	foreign key (code) references chicken(code),
	CONSTRAINT cons_grade CHECK (grade>0 AND grade <=5)
);

insert into review(code,name,grade,text) values(1,'푸라닭 고추마요 치킨',5,'너무 맛있어요');
insert into review(code,name,grade,text) values(1,'푸라닭 고추마요 치킨',1,'너무 맛없어요');
update review set code = (select code from chicken where review.name = chicken.name);
delete from review;
select * from review;