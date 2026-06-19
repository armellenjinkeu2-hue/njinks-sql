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
-- Week 2 Query 2: Provider Adjustment Rate Analysis
-- Week 2 Query 4: Denial Rate by State
-- Identifies states with highest number of zero-payment providers

SELECT
Rndrng_Prvdr_State_Abrvtn AS state,
COUNT(*) AS total_providers,
SUM(CASE WHEN Tot_Mdcr_Pymt_Amt = 0 THEN 1 ELSE 0 END) AS denied_providers,
ROUND(SUM(CASE WHEN Tot_Mdcr_Pymt_Amt = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS denial_rate
FROM MUP_PHY_R26_P05_V10_D24_Prov
WHERE Tot_Sbmtd_Chrg > 0
GROUP BY state
ORDER BY denied_providers DESC
LIMIT 10
