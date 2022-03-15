select 


(
    SELECT  count(v.patient_id)
    FROM visit v
    inner join
    (
            SELECT distinct v.`visit_id`
            FROM visit v
            inner join encounter e on v.`visit_id`=  e.`visit_id`
            inner join person p on p.`person_id`=e.`patient_id`
            inner join  `form` f on f.`form_id`= e.`form_id`
            Where v.`voided`=0 
            and f.uuid='a6a93f74-9bd4-4934-b4b2-e1811b1cc105'
            and e.`voided`=0
            and (TIMESTAMPDIFF(year,p.`birthdate`, v.date_started) <1)
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
        inner join person p on p.`person_id`=e.`patient_id`
        where f.`uuid`='3e908357-2c55-474d-9b33-67e00d15abd3' 
        and e.`visit_id`=v.`visit_id`
        and (TIMESTAMPDIFF(year,p.`birthdate`, v.date_started) <1)
        and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
        ) --  Admit to hospitalisation
    )
) transfert_hospi_moins_1,

 


(
    SELECT  count(v.patient_id)
    FROM visit v
    inner join
    (
            SELECT distinct v.`visit_id`
            FROM visit v
            inner join encounter e on v.`visit_id`=  e.`visit_id`
            inner join person p on p.`person_id`=e.`patient_id`
            inner join  `form` f on f.`form_id`= e.`form_id`
            Where v.`voided`=0 
            and f.uuid='a6a93f74-9bd4-4934-b4b2-e1811b1cc105'
            and e.`voided`=0
            and (TIMESTAMPDIFF(year,p.`birthdate`, v.date_started) >=1 and TIMESTAMPDIFF(year,p.`birthdate`, v.date_started) <=4)
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
        inner join person p on p.`person_id`=e.`patient_id`
        where f.`uuid`='3e908357-2c55-474d-9b33-67e00d15abd3' 
        and e.`visit_id`=v.`visit_id`
        and (TIMESTAMPDIFF(year,p.`birthdate`, v.date_started) >=1 and TIMESTAMPDIFF(year,p.`birthdate`, v.date_started) <=4)
        and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
        ) --  Admit to hospitalisation
    )
) transfert_hospi_1_4,

 


(
    SELECT  count(v.patient_id)
    FROM visit v
    inner join
    (
            SELECT distinct v.`visit_id`
            FROM visit v
            inner join encounter e on v.`visit_id`=  e.`visit_id`
            inner join person p on p.`person_id`=e.`patient_id`
            inner join  `form` f on f.`form_id`= e.`form_id`
            Where v.`voided`=0 
            and f.uuid='a6a93f74-9bd4-4934-b4b2-e1811b1cc105'
            and e.`voided`=0
            and (TIMESTAMPDIFF(year,p.`birthdate`, v.date_started) >=5 and TIMESTAMPDIFF(year,p.`birthdate`, v.date_started) <=14)
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
        inner join person p on p.`person_id`=e.`patient_id`
        where f.`uuid`='3e908357-2c55-474d-9b33-67e00d15abd3' 
        and e.`visit_id`=v.`visit_id`
        and (TIMESTAMPDIFF(year,p.`birthdate`, v.date_started) >=5 and TIMESTAMPDIFF(year,p.`birthdate`, v.date_started) <=14)
        and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
        ) --  Admit to hospitalisation
    )
) transfert_hospi_5_14,





(
    SELECT  count(v.patient_id)
    FROM visit v
    inner join
    (
            SELECT distinct v.`visit_id`
            FROM visit v
            inner join encounter e on v.`visit_id`=  e.`visit_id`
            inner join person p on p.`person_id`=e.`patient_id`
            inner join  `form` f on f.`form_id`= e.`form_id`
            Where v.`voided`=0 
            and f.uuid='a6a93f74-9bd4-4934-b4b2-e1811b1cc105'
            and e.`voided`=0
            and (TIMESTAMPDIFF(year,p.`birthdate`, v.date_started) >=15 and TIMESTAMPDIFF(year,p.`birthdate`, v.date_started) <=200)
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
        inner join person p on p.`person_id`=e.`patient_id`
        where f.`uuid`='3e908357-2c55-474d-9b33-67e00d15abd3' 
        and e.`visit_id`=v.`visit_id`
        and (TIMESTAMPDIFF(year,p.`birthdate`, v.date_started) >=15 and TIMESTAMPDIFF(year,p.`birthdate`, v.date_started) <=200)
        and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
        ) --  Admit to hospitalisation
    )
) transfert_hospi_15_plus,






(
    SELECT  count(v.patient_id)
    FROM visit v
    inner join
    (
            SELECT distinct v.`visit_id`
            FROM visit v
            inner join encounter e on v.`visit_id`=  e.`visit_id`
            inner join person p on p.`person_id`=e.`patient_id`
            inner join  `form` f on f.`form_id`= e.`form_id`
            Where v.`voided`=0 
            and f.uuid='a6a93f74-9bd4-4934-b4b2-e1811b1cc105'
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
        inner join person p on p.`person_id`=e.`patient_id`
        where f.`uuid`='3e908357-2c55-474d-9b33-67e00d15abd3' 
        and e.`visit_id`=v.`visit_id`
        and e.`encounter_datetime` >= :startOfPeriod AND e.`encounter_datetime`<= :endOfPeriod and v.location_id =:locationId
        ) --  Admit to hospitalisation
    )
) transfert_hospi_total


