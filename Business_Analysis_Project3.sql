SELECT*FROM top_insta

SELECT 
CASE WHEN rank_followers BETWEEN 1 AND 10 THEN influencer_account
END AS top_following,followers
FROM top_insta
WHERE CASE WHEN rank_followers BETWEEN 1 AND 10 THEN influencer_account
END IS NOT NULL 

SELECT 
CASE WHEN rank_likes BETWEEN 1 AND 10 THEN influencer_account
END AS top_liked,total_likes
FROM top_insta
WHERE CASE WHEN rank_likes BETWEEN 1 AND 10 THEN influencer_account
END IS NOT NULL 

SELECT TOP 10 influencer_account AS most_reach,like_to_follow_ratio
FROM top_insta
ORDER BY like_to_follow_ratio DESC

SELECT TOP 10 influencer_account AS most_influence,influence_score
FROM top_insta
ORDER BY influence_score DESC

SELECT TOP 10 influencer_account AS most_active,posts
FROM top_insta
ORDER BY posts DESC


SELECT AVG(avg_likes) AS like_average,AVG(CAST(REPLACE(current_eng_rate, '%', '') AS FLOAT)) AS eng_rate_average
,AVG(CAST(REPLACE(growth, '%', '') AS FLOAT)) AS growth_average,AVG(like_to_follow_ratio) AS like_follow_average
FROM top_insta


SELECT COUNT(influencer_account)/COUNT(DISTINCT(country))
FROM top_insta


SELECT  TOP 3 country,COUNT(influencer_account) AS influencer_per_country,
AVG(influence_score) AS influencer_score_avg,
ROUND(AVG(CAST((REPLACE(eng_rate_historical, '%', '')) AS FLOAT)),2) AS eng_rate_avg
FROM top_insta
GROUP BY country
ORDER BY ROUND(AVG(CAST((REPLACE(eng_rate_historical, '%', '')) AS FLOAT)),2) DESC


SELECT followers,avg_likes
FROM top_insta


SELECT current_eng_rate,new_post_avg_like
FROM top_insta

SELECT country, AVG(CAST(followers AS BIGINT)) AS avg_followers
FROM top_insta
GROUP BY country


SELECT TOP 10 influencer_account,(total_likes/posts) AS like_per_post,posts
FROM top_insta
ORDER BY (total_likes/posts) DESC
