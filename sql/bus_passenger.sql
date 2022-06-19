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

select * from bus,passenger p
where bus.arrival_time>=p.arrival_time;


-- select * from bus;

-- select * from passenger;
