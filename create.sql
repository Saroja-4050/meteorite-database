-- 1. Meteorite_Classification
CREATE TABLE Meteorite_Classification (
  class_id    INT    PRIMARY KEY,
  class_name  TEXT   NOT NULL
);

-- 2. Locations
CREATE TABLE Locations (
  location_id  INT PRIMARY KEY,
  latitude     DOUBLE PRECISION NOT NULL,
  longitude    DOUBLE PRECISION NOT NULL,
  region       TEXT NOT NULL,
  country      TEXT NOT NULL
);

-- 3. Institutions
CREATE TABLE Institutions (
  institution_id      INT PRIMARY KEY,
  institution_name    TEXT NOT NULL,
  institution_country TEXT NOT NULL
);

-- 4. Scientists
CREATE TABLE Scientists (
  scientist_id   INT PRIMARY KEY,
  email          TEXT UNIQUE NOT NULL,
  institution_id INT NOT NULL
    REFERENCES Institutions(institution_id),
  scientist_name TEXT NOT NULL
);

-- 5. Meteorites
CREATE TABLE Meteorites (
  meteorite_id   INT PRIMARY KEY,
  class_id       INT NOT NULL
    REFERENCES Meteorite_Classification(class_id),
  location_id    INT NOT NULL
    REFERENCES Locations(location_id),
  meteorite_name TEXT NOT NULL,
  mass           NUMERIC,
  fall_type      VARCHAR(10),
  fall_year      SMALLINT
);

-- 6. Findings
CREATE TABLE Findings (
  finding_id     INT PRIMARY KEY,
  meteorite_id   INT NOT NULL
    REFERENCES Meteorites(meteorite_id),
  findings       TEXT NOT NULL,
  discovery_year SMALLINT NOT NULL
);

-- 7. Funding
CREATE TABLE Funding (
  funding_id   INT PRIMARY KEY,
  scientist_id INT NOT NULL
    REFERENCES Scientists(scientist_id),
  amount       INT NOT NULL,
  sponsor      TEXT NOT NULL,
  year         SMALLINT NOT NULL
);

-- 8. Studies
CREATE TABLE Studies (
  study_id     INT PRIMARY KEY,
  meteorite_id INT NOT NULL
    REFERENCES Meteorites(meteorite_id),
  scientist_id INT NOT NULL
    REFERENCES Scientists(scientist_id),
  study_date   DATE NOT NULL
);

-- 9. Research_Papers
CREATE TABLE Research_Papers (
  paper_id         INT PRIMARY KEY,
  scientist_id     INT NOT NULL
    REFERENCES Scientists(scientist_id),
  title            TEXT NOT NULL,
  journal_name     TEXT NOT NULL,
  publication_date DATE NOT NULL
);

-- 10. Expeditions
CREATE TABLE Expeditions (
  expedition_id   INT PRIMARY KEY,
  meteorite_id    INT NOT NULL
    REFERENCES Meteorites(meteorite_id),
  scientist_id    INT NOT NULL
    REFERENCES Scientists(scientist_id),
  expedition_date DATE NOT NULL,
  notes           TEXT
);

