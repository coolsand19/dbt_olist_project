{{
    config(
        materialized='table',
        schema='ANALYTICS_BR',
        tags=['bronze','staging','products']
    )
}}

WITH source AS (
    SELECT *
    FROM {{ src('products') }}
)
-- Source columns: "product_id","product_category_name","product_name_lenght","product_description_lenght","product_photos_qty","product_weight_g","product_length_cm","product_height_cm","product_width_cm"
SELECT *, CURRENT_TIMESTAMP() AS loaded_at
FROM source
