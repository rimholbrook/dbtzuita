with 

ordini as ( 

    select * from {{ ref('stg_ordini') }}

),

transazioni as (

    select * from {{ ref('stg_transazioni') }}

),

rinnovi as (

    select * from {{ ref('stg_rinnovi') }}

),

abbonamenti as (

    select * from {{ ref('stg_abbonamenti') }}

),

joined as (

    select
        ordini.*,
        transazioni.data_transazione,
        transazioni.importo,
        rinnovi.attivo,
        abbonamenti.iniziato_il,
        abbonamenti.finito_il,         

    from ordini

    left join transazioni on ordini.id_ordine = transazioni.id_corsa
    left join rinnovi on ordini.id_ordine = rinnovi.id_corsa
    left join abbonamenti on ordini.id_ordine = abbonamenti.id_corsa

)

select * from joined