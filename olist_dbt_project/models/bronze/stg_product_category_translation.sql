{{
    config(
        materialized='table',
        schema='ANALYTICS_BR',
        tags=['bronze','staging','product_categories']
    )
}}

WITH source AS (
    SELECT *
    FROM {{ src('categories') }}
)
-- Source columns: "product_category_name","product_category_name_english"
SELECT *, CURRENT_TIMESTAMP() AS loaded_at
FROM source
