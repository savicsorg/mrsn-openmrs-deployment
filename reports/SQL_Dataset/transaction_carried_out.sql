SELECT distinct 
cashier_bill_payment.date_created as "Date", 
inv_item.name  as "Acte",
(cashier_bill_line_item.price * cashier_bill_line_item.quantity) as "Montant de l'acte",
cashier_payment_mode.name as "Type de paiement",
location.name as "Service/unité de l'HD",
case 
	when cashier_payment_mode_attribute_type.uuid  = "539430a9-c957-4991-989e-63f52b6fdfb2" then cashier_bill_payment_attribute.value_reference
	else ""
end as "Numéro d'assurance",
cashier_bill.patient_id as "ID du patient",
person_name.given_name as "Nom caissier"
FROM cashier_bill_payment
inner join cashier_bill on cashier_bill_payment.bill_id = cashier_bill.bill_id 
inner join cashier_bill_line_item on cashier_bill_line_item.bill_id = cashier_bill.bill_id 
inner join inv_item on inv_item.item_id = cashier_bill_line_item.item_id
inner join cashier_payment_mode on cashier_payment_mode.payment_mode_id = cashier_bill_payment.payment_mode_id
inner join cashier_cash_point on cashier_bill.cash_point_id = cashier_cash_point.cash_point_id 
inner join location on cashier_cash_point.location_id = location.location_id
inner join person on cashier_bill_payment.creator = person.person_id 
inner join person_name on person_name.person_id = person.person_id
inner join cashier_bill_payment_attribute on cashier_bill_payment.bill_payment_id = cashier_bill_payment_attribute.bill_payment_id
inner join cashier_payment_mode_attribute_type on cashier_payment_mode_attribute_type.payment_mode_attribute_type_id =  cashier_bill_payment_attribute.payment_mode_attribute_type_id
where cashier_bill_payment.voided != 1