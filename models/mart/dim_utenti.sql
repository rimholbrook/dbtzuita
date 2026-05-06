with

source as (

    select * from {{ ref('stg_utenti') }}

)

select * from source