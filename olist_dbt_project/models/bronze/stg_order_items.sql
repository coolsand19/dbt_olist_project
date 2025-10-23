{{
    config(
        materialized='table',
        schema='ANALYTICS_BR',
        tags=['bronze','staging','order_items']
    )
}}

WITH source AS (
    SELECT *
    FROM {{ src('items') }}
)
-- Source columns: "order_id","order_item_id","product_id","seller_id","shipping_limit_date","price","freight_value"
SELECT *, CURRENT_TIMESTAMP() AS loaded_at
FROM source
