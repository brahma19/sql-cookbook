select
id,a_max_metric1,a_max_metric2,b_max_metric1,b_max_metric2,c_max_metric1,c_max_metric2,
d_max_metric1,d_max_metric2,e_max_metric1,e_max_metric2,f_max_metric1,f_max_metric2,g_max_metric1,g_max_metric2
from 
 (
 select id,case 
     when event_time_day=trunc(sysdate-7) then 7
     when event_time_day=trunc(sysdate-6) then 6
     when event_time_day=trunc(sysdate-5) then 5
     when event_time_day=trunc(sysdate-4) then 4
     when event_time_day=trunc(sysdate-3) then 3
     when event_time_day=trunc(sysdate-2) then 2
     when event_time_day=trunc(sysdate-1) then 1
end event_time_pivot,
max_metric1_perday,max_metric2_perday
  from (
select id, trunc(event_time) event_time_day,max(metric1) max_metric1_perday,max(metric2) max_metric2_perday
from test_pivot_report where event_time between trunc(sysdate-7) and trunc(sysdate) group by id, trunc(event_time)) d
 ) all_data
pivot
(
MAX(max_metric1_perday) max_metric1,
MAX(max_metric2_perday) max_metric2
FOR event_time_pivot in (7 as A,6 as B,5 as C,4 as D,3 as E,2 as F,1 as G));
