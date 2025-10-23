{{
    config(
        materialized='table',
        schema='ANALYTICS_BR',
        tags=['bronze', 'staging', 'customers']
    )
}}

-- Bronze/Staging layer for Customers
-- Source: olist_customers_dataset seed
-- This model creates a cleaned and standardized version of the raw customer data
-- Source columns:
-- "customer_id","customer_unique_id","customer_zip_code_prefix","customer_city","customer_state"

WITH source AS (
    SELECT *
    FROM {{ ref('olist_customers_dataset') }}
),

renamed AS (
    SELECT
        *,
        -- Add metadata columns
        CURRENT_TIMESTAMP() AS loaded_at
    FROM source
)

SELECT * FROM renamed
