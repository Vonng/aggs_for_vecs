load test_helper

@test "float div to scalar lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(5::float, floats) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{5,NULL,2.5} | double precision[]" ]
}

@test "float div to scalar rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(floats, 5::float) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{0.2,NULL,0.4} | double precision[]" ]
}

@test "float div to array" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(floats, floats) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{1,NULL,1} | double precision[]" ]
}


@test "float div to null scalar lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::float, floats) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{NULL,NULL,NULL} | double precision[]" ]
}

@test "float div to null scalar rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(floats, NULL::float) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{NULL,NULL,NULL} | double precision[]" ]
}

@test "float div scalar to null array lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(5::float, NULL::float[]) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | double precision[]" ]
}

@test "float div scalar to null array rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::float[], 5::float) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | double precision[]" ]
}

@test "float div to null array lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(floats, NULL::float[]) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | double precision[]" ]
}

@test "float div to null array rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::float[], floats) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | double precision[]" ]
}


@test "null float div to null scalar lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::float, NULL::float[]) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | double precision[]" ]
}

@test "null float div to null scalar rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::float[], NULL::float) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | double precision[]" ]
}

@test "null float div to null array" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::float[], NULL::float[]) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | double precision[]" ]
}


@test "int div to scalar lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(5::int, ints) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{5,NULL,2} | integer[]" ]
}

@test "int div to scalar rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(ints, 5::int) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{0,NULL,0} | integer[]" ]
}

@test "int div to array" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(ints, ints) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{1,NULL,1} | integer[]" ]
}


@test "int div to null scalar lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::int, ints) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{NULL,NULL,NULL} | integer[]" ]
}

@test "int div to null scalar rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(ints, NULL::int) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{NULL,NULL,NULL} | integer[]" ]
}

@test "int div scalar to null array lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(5::int, NULL::int[]) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | integer[]" ]
}

@test "int div scalar to null array rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::int[], 5::int) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | integer[]" ]
}

@test "int div to null array lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(ints, NULL::int[]) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | integer[]" ]
}

@test "int div to null array rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::int[], ints) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | integer[]" ]
}


@test "null int div to null scalar lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::int, NULL::int[]) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | integer[]" ]
}

@test "null int div to null scalar rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::int[], NULL::int) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | integer[]" ]
}

@test "null int div to null array" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::int[], NULL::int[]) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | integer[]" ]
}


@test "numeric div to scalar lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(5::numeric, nums) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{4.0650406504065041,NULL,2.1367521367521368} | numeric[]" ]
}

@test "numeric div to scalar rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(nums, 5::numeric) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{0.24600000000000000000,NULL,0.46800000000000000000} | numeric[]" ]
}

@test "numeric div to array" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(nums, nums) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{1.00000000000000000000,NULL,1.00000000000000000000} | numeric[]" ]
}


@test "numeric div to null scalar lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::numeric, nums) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{NULL,NULL,NULL} | numeric[]" ]
}

@test "numeric div to null scalar rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(nums, NULL::numeric) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{NULL,NULL,NULL} | numeric[]" ]
}

@test "numeric div scalar to null array lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(5::numeric, NULL::numeric[]) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | numeric[]" ]
}

@test "numeric div scalar to null array rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::numeric[], 5::numeric) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | numeric[]" ]
}

@test "numeric div to null array lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(nums, NULL::numeric[]) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | numeric[]" ]
}

@test "numeric div to null array rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::numeric[], nums) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | numeric[]" ]
}


@test "null numeric div to null scalar lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::numeric, NULL::numeric[]) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | numeric[]" ]
}

@test "null numeric div to null scalar rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::numeric[], NULL::numeric) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | numeric[]" ]
}

@test "null numeric div to null array" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(NULL::numeric[], NULL::numeric[]) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "NULL | numeric[]" ]
}


@test "numeric div to scalar 0 lhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(0::numeric, nums) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{0.00000000000000000000,NULL,0.00000000000000000000} | numeric[]" ]
}

@test "numeric div to scalar 0 rhs" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(nums, 0::numeric) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{NaN,NULL,NaN} | numeric[]" ]
  # TODO: for PG 14+ we expect Infinity, not NaN; how model that requirement in test?
  # [ "$result" = "{Infinity,NULL,Infinity} | numeric[]" ]
}

@test "numeric div to array 0" {
  result="$(query "SELECT r, pg_typeof(r) FROM (SELECT vec_div(nums, ARRAY[0,0,1]::numeric[]) FROM measurements WHERE sensor_id IN (4)) r(r)")";
  echo $result;
  [ "$result" = "{NaN,NULL,2.3400000000000000} | numeric[]" ]
  # TODO: for PG 14+ we expect Infinity, not NaN; how model that requirement in test?
  # [ "$result" = "{Infinity,NULL,2.3400000000000000} | numeric[]" ]
}

