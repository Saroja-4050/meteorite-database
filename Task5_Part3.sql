CREATE OR REPLACE FUNCTION update_meteorite(
  _id    INT,
  _name  TEXT,
  _mass  NUMERIC,
  _fall  TEXT,
  _year  SMALLINT
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE meteorites
    SET meteorite_name = _name,
        mass           = _mass,
        fall_type      = _fall,
        fall_year      = _year
  WHERE meteorite_id = _id;
END;
$$;

SELECT update_meteorite(
  999999,            -- meteorite_id
  'UpdatedRock',     -- new name
  200.1,             -- new mass
  'Found',           -- new fall_type
  2021::SMALLINT     -- new fall_year
);

-- 1. Show the full row you just updated
SELECT
  meteorite_id,
  meteorite_name,
  mass,
  fall_type,
  fall_year
FROM meteorites
WHERE meteorite_id = 999999;
