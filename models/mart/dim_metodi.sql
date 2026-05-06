with

source as (

    select * from {{ ref('stg_metodi') }}

)

select * from source