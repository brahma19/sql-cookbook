with sample as (
select 1 as id, to_date('2000-01-01 04:30','YYYY-MM-DD HH24:MI') as StartDate, 
  to_date('2000-01-03 06:15','YYYY-MM-DD HH24:MI') as EndDate from dual union all
select 2 as id, to_date('2000-01-04 08:10','YYYY-MM-DD HH24:MI') as StartDate, 
  to_date('2000-01-04 17:25','YYYY-MM-DD HH24:MI') as EndDate from dual union all
select 3 as id, to_date('2000-01-05 11:00','YYYY-MM-DD HH24:MI') as StartDate, 
  to_date('2000-01-06 03:45','YYYY-MM-DD HH24:MI')as EndDate from dual
)
select s.id,
case 
when trunc(enddate)-trunc(startdate) =0 then startdate
when (trunc(startdate)+level-1) < startdate then startdate
else (trunc(startdate)+level-1)  end as startdate,
case when trunc(enddate)-trunc(startdate) =0 then enddate
when (trunc(startdate)+level)-1/86400 > enddate then enddate
else (trunc(startdate)+level)-1/86400  end as enddate from sample s
connect by level<=(trunc(enddate)-trunc(startdate))+1
and prior id = id and PRIOR SYS_GUID() is not null
order by id
;
