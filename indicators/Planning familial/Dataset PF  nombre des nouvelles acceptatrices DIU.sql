 select
    
    (select count(*)
	FROM encounter e
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join visit v on v.visit_id = e.visit_id
	inner join person p on p.`person_id`=v.`patient_id`
    inner join  `form` f on f.`form_id`= e.`form_id`
    inner join obs o on o.`encounter_id` = e.`encounter_id`

	WHERE
	e.`voided`=0
	and v.`voided`=0 
	and f.`retired`=0
	and et.uuid='b4f4be4d-d3cd-424e-b0ce-97b3f6c73c07' 
	and f.uuid='1aad92db-e5b8-4429-8f4a-428627483e77'
    and ((o.`concept_id`=4923 and o.`value_coded`=1) or (o.`concept_id`=4924 and o.`value_coded`=1) )
	and  o.`concept_id` in (4923,4924)
    and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=10 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=14)
    and  e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
    ) DIU_10_14
    ,
    (select count(*)
	FROM encounter e
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join visit v on v.visit_id = e.visit_id
	inner join person p on p.`person_id`=v.`patient_id`
    inner join  `form` f on f.`form_id`= e.`form_id`
    inner join obs o on o.`encounter_id` = e.`encounter_id`

	WHERE
	e.`voided`=0
	and v.`voided`=0 
	and f.`retired`=0
	and et.uuid='b4f4be4d-d3cd-424e-b0ce-97b3f6c73c07' 
	and f.uuid='1aad92db-e5b8-4429-8f4a-428627483e77'
    and ((o.`concept_id`=4923 and o.`value_coded`=1) or (o.`concept_id`=4924 and o.`value_coded`=1) )
	and  o.`concept_id` in (4923,4924)
    and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=15 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=19)
    and  e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
    ) DIU_15_19
    ,
    (select count(*)
	FROM encounter e
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join visit v on v.visit_id = e.visit_id
	inner join person p on p.`person_id`=v.`patient_id`
    inner join  `form` f on f.`form_id`= e.`form_id`
    inner join obs o on o.`encounter_id` = e.`encounter_id`

	WHERE
	e.`voided`=0
	and v.`voided`=0 
	and f.`retired`=0
	and et.uuid='b4f4be4d-d3cd-424e-b0ce-97b3f6c73c07' 
	and f.uuid='1aad92db-e5b8-4429-8f4a-428627483e77'
    and ((o.`concept_id`=4923 and o.`value_coded`=1) or (o.`concept_id`=4924 and o.`value_coded`=1) )
	and  o.`concept_id` in (4923,4924)
    and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=20 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=24)
    and  e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
    ) DIU_20_24
    ,
    (select count(*)
	FROM encounter e
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join visit v on v.visit_id = e.visit_id
	inner join person p on p.`person_id`=v.`patient_id`
    inner join  `form` f on f.`form_id`= e.`form_id`
    inner join obs o on o.`encounter_id` = e.`encounter_id`

	WHERE
	e.`voided`=0
	and v.`voided`=0 
	and f.`retired`=0
	and et.uuid='b4f4be4d-d3cd-424e-b0ce-97b3f6c73c07' 
	and f.uuid='1aad92db-e5b8-4429-8f4a-428627483e77'
    and ((o.`concept_id`=4923 and o.`value_coded`=1) or (o.`concept_id`=4924 and o.`value_coded`=1) )
	and  o.`concept_id` in (4923,4924)
    and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=25 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=39)
    and  e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
    ) DIU_25_39
    ,
    (select count(*)
	FROM encounter e
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join visit v on v.visit_id = e.visit_id
	inner join person p on p.`person_id`=v.`patient_id`
    inner join  `form` f on f.`form_id`= e.`form_id`
    inner join obs o on o.`encounter_id` = e.`encounter_id`

	WHERE
	e.`voided`=0
	and v.`voided`=0 
	and f.`retired`=0
	and et.uuid='b4f4be4d-d3cd-424e-b0ce-97b3f6c73c07' 
	and f.uuid='1aad92db-e5b8-4429-8f4a-428627483e77'
    and ((o.`concept_id`=4923 and o.`value_coded`=1) or (o.`concept_id`=4924 and o.`value_coded`=1) )
	and  o.`concept_id` in (4923,4924)
    and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=40 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=49)
    and  e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
    ) DIU_40_49
    ,
    (select count(*)
	FROM encounter e
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join visit v on v.visit_id = e.visit_id
	inner join person p on p.`person_id`=v.`patient_id`
    inner join  `form` f on f.`form_id`= e.`form_id`
    inner join obs o on o.`encounter_id` = e.`encounter_id`

	WHERE
	e.`voided`=0
	and v.`voided`=0 
	and f.`retired`=0
	and et.uuid='b4f4be4d-d3cd-424e-b0ce-97b3f6c73c07' 
	and f.uuid='1aad92db-e5b8-4429-8f4a-428627483e77'
    and ((o.`concept_id`=4923 and o.`value_coded`=1) or (o.`concept_id`=4924 and o.`value_coded`=1) )
	and  o.`concept_id` in (4923,4924)
    and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=50 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=200)
    and  e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
    ) DIU_50_plus

    