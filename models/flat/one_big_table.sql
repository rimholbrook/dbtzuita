with

coupon as (

    select * from {{ ref('dim_coupon') }}

),

metodi as (

    select * from {{ ref('dim_metodi') }}

),

piani as (

    select * from {{ ref('dim_piani') }}

),

utenti as (

    select * from {{ ref('dim_utenti') }}

),

ordini as (

    select * from {{ ref('fct_ordini') }}

),
one_table as(
    select ordini.*,
    coupon.codice,
    coupon.sconto,
    metodi.nome,
    piani.nome,
    piani.prezzo,
    piani.durata,
    utenti.nome,
    utenti.cognome,
    utenti.data_nascita,
    utenti.data_registrazione
    
    from ordini
    left join coupon on ordini.id_coupon = coupon.id_coupon
    left join metodi on ordini.id_metodi = metodi.id_metodi
    left join piani on ordini.id_piani = piani.id_piani
    left join utenti on ordini.id_utenti = utenti.id_utenti
)

select * from one_table