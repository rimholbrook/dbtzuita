with

source as (

    select * from {{ ref('stg_coupon') }}

)

select * from source