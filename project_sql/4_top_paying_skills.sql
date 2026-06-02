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
    job_postings.job_location = 'India' AND
    job_postings.salary_year_avg IS NOT NULL
GROUP BY 
    skills_dim.skills
ORDER BY 
    avg_salary DESC
LIMIT 25;