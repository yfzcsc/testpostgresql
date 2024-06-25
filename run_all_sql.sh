for i in `seq 1 22`
do
  echo $i
  sudo systemctl restart postgresql
  echo 3 | sudo tee /proc/sys/vm/drop_caches
  for j in `seq 1 5`
  do
    /usr/bin/time -f "real: %e\t user: %U\t sys: %S" -o results/time_$i-$j psql -U admin -d test -f queries/pgsql/$i.sql > results/output_$i-$j
    cat results/time_$i-$j
  done
done
