-- 1) Top 10 Countries by Meteorite Falls
SELECT
  l.country,
  COUNT(*) AS fall_count
FROM meteorites m
JOIN locations l USING(location_id)
GROUP BY l.country
ORDER BY fall_count DESC
LIMIT 10;

-- 2) Persist it as a view for your dashboard
CREATE OR REPLACE VIEW vw_top10_countries AS
SELECT
  l.country,
  COUNT(*) AS fall_count
FROM meteorites m
JOIN locations l USING(location_id)
GROUP BY l.country
ORDER BY fall_count DESC
LIMIT 10;

-- 2a) Preview: Meteorite Falls Per Year (time series)
SELECT
  fall_year,
  COUNT(*) AS num_falls
FROM meteorites
GROUP BY fall_year
ORDER BY fall_year;

-- 2b) Persist as view
CREATE OR REPLACE VIEW vw_falls_over_time AS
SELECT
  fall_year,
  COUNT(*) AS num_falls
FROM meteorites
GROUP BY fall_year
ORDER BY fall_year;

-- 3a) Preview: Top 10 Regions by Meteorite Falls
SELECT
  l.region,
  COUNT(*) AS fall_count
FROM meteorites m
JOIN locations l USING(location_id)
GROUP BY l.region
ORDER BY fall_count DESC
LIMIT 10;

-- 3b) Persist as view
CREATE OR REPLACE VIEW vw_top10_regions AS
SELECT
  l.region,
  COUNT(*) AS fall_count
FROM meteorites m
JOIN locations l USING(location_id)
GROUP BY l.region
ORDER BY fall_count DESC
LIMIT 10;


-- 4a) Preview: Top 10 Meteorite Classes by Frequency
SELECT
  c.class_name,
  COUNT(*) AS class_count
FROM meteorites m
JOIN meteorite_classification c USING(class_id)
GROUP BY c.class_name
ORDER BY class_count DESC
LIMIT 10;

-- 4b) Persist as view
CREATE OR REPLACE VIEW vw_top10_classes AS
SELECT
  c.class_name,
  COUNT(*) AS class_count
FROM meteorites m
JOIN meteorite_classification c USING(class_id)
GROUP BY c.class_name
ORDER BY class_count DESC
LIMIT 10;


-- 5a) Preview: Average Meteorite Mass by Class (classes with ≥50 samples)
SELECT
  c.class_name,
  COUNT(*)              AS count_by_class,
  ROUND(AVG(m.mass),2)  AS avg_mass
FROM meteorites m
JOIN meteorite_classification c USING(class_id)
GROUP BY c.class_name
HAVING COUNT(*) >= 50
ORDER BY count_by_class DESC;

-- 5b) Persist as view
CREATE OR REPLACE VIEW vw_avg_mass_by_class AS
SELECT
  c.class_name,
  COUNT(*)              AS count_by_class,
  ROUND(AVG(m.mass),2)  AS avg_mass
FROM meteorites m
JOIN meteorite_classification c USING(class_id)
GROUP BY c.class_name
HAVING COUNT(*) >= 50
ORDER BY count_by_class DESC;

-- 6a) Preview: Top 10 Scientists by Number of Studies
SELECT
  s.scientist_name,
  COUNT(*) AS study_count
FROM studies st
JOIN scientists s USING(scientist_id)
GROUP BY s.scientist_name
ORDER BY study_count DESC
LIMIT 10;

-- 6b) Persist as view
CREATE OR REPLACE VIEW vw_top10_scientists_by_studies AS
SELECT
  s.scientist_name,
  COUNT(*) AS study_count
FROM studies st
JOIN scientists s USING(scientist_id)
GROUP BY s.scientist_name
ORDER BY study_count DESC
LIMIT 10;

-- 7a) Preview: Total Funding by Sponsor (Top 10)
SELECT
  sponsor,
  SUM(amount) AS total_funding
FROM funding
GROUP BY sponsor
ORDER BY total_funding DESC
LIMIT 10;

-- 7b) Persist as view
CREATE OR REPLACE VIEW vw_top10_sponsors AS
SELECT
  sponsor,
  SUM(amount) AS total_funding
FROM funding
GROUP BY sponsor
ORDER BY total_funding DESC
LIMIT 10;

-- 8a) Preview: Average Funding per Scientist (Top 10)
SELECT
  s.scientist_name,
  ROUND(AVG(f.amount),0) AS avg_funding
FROM funding f
JOIN scientists s USING(scientist_id)
GROUP BY s.scientist_name
ORDER BY avg_funding DESC
LIMIT 10;


-- 8b) Persist as view
CREATE OR REPLACE VIEW vw_avg_funding_per_scientist AS
SELECT
  s.scientist_name,
  ROUND(AVG(f.amount),0) AS avg_funding
FROM funding f
JOIN scientists s USING(scientist_id)
GROUP BY s.scientist_name
ORDER BY avg_funding DESC
LIMIT 10;
