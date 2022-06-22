--create table country
--( name varchar2(30)
--);


insert into country values('INDONESIA');
insert into country values('NEPAL');
insert into country values('INDIA');
insert into country values('CHINA');
--delete from country;


select name from country where name='INDIA'
UNION ALL
select * from 
(select name from country where name<>'INDIA' order by 1)a;

select name from country order by nullif(name,'INDIA') nulls first;



select name from (
select name,
count(case when name='INDIA' then name else null end) srt_key from country
group by name
) data
order by srt_key desc,name;
