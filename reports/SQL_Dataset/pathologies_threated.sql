select distinct 
hostpitalisation_avec_lit.visit_id ,
hostpitalisation_avec_lit.date_created as "Date",
pathologies.pathologie as "Pathologie",
hostpitalisation_avec_lit.location_name as "Service/unite de l'HD",
hostpitalisation_avec_lit.patient_id as "ID Patient",
hostpitalisation_avec_lit.num_lit as "N° Lit",
DATEDIFF(hostpitalisation_avec_lit.date_created, hostpitalisation_avec_date_sortie.date_sortie)  as "Durée du séjour",
hostpitalisation_avec_lit.medecin  as "Médécin",
hostpitalisation_avec_date_sortie.date_sortie as "Date Sortie",
transferts.transfered as "Transfert Oui/Non",
transfert_avec_date_transfert.date_transfert as "Date Transfert",
transferts.service_de_transfert as "Service Transfert",
transfert_avec_numero_lit.numero_nouveau_lit as "N° Nouveau lit"
from (
	select distinct 
	encounter.visit_id as visit_id,
	encounter.encounter_id as encounter_id,
	encounter.encounter_datetime  as date_created,
	location.name as location_name,
	encounter.patient_id as patient_id,
	obs.value_text as num_lit,
	"" as duree_sejour,
	person_name.given_name as medecin,
	obs.value_datetime as date_sortie,
	"" as transfert_or_not,
	"" as date_transfert,
	"" as numero_nouveau_lit
	from encounter
	inner join location on location.location_id = encounter.location_id
	inner join encounter_provider on encounter.encounter_id  = encounter_provider.encounter_id
	inner join provider on encounter_provider.provider_id = provider.provider_id 
	inner join person on provider.person_id  = person.person_id
	inner join person_name on person_name.person_id = person.person_id
	inner join encounter_type on encounter_type.encounter_type_id = encounter.encounter_type 
	inner join obs on obs.encounter_id  = encounter.encounter_id 
	inner join concept on concept.concept_id = obs.concept_id 
	where concept.uuid = "32710863-c027-4239-ad4b-7f3c4f7127f1"
	and encounter_type.uuid = "e22e39fd-7db2-45e7-80f1-60fa0d5a4378") hostpitalisation_avec_lit
 left join (
	select distinct 
	encounter.visit_id as visit_id,
	encounter.encounter_id as encounter_id ,
	encounter.encounter_datetime as date_sortie
	from encounter
	inner join encounter_type on encounter.encounter_type = encounter_type.encounter_type_id 
	where encounter_type.uuid = "181820aa-88c9-479b-9077-af92f5364329") hostpitalisation_avec_date_sortie
on hostpitalisation_avec_lit.visit_id = hostpitalisation_avec_date_sortie.visit_id
left join (
	select distinct 
	encounter.visit_id as visit_id,
	encounter.encounter_id as encounter_id
	from encounter
	join encounter_type on encounter.encounter_type = encounter_type.encounter_type_id 
	where encounter_type.uuid = "d7151f82-c1f3-4152-a605-2f9ea7414a79") notes_visistes
on hostpitalisation_avec_lit.visit_id = notes_visistes.visit_id
left join (
	select distinct 
	encounter.encounter_id as encounter_id,
	encounter.visit_id as visit_id,
	concept_name.name as pathologie
	from encounter 
	inner join encounter_diagnosis on encounter.encounter_id = encounter_diagnosis.encounter_id 
	inner join concept_name on concept_name.concept_name_id = encounter_diagnosis.diagnosis_coded_name ) pathologies
on hostpitalisation_avec_lit.visit_id = pathologies.visit_id
left join (
	select distinct 
	encounter.visit_id as visit_id,
	encounter.encounter_id as encounter_id,
	"oui" as transfered,
	location.name as service_de_transfert
	from encounter
	join encounter_type on encounter.encounter_type = encounter_type.encounter_type_id 
	inner join location on location.location_id = encounter.location_id
	inner join encounter_provider on encounter.encounter_id  = encounter_provider.encounter_id
	inner join provider on encounter_provider.provider_id = provider.provider_id 
	where encounter_type.uuid = "7b68d557-85ef-4fc8-b767-4fa4f5eb5c23") transferts
on hostpitalisation_avec_lit.visit_id = transferts.visit_id
left join (
	select distinct 
	encounter.visit_id as visit_id,
	encounter.encounter_id as encounter_id,
	obs.value_text as numero_nouveau_lit
	from encounter
	inner join encounter_type on encounter_type.encounter_type_id = encounter.encounter_type 
	inner join obs on obs.encounter_id  = encounter.encounter_id 
	inner join concept on concept.concept_id = obs.concept_id 
	where concept.uuid = "32710863-c027-4239-ad4b-7f3c4f7127f1"
	and encounter_type.uuid = "7b68d557-85ef-4fc8-b767-4fa4f5eb5c23") transfert_avec_numero_lit
on hostpitalisation_avec_lit.visit_id = transfert_avec_numero_lit.visit_id
left join (
	select distinct 
	encounter.visit_id as visit_id,
	encounter.encounter_id as encounter_id,
	obs.value_datetime as date_transfert
	from encounter
	inner join encounter_type on encounter_type.encounter_type_id = encounter.encounter_type 
	inner join obs on obs.encounter_id  = encounter.encounter_id 
	inner join concept on concept.concept_id = obs.concept_id 
	where concept.uuid = "1640AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
	and encounter_type.uuid = "7b68d557-85ef-4fc8-b767-4fa4f5eb5c23") transfert_avec_date_transfert
on hostpitalisation_avec_lit.visit_id = transfert_avec_date_transfert.visit_id
group by pathologies.pathologie, hostpitalisation_avec_lit.encounter_id