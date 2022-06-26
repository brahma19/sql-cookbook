CREATE TABLE PAR_CHI
(PARENT_SN VARCHAR2(50 BYTE) ,
 CHILD_SN VARCHAR2(50 BYTE) NOT NULL
);
 
insert into PAR_CHI values ('', '135887957');
insert into PAR_CHI values ('135887957', '135562597');
insert into PAR_CHI values ('135562597', '135424162');
insert into PAR_CHI values ('135424162', '135422839');
insert into PAR_CHI values ('135887957', '135623876');
insert into PAR_CHI values ('135623876', '135519894');
insert into PAR_CHI values ('135519894', '135517981');
insert into PAR_CHI values ('135887957', '136526805');

select PARENT_SN, CHILD_SN as ROOT, level, 
connect_by_root(CHILD_SN) as Searched_val, 
sys_connect_by_path(CHILD_SN, '/') as path, connect_by_isleaf
from PAR_CHI
where connect_by_isleaf = 1
--start with CHILD_SN = '135422839'
connect by CHILD_SN = prior PARENT_SN
order by 3;

create or replace view test_hierarchy as 
select PARENT_SN, CHILD_SN as ROOT, level level_in, 
connect_by_root(CHILD_SN) as Searched_val, 
sys_connect_by_path(CHILD_SN, '/') as path
from PAR_CHI
where connect_by_isleaf = 1
--start with CHILD_SN = '135422839'
connect by CHILD_SN = prior PARENT_SN
;

 select * from test_hierarchy where searched_val='135422839';
