WITH source As (
    SELECT * 
    FROM {{ src('olist_orders_dataset') }}
)

SELECT
    -- Source columns: "order_id","customer_id","order_status","order_purchase_timestamp","order_approved_at","order_delivered_carrier_date","order_delivered_customer_date","order_estimated_delivery_date"
    *,
    -- Add metadata columns
    CURRENT_TIMESTAMP() AS loaded_at
FROM source