select distinct concept.concept_id, concept.uuid,concept_reference_term.`code`, concept_name.`name`  from concept
inner join concept_name on concept_name.`concept_id`= concept.`concept_id`
inner join concept_set on concept_set.`concept_id` = concept.`concept_id` and concept.`concept_id`=concept_set.`concept_id` 
inner join concept_reference_map on concept_reference_map.`concept_id`=concept.`concept_id`
inner join concept_reference_term on concept_reference_term.`concept_reference_term_id`= concept_reference_map.`concept_reference_term_id`
where concept.`class_id`=4 and concept_name.`locale`= 'fr' and concept_set.`concept_set` in (1242,1351,1901,1549,2038,993,1094,2042,2033,2328,2095,1596,1123,1501,1639,1289,2031,1627,2329,1012,2331,2043,1126,2333,1295,2332,1634)
and concept_name.`name` !=''
and concept_reference_term.`concept_source_id` = 12
order by concept_name.`name` 