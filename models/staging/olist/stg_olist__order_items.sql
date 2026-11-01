with source as (
    select * from {{ source('olist', 'order_items') }}
),

renamed as (
    select
        order_id,
        order_item_id as order_item_number,  -- 1..n within an order, not a unique id
        product_id,
        seller_id,
        cast(shipping_limit_date as timestamp) as shipping_limit_at,  -- has a time part
        cast(price as decimal(10, 2)) as price,
        cast(freight_value as decimal(10, 2)) as freight_value
    from source
)

select * from renamed
