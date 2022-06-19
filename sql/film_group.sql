/*
Instruction

Write a query to return the number of films in 3 separate groups: high, medium, low.
The order of your results doesn't matter.
Definition

high: revenue >= $100.
medium: revenue >= $20, <$100 .
low: revenue <$20.
Hint

If a movie has no rental revenue, it belongs to the low group
*/
select revenue film_group,count(film_id) cnt from (
select film_id,
case when sum(amount) >= 100 then 'high'
when sum(amount) >=20 and sum(amount)< 100 then 'medium'
else 'low' end
revenue from (
SELECT 
f.film_id,
i.inventory_id,
r.rental_id,
p.amount
FROM film f
left outer join
inventory i
on f.film_id= i.film_id
left outer join
rental r
on i.inventory_id=r.inventory_id
left outer join
payment p
on r.rental_id=p.rental_id
  ) dt group by film_id
  ) fin group by revenue
;
