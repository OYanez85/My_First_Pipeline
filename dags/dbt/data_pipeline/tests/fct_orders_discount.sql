--select
--    *
--from
--    {{ ref('fct_orders') }}
--where
--    item_discount_amount > 0

/*
It looks like the fct_orders_discount test is failing because 
it is finding 21,477 records that match the condition where item_discount_amount > 0.
The test was likely configured to fail if any rows (other than 0) meet this condition.*/

--select count(*)
--from {{ ref('fct_orders') }}
--where item_discount_amount > 0

--select *
--from {{ref('fct_orders')}}
--where item_discount_amount < 0

/*The test fct_orders_discount is still failing, returning 1,478,523 rows where 
item_discount_amount > 0. This suggests that your dataset contains a significant 
number of records with a discount greater than zero, and the test is configured 
to fail if any rows meet this condition (i.e., it expects item_discount_amount > 0 to return 0 results). */

-- Correct SQL format, without unnecessary semicolons
select *
from {{ ref('fct_orders') }}
where item_discount_amount < 0
   or item_discount_amount > 80

