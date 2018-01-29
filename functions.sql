create function mymult(a integer) returns integer as'
begin
return a*123;
end;'
language plpgsql;

create function mymult(a integer) returns integer as'
begin
return a*123;
end;'
language plpgsql;


create function mymult(integer) returns integer as'
declare 
a alias for $1;
begin
return a*123;
end;'
language plpgsql;

create or replace function(integer) returns text as'
declare
a alias for $1;
i integer;
cnt integer;
begin
i:=a;
cnt:=0;
while i>0
LOOP
IF a%i=0
   cnt:=cnt+1
 i:=i-1
END IF;
END LOOP;
IF cnt=2
 return True;
ELSE 
 return False;
END IF;
end;'
language plpgsql;


create or replace function isPrime(integer) returns text as'
declare
a alias for $1;
i integer;
cnt integer;
begin
i:=a;
cnt:=0;
while i>0
LOOP
IF a%i==0 THEN
   cnt:=cnt+1;
END IF;
 i:=i-1;
END LOOP;
IF cnt==2
 THEN return True;
ELSE 
 return False;
END IF;
end;'
language plpgsql;


create or replace function get_sell_price(name varchar) returns text as '
declare 
s_price item.sell_price%type;
begin
select into s_price sell_price from item where description like name;
return s_price;
end;'
language plpgsql;




create or replace function primeNos(integer) returns integer as'
declare
a alias for $1;
i integer;
j integer;cnt integer;
begin
i:=a;j:=1;
cnt:=0; FOR j IN 1..a
LOOP while i>0
LOOP
IF j%i=0 THEN
   cnt:=cnt+1;
END IF;
 i:=i-1;
END LOOP;
IF cnt=2
 THEN return j;

END IF;
END LOOP; end;'
language plpgsql;



create or replace function primeNos(integer) returns text as $$
declare
a alias for $1;
i integer;
j integer;
cnt integer;
msg text;
begin
i:=1;
msg:=' ';
cnt:=0;
FOR j IN 2..a
 LOOP 
  while i<=j
 LOOP
 IF j%i=0 THEN
   cnt:=cnt+1;
 END IF;
 i:=i+1;
END LOOP;
IF cnt=2
 THEN  msg:=msg||' '||j;
END IF;
i:=1;
cnt:=0;
END LOOP; 
return msg;
end;$$
language plpgsql;


create or replace function primeNosRange(integer,integer) returns text as $$
declare
a alias for $1;
i integer;
b alias for $2;
cnt integer;
msg text;
begin
i:=1;
msg:=' ';
cnt:=0;
FOR j IN a..b
 LOOP 
  while i<=j
 LOOP
 IF j%i=0 THEN
   cnt:=cnt+1;
 END IF;
 i:=i+1;
END LOOP;
IF cnt=2
 THEN  msg:=msg||' '||j;
END IF;
i:=1;
cnt:=0;
END LOOP; 
return msg;
end;$$
language plpgsql;


create or replace function update_sqaure(integer) returns integer as $$
declare 
a alias for $1
begin
select * from insert_val;
return;
end; $$
language plpgsql;

create or replace function my_fib2(fib_for integer)
returns setof integer as $$
declare
 retval integer:=0;
 nxtval integer:=1;
 tmpval integer;
begin
 for num in 1..fib_for loop
  return next retval;
  tmpval:=retval;
  retval:=nxtval;
  nxtval:=tmpval+nxtval;
 end loop;
end;
$$
language plpgsql;




create or replace function primeNosSet(integer) returns setof integer as $$
declare
a alias for $1;
i integer;
j integer;
cnt integer;
msg text;
begin
i:=1;
msg:=' ';
cnt:=0;
FOR j IN 2..a
 LOOP
  while i<=j
 LOOP
 IF j%i=0 THEN
   cnt:=cnt+1;
 END IF;
 i:=i+1;
END LOOP;
IF cnt=2
 THEN  return next j;
END IF;
i:=1;
cnt:=0;
END LOOP;
end;$$
language plpgsql;





create or replace function my_fib3(fib_for integer)
returns integer as $$
begin 
 if fib_for < 2 then
   return fib_for;
 end if;
   return my_fib3(fib_for-2)+my_fib3(fib_for-1);
end;
$$
language plpgsql;


begin
update mytab set fname='monu' where lname='jagtap';
x:=x+1;
y:=x/0;
exception
 when division_by_zero then 
 raise notice "division by zero";
 return x;
end;



sume1995=# create operator +(procedure=my_sum,
sume1995(# leftarg=text,
sume1995(# rightarg=text);
CREATE OPERATOR




sume1995=# create operator !(procedure=primenos,
rightarg=integer);
CREATE OPERATOR
sume1995=# select !(5);
 ?column? 
----------
   2 3 5
(1 row)

sume1995=# select !(10);
 ?column?  
-----------
   2 3 5 7
(1 row)






sume1995=# drop operator ^ (integer,NONE);
DROP OPERATOR




create or replace function my_power(integer,integer) returns integer as $$
declare
num alias as $1;
raiseto alias as $2;
index1 integer;
product integer;
begin
 product:=1;
 for index1 in 1..raiseto loop
  product=product*num;
 end loop;
return product;
end; $$
language plpgsql;


sume1995=# create operator ^(procedure=my_power,leftarg=integer,rightarg=integer);
CREATE OPERATOR
sume1995=# select 2^4;
 ?column? 
----------
       16
(1 row)




sume1995=# create table emp(name text,salary numeric);
CREATE TABLE

sume1995=# create function double_salary(emp) returns numeric as $$ select $1.salary*2 as salary;  $$ language sql;
CREATE FUNCTION



sume1995=# create or replace  function square_salary(emp) returns numeric as $$ select $1.salary*$1.salary as salary;  $$ language sql;
CREATE FUNCTION
select name,square_salary(row(name,salary*10)) as dream from emp;


clm1=>int 1-10
clm=>int square
clm=>int cube
clm=>text even/odd



create function myappend(anyarray,anyelement) returns anyarray as $$
select $1 || $2;
$$
language sql;


create function Mymin(VARIADIC numeric[]) returns numeric as $$
select min($1[i]) from generate_subscripts($1,1) g(i);
$$ language sql;

sume1995=# select Mymin(110,-11,4,5,1);
 mymin 
-------
   -11
(1 row)

create function Mycombine(VARIADIC text[]) returns text AS $$
select array_to_string($1,''); 
$$ language sql;

sume1995=# select Mycombine1('sumedha','jagtap','6/11/1995','16218');
           mycombine1           
--------------------------------
 sumedha,jagtap,6/11/1995,16218
(1 row)




create or replace function myconcat(anyelement)
returns text as $$
select concat(',',$1) $$ language sql;



select sum(grade_point*no_of_credits)/5 as GPA from student,performance,grade,courses where student.Roll_no=performance.Roll_no and performance.grade=grade.grade and performance.course_code=courses.course_code and student.Roll_no='16210' and performance.course_code not in (select course_code from performance where grade='F') ;


create or replace function update_GPA(varchar(5)) returns numeric as $$
declare
GPA1 numeric;
rno alias for $1;
begin
select into GPA1 (sum(grade_point*no_of_credits)/(select count(*) from performance where  Roll_no=rno)) from student,performance,grade,courses where student.Roll_no=performance.Roll_no and performance.grade=grade.grade and performance.course_code=courses.course_code and student.Roll_no=rno ;
update student set GPA=GPA1 where Roll_no=rno;
return GPA1;
end; $$
language plpgsql;



create or replace function update_all_GPA() returns setof numeric as $$
declare
GPA1 numeric;
rno alias for $1;
begin
select into GPA1 (sum(grade_point*no_of_credits)/(select count(*) from performance where  Roll_no=rno)) from student,performance,grade,courses where student.Roll_no=performance.Roll_no and performance.grade=grade.grade and performance.course_code=courses.course_code and student.Roll_no=rno ;
update student set GPA=GPA1 where Roll_no=rno;
return GPA1;
end; $$
language plpgsql;

