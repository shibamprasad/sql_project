/*
Question: What are the top 10 highest-paying remote Data Analyst roles based on available salary data? 
This analysis focuses on identifying the most lucrative opportunities in the remote job market 
while excluding postings with missing salary information to ensure accurate comparisons.
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment opportunities
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
From job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location='Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;

/*
Key Insights:
* The highest-paying remote Data Analyst role reaches up to $650,000, significantly exceeding typical market expectations, indicating the presence of outlier or highly specialized roles.
* Senior-level positions such as Director and Principal Data Analyst dominate the top salary range, highlighting the impact of experience and leadership responsibilities on compensation.
* Companies like Meta, AT&T, and SmartAsset appear in high-paying roles, suggesting that large and tech-driven organizations offer competitive salaries for data professionals.
* There is a steep drop from the top salary ($650K) to the second-highest (~$336K), indicating a wide salary distribution within remote Data Analyst roles.
* Most top-paying roles are full-time positions, reinforcing the stability and demand for experienced data professionals in remote settings.
* The analysis confirms that remote opportunities can offer premium compensation, especially for senior and specialized roles in analytics.
*/