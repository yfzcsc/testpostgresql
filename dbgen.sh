set +e
createdb $DBNAME
set -e
date > results/begin_gen_time
psql -U admin -d $DBNAME -a -f drop_tables.sql -o results/output_drop_tables
psql -U admin -d $DBNAME -a -f create_tables.sql -o results/output_create_tables
#psql -U admin -d $DBNAME -a -f create_index.sql -o results/output_create_index
cd tpch/dbgen
rm -f *.tbl
./dbgen -s $SCALE
cd ../..
date > results/end_gen_tbl_time
psql -U admin -d $DBNAME -a -f load_data.sql -o results/load_data.sql
date > results/end_load_time
./gen_sqls.sh
psql -U admin -d $DBNAME -a -f create_index.sql -o results/output_create_index
date > results/end_gen_time
