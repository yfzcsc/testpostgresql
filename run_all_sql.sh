for i in `seq 1 22`
do
  echo $i
  sudo systemctl restart postgresql
  echo 3 | sudo tee /proc/sys/vm/drop_caches
  for j in `seq 1 5`
  do
    /usr/bin/time -f "real: %e\t user: %U\t sys: %S" -o results/time_$i_$j psql -U fangzhou -d fangzhou -a -f queries/pgsql/$i.sql > results/output_$i_$j
    cat results/time_$i_$j
  done
done