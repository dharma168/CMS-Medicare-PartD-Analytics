-- MOST PRESCRIBED DRUGS
SELECT 
	Gnrc_Name,
    SUM(total_claims) AS total_prescriptions
FROM clean_medicare_claims
GROUP BY Gnrc_Name
ORDER BY total_prescriptions DESC
LIMIT 10;

-- PROVIDER SPECIALTY ANALYSIS
SELECT 
   Prscrbr_Type AS specialty,
   SUM(total_claims) AS total_claims
FROM clean_medicare_claims
GROUP BY  Prscrbr_Type
ORDER BY total_claims DESC
LIMIT 10;

-- STATE-WISE MEDICARE DRUG SPENDING
SELECT 
	Prscrbr_State_Abrvtn AS state,
    SUM(total_drug_cost) AS state_total_cost
FROM clean_medicare_claims
GROUP BY state
ORDER BY state_total_cost DESC;

-- COST PER BENEFICIARY
SELECT
    Brnd_Name,
    ROUND(SUM(total_drug_cost) / SUM(total_beneficiaries)) AS total_cost_per_beneficiary
FROM clean_medicare_claims
WHERE total_beneficiaries IS NOT NULL
GROUP BY Brnd_Name
ORDER BY total_cost_per_beneficiary DESC
LIMIT 10;
