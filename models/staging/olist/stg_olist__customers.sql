with source as (
    select * from {{ source('olist', 'customers') }}
),

renamed as (
    select
        customer_id,  -- one per order, not per person
        customer_unique_id,  -- the actual person
        cast(customer_zip_code_prefix as varchar) as customer_zip_code_prefix,  -- keep leading zeros
        customer_city,
        customer_state
    from source
)

select * from renamed
