-- using 604122729 as a seed to the RNG
BEGIN;



select
	sum(l_extendedprice * l_discount) as revenue
from
	lineitem
where
	l_shipdate >= date '1997-01-01'
	and l_shipdate < cast(date '1997-01-01' + interval '1 year' as date)
	and l_discount between 0.05 - 0.01 and 0.05 + 0.01
	and l_quantity < 24;
COMMIT;

