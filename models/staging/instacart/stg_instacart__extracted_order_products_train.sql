with 

source as (

    select * from {{ source('instacart_raw', 'extracted_order_products_train') }}

),

renamed as (

    select
        Cast(order_id as integer) as order_id,
        Cast(product_id as integer)as product_id,
        Cast(add_to_cart_order as integer)as add_to_cart_order,
        Cast(reordered as integer) as recorded




        from source

)

select * from renamed