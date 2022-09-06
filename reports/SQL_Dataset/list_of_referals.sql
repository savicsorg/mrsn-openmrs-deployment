select distinct 
date_admissions.date_admission as Date_arrivee,
pathologies.pathologie as Pathologie,
structure_provenances.structure_provenance as Structure_de_provenance,
patient_identifier.identifier as ID_du_patient,
person_name.given_name as Medecin,
contre_references.contre_references.have_contre_reference as Contre_refere_Oui_Non,
date_contre_reference as Date_de_la_contre_reference,
structure_contre_references.structure_contre_reference as Structure_de_la_contre_reference
from encounter 
inner join encounter_type on encounter.encounter_type = encounter_type.encounter_type_id
inner join users on users.user_id = encounter.creator
inner join patient_identifier on patient_identifier.patient_id = encounter.patient_id
inner join person on person.person_id = users.person_id 
inner join person_name on person_name.person_id = person.person_id
inner join(
	select distinct 
		encounter.visit_id as visit_id,
		encounter.encounter_id as encounter_id,
		obs.value_datetime as date_admission
	from encounter
	inner join obs on encounter.encounter_id = obs.encounter_id
	inner join concept on obs.concept_id = concept.concept_id
	where concept.uuid = "fdf7e393-2911-44a2-abaa-c11ed97ac7e9" ) date_admissions
on date_admissions.encounter_id = encounter.encounter_id 
inner join(
	select distinct 
		encounter.visit_id as visit_id,
		encounter.encounter_id as encounter_id,
		obs.value_text as structure_provenance
	from encounter
	inner join obs on encounter.encounter_id = obs.encounter_id
	inner join concept on obs.concept_id = concept.concept_id
	where concept.uuid = "06c54279-affc-4dad-8622-5714af84b878" ) structure_provenances
on structure_provenances.encounter_id = encounter.encounter_id 
left join (
	select distinct 
		encounter.visit_id as visit_id,
		encounter.encounter_id as encounter_id
	from encounter
	join encounter_type on encounter.encounter_type = encounter_type.encounter_type_id 
	where encounter_type.uuid = "d7151f82-c1f3-4152-a605-2f9ea7414a79") notes_visistes
on encounter.visit_id = notes_visistes.visit_id
left join (
	select distinct 
		encounter.encounter_id as encounter_id,
		encounter.visit_id as visit_id,
		concept_name.name as pathologie
	from encounter 
	inner join encounter_diagnosis on encounter.encounter_id = encounter_diagnosis.encounter_id 
	inner join concept_name on concept_name.concept_name_id = encounter_diagnosis.diagnosis_coded_name ) pathologies
on encounter.visit_id = pathologies.visit_id
left join (
	select distinct
		encounter.encounter_id as encounter_id,
		encounter.visit_id as visit_id,
		"Oui" as have_contre_reference,
		encounter.date_created as date_contre_reference
		from encounter 
		inner join encounter_type on encounter.encounter_type = encounter_type.encounter_type_id
		inner join form on form.form_id = encounter.form_id
		where encounter_type.uuid = "7155a26a-e79f-416a-8b6d-8c5bc1ed0ac5"
		and form.uuid = "bc5c5485-9697-416b-934f-40fd27db6f42") contre_references
on encounter.visit_id = contre_references.visit_id
left join (
	select distinct 
		encounter.visit_id as visit_id,
		encounter.encounter_id as encounter_id,
		concept_name.name as structure_contre_reference
	from encounter
	inner join obs on encounter.encounter_id = obs.encounter_id
	inner join concept on obs.concept_id = concept.concept_id
	inner join concept_name on concept_name.concept_id = obs.value_coded 
	where concept.uuid = "c1b5370f-e62f-4301-8603-d6049e5429b3" ) structure_contre_references
on encounter.encounter_id = structure_contre_references.encounter_id
where encounter.voided = 0
and date_admissions.date_admission between :startDate and :endDate
order by date_admissions.date_admission