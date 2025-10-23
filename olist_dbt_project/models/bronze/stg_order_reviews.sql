{{
    config(
        materialized='table',
        schema='ANALYTICS_BR',
        tags=['bronze','staging','order_reviews']
    )
}}

WITH source AS (
    SELECT *
    FROM {{ src('reviews') }}
)

-- Source columns: "review_id","order_id","review_score","review_comment_title","review_comment_message","review_creation_date","review_answer_timestamp"
SELECT *, CURRENT_TIMESTAMP() AS loaded_at
FROM source
