SELECT customer_id, login, surname, name,

case
when addres = '-' then null
else addres
end as addres,

case
when phone = '' or phone is null then '-'
else phone
end as phone	

FROM customers;