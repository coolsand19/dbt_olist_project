{{
    config(
        materialized='table',
        schema='ANALYTICS_BR',
        tags=['bronze','staging','sellers']
    )
}}

WITH source AS (
    SELECT *
    FROM {{ src('sellers') }}
)
-- Source columns: "seller_id","seller_zip_code_prefix","seller_city","seller_state"
SELECT *, CURRENT_TIMESTAMP() AS loaded_at
FROM source
