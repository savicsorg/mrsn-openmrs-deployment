select 


(SELECT  count(v.patient_id)
FROM visit v
inner join
(
	SELECT distinct v.`visit_id`
	FROM visit v
	inner join encounter e on v.`visit_id`=  e.`visit_id`
	inner join person p on p.`person_id`=e.`patient_id`
	Where v.`voided`=0 
	and e.`voided`=0
	and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <1)
    and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) U
on v.visit_id = U.visit_id
WHERE
v.date_started>= :startOfPeriod AND v.date_started<=:endOfPeriod and v.location_id =:locationId
AND 
(

v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='145235c8-51df-4896-8540-65a5ef6f66b6' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4838 and o.`value_coded`=4972
and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <1)
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in discharge with refered=true

or

v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='bc5c5485-9697-416b-934f-40fd27db6f42' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4972 and o.`value_coded`=1
and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <1)
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in contre ref with refered=true
)) retour_domicil_moins_1,

 


(SELECT  count(v.patient_id)
FROM visit v
inner join
(
	SELECT distinct v.`visit_id`
	FROM visit v
	inner join encounter e on v.`visit_id`=  e.`visit_id`
	inner join person p on p.`person_id`=e.`patient_id`
	Where v.`voided`=0 
	and e.`voided`=0
	and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=1 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=4)
    and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) U
on v.visit_id = U.visit_id
WHERE
v.date_started>= :startOfPeriod AND v.date_started<=:endOfPeriod and v.location_id =:locationId
AND 
(

v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='145235c8-51df-4896-8540-65a5ef6f66b6' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4838 and o.`value_coded`=4972
and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=1 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=4)
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in discharge with refered=true

or

v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='bc5c5485-9697-416b-934f-40fd27db6f42' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4972 and o.`value_coded`=1
and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=1 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=4)
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in contre ref with refered=true
)) retour_domicil_1_4,

 


(SELECT  count(v.patient_id)
FROM visit v
inner join
(
	SELECT distinct v.`visit_id`
	FROM visit v
	inner join encounter e on v.`visit_id`=  e.`visit_id`
	inner join person p on p.`person_id`=e.`patient_id`
	Where v.`voided`=0 
	and e.`voided`=0
	and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=5 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=14)
    and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) U
on v.visit_id = U.visit_id
WHERE
v.date_started>= :startOfPeriod AND v.date_started<=:endOfPeriod and v.location_id =:locationId
AND 
(

v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='145235c8-51df-4896-8540-65a5ef6f66b6' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4838 and o.`value_coded`=4972
and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=5 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=14)
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in discharge with refered=true

or

v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='bc5c5485-9697-416b-934f-40fd27db6f42' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4972 and o.`value_coded`=1
and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=5 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=14)
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in contre ref with refered=true
)) retour_domicil_5_14,





(SELECT  count(v.patient_id)
FROM visit v
inner join
(
	SELECT distinct v.`visit_id`
	FROM visit v
	inner join encounter e on v.`visit_id`=  e.`visit_id`
	inner join person p on p.`person_id`=e.`patient_id`
	Where v.`voided`=0 
	and e.`voided`=0
	and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=15 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=200)
    and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) U
on v.visit_id = U.visit_id
WHERE
v.date_started>= :startOfPeriod AND v.date_started<=:endOfPeriod and v.location_id =:locationId
AND 
(

v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='145235c8-51df-4896-8540-65a5ef6f66b6' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4838 and o.`value_coded`=4972
and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=15 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=200)
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in discharge with refered=true

or

v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='bc5c5485-9697-416b-934f-40fd27db6f42' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4972 and o.`value_coded`=1
and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=15 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=200)
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in contre ref with refered=true
)) retour_domicil_15_plus,






(SELECT  count(v.patient_id)
FROM visit v
inner join
(
	SELECT distinct v.`visit_id`
	FROM visit v
	inner join encounter e on v.`visit_id`=  e.`visit_id`
	inner join person p on p.`person_id`=e.`patient_id`
	Where v.`voided`=0 
	and e.`voided`=0
    and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) U
on v.visit_id = U.visit_id
WHERE
v.date_started>= :startOfPeriod AND v.date_started<=:endOfPeriod and v.location_id =:locationId
AND 
(

v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='145235c8-51df-4896-8540-65a5ef6f66b6' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4838 and o.`value_coded`=4972
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in discharge with refered=true

or

v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='bc5c5485-9697-416b-934f-40fd27db6f42' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4972 and o.`value_coded`=1
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in contre ref with refered=true
)) retour_domicil_total


