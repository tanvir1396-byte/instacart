with 

source as (

    select * from {{ source('instacart_raw', 'extracted_departments') }}

),

renamed as (

    select
        cast (department_id as integer)as department_id,
        cast(department as string) as department 

    from source

)

select * from renamed