WITH source AS (
    SELECT * 
    FROM {{ src('olist_geolocation_dataset') }}
)

SELECT
    *,
    -- Add metadata columns
    CURRENT_TIMESTAMP() AS loaded_at
FROM source

   -- Source columns: "geolocation_zip_code_prefix","geolocation_lat","geolocation_lng","geolocation_city","geolocation_state"

{# geolocation_zip_code_prefix","geolocation_lat","geolocation_lng","geolocation_city","geolocation_state" #}