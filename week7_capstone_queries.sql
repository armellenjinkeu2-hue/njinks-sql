SELECT
Rndrng_Prvdr_Type AS specialty,
ROUND(SUM(Tot_Sbmtd_Chrg), 2) AS total_billed,
ROUND(SUM(Tot_Mdcr_Pymt_Amt), 2) AS total_paid,
ROUND((SUM(Tot_Sbmtd_Chrg) - SUM(Tot_Mdcr_Pymt_Amt)) * 100.0 / SUM(Tot_Sbmtd_Chrg), 2) AS adjustment_rate
FROM MUP_PHY_R26_P05_V10_D24_Prov
WHERE Rndrng_Prvdr_Type LIKE '%Psych%'
GROUP BY specialty
ORDER BY adjustment_rate DESC 
