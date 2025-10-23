{% macro src(table_alias) %}
    {# Map short aliases to actual table names #}
    {% set table_mapping = {
        'cust': 'olist_customers_dataset',
        'orders': 'olist_orders_dataset',
        'items': 'olist_order_items_dataset',
        'products': 'olist_products_dataset',
        'sellers': 'olist_sellers_dataset',
        'payments': 'olist_order_payments_dataset',
        'reviews': 'olist_order_reviews_dataset',
        'geo': 'olist_geolocation_dataset',
        'categories': 'product_category_name_translation'
    } %}
    
    {# If alias exists in mapping, use it; otherwise use the input as-is #}
    {% set actual_table = table_mapping.get(table_alias, table_alias) %}
    
    {{ source('raw', actual_table) }}
{% endmacro %}
