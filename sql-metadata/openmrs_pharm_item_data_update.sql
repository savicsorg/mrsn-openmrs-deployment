UPDATE 
     drug d, 
     `pharm_item` p
SET 
     p.`drug_id` = d.drug_id
WHERE
     p.name = d.name