with 

source as (

    select * from {{ source('instacart_raw', 'extracted_aisles') }}

),

renamed as (

    select
        cast(aisle_id as integer)as aisle_id,
        cast(aisle as string)as aisle

    from source

)

select * from renamed