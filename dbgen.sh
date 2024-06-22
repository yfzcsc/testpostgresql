set -e
psql -U fangzhou -d fangzhou -a -f drop_tables.sql -o results/output_drop_tables
psql -U fangzhou -d fangzhou -a -f create_tables.sql -o results/output_create_tables
# psql -U fangzhou -d fangzhou -a -f create_index.sql -o results/output_create_index
cd tpch/dbgen
rm -f *.tbl
./dbgen -s $SCALE
cd ../..
psql -U fangzhou -d fangzhou -a -f load_data.sql -o results/load_data.sql
./gen_sqls.sh