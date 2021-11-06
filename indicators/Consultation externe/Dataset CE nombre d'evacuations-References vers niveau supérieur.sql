
select

(
SELECT  count(v.patient_id)
FROM visit v
inner join
(
	SELECT distinct v.`visit_id`
	FROM visit v
	inner join encounter e on v.`visit_id`=  e.`visit_id`
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join person p on p.`person_id`=e.`patient_id`
	Where v.`voided`=0 
	and e.`voided`=0
	and et.`uuid` not in ('e22e39fd-7db2-45e7-80f1-60fa0d5a4378','181820aa-88c9-479b-9077-af92f5364329')
	and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <1)
    and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
	-- CE = (encounters without ET that is in admission and discharge)
) CE
on v.visit_id = CE.visit_id
Where
 
(
v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='145235c8-51df-4896-8540-65a5ef6f66b6' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4838 and o.`value_coded`=4836
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
and o.`concept_id`=4975 and o.`value_coded`=1
and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <1)
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in contre ref with refered=true

)) evacuation_sup_moins_1,






(
SELECT  count(v.patient_id)
FROM visit v
inner join
(
	SELECT distinct v.`visit_id`
	FROM visit v
	inner join encounter e on v.`visit_id`=  e.`visit_id`
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join person p on p.`person_id`=e.`patient_id`
	Where v.`voided`=0 
	and e.`voided`=0
	and et.`uuid` not in ('e22e39fd-7db2-45e7-80f1-60fa0d5a4378','181820aa-88c9-479b-9077-af92f5364329')
	and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=1 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=4)
    and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
	-- CE = (encounters without ET that is in admission and discharge)
) CE
on v.visit_id = CE.visit_id
Where

(
v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='145235c8-51df-4896-8540-65a5ef6f66b6' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4838 and o.`value_coded`=4836
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
and o.`concept_id`=4975 and o.`value_coded`=1
and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=1 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=4)
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in contre ref with refered=true

)) evacuation_sup_1_4,



(
SELECT  count(v.patient_id)
FROM visit v
inner join
(
	SELECT distinct v.`visit_id`
	FROM visit v
	inner join encounter e on v.`visit_id`=  e.`visit_id`
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join person p on p.`person_id`=e.`patient_id`
	Where v.`voided`=0 
	and e.`voided`=0
	and et.`uuid` not in ('e22e39fd-7db2-45e7-80f1-60fa0d5a4378','181820aa-88c9-479b-9077-af92f5364329')
	and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=5 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=14)
    and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
	-- CE = (encounters without ET that is in admission and discharge)
) CE
on v.visit_id = CE.visit_id
Where

(
v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='145235c8-51df-4896-8540-65a5ef6f66b6' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4838 and o.`value_coded`=4836
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
and o.`concept_id`=4975 and o.`value_coded`=1
and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=5 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=14)
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in contre ref with refered=true

)) evacuation_sup_5_14,




(
SELECT  count(v.patient_id)
FROM visit v
inner join
(
	SELECT distinct v.`visit_id`
	FROM visit v
	inner join encounter e on v.`visit_id`=  e.`visit_id`
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join person p on p.`person_id`=e.`patient_id`
	Where v.`voided`=0 
	and e.`voided`=0
	and et.`uuid` not in ('e22e39fd-7db2-45e7-80f1-60fa0d5a4378','181820aa-88c9-479b-9077-af92f5364329')
	and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=15 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=200)
    and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
	-- CE = (encounters without ET that is in admission and discharge)
) CE
on v.visit_id = CE.visit_id
Where
(
v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='145235c8-51df-4896-8540-65a5ef6f66b6' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4838 and o.`value_coded`=4836
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
and o.`concept_id`=4975 and o.`value_coded`=1
and (TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) >=15 and TIMESTAMPDIFF(year,p.`birthdate`, :endOfPeriod) <=200)
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in contre ref with refered=true

)) evacuation_sup_15_plus,


(
SELECT  count(v.patient_id)
FROM visit v
inner join
(
	SELECT distinct v.`visit_id`
	FROM visit v
	inner join encounter e on v.`visit_id`=  e.`visit_id`
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join person p on p.`person_id`=e.`patient_id`
	Where v.`voided`=0 
	and e.`voided`=0
	and et.`uuid` not in ('e22e39fd-7db2-45e7-80f1-60fa0d5a4378','181820aa-88c9-479b-9077-af92f5364329')
    and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
	-- CE = (encounters without ET that is in admission and discharge)
) CE
on v.visit_id = CE.visit_id
Where 
(
v.`visit_id` in (
select v.`visit_id`  from encounter e 
inner join form f on f.`form_id`= e.`form_id`
inner join obs o on o.`encounter_id` = e.`encounter_id`
inner join person p on p.`person_id`=e.`patient_id`
where f.`uuid`='145235c8-51df-4896-8540-65a5ef6f66b6' 
and e.`visit_id`=v.`visit_id`
and o.`concept_id`=4838 and o.`value_coded`=4836
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
and o.`concept_id`=4975 and o.`value_coded`=1
and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
) --  in contre ref with refered=true

)) evacuation_sup_total