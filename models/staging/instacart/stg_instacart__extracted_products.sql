with 

source as (

    select * from {{ source('instacart_raw', 'extracted_products') }}

),

renamed as (

    select
    CAST (product_id as integer)as product_id,
    Cast(product_name as string) as product_name,
    Cast(aisle_id as integer)as aisle_id,
    Cast(department_id as integer) as department_id
    
    from source

)

select * from renamed