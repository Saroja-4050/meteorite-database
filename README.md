# 🌠 Meteorite Discoveries & Research Dashboard

A deep dive into NASA’s Meteorite Landings dataset, extended with synthetic research data on institutions, scientists, funding, expeditions, studies, findings, and papers. Explore where and when meteorites fell, which classes are most common, who studies them, and who funds the work.

## 📖 Data Sources

-   **Primary:** NASA Meteorite Landings on Kaggle
    [`https://www.kaggle.com/datasets/nasa/meteorite-landings`](https://www.kaggle.com/datasets/nasa/meteorite-landings)
-   **Synthetic extensions (generated via Python notebooks):**
    -   `institutions.csv`
    -   `scientists.csv`
    -   `expeditions.csv`
    -   `funding.csv`
    -   `research_papers.csv`
    -   `studies.csv`
    -   `findings.csv`

## ⚙️ Setup

1.  **Create schema & tables**
    ```bash
    psql -d postgres -f create.sql
    ```
    *(Note: Ensure you have created the `meteorites_db` database first or adjust the target database)*

2.  **Bulk-load data**
    ```bash
    psql -d meteorites_db -f load.sql
    ```
    *(Note: Adjust file paths in `load.sql` if your CSV files are not in the expected location relative to where you run psql)*

3.  **Verify**
    -   Open pgAdmin4 or connect via `psql -d meteorites_db`
    -   Browse tables under `meteorites_db` -> `schemas` -> `public` -> `Tables`
    -   Check views under `Views` (e.g. `vw_top10_countries`, `vw_falls_over_time`, etc.)

## 📊 Dashboards

*Note: Embedded dashboards may not render in all Markdown previews. Please use the direct links below for the full interactive experience.*

### Dashboard 1: Meteorite Discoveries & Research

[![Meteorite Discoveries & Research Dashboard](https://public.tableau.com/static/images/Bo/Book1_17451869816810/Dashboard1/1.png)](https://public.tableau.com/views/Book1_17451869816810/Dashboard1?publish=yes)

**[➡️ View Live Dashboard 1](https://public.tableau.com/views/Book1_17451869816810/Dashboard1?publish=yes)**

### Dashboard 2: Extended Research Insights

[![Extended Research Insights Dashboard](https://public.tableau.com/static/images/Bo/Book1_17451869816810/Dashboard2/1.png)](https://public.tableau.com/views/Book1_17451869816810/Dashboard2?publish=yes)

**[➡️ View Live Dashboard 2](https://public.tableau.com/views/Book1_17451869816810/Dashboard2?publish=yes)**

## 📝 License & Acknowledgments

-   Data licensed under NASA Open Data Commons Public Domain Dedication.
-   Synthesized research data created for educational purposes.
