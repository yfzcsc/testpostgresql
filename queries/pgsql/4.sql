-- using 604122729 as a seed to the RNG
BEGIN;



select
	o_orderpriority,
	count(*) as order_count
from
	orders
where
	o_orderdate >= date '1994-11-01'
	and o_orderdate < cast(date '1994-11-01' + interval '3 month' as date)
	and exists (
		select
			*
		from
			lineitem
		where
			l_orderkey = o_orderkey
			and l_commitdate < l_receiptdate
	)
group by
	o_orderpriority
order by
	o_orderpriority;
COMMIT;

