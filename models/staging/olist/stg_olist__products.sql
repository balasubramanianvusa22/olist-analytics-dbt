with source as (
    select * from {{ source('olist', 'products') }}
),

renamed as (
    select
        product_id,
        product_category_name,
        product_name_lenght as product_name_length,  -- fix the source typo
        product_description_lenght as product_description_length,  -- fix the source typo
        product_photos_qty as product_photo_count,
        product_weight_g,
        product_length_cm,
        product_height_cm,
        product_width_cm
    from source
)

select * from renamed
