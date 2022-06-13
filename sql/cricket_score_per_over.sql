-- create table cricket
-- (
-- ball integer,
-- run varchar2(100)
-- );

-- insert into cricket values(1,4);
-- insert into cricket values(2,0);
-- insert into cricket values(3,2);
-- insert into cricket values(4,1);
-- insert into cricket values(5,1);
-- insert into cricket values(6,3);
-- insert into cricket values(7,6);
-- insert into cricket values(8,4);
-- insert into cricket values(9,4);
-- insert into cricket values(10,0);
-- insert into cricket values(11,0);
-- insert into cricket values(12,0);
-- insert into cricket values(13,1);

-- select * from cricket;

select overs,sum(run) runs from (
select trunc((ball-1)/6)+1 overs,ball,run from cricket
) group by overs order by 1;
