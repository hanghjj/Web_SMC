DROP TABLE review;
CREATE TABLE review(
	code number,
	name varchar(100),
	grade int,
	text varchar(100),
	reviewer varchar(20) NOT NULL, 
	rev_num NUMBER GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT rev_pri PRIMARY KEY(code,rev_num),
	foreign key (code) references chicken(code),
	CONSTRAINT cons_grade CHECK (grade>0 AND grade <=5)
);


update review set code = (select code from chicken where review.name = chicken.name);
delete from review;
select * from review;
select chicken.name,review.grade, review.text from review,chicken where chicken.name = review.name order by chicken.code;