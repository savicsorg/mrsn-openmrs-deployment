select count(*)
	FROM encounter e
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join visit v on v.visit_id = e.visit_id
        inner join  `form` f on f.`form_id`= e.`form_id`
	WHERE
	e.`voided`=0
	and v.`voided`=0 
	and f.`retired`=0
	and et.uuid='eb040652-8cfc-4a00-9ba7-820671520e3f' 
	and f.uuid='f28d96a9-989e-41dd-b159-e316c5478312'
    and  e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
