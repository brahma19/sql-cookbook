create table test_pivot_report
(
id         number,
event_time date,
metric1    number,
metric2    number
);

/* insert dummy data */
insert into test_pivot_report values(1,to_date('2021-02-18 10:15','yyyy-mm-dd hh24:mi'),4.56,2.13);
insert into test_pivot_report values(1,to_date('2021-02-18 20:15','yyyy-mm-dd hh24:mi'),14.56,32.13);
insert into test_pivot_report values(1,to_date('2021-02-19 10:30','yyyy-mm-dd hh24:mi'),2.45,23.33);
insert into test_pivot_report values(1,to_date('2021-02-19 17:15','yyyy-mm-dd hh24:mi'),12.45,3.33);
insert into test_pivot_report values(1,to_date('2021-02-20 10:45','yyyy-mm-dd hh24:mi'),8.45,0.45);
insert into test_pivot_report values(1,to_date('2021-02-20 13:15','yyyy-mm-dd hh24:mi'),1.45,10.45);
insert into test_pivot_report values(1,to_date('2021-02-21 11:00','yyyy-mm-dd hh24:mi'),0.09,23.33);
insert into test_pivot_report values(1,to_date('2021-02-21 16:15','yyyy-mm-dd hh24:mi'),10.09,43.33);
insert into test_pivot_report values(1,to_date('2021-02-22 11:15','yyyy-mm-dd hh24:mi'),16.42,37.39);
insert into test_pivot_report values(1,to_date('2021-02-22 14:15','yyyy-mm-dd hh24:mi'),6.42,1.13);
insert into test_pivot_report values(2,to_date('2021-02-18 09:15','yyyy-mm-dd hh24:mi'),42.56,62.13);
insert into test_pivot_report values(2,to_date('2021-02-18 14:15','yyyy-mm-dd hh24:mi'),2.56,12.13);
insert into test_pivot_report values(2,to_date('2021-02-19 04:30','yyyy-mm-dd hh24:mi'),64.45,43.33);
insert into test_pivot_report values(2,to_date('2021-02-19 14:30','yyyy-mm-dd hh24:mi'),4.45,53.33);
insert into test_pivot_report values(2,to_date('2021-02-20 11:45','yyyy-mm-dd hh24:mi'),17.45,10.45);
insert into test_pivot_report values(2,to_date('2021-02-20 14:45','yyyy-mm-dd hh24:mi'),7.45,30.45);
insert into test_pivot_report values(2,to_date('2021-02-21 08:00','yyyy-mm-dd hh24:mi'),34.09,53.33);
insert into test_pivot_report values(2,to_date('2021-02-21 15:00','yyyy-mm-dd hh24:mi'),14.09,3.33);
insert into test_pivot_report values(2,to_date('2021-02-22 13:15','yyyy-mm-dd hh24:mi'),16.42,31.13);
insert into test_pivot_report values(2,to_date('2021-02-22 15:15','yyyy-mm-dd hh24:mi'),56.42,21.13);
