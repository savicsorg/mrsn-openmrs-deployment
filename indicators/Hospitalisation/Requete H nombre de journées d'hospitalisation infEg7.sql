	select count(*)
	
	from 
	
   ( SELECT e.`visit_id`, DATEDIFF(:endOfPeriod, e.`encounter_datetime`) nbr
	FROM encounter e
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join visit v on v.visit_id = e.visit_id
	WHERE
	e.`voided`=0
	and v.`voided`=0 
	and et.uuid='e22e39fd-7db2-45e7-80f1-60fa0d5a4378'
    and  e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
	) start_hopitalisation
	
	left join
	
	 ( SELECT  e.`visit_id`, DATEDIFF(:endOfPeriod, e.`encounter_datetime`) nbr
	FROM encounter e
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join visit v on v.visit_id = e.visit_id
	WHERE
	e.`voided`=0
	and v.`voided`=0 
	and et.uuid='181820aa-88c9-479b-9077-af92f5364329'
    and  e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
	) end_hopitalisation
	
	on  start_hopitalisation.`visit_id` = end_hopitalisation.`visit_id` 
    	
	where (COALESCE(start_hopitalisation.nbr,0) - COALESCE(end_hopitalisation.nbr,0) )<= 7




    
    
    /*immediate test

    
    

    select count(*)
	
	from 
	
   ( SELECT e.`visit_id`, DATEDIFF(now(), e.`encounter_datetime`) nbr
	FROM encounter e
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join visit v on v.visit_id = e.visit_id
	WHERE
	e.`voided`=0
	and v.`voided`=0 
	and et.uuid='e22e39fd-7db2-45e7-80f1-60fa0d5a4378'
     and  e.`encounter_datetime` >= '2021-10-01 00:00:00' AND e.`encounter_datetime`<= '2021-10-02 23:59:59' 
	) start_hopitalisation
	
	left join
	
	 ( SELECT  e.`visit_id`, DATEDIFF(now(), e.`encounter_datetime`) nbr
	FROM encounter e
	inner join encounter_type et on et.`encounter_type_id`=e.`encounter_type`
	inner join visit v on v.visit_id = e.visit_id
	WHERE
	e.`voided`=0
	and v.`voided`=0 
	and et.uuid='181820aa-88c9-479b-9077-af92f5364329'
    and  e.`encounter_datetime` >= '2021-10-01 00:00:00' AND e.`encounter_datetime`<= '2021-10-02 23:59:59' 
	) end_hopitalisation
	
	on  start_hopitalisation.`visit_id` = end_hopitalisation.`visit_id` 
	
	where (COALESCE(start_hopitalisation.nbr,0) - COALESCE(end_hopitalisation.nbr,0) ) > 7

    */