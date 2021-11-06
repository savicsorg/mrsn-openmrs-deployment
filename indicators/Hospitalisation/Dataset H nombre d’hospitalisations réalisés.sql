	SELECT count(e.`visit_id`) nbr
	FROM encounter e
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join visit v on v.visit_id = e.visit_id
	WHERE
	e.`voided`=0
	and v.`voided`=0 
	and et.uuid='e22e39fd-7db2-45e7-80f1-60fa0d5a4378' 
    and e.`encounter_datetime`>= :startOfPeriod AND e.`encounter_datetime`<=:endOfPeriod and v.location_id =:locationId