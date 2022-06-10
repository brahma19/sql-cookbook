select listagg(lvl,',') within group(order by lvl) col1 from (
select level lvl from dual connect by level<=3
) data;
