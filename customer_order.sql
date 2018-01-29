select * from customer,orderinfo where customer.customer_id=orderinfo.customer_id;
select * from item,stock where item.item_id=stock.item_id;
select * from item,barcode,stock where item.item_id=stock.item_id and item.item_id=barcode.item_id;
select oid,relname from pg_class where relname like 'customer';
select attname from pg_attribute where attname lsike 'customer%';
select attname,attrelid from pg_attribute where attname like 'customer%';                                                                                                              
select relname from pg_class where oid in (16872,16876,16888);
create table mytable as (select * from customer);    //does not copy constraints
insert into mytable (select * from customer);
select oid,relname,relpages from pg_class where relname like 'mytable';


//multithreaded database system
//how can access one column and update other column


//PL/pgSQL blocks
->declaring pg/pgsql variables
//man create language
///pg_pltemplate
//postmaster
//pg_toast table for over sized attributes
//pg_clss info about table,views,constraints
//relkind in pg_class
\d customer_customer_id_seq;
//n teer architecture
//if query fails autoincement is applied
// dbms ->rdbms->ordbms
//alter database "username" owner to "anotheruser"
//vacuum
//set
//create schema
//show search_path
//when our schema is created by default all tables are created within it
//set search_path TO public ;
//drop table schema.tablename;
//initdb
//query planner tree=>SQL query plan

//cd /bin => file ls
//deadlock

//select customer.customer_id,fname from customer,orderinfo where customer.customer_id=orderinfo.customer_id;
//select customer_id,fname from customer where customer_id in (select customer_id from orderinfo);
//database replication
//array insertion,updation
//composite attribute
//derived attribute
//limit
//offset
//sort
//explain
//explain analyze
//minimum 30 queries
//count(*)
//pucsdassgn@gmail.com 		ADT_01
//object indentifier
//types
// \d  pg_type
//ctid
//begin
//rollback
//commit
//insert  into  z values  ("This is first lineThis is first lineThis is first lineThis is first line",1);

----------------------------------------------------------------------------------------------------------------------------------------------
select distinct(relkind) from pg_class;
 relkind 
---------
 r
 v
 S
 t
 i

r= ordinary table, i = index, S = sequence, v = view, m = materialized view, c = composite type, t = TOAST table, f = foreign table
----------------------------------------------------------------------------------------------------------------------------------------------
