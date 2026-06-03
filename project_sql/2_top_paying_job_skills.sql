/*
Question: **Business Question:**
What are the most in-demand skills required for the top-paying remote Data Analyst roles? This analysis focuses on identifying the
key technical and analytical skills associated with high-salary positions by examining the skill requirements of the top-paying jobs.
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    From job_postings_fact
    LEFT JOIN company_dim
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND 
        job_location='Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id;

/*
Key Insights:
* SQL and Python emerge as the most consistently required skills across high-paying Data Analyst roles, making them essential for candidates targeting top-tier salaries.
* Data visualization tools such as Tableau and Power BI are frequently required, highlighting the importance of communicating insights effectively.
* Cloud and big data technologies like AWS, Azure, Snowflake, and Databricks appear in several high-paying roles, indicating a growing demand for scalable data processing skills.
* Advanced tools and libraries such as Pandas, NumPy, and PySpark are commonly associated with higher-paying positions, reflecting the need for strong data manipulation capabilities.
* Senior-level roles tend to require a broader skill set, including both technical tools and workflow/platform tools like Git, Jira, and Confluence.
* Overall, high-paying Data Analyst roles demand a combination of core analytics skills (SQL, Python), visualization expertise, and modern data infrastructure knowledge.
*/