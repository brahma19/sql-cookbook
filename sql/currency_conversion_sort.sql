-- create table exchange_rate
-- (
-- currency varchar2(10),
-- rate number
-- );

-- insert into exchange_rate values('USD',50);
-- insert into exchange_rate values('INR',75);
-- insert into exchange_rate values('CHF',90);

-- select * from exchange_rate;

select 
a.currency||'/'||b.currency currency_conversion,
a.rate||'/'||b.rate rate,
greatest(a_sort_key,b_sort_key) sort_key,
greatest(a.currency,b.currency) sort_key2 from 
(select currency,rate,case when currency='CHF' then null else currency end a_sort_key from exchange_rate) a 
inner join 
(select currency,rate,case when currency='CHF' then null else currency end b_sort_key from exchange_rate) b
on a.currency<>b.currency
order by sort_key  nulls first,sort_key2;
