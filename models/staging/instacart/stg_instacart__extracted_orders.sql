with 

source as (

    select * from {{ source('instacart_raw', 'extracted_orders') }}

),

renamed as (

    select
    Cast (order_id as integer)as order_id,
    Cast(user_id as integer)as user_id,
    Cast(eval_set as string)as eval_set,
    Cast(order_number as integer)as order_number,
    Cast(order_dow as integer)as order_dow,
    Cast(order_hour_of_day as integer)as order_hour_of_day,
    Cast(days_since_prior_order as integer)as days_since_prior_order ,
    from source

)

select * from renamed