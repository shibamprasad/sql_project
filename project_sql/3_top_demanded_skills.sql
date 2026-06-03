/*
Question: What are the most in-demand skills for Data Analyst roles based on job postings? This analysis aims to identify the 
core skills that appear most frequently across job listings, providing insight into the key competencies required in the data 
analytics job market.
*/

SELECT
    skills_dim.skills AS skills,
    COUNT(skills_job_dim.skill_id) AS demand_count
FROM job_postings_fact AS job_postings
INNER JOIN skills_job_dim ON job_postings.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings.job_location = 'Anywhere' AND
    job_postings.job_title_short = 'Data Analyst'
GROUP BY 
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
Key Insights:
* SQL is the most in-demand skill by a significant margin, appearing in over 7,000 job postings, making it the foundational skill for Data Analysts.
* Excel remains highly relevant, ranking second, which highlights its continued importance in business and reporting workflows despite the rise of advanced tools.
* Python is the third most demanded skill, reinforcing its importance for data manipulation, automation, and advanced analytics.
* Data visualization tools such as Tableau and Power BI are also among the top skills, emphasizing the need for strong data storytelling and dashboarding capabilities.
* The demand distribution shows a mix of traditional tools (Excel) and modern technologies (Python, BI tools), indicating that employers value both business familiarity and technical expertise.
* Overall, mastering SQL, Excel, Python, and at least one visualization tool provides a strong foundation for securing Data Analyst roles.
*/