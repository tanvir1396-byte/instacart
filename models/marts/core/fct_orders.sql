with orders as(
    select * from {{ref('stg_instacart__extracted_orders')}}
),

prior as(
    select *from {{ref('stg_instacart_raw__extracted_order_products_prior')}}
),

final as(
    select
    o.order_id,
    p.product_id,
    p.add_to_cart_order,
    p.reordered

    from orders as o
    join prior as p
    ON o.order_id=p.order_id


)

select * from final