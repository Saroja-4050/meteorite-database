CREATE OR REPLACE FUNCTION delete_meteorite(
  _id  INT
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
  DELETE FROM meteorites
    WHERE meteorite_id = _id;
END;
$$;

SELECT delete_meteorite(999999);
