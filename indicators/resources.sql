-- Urgence (all not voided encounters)
select U.`visit_id`
from
(
	SELECT distinct v.`visit_id`
	FROM visit v
	inner join encounter e on v.`visit_id`=  e.`visit_id`
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	Where v.`voided`=0 
	and e.`voided`=0
) U


-- Consultation Externe (Visite sans hopitalisation)
select CE.`visit_id`
from
(
	SELECT distinct v.`visit_id`
	FROM visit v
	inner join encounter e on v.`visit_id`=  e.`visit_id`
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	Where v.`voided`=0 
	and e.`voided`=0
	and et.`uuid` not in ('e22e39fd-7db2-45e7-80f1-60fa0d5a4378','181820aa-88c9-479b-9077-af92f5364329')
	-- CE = (encounters without ET that is in admission and discharge)
) CE


-- Consultation Interne (Visite avec hopitalisation)
select CI.`visit_id`
from
(
	SELECT distinct v.`visit_id`
	FROM visit v
	inner join encounter e on v.`visit_id`=  e.`visit_id`
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	Where v.`voided`=0 
	and e.`voided`=0
	and et.`uuid` in ('e22e39fd-7db2-45e7-80f1-60fa0d5a4378','181820aa-88c9-479b-9077-af92f5364329')
	-- CI = (encounters with ET that is admission)
) CI