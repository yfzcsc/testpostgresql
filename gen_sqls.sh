set -e
cd ./tpch/dbgen
for i in `seq 1 22`
do
  DSS_QUERY=./queries/pgsql ./qgen -r 604122729 $i > ../../queries/pgsql/$i.sql
done