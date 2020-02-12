create table branch1(
branchname varchar2(20),
branchcity varchar2(10),
assets number(10,5),
primary key(branchname));

create table account1(
accno number(10),
branchname varchar2(20),
balance number(10,5),
primary key(accno),
foreign key (branchname)REFERENCES branch(branchname));
create table customer1(
customername varchar2(10),
customerstreet varchar2(30),
city varchar(20),
primary key(customername));



create table depositor1(
customername varchar2(10),
accno number(10),
primary key(customername,accno),
foreign key(accno) references account(accno),
foreign key(customername) REFERENCES customer(customername));
drop table depositor;

create table loan1(
loannumber number(10),
branchname varchar2(20),
amount number(10),
primary key (loannumber),
foreign key (branchname) references branch(branchname));

create table borrower1(
customername varchar2(10),
loannumber number(10),
primary key(customername),
foreign key(customername) references customer(customername),
foreign key(loannumber) references loan(loannumber));

INSERT INTO branch1 VALUES

('&branchname','&branchcity',&assets);

INSERT INTO account1 VALUES

(accno,'&branchname',&balance);

INSERT INTO depositor1 VALUES

('&customername',&accno);

    INSERT INTO customer1 VALUES

('&customername','&customerstreet','&city');

INSERT INTO loan1 VALUES

('&loannumber','
INSERT INTO borrower1 VALUES


('&customername',&loanno);&branchname',&amount);


select * from branch;
SELECT * FROM account ;
SELECT * FROM depositor;
SELECT * FROM customer;
SELECT * FROM loan;
SELECT * FROM borrower;

