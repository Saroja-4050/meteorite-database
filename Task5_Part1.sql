INSERT INTO meteorites
  (meteorite_id, class_id, location_id, meteorite_name, mass, fall_type, fall_year)
VALUES
  (999999, 1, 1, 'Test Meteorite X', 1234.5, 'Found', 2025);

SELECT MAX(scientist_id) + 1 AS next_id
FROM scientists;

INSERT INTO scientists
  (scientist_id, email, institution_id, scientist_name)
VALUES
  (38115, 'new.scientist@example.com', 1, 'New Scientist');

UPDATE meteorites
SET mass = mass * 1.10
WHERE meteorite_id = 999999;

UPDATE funding
SET amount = amount + 50000
WHERE funding_id = 1;

DELETE FROM research_papers
WHERE paper_id = 9999;

DELETE FROM meteorites
WHERE meteorite_id = 999999;

SELECT
  m.meteorite_name,
  c.class_name
FROM meteorites AS m
JOIN meteorite_classification AS c
  ON m.class_id = c.class_id
LIMIT 10;

SELECT
  s.scientist_name,
  COUNT(study_id) AS num_studies
FROM scientists AS s
JOIN studies AS st
  ON s.scientist_id = st.scientist_id
GROUP BY s.scientist_name
ORDER BY num_studies DESC
LIMIT 5;

SELECT
  meteorite_name,
  fall_year
FROM meteorites
WHERE mass > (
  SELECT AVG(mass) FROM meteorites
);

SELECT
  l.country,
  COUNT(m.meteorite_id) AS count_per_country
FROM locations AS l
JOIN meteorites AS m
  ON l.location_id = m.location_id
GROUP BY l.country
HAVING COUNT(m.meteorite_id) > 100;

SELECT
  scientist_id,
  journal_name,
  publication_date
FROM research_papers
WHERE publication_date BETWEEN '2010-01-01' AND '2020-12-31'
ORDER BY publication_date;

SELECT
  meteorite_id,
  meteorite_name,
  mass,
  RANK() OVER (ORDER BY mass DESC) AS mass_rank
FROM meteorites
LIMIT 10;

SELECT
  meteorite_name,
  fall_type
FROM meteorites
WHERE location_id IN (
  SELECT location_id
  FROM locations
  WHERE country = 'USA'
);

SELECT
  st.study_id,
  m.meteorite_name,
  s.scientist_name,
  st.study_date
FROM studies AS st
JOIN meteorites AS m ON st.meteorite_id = m.meteorite_id
JOIN scientists AS s ON st.scientist_id = s.scientist_id
ORDER BY st.study_date DESC
LIMIT 5;

SELECT
  sponsor,
  SUM(amount) AS total_grant
FROM funding
GROUP BY sponsor
ORDER BY total_grant DESC
LIMIT 10;
