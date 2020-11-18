{{
    config(
    materialized="table"
    )
}}

SELECT *
FROM raw.stripe.payment