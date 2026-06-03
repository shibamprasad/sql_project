/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Why? It reveals how different skills impact the salary of Data Analysts ans identify
    which skill is most rewarding financially to acquire or improve.
*/

SELECT
    skills_dim.skills,
    ROUND(AVG(job_postings.salary_year_avg),2) AS avg_salary
FROM job_postings_fact AS job_postings
INNER JOIN skills_job_dim ON job_postings.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings.job_title_short = 'Data Analyst' AND
    job_postings.job_location = 'Anywhere' AND
    job_postings.salary_year_avg IS NOT NULL
GROUP BY 
    skills_dim.skills
ORDER BY 
    avg_salary DESC
LIMIT 25;

/*
Key Insights:
* Certain specialized and advanced skills are associated with significantly higher average salaries, indicating their strong market value in Data Analyst roles.
* Skills related to cloud platforms (e.g., AWS, Azure), big data technologies, and data engineering tools tend to command higher salaries compared to basic analytics tools.
* Core skills such as SQL and Python may not always rank at the very top in salary because they are widely required across all roles, including lower-paying ones.
* Niche or less common skills often show higher average salaries, as they are typically required for more specialized and senior-level positions.
* The analysis highlights that salary is influenced not just by skill demand, but also by skill rarity and the complexity of roles requiring those skills.
* Overall, combining foundational skills (SQL, Python) with specialized tools (cloud, big data) can significantly improve earning potential.
*/