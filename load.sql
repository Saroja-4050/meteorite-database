-- 1) Classification
\copy meteorite_classification(class_id, class_name)
  FROM 'meteorite_classification.csv' WITH (FORMAT csv, HEADER);

-- 2) Locations
\copy locations(location_id, latitude, longitude, region, country)
  FROM 'locations.csv' WITH (FORMAT csv, HEADER);

-- 3) Institutions
\copy institutions(institution_id, institution_name, institution_country)
  FROM 'institutions.csv' WITH (FORMAT csv, HEADER);

-- 4) Scientists
\copy scientists(scientist_id, email, institution_id, scientist_name)
  FROM 'scientists.csv' WITH (FORMAT csv, HEADER);

-- 5) Meteorites
\copy meteorites(meteorite_id, class_id, location_id, meteorite_name, mass, fall_type, fall_year)
  FROM 'cleaned_meteorite_landings.csv' WITH (FORMAT csv, HEADER);

-- 6) Findings
\copy findings(finding_id, meteorite_id, findings, discovery_year)
  FROM 'findings.csv' WITH (FORMAT csv, HEADER);

-- 7) Funding
\copy funding(funding_id, scientist_id, amount, sponsor, year)
  FROM 'funding.csv' WITH (FORMAT csv, HEADER);

-- 8) Studies
\copy studies(study_id, meteorite_id, scientist_id, study_date)
  FROM 'studies.csv' WITH (FORMAT csv, HEADER);

-- 9) Research_Papers
\copy research_papers(paper_id, scientist_id, title, journal_name, publication_date)
  FROM 'research_papers.csv' WITH (FORMAT csv, HEADER);

-- 10) Expeditions
\copy expeditions(expedition_id, meteorite_id, scientist_id, expedition_date, notes)
  FROM 'expeditions.csv' WITH (FORMAT csv, HEADER);
