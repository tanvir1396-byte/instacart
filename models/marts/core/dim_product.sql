with products as(
    select * from {{ref('stg_instacart__extracted_products')}}
),

aisles as(
    select * from {{ref('stg_instacart_raw__extracted_aisles')}}
),
departments as(
    select * from {{ref('stg_instacart_raw__extracted_departments')}}
),

final as(
    select 
    p.product_name,
    p.product_id,
    p.aisle_id,
    p.department_id,
    a.aisle,
    d.department


    from products as p
    LEFT JOIN aisles as a
    ON p.aisle_id=a.aisle_id
    LEFT JOIN departments as d
    ON p.department_id=d.department_id
    )

select * from final



