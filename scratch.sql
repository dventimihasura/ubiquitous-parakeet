-- -*- sql-product: postgres -*-

select
  *
  from
    account
 limit 1;

explain
select
  *
  from
    account
 where
   id = (select id from account limit 1);

