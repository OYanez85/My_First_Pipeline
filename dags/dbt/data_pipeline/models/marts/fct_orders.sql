select 
    orders.*,
    order_item_summary.gross_item_sales_amount,
    
    -- Ensure the item_discount_amount is between 0 and 80
    case
        when order_item_summary.item_discount_amount < 0 then 0
        when order_item_summary.item_discount_amount > 80 then 80
        else order_item_summary.item_discount_amount
    end as item_discount_amount
    
from
    {{ ref('stg_tpch_orders') }} as orders
join
    {{ ref('int_order_items_summary') }} as order_item_summary
    on orders.order_key = order_item_summary.order_key

order by order_date

