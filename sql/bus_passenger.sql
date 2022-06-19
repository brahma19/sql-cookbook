-- create table bus
-- (
-- id int,
-- arrival_time int
-- );

-- create table passenger
-- (
-- p_id int,
-- arrival_time int
-- );

-- insert into bus values(1,2);
-- insert into bus values(2,4);
-- insert into bus values(3,7);

-- insert into passenger values(11,1);
-- insert into passenger values(12,5);
-- insert into passenger values(13,6);
-- insert into passenger values(14,7);
-- insert into passenger values(15,7);
-- insert into passenger values(16,3);
-- insert into passenger values(17,2);
-- insert into passenger values(18,1);

select bus_id,
sum(
  case when patime-nvl(last_at,0) = 0 and p_id=last_pid
  then null
  else 1 end
  ) cnt from 
  (
select b.id bus_id,p.p_id,p.arrival_time patime, 
lag(p.arrival_time,1) over( order by p.arrival_time) last_at,
lag(p.p_id,1) over( order by p.arrival_time) last_pid 
from bus b,passenger p
where p.arrival_time<=b.arrival_Time
) a group by bus_id;


-- select * from bus;

select * from passenger;
delete from passenger where p_id >=15;
