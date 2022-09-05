select dte "Date", Pathologie, Service, Patient, doctor Docteur from
	
	(SELECT  DATE_FORMAT(e.`encounter_datetime`,'%d/%m/%Y')  dte, cn.`name` Pathologie, l.`name` Service,
    pid.`identifier` Patient, CONCAT_WS(' ', pn.`family_name`, pn.`given_name`) doctor
	FROM encounter e 
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join `patient_identifier` pid on pid.`patient_id`=e.`patient_id`
	inner join `encounter_diagnosis` ed on ed.`encounter_id` = e.`encounter_id`
	inner join (select concept_id, name  from `concept_name` where `locale`='fr' and `voided`=0 group by concept_id) cn on 
    cn.`concept_id` = ed.`diagnosis_coded`
	inner join location l on l.`location_id`= e.`location_id`
	inner join encounter_provider ep on ep.`encounter_id`= e.`encounter_id`
	inner join (select `person_id`, `family_name`, `given_name` from `person_name` group by `person_id`) pn on pn.`person_id`= 
    ep.`provider_id`
	Where e.`voided`=0
	and pid.`identifier_type`=4
	and ed.`diagnosis_coded` is not null
    and et.uuid='d7151f82-c1f3-4152-a605-2f9ea7414a79'
        and e.`encounter_datetime` >= :startDate AND e.`encounter_datetime`<= :endDate
    ) coded_diag_encounter -- coded diagnostic with visit note
    
    UNION
    
    select dte , Pathologie, Service, Patient, doctor from 
    (SELECT DATE_FORMAT(e.`encounter_datetime`,'%d/%m/%Y') dte,  ed.`diagnosis_non_coded` Pathologie, l.`name` Service, 
    pid.`identifier` Patient, CONCAT_WS(' ', pn.`family_name`, pn.`given_name`) doctor
	FROM encounter e 
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join `patient_identifier` pid on pid.`patient_id`=e.`patient_id`
	inner join `encounter_diagnosis` ed on ed.`encounter_id` = e.`encounter_id`
	inner join location l on l.`location_id`= e.`location_id`
	inner join encounter_provider ep on ep.`encounter_id`= e.`encounter_id`
	inner join (select `person_id`, `family_name`, `given_name` from `person_name` group by `person_id`) pn on pn.`person_id`= 
    ep.`provider_id`
	Where e.`voided`=0
	and pid.`identifier_type`=4
	and ed.`diagnosis_coded` is null
    and et.uuid='d7151f82-c1f3-4152-a605-2f9ea7414a79'
    and e.`encounter_datetime` >= :startDate AND e.`encounter_datetime`<= :endDate
    ) non_coded_diag_encounter --  non coded diagnostic with visit note
    order by date, Pathologie, Service, Patient, Docteur
