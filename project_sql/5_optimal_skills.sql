/*
Question: What are the most optimal skills to learn i.e., it is in high demand and high paying as well?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (High Demand) and financial benefits (High Salaries),
    offering strategic insights for career development in data analysis
*/

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    AVG(job_postings.salary_year_avg) AS avg_salary
FROM job_postings_fact AS job_postings
INNER JOIN skills_job_dim ON job_postings.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings.salary_year_avg IS NOT NULL AND
    job_postings.job_work_from_home = TRUE AND
    job_postings.job_title_short = 'Data Analyst'
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id)>10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

/*
Key Insights:
* The most optimal skills are those that balance both high demand and high salary, making them valuable for both job security and financial growth.
* Core technical skills such as SQL and Python remain essential, but their true value increases when combined with high-paying specialized tools.
* Skills related to cloud computing (AWS, Azure), data warehousing (Snowflake), and big data technologies tend to rank highly due to their presence in both high-paying and frequently demanded roles.
* Data visualization tools like Tableau and Power BI continue to appear as valuable complementary skills, especially when paired with strong technical expertise.
* The HAVING clause ensures that only skills with sufficient demand are considered, reducing the impact of niche skills that may show high salaries but low job availability.
* Overall, the most strategic approach is to build a skill stack that combines foundational tools (SQL, Python) with modern data infrastructure and visualization technologies.
*/