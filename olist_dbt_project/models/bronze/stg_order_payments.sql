{{
    config(
        materialized='table',
        schema='ANALYTICS_BR',
        tags=['bronze','staging','payments']
    )
}}

WITH source AS (
    SELECT *
    FROM {{ src('payments') }}
)

-- Source columns: "order_id","payment_sequential","payment_type","payment_installments","payment_value"
SELECT *, CURRENT_TIMESTAMP() AS loaded_at
FROM source
