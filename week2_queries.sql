-- Week 2 Query 1: Provider Volume Categories on CMS Data
-- Categorizes Medicare providers by number of services billed

SELECT 
CASE 
    WHEN Tot_Srvcs > 1000 THEN 'High Volume'
    WHEN Tot_Srvcs BETWEEN 500 AND 1000 THEN 'Medium Volume'
    ELSE 'Low Volume'
END AS provider_volume,
COUNT(*) AS total_providers
FROM MUP_PHY_R26_P05_V10_D24_Prov
GROUP BY provider_volume
ORDER BY total_providers DESC
