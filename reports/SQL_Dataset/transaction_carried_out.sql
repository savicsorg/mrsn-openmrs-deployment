SELECT distinct 
cashier_bill_payment.date_created as date_created, 
inv_item.name  as acte,
(cashier_bill_line_item.price * cashier_bill_line_item.quantity) * (cashier_bill_payment.amount / montant_total_factures.total_facture) as montant_acte,
cashier_payment_mode.name as type_paiement,
location.name as service,
numero_assurances.numero_assurance as numero_assurance,
cashier_bill.patient_id as id_patient,
person_name.given_name  as nom_caissier
FROM cashier_bill_payment
inner join cashier_bill on cashier_bill_payment.bill_id = cashier_bill.bill_id 
inner join cashier_bill_line_item on cashier_bill_line_item.bill_id = cashier_bill.bill_id 
inner join inv_item on inv_item.item_id = cashier_bill_line_item.item_id
inner join cashier_payment_mode on cashier_payment_mode.payment_mode_id = cashier_bill_payment.payment_mode_id
inner join cashier_cash_point on cashier_bill.cash_point_id = cashier_cash_point.cash_point_id 
left join location on cashier_bill.location_id = location.location_id
inner join person on cashier_bill_payment.creator = person.person_id 
inner join person_name on person_name.person_id = person.person_id
left join (
	select cashier_bill_payment.bill_payment_id as bill_payment_id,
		cashier_bill_payment_attribute.value_reference as numero_assurance
	from cashier_bill_payment
	inner join cashier_bill_payment_attribute on cashier_bill_payment_attribute.bill_payment_id = cashier_bill_payment.bill_payment_id
	inner join cashier_payment_mode_attribute_type on cashier_payment_mode_attribute_type.payment_mode_attribute_type_id = cashier_bill_payment_attribute.payment_mode_attribute_type_id 
	where cashier_payment_mode_attribute_type.uuid = "539430a9-c957-4991-989e-63f52b6fdfb2") numero_assurances
on cashier_bill_payment.bill_payment_id = numero_assurances.bill_payment_id
left join (
	select 
		SUM(cashier_bill_line_item.price * cashier_bill_line_item.quantity) as total_facture,
		cashier_bill_line_item.bill_id as bill_id
	from cashier_bill_line_item
	group by cashier_bill_line_item.bill_id ) montant_total_factures
on cashier_bill_payment.bill_id = montant_total_factures.bill_id
where cashier_bill_payment.date_created between :startDate and :endDate
and cashier_bill_payment.voided = 0
order by cashier_bill_payment.date_created