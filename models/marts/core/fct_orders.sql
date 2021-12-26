with customers as (

    select * from {{ ref('stg_customers')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (
  select * from {{ ref('stg_payments') }}
),

order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount_in_dollar end) as total_amount

    from payments
    group by 1
), 

final as (

    select
        orders.order_id,
        orders.customer_id,
        order_payments.total_amount
    from orders

  left join order_payments using (order_id)

)

select * from final