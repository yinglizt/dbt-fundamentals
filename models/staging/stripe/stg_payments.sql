with payments as (

    select
        id as payment_id,
        orderid as order_id,
        status,
        amount/100 as amount_in_dollar
       
    from raw.stripe.payment

)

select * from payments