is_psql_up() {
    psql -c "select 1"
}

until is_psql_up; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

psql -f create_tables.sql
test_exit_code=$?

if [ "$test_exit_code" != 0 ]
then
  >&2 echo "Failed creating the tables"
  exit 1
fi

echo "Success creating the tables"
exit 0
