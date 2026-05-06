with

source as (

    select * from {{ ref('stg_piani') }}

)

select * from source