DROP TABLE Chicken;
CREATE TABLE Chicken(
	code NUMBER GENERATED ALWAYS AS IDENTITY primary key,
	name varchar2(100) not null unique,
	price integer not null
);

insert into Chicken(name, price) values('후라이드 치킨',12000);
Select * from chicken;