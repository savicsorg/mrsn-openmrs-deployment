
select v.`visit_id`,cn.concept_id,  ROW_NUMBER() OVER(PARTITION BY v.`visit_id`)  , cn.name, avg ((DATEDIFF(discharge.dte, enter.dte) + 1)) duration
from visit v

inner join (select visit_id,encounter_id, encounter.encounter_datetime from encounter inner join encounter_type on encounter.encounter_type = encounter_type.encounter_type_id 
and encounter_type.uuid ='d7151f82-c1f3-4152-a605-2f9ea7414a79') consultation on consultation.visit_id = v.visit_id

inner join (select visit_id,encounter_id, encounter.encounter_datetime dte from encounter inner join encounter_type on encounter.encounter_type = encounter_type.encounter_type_id 
and encounter_type.uuid ='e22e39fd-7db2-45e7-80f1-60fa0d5a4378') enter on enter.visit_id = v.visit_id

inner join (select visit_id,encounter_id, encounter.encounter_datetime dte from encounter inner join encounter_type on encounter.encounter_type = encounter_type.encounter_type_id 
and encounter_type.uuid ='181820aa-88c9-479b-9077-af92f5364329') discharge on discharge.visit_id = enter.visit_id

inner join `encounter_diagnosis` ed on ed.`encounter_id` = consultation.`encounter_id`
inner join (select concept_id, name  from `concept_name` where `locale`='fr' and `voided`=0 group by concept_id) cn on  cn.`concept_id` = ed.`diagnosis_coded`

where v.`date_started` >= :startDate AND v.`date_started` <= :endDate
group by v.`visit_id`,cn.concept_id , cn.name