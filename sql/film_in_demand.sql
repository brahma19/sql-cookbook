/*
Instruction

Write a query to return the number of in demand and not in demand movies in May 2020.
Assumptions (great to clarify in your interview): all films are available for rent before May.
But if a film is not in stock, it is not in demand.
The order of your results doesn't matter.
Definition
in-demand: rented >1 times in May 2020.
not-in-demand: rented <= 1 time in May 2020.

*/


select demand_category,count(film_id) cnt from (
select film_id,
case when count(rental_id) > 1 then 'in demand'
else 'not in demand' end demand_category from (
SELECT 
f.film_id,
i.inventory_id,
r.rental_id,
r.rental_ts,
extract(month from r.rental_ts) mon
FROM 
(select * from rental where extract(year from rental_ts)= 2020
 and extract(month from rental_ts)= 5
 )r
  right outer join
  inventory i
on i.inventory_id=r.inventory_id
  right outer join 
  film f
  on i.film_id=f.film_id
  ) a group by film_id
  ) all_data group by demand_Category
;
