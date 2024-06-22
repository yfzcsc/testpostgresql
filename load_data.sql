\copy "region"     from './tpch/dbgen/region.tbl'        DELIMITER '|' CSV;
\copy "nation"     from './tpch/dbgen/nation.tbl'        DELIMITER '|' CSV;
\copy "customer"   from './tpch/dbgen/customer.tbl'    DELIMITER '|' CSV;
\copy "supplier"   from './tpch/dbgen/supplier.tbl'    DELIMITER '|' CSV;
\copy "part"       from './tpch/dbgen/part.tbl'            DELIMITER '|' CSV;
\copy "partsupp"   from './tpch/dbgen/partsupp.tbl'    DELIMITER '|' CSV;
\copy "orders"     from './tpch/dbgen/orders.tbl'        DELIMITER '|' CSV;
\copy "lineitem"   from './tpch/dbgen/lineitem.tbl'    DELIMITER '|' CSV;