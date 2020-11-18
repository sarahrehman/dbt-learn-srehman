{{
    config(
    materialized="table"
    )
}}


WITH payments AS (

    SELECT
    id as customer_id
    , orderid as order_id
    , amount
    FROM {{ ref('payment_data') }}
)
, lifetime_value AS (

    SELECT
    id as customer_id
    , SUM(amount) as lifetime_value_amount
    FROM {{ ref('payment_data') }}
    group by 1
)

SELECT
payments.customer_id
, payments.order_id
, lifetime_value_amount

FROM payments
LEFT JOIN lifetime_value ON payments.customer_id = lifetime_value.customer_id