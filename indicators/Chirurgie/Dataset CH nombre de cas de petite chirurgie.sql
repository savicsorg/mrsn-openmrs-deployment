select count(*)
	FROM encounter e
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join visit v on v.visit_id = e.visit_id
        inner join  `form` f on f.`form_id`= e.`form_id`
	WHERE
	e.`voided`=0
	and v.`voided`=0 
	and f.`retired`=0
	and et.uuid='0260179d-dad5-4edd-ad46-850c9096146f' 
	and f.`uuid`='d91e0f44-42bd-41ee-bb2d-9f7e96636505'
    and  e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId