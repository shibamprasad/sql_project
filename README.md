# 📊 Data Analyst Job Market Analysis (SQL Project)

---

## 📌 Introduction
This project analyzes the Data Analyst job market using SQL by exploring job postings, salaries, and required skills. The objective is to uncover insights about high-paying roles, in-demand skills, and the most optimal skills for career growth.

SQL queries? Check them out here: [project_sql folder](/project_sql/)

---

## 📖 Background
The demand for Data Analysts is rapidly growing, but not all skills provide equal value. This project answers key questions:
- Which Data Analyst jobs pay the most?
- What skills are required for those high-paying jobs?
- Which skills are most in demand?
- Which skills offer the best combination of demand and salary?

---

## 🛠️ Tools I Used
- **SQL** → Data querying and analysis  
- **PostgreSQL** → Database management  
- **VS Code** → Development environment  
- **Git & GitHub** → Version control and project hosting  
- **ChatGPT** → Used for generating visualizations  

---

## 📊 The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1️⃣ Top Paying Data Analyst Jobs

To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.
```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```

### 📌 Key Insights

- Wide Salary Range: The top 10 Data Analyst roles range from approximately $184,000 to $650,000, highlighting strong earning potential and the presence of high-paying outlier roles.

- Senior Roles Dominate: Higher-paying positions are often senior-level roles such as Director and Principal Data Analyst, indicating that experience significantly impacts salary.

- Diverse Employers: Companies like SmartAsset, Meta, and AT&T offer top salaries, showing that high-paying opportunities exist across multiple industries.

## 📊 Visualization
![Top Paying Roles](/assets/1_top_paying_data_analyst_jobs.png)
*Figure: Top 10 highest-paying remote Data Analyst roles. Visualization generated using ChatGPT based on SQL query results.*

### 2️⃣ Skills Required for Top Paying Jobs

To understand which skills are required for high-paying Data Analyst roles, I joined job postings with skill data and filtered for remote positions with available salary information. This helps identify the key skills associated with top-paying opportunities.

```sql
SELECT
    skills_dim.skills,
    job_postings.salary_year_avg,
    company_dim.name
FROM job_postings_fact AS job_postings
INNER JOIN skills_job_dim 
    ON job_postings.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
INNER JOIN company_dim 
    ON job_postings.company_id = company_dim.company_id
WHERE 
    job_postings.job_title_short = 'Data Analyst'
    AND job_postings.job_location = 'Anywhere'
    AND job_postings.salary_year_avg IS NOT NULL;
```

### 📌 Key Insights

- Core Skills Dominate: SQL and Python appear consistently across high-paying roles, making them essential for Data Analysts targeting top salaries.

- Visualization Tools Matter: Tools like Tableau and Power BI are frequently required, highlighting the importance of presenting insights effectively.

- Cloud & Big Data Demand: Skills such as AWS, Azure, and Snowflake are present in several high-paying roles, indicating a shift towards modern data infrastructure.

- Advanced Data Handling: Libraries like Pandas, NumPy, and PySpark show that strong data processing capabilities are highly valued.

- Broader Skill Sets: Senior and high-paying roles often require a mix of technical, analytical, and workflow tools, reflecting increased responsibilities.

## 📊 Visualization
![Top Skills](/assets/2_top_skills_high_paying_jobs.png)
*Figure: Top skills required for high-paying Data Analyst roles (ChatGPT-generated visualization).*

### 3️⃣ Most In-Demand Skills

To identify the most in-demand skills, I analyzed the frequency of each skill across all job postings. This helps determine which skills are most commonly required by employers in the Data Analyst job market.

```sql
SELECT
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM skills_job_dim
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY skills_dim.skills
ORDER BY demand_count DESC
LIMIT 5;
```

### 📌 Key Insights

- SQL Dominates Demand: SQL is the most in-demand skill by a significant margin, making it essential for any Data Analyst role.

- Excel Remains Crucial: Excel continues to be highly востребован, showing its importance in business analysis and reporting.

- Python is Widely Used: Python ranks among the top skills, highlighting its role in data manipulation and automation.

| Skill    | Demand Count |
|----------|-------------|
| SQL      | 7291        |
| Excel    | 4611        |
| Python   | 4330        |
| Tableau  | 3745        |
| Power BI | 2609        |

*Table of the Top 5 skills in demand for data analyst*

### 4️⃣ Top Paying Skills

To identify the highest-paying skills, I calculated the average salary associated with each skill for remote Data Analyst roles. This helps determine which skills offer the greatest financial return.

```sql
SELECT
    skills_dim.skills,
    ROUND(AVG(job_postings.salary_year_avg),2) AS avg_salary
FROM job_postings_fact AS job_postings
INNER JOIN skills_job_dim 
    ON job_postings.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings.job_title_short = 'Data Analyst'
    AND job_postings.job_location = 'Anywhere'
    AND job_postings.salary_year_avg IS NOT NULL
GROUP BY skills_dim.skills
ORDER BY avg_salary DESC
LIMIT 25;
```

### 📌 Key Insights

- High-Paying Skills: Cloud and big data tools tend to offer higher salaries.

- Niche Advantage: Less common skills often command premium pay.

- Common Skills Plateau: Widely used skills like SQL appear across all salary levels.

| Skill         | Avg Salary ($) |
|--------------|----------------|
| PySpark      | 208,172        |
| Bitbucket    | 189,154        |
| Couchbase    | 160,515        |
| Watson       | 160,515        |
| DataRobot    | 155,485        |
| GitLab       | 154,500        |
| Swift        | 153,750        |
| Jupyter      | 152,776        |
| Pandas       | 151,821        |
| Elasticsearch| 145,000        |
| Golang       | 145,000        |
| NumPy        | 143,512        |
| Databricks   | 141,906        |
| Linux        | 136,507        |
| Kubernetes   | 132,500        |
| Atlassian    | 131,161        |
| Twilio       | 127,000        |
| Airflow      | 126,103        |
| Scikit-learn | 125,781        |
| Jenkins      | 125,436        |
| Notion       | 125,000        |
| Scala        | 124,903        |
| PostgreSQL   | 123,878        |
| GCP          | 122,500        |
| MicroStrategy| 121,619        |

*Table of the average salary for the top 10 paying skills for data analysts*

### 5️⃣ Most Optimal Skills (High Demand + High Salary)

To identify the most optimal skills, I combined both demand and salary by calculating the frequency of each skill along with its average salary. This helps highlight skills that provide both strong job opportunities and high earning potential.

```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    AVG(job_postings.salary_year_avg) AS avg_salary
FROM job_postings_fact AS job_postings
INNER JOIN skills_job_dim 
    ON job_postings.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings.salary_year_avg IS NOT NULL
    AND job_postings.job_work_from_home = TRUE
    AND job_postings.job_title_short = 'Data Analyst'
GROUP BY skills_dim.skill_id, skills_dim.skills
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY avg_salary DESC, demand_count DESC
LIMIT 25;
```

### 📌 Key Insights

- High Demand + High Pay: Skills like SQL and Python offer strong demand with good salaries.

- Specialized Edge: Cloud and big data tools boost earning potential.

- Smart Strategy: Combining core + advanced skills gives best career growth.

| Skill ID | Skill        | Demand | Avg Salary ($) |
|----------|-------------|--------|----------------|
| 8        | Go          | 27     | 115,319        |
| 234      | Confluence  | 11     | 114,209        |
| 97       | Hadoop      | 22     | 113,192        |
| 80       | Snowflake   | 37     | 112,947        |
| 74       | Azure       | 34     | 111,225        |
| 77       | BigQuery    | 13     | 109,653        |
| 76       | AWS         | 32     | 108,317        |
| 4        | Java        | 17     | 106,906        |
| 194      | SSIS        | 12     | 106,683        |
| 233      | Jira        | 20     | 104,917        |
| 79       | Oracle      | 37     | 104,533        |
| 185      | Looker      | 49     | 103,795        |
| 2        | NoSQL       | 13     | 101,413        |
| 1        | Python      | 236    | 101,397        |
| 5        | R           | 148    | 100,498        |
| 78       | Redshift    | 16     | 99,936         |
| 187      | Qlik        | 13     | 99,630         |
| 182      | Tableau     | 230    | 99,287         |
| 197      | SSRS        | 14     | 99,171         |
| 92       | Spark       | 13     | 99,076         |
| 13       | C++         | 11     | 98,958         |
| 186      | SAS         | 63     | 98,902         |
| 61       | SQL Server  | 35     | 97,785         |
| 9        | JavaScript  | 20     | 97,587         |

*Table of the most optimal skills for data analyst sorted by salary*

# 📚 What I Learned

- SQL can be used to extract real business insights, not just query data

- Data cleaning (handling NULLs, filtering roles) is critical for accurate analysis

- Improved my ability to write complex SQL queries using JOINs across multiple tables  

- Gained strong understanding of aggregation functions like COUNT() and AVG()  

- Learned how to use GROUP BY and HAVING effectively for filtering aggregated data  

- Developed better query structuring and readability practices  

- Understood how to translate business questions into SQL queries  

- Improved problem-solving skills by breaking down analytical questions step by step  

# ✅ Conclusions

- Top-Paying Data Analyst Jobs: The analysis revealed that remote Data Analyst roles can offer extremely high salaries, with a wide range between $184K and $650K. Senior-level positions such as Directors and Principal Analysts dominate the top-paying roles, highlighting the impact of experience on compensation.

- Skills Required for Top-Paying Jobs: High-paying roles consistently require strong technical foundations like SQL and Python, along with visualization tools and cloud technologies. This indicates that top companies expect a combination of analytical, technical, and data engineering skills.

- Most In-Demand Skills: SQL, Excel, and Python emerged as the most demanded skills across job postings, showing that employers prioritize both technical expertise and business-oriented tools for day-to-day data analysis tasks.

- Top Paying Skills: Specialized and less common skills such as cloud platforms and big data tools tend to offer higher average salaries. This suggests that niche expertise plays a significant role in increasing earning potential.

- Most Optimal Skills (High Demand + High Salary): The most valuable skills are those that balance both demand and salary, such as SQL and Python combined with cloud or big data tools. This highlights that the best career strategy is to build a strong foundation and then layer it with advanced, high-value skills.

# 💭 Closing Thoughts

This project helped me move beyond basic SQL queries and apply them to solve real-world analytical problems. By exploring different aspects of the job market, I was able to understand how data can be used to uncover meaningful insights and support decision-making.

Through this analysis, I learned that becoming a successful Data Analyst is not just about learning tools, but about understanding how to connect data with business questions. The combination of SQL skills, analytical thinking, and the ability to interpret results plays a crucial role in delivering impactful insights.

Overall, this project strengthened both my technical and analytical skills and provided a clear direction on how to approach real-world data problems in a structured way.