```markdown
# 🌠 Meteorite Discoveries & Research Dashboard

A deep dive into NASA’s Meteorite Landings dataset, extended with synthetic research data on institutions, scientists, funding, expeditions, studies, findings, and papers. Explore where and when meteorites fell, which classes are most common, who studies them, and who funds the work.

---

## 📂 Repository Contents

```
meteorite-database/
├── DATASETS/                        ← Original & cleaned CSVs  
├── query output screen shots/       ← Screenshots of SQL results  
├── Dataset_cleaning.ipynb           ← Jupyter: clean & synthesize data  
├── FINAL_FIXES.ipynb                ← Jupyter: final CSV re‑ordering  
├── create.sql                       ← DDL to build all tables/views  
├── load.sql                         ← COPY commands to bulk‑load data  
└── README.md                        ← ← You are here  
```

---

## 📖 Data Sources

- **Primary:** NASA Meteorite Landings on Kaggle  
  https://www.kaggle.com/datasets/nasa/meteorite-landings  
- **Synthetic extensions:**  
  - `institutions.csv`  
  - `scientists.csv`  
  - `expeditions.csv`  
  - `funding.csv`  
  - `research_papers.csv`  
  - `studies.csv`  
  - `findings.csv`  
  *(Generated via Python notebooks to simulate realistic research metadata.)*

---

## ⚙️ Setup

1. **Create schema & tables**  
   ```bash
   psql -d postgres -f create.sql
   ```
2. **Bulk‑load data**  
   ```bash
   psql -d meteorites_db -f load.sql
   ```
3. **Verify**  
   - Open `pgAdmin4` (or `psql`)  
   - Browse tables under `meteorites_db/public`  
   - Check views under **Views** (e.g. `vw_top10_countries`, `vw_falls_over_time`, etc.)

---

## 📊 Dashboards

### 1. Meteorite Discoveries & Research Dashboard  
<p align="center">
  <a href="https://public.tableau.com/views/Book1_17451869816810/Dashboard1?publish=yes" target="_blank">
    <img
      src="https://public.tableau.com/static/images/Bo/Book1_17451869816810/Dashboard1/1.png"
      alt="Meteorite Discoveries & Research Dashboard"
      style="max-width:100%; height:auto; border:1px solid #eee; box-shadow:0 2px 4px rgba(0,0,0,0.1);"
    />
  </a>
</p>
_Click the image above for the **interactive** version on Tableau Public._

---

### 2. Extended Research Insights Dashboard  
<p align="center">
  <a href="https://public.tableau.com/views/Book1_17451869816810/Dashboard2?publish=yes" target="_blank">
    <img
      src="https://public.tableau.com/static/images/Bo/Book1_17451869816810/Dashboard2/1.png"
      alt="Extended Research Insights Dashboard"
      style="max-width:100%; height:auto; border:1px solid #eee; box-shadow:0 2px 4px rgba(0,0,0,0.1);"
    />
  </a>
</p>
_Click the image above for additional analyses on funding, expeditions, studies, and findings._

---

## 🔗 Live Links

- ▶️ **Dashboard 1:** https://public.tableau.com/views/Book1_17451869816810/Dashboard1  
- ▶️ **Dashboard 2:** https://public.tableau.com/views/Book1_17451869816810/Dashboard2  

---

## 📝 License & Acknowledgments

- Data licensed under [NASA Open Data Commons Public Domain Dedication](https://opendata.nasa.gov/)  
- Synthesized research data created for educational purposes  

---

> _Built by Saroja Amarsha – April 2025_  
```
