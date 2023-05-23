-- -*- sql-product: postgres -*-

select
  *
  from
    account
 limit 1;

explain
select
  id
  from
    account
 where
  id = (select id from account limit 1)

explain
select
  id
  from
    account
 where
   id = 'a0000000-6432-6463-3364-62632d616466';
