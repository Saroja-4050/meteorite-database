CREATE OR REPLACE FUNCTION add_meteorite(
  _id        INT,
  _class     INT,
  _loc       INT,
  _name      TEXT,
  _mass      NUMERIC,
  _fall      TEXT,
  _year      SMALLINT
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO meteorites
    (meteorite_id, class_id, location_id, meteorite_name, mass, fall_type, fall_year)
  VALUES
    (_id, _class, _loc, _name, _mass, _fall, _year);
END;
$$;

SELECT add_meteorite(
  999999,      -- INT
  1,           -- INT
  1,           -- INT
  'TestRock',  -- TEXT
  123.4,       -- NUMERIC
  'Fell',      -- TEXT
  2020::SMALLINT  -- << explicit cast down to SMALLINT
);

SELECT * 
FROM meteorites 
WHERE meteorite_id = 999999;
