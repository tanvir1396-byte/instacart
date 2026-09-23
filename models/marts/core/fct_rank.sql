with fct_orders as(
    select *
    from {{ref('fct_orders')}}
),

dim_products as(
    select *
    from {{ref('dim_product')}}
),

aggregated as(
    select
     d.product_id,
    d.product_name,
    d.aisle,
    d.department,
    SUM(o.reordered) as total_reorder,
    Count(o.order_id) as total_order

   
    from fct_orders as o
    JOIN dim_products as d
    ON o.product_id=d.product_id

    group by 
    d.product_id,
    d.product_name,
    d.aisle,
    d.department
),

rank as (
    select *,
    row_number() OVER(order by total_reorder DESC)as reorder_rank
    from aggregated
)

select *
from rank
Order by reorder_rank ASC
