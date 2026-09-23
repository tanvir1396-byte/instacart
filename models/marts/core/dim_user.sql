with orders as(
    select *
    from {{ ref('stg_instacart__extracted_orders')}}
),

final as(
    select
    user_id,
    Count(order_id)as total_order,
    Max(order_number) as last_order,
    Min(order_number)as first_order
    from orders
    group by user_id
)
select *
from final